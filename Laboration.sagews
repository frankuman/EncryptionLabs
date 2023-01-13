︠d5eab464-0fc0-47a6-b771-189242addc7di︠
%md
# Laboration
Kryptering 1, hösten 2022
︡6d053489-a538-46e8-a6ee-24b00ec8d441︡{"done":true,"md":"# Laboration\nKryptering 1, hösten 2022"}
︠5bd9ca94-b92d-4589-a44a-33a208f3b8df︠

︡02429186-61a0-4d92-b304-77dfec886df1︡
︠a7043f5a-b763-459f-bb34-9cc0cb853ce0︠
%md
**Namn:** Oliver Bölin

︡a6390882-4964-4dbf-b798-ae98dd0590d0︡{"done":true,"md":"**Namn:** Oliver Bölin"}
︠69c3f036-a7d1-484e-a1d9-d3d9d06797aa︠

︡28bcbdfc-22fd-4e40-9b76-0ba67ac84600︡
︠5ae2eb53-8820-4a37-a2dc-aa92dc62f405s︠
# laddar användbar fil
load('kryptering1.sage')
load('data.sage')
︡4b5cb0e0-95da-4e92-a37d-8cea935a8285︡{"stdout":"***  kryptering1.sage: Funktioner för kursen Kryptering 1 (SageMath)  ***\n"}︡{"done":true}
︠d6e50983-f988-4a51-bd22-bbf16805e39di︠
%md
## Uppgift 1
︡e2e2ac1b-d43f-465d-9826-6840abb98314︡{"done":true,"md":"## Uppgift 1"}
︠d2320d68-0a8f-4c89-8f8b-2388e5b34913︠

︡6340ba75-07ac-4f13-8824-d8f6a442eabe︡
︠c9935886-b3c6-4673-a6a7-0eba7e768841︠


︡590f8964-9c88-42af-9e0c-ab8c64f588fe︡
︠5f1cc5bd-b34d-41a2-8cba-6c50da3d8a10︠

#a)
#Kryptering:
#ADFGVX   SVAR: GXDVXAFVGDDFGXGFGGXXAV
#Affint   SVAR: zjedtsymhok
#Enigma   SVAR: ZLUKSWBNURH
#Hill     SVAR: vqyklånldföu
#Playfair SVAR: ZQIRRZVGTNAL

#b)
#Dekryptering
#I.     dekrypterades med enigma  blir: ENGANSKANORMALMENKORTKLARTEXT
#II.    dekrypterades med hill    blir: elakaspionerknäckerhemligameddelandenx
#III.   dekrypterades med affint blir:  ofrjygtsiqåxfxypåxpfxrjyzmjqfifljs
#IV.    dekrypterades med adfgvx blir:  THESEGOTO11
#V.     dekrypterades medplayfair blir: DONTTELXLNOBODYTHATX

uppgift_1a = 'formidabelt'
uppgift_1b_I   = 'wkewttpoxebfbkvzenzismszphlhx'
uppgift_1b_II  = 'dfsäkcnkpdåpphmkkuolqqnooizeeydfbdrgnm'
uppgift_1b_III = 'jzeixnkvtpafzfxäafäzfeixldipztzoiv'
uppgift_1b_IV  = 'xvgfgvagvxgdgffxggvgxv'
uppgift_1b_V   = 'zuleeknlncsiuzqawval'

                                                                       #Vi använder funktionerna som de ska användas enligt "Kom igång med SageMath/CoCalc"
adfgvx_cipher = ADFGVX("FORMIDABELT","QXMBK2GP56JFVND01HUA8OW473YELSCR9TZI",(3,1,0,2,4),'kryptera')
print("formidabelt krypterat med ADFGVX blir: ",adfgvx_cipher)
               

affint_cipher = affint_krypto(uppgift_1a,17,23)
print("formidabelt krypterat med AFFINT blir: ",affint_cipher)

enigma_cipher = Enigma("FORMIDABELT",[("A","H"),("C","Z"),("J","R"),("M","N"),("T","Y")],["V","I","III"],"OST")
print("formidabelt krypterat med ENIGMA blir: ",enigma_cipher)

hill_cipher = Hillkrypto("formidabelt",(matrix(Zmod(28), 2, 2, [7,13,6,11])),'x','H')
print("formidabelt krypterat med HILL blir: ",hill_cipher)

playfair_cipher = Playfair("FORMIDABELT",'MRIBGTEKVAFDZHWQUOSYLNCPX','X','kryptera')
print("formidabelt krypterat med PLAYFAIR blir: ",playfair_cipher)
#####################################################################################################################################################################################################################

#b)

                                                                        #I Detta är enigma eftersom de använder W, vilket vi inte använder i de "försvenskade" kryptosystemen, sen så är ingen bokstav på samma ställe som i originaltexten
                                                                        #Vi dekrypterar sådant som vi krypterar
enigma_decipher = Enigma(uppgift_1b_I.upper(),[("A","H"),("C","Z"),("J","R"),("M","N"),("T","Y")],["V","I","III"],"OST")
print("I. WKEWTTPOXEBFBKVZENZISMSZPHLHX DEKRYPTERAT MED enigma blir: ",enigma_decipher)

                                                                        #II Detta är hill, vi dekrypterar genom att använda inversen av matrisen, den modulära (multiplikativa) inversen av determinanten
A = (matrix(Zmod(28), 2, 2, [7,13,6,11]))                               #Här skapar vi matrisen
detA = Mod(det(A)^-1,28)                                                #Här räknar vi determinanten och sedan gör om det till den multiplikativa inversen
A_inverse = (matrix(Zmod(28), 2, 2, [detA*11,detA*-13,detA*-6,detA*7])) #Här gör vi om matrisen till inversen
hill_decipher = Hillkrypto(uppgift_1b_II,(A_inverse),'x','H')           #Sedan slänger vi in det i funktionen
print("II. DFSÄKCNKPDÅPPHMKKUOLQQNOOIZEEYDFBDRGNM DEKRYPTERAT MED hill blir: ",hill_decipher)

                                                                        #III Vi ser att detta är affint. P*a + b = C. För att få klartexten P så måste vi beräkna (C-b)*a^(-1)
a = Mod(17^(-1),28)                                                     #Vi beräknar multiplikativa inversen av 17 mod 28
b = (Mod(-23*a,28))                                                     #Vi gör lite beräkningar mod 28 för att
affint_decipher = affint_krypto(uppgift_1b_III,a,b)
print("III. JZEIXNKVTPAFZFXÄAFÄZFEIXLDIPZTZOIV DEKRYPTERAT MED affint blir: ",affint_decipher)


                                                                        #IV Vi ser att kryptot enbart använder bokstäverna ADFGVX, därav finns det bara ADFGVX som kan användas.
key = 'QXMBK2GP56JFVND01HUA8OW473YELSCR9TZI'
                                                                        #Här så slänger vi bara in allt som vanligt förutom att vi tar permutationens invers
adfgvx_decipher = ADFGVX(uppgift_1b_IV.upper(),key,(3,1,0,2,4),'dekryptera')
print("IV. XVGFGVAGVXGDGFFXGGVGXV DEKRYPTERAT MED adfgvx blir: ",adfgvx_decipher)

                                                                        #V liknar playfair, den har inget identiskt bigram
                                                                        #Här så använder vi bara dekrypteringsfunktionen som vanligt.
playfair_decipher = Playfair(uppgift_1b_V.upper(),'MRIBGTEKVAFDZHWQUOSYLNCPX','X','dekryptera')
print("V. ZULEEKNLNCSIUZQAWVAL DEKRYPTERAT MED playfair blir: ",playfair_decipher)



︡51c2b578-d1a0-4259-9438-addc19fca558︡{"stdout":"formidabelt krypterat med ADFGVX blir:  GXDVXAFVGDDFGXGFGGXXAV\n"}︡{"stdout":"formidabelt krypterat med AFFINT blir:  zjedtsymhok\n"}︡{"stdout":"formidabelt krypterat med ENIGMA blir:  ZLUKSWBNURH\n"}︡{"stdout":"formidabelt krypterat med HILL blir:  vqyklånldföu\n"}︡{"stdout":"formidabelt krypterat med PLAYFAIR blir:  ZQIRRZVGTNAL\n"}︡{"stdout":"I. WKEWTTPOXEBFBKVZENZISMSZPHLHX DEKRYPTERAT MED enigma blir:  ENGANSKANORMALMENKORTKLARTEXT\n"}︡{"stdout":"II. DFSÄKCNKPDÅPPHMKKUOLQQNOOIZEEYDFBDRGNM DEKRYPTERAT MED hill blir:  elakaspionerknäckerhemligameddelandenx\n"}︡{"stdout":"III. JZEIXNKVTPAFZFXÄAFÄZFEIXLDIPZTZOIV DEKRYPTERAT MED affint blir:  ofrjygtsiqåxfxypåxpfxrjyzmjqfifljs\n"}︡{"stdout":"IV. XVGFGVAGVXGDGFFXGGVGXV DEKRYPTERAT MED adfgvx blir:  THESEGOTO11\n"}︡{"stdout":"V. ZULEEKNLNCSIUZQAWVAL DEKRYPTERAT MED playfair blir:  DONTTELXLNOBODYTHATX\n"}︡{"done":true}
︠cb5ab162-3d5d-4e39-ba69-9e981d97afd4i︠
%md
## Uppgift 2
︡723529ee-192d-4b23-b0d3-d03c67a47b37︡{"done":true,"md":"## Uppgift 2"}
︠46182d01-c1f5-479f-91cf-4da70e6de5a3︠

#Jag valde vigenerekrypto, jag är född den 22a
#Perioden fick jag till 6 med Babbage & Kasiski metoden
#Nyckeln fick jag fram till FINGER genom att göra monoanalys på texten splittrat i 6
#Klartexten fick jag till "pojken som åt ikapp med trollet det var en gång en bonde som hade tre söner" (Du kan se vad den printar för hela texten)
vigenere = uppgift_2v_22
                                                #Vi gör en trigramanalys för se de vanligaste trigrammen
trigramanalys(vigenere)
lst = BabbageKasiski(vigenere,'nji')            #Sedan tar vi och gör BabbageKasiski med ett trigram
print(lst)
                                                #Vi primtalsfaktoriserar alla differanser
print(lst[1],"-",lst[0], "=", lst[1]-lst[0],"= 2^2 x 3^2 * 7")
print(lst[2],"-",lst[0], "=", lst[2]-lst[0],"= 2^4 x 3^1 * 7")
print(lst[3],"-",lst[0], "=", lst[3]-lst[0],"= 2^4 x 3^4 ")
print(lst[4],"-",lst[0], "=", lst[4]-lst[0],"= 2 x 3^2 x 5 x 19")
print(lst[5],"-",lst[0], "=", lst[5]-lst[0],"= 2 x 3 x 191 x 14923")
print(lst[6],"-",lst[0], "=", lst[6]-lst[0],"= 2 x 3^3 x 41 \n")

print(lst[2],"-",lst[1], "=", lst[2]-lst[1],"= 2^2 x 3 x 7")
print(lst[3],"-",lst[1], "=", lst[3]-lst[1],"= 2^2 x 3^2 x 29")
print(lst[4],"-",lst[1], "=", lst[4]-lst[1],"= 2^1 x 3^6")
print(lst[5],"-",lst[1], "=", lst[5]-lst[1],"= 2 x 3 x 251")
print(lst[6],"-",lst[1], "=", lst[6]-lst[1],"= 2 x 3 x 109 \n")


print(lst[3],"-",lst[2], "=", lst[3]-lst[2],"= 2^6 x 3 x 5")
print(lst[4],"-",lst[2], "=", lst[4]-lst[2],"= 2 x 3 x 229")
print(lst[5],"-",lst[2], "=", lst[5]-lst[2],"= 2 x 3^2 x 79")
print(lst[6],"-",lst[2], "=", lst[6]-lst[2],"= 2 x 3 x 313\n")

print(lst[4],"-",lst[3], "=", lst[4]-lst[3],"= 2 x 3^2 x 23")
print(lst[5],"-",lst[3], "=", lst[5]-lst[3],"= 2 x 3 x 7 x 11")
print(lst[6],"-",lst[3], "=", lst[6]-lst[3],"= 2 x 3^3 x 17\n")

print(lst[5],"-",lst[4], "=", lst[5]-lst[4],"= 2^4 x 3")
print(lst[6],"-",lst[4], "=", lst[6]-lst[4],"= 2^3 x 3^2 x 7\n")

print(lst[6],"-",lst[5], "=", lst[6]-lst[5],"= 2^3 x 3 x 19")
                                                     #Vi ser att 2 x 3 = 6 är troligaste perioden
                                                     #Vi undersöker därefter för perioden 6
                                                     #Vi jämnför med svenska alfabetet, jag brukar kolla på a-e och hitta passande

                                                     #K1 = F är troligt här
                                                     #Vi splittrar texten i 6 och kollar en monogramanalys på vardera för att bestämma de olika förskjutningarna
text_split_3 = splittra_text(vigenere,6)[0]

monogramanalys(text_split_3)
print("K1")
text_split_3 = splittra_text(vigenere,6)[1]

monogramanalys(text_split_3)
                                                     #K2 = I är troligt här
print("K2")
text_split_3 = splittra_text(vigenere,6)[2]

monogramanalys(text_split_3)
                                                     #K3 = N är troligt här
print("K3")
text_split_3 = splittra_text(vigenere,6)[3]

monogramanalys(text_split_3)
print("K4")

                                                     #K4 = G
text_split_3 = splittra_text(vigenere,6)[4]

monogramanalys(text_split_3)
print("K5")
                                                    #K5 = E
text_split_3 = splittra_text(vigenere,6)[5]

monogramanalys(text_split_3)
                                                    #K6 = R
print("K6")

                                                    #Då har vi vår nyckel FINGER, vi behöver bara göra om det till en dekrypterings nyckel.
                                                    #man tar t.ex f = 5, sen ska man ju ta minus, så (-5) mod 28, så gör man
                                                    # så med hela FINGER så får man yupxzl
Vigenerekrypto(vigenere,"yupxzl")

                                                    #Då får vi detta dekrypterar!

︡e2c9ebb6-a09f-481d-9a6e-6f1fba9be08c︡{"stdout":"pnt"}︡{"stdout":"  :  7\nkfå  :  7\nime  :  7\nryk  :  7\nnji  :  7\ntku  :  7\nori  :  6\nykr  :  6\netr  :  6\nmiä  :  6\nzri  :  6\nghv  :  6\nrim  :  6\nqtr  :  6\ntry  :  6\nhvz  :  6\nimä  :  5\nqme  :  5\nzfv  :  5\ndok  :  5\neys  :  5\nntz  :  5\njic  :  5\njvd  :  5\nupa  :  5\n"}︡{"stdout":"[632, 884, 968, 1928, 2342, 2390, 2846]\n"}︡{"stdout":"884 - 632 = 252 = 2^2 x 3^2 * 7\n"}︡{"stdout":"968 - 632 = 336 = 2^4 x 3^1 * 7\n"}︡{"stdout":"1928 - 632 = 1296 = 2^4 x 3^4 \n"}︡{"stdout":"2342 - 632 = 1710 = 2 x 3^2 x 5 x 19\n"}︡{"stdout":"2390 - 632 = 1758 = 2 x 3 x 191 x 14923\n"}︡{"stdout":"2846 - 632 = 2214 = 2 x 3^3 x 41 \n\n"}︡{"stdout":"968 - 884 = 84 = 2^2 x 3 x 7\n"}︡{"stdout":"1928 - 884 = 1044 = 2^2 x 3^2 x 29\n"}︡{"stdout":"2342 - 884 = 1458 = 2^1 x 3^6\n"}︡{"stdout":"2390 - 884 = 1506 = 2 x 3 x 251\n"}︡{"stdout":"2846 - 884 = 1962 = 2 x 3 x 109 \n\n"}︡{"stdout":"1928 - 968 = 960 = 2^6 x 3 x 5\n"}︡{"stdout":"2342 - 968 = 1374 = 2 x 3 x 229\n"}︡{"stdout":"2390 - 968 = 1422 = 2 x 3^2 x 79\n"}︡{"stdout":"2846 - 968 = 1878 = 2 x 3 x 313\n\n"}︡{"stdout":"2342 - 1928 = 414 = 2 x 3^2 x 23\n"}︡{"stdout":"2390 - 1928 = 462 = 2 x 3 x 7 x 11\n"}︡{"stdout":"2846 - 1928 = 918 = 2 x 3^3 x 17\n\n"}︡{"stdout":"2390 - 2342 = 48 = 2^4 x 3\n"}︡{"stdout":"2846 - 2342 = 504 = 2^3 x 3^2 x 7\n\n"}︡{"stdout":"2846 - 2390 = 456 = 2^3 x 3 x 19\n"}︡{"file":{"filename":"/tmp/tmpq3m1akzm/tmp_nqpt2yrz.svg","show":true,"text":null,"uuid":"aafa0754-74fb-4da9-9490-b50ef5d77673"},"once":false}︡{"stdout":"K1\n"}︡{"file":{"filename":"/tmp/tmpq3m1akzm/tmp_c7vb6ywo.svg","show":true,"text":null,"uuid":"6efab728-002f-4451-be00-839cc982f617"},"once":false}︡{"stdout":"K2\n"}︡{"file":{"filename":"/tmp/tmpq3m1akzm/tmp_azf3w72q.svg","show":true,"text":null,"uuid":"ed4fabb6-e693-4d9d-b738-3bfcea82a6c5"},"once":false}︡{"stdout":"K3\n"}︡{"file":{"filename":"/tmp/tmpq3m1akzm/tmp_65qwp6u8.svg","show":true,"text":null,"uuid":"8c50755f-b2c1-48e6-b800-37f28ecc647e"},"once":false}︡{"stdout":"K4\n"}︡{"file":{"filename":"/tmp/tmpq3m1akzm/tmp_oizp4nn3.svg","show":true,"text":null,"uuid":"fbe94861-8128-4172-8f8c-db0f9e882856"},"once":false}︡{"stdout":"K5\n"}︡{"file":{"filename":"/tmp/tmpq3m1akzm/tmp_ntvq4ojy.svg","show":true,"text":null,"uuid":"78619bd9-4235-4243-a59f-6c0536c718ed"},"once":false}︡{"stdout":"K6\n"}︡{"stdout":"'pojkensomåtikappmedtrolletdetvarengångenbondesomhadetresönerhanvarskuldsattochgammalochsvagmeningenavsönernavillehjälpasinfartillgårdenhördeenstorskogbondenvilleattsönernaskullefällaträdidenochpådetsättetförsökabetalaavnågotpåskuldeneftermångaövertalningsförsökfickhandemattställauppförstgickdenäldsteutiskogenmedsinyxapåaxelnnärhanhadekommitiniskogenochbörjathuggapåengammalskäggiggrankomettstorttjockttrollframtillhonomomduhuggeriminskogsåslårjagihjäldigsatrolletdåpojkenhördedetkastadehanyxanifrånsigochspranghemsåforthankundehanvaralldelesandfåddochberättadeskräckslagenvadsomhänthonomhansfarblevargpåhonomvilketharhjärtaduärsafaderntrollenskrämdealdrigmignärjagvarungochhöggträdiskogenföljandedaggavdennästäldstasonensigavtillskogenmendetgickpåsammasättnärhanhadegjortnågrahuggiengrankomtrolletframtillhonomomduhuggeriminskogsåslårjagihjäldiggossenvågadeknapptsepåtrolletutankastadeyxanifrånsigochsprangsåforthankundedärifrånprecissomsinäldrebrornärhankomhemblevfadernåterigenargochsaattaldrighadetrollenskrämthonomdåhanvarungtredjedagenvilledenyngstebrodernocksåförsökajadusadebådaäldrebrödernadukommersäkertgörabraifråndigdusomaldrigvaritutanfördörrendenyngstebrodernsaingethanvändesigbaratillsinmorochbadomenordentligmatsäckhongavhonomenstorochpräktigostsomännuintevarriktigtfärdigdenvarvattnigochalldelesmjukhelahansväskafylldesuppavostensedangavhansigavdåhanhuggitenstundpåenstorgrankomtrolletäventillhonomomduhuggeriminskogsåslårjagihjäldigmendenyngstepojkenvarintesenivändningarnahansprangborttillväskanochlyfteuppostensedanklämdehandensåattvasslanskvättehållerintedutystsahantilltrolletsåskalljagklämmadigsåsomjagklämmervattneturdenhärvitastenennejkäraskonamigbadtrolletjagskallhjälpadigatthuggaträdjapådetvillkoretskonadepojkenhonomochtrolletvarduktigtpåatthuggadendagenfälldedemångastammardådetledmotkvällensatrolletnukanduföljamedmighemdetärnärmaretillmigäntilldigdettycktepojkenlätbraochhanföljdemedvälhemmabörjadetrolletgörauppeldispisenochpojkengickeftervattentillgrötgrytanmendärstodtvåjärnhinkarsåstoraochtungaatthaninteengångorkadelyftademurfläckendåsapojkendetärintevärtatttamedsigdehärfingerborgarnajagskagåefterhelabrunnenjagnejkärasnällasatrolletjagkanintevarautanbrunnengöruppeldendusåskalljaggåeftervattendåtrolletkomtillbakamedvattnetkokadedetenväldiggrytamedgrötövereldenhörpåsapojkenskaviätikappdetkanvigörasvaradetrollethankändesigheltsäkerpåatthanskullevinnadesattesigtillbordsmenutanatttrolletsågdetsattepojkensinväskapåmagenunderskjortanochnärhanåtöstehanmeriväskanänvadhanstoppadeimunnendåväskanvarfulltoghanuppsintäljknivochskaretthålidensåattgrötenrannuttrolletsågpåhonommensadeingetdådeätitenbrastundlatrolletbortskedennejnuorkarintejagmersadetduskallätasvaradegossenjagärknappasthalvmättännugördusomjaggjordeskäretthålpåmagensåäterdusåmycketduvillmendetgörvälväldigtontfrågadetrolletåingentingatttalaomsvaradepojkendågjordetrolletsompojkensadeochdetkanmanvälförståatttrollettogdödpåsigsjälvmenpojkentogalltdetsilverochguldsomfannsibergetochgickhemmeddetkundehanminsannbetalasinfarsskulder'\n"}︡{"done":true}
︠4d7b209b-39d5-493e-ab13-23ba6f741cec︠

︡f8fe9659-b7a7-43f3-8732-ff97daddc468︡
︠a889c1d9-672a-4e6a-803e-f01488e9b7bci︠
%md
## Uppgift 3 eller 4
︡13f6872e-e317-4d41-8e7d-f31ce9ed2dcc︡{"done":true,"md":"## Uppgift 3 eller 4"}
︠0cb894fe-4dcf-4350-a551-33b570d19c3f︠

︡bf4cd0cb-d366-4f10-8c27-5e3893ee876a︡
︠9da540eb-d0b3-4830-af95-017669c94398s︠
#Uppgift 3)
#a) Svaret ser du i funktionen med förklaringar
#b) Jag fick krypteringen till "i inebgb ha vpastiorale adiokesylic n stcIe  a rteBlbeenhwcg!"
#c) Jag fick dekrypteringen till "Bättre vara ute på hal is och ha det glatt än att gå i lera och sörja."

#Input såhär kryptering(klartext,[x1,x2],[b,c],[0,1,2,3,4],'dekryptera')
def Bernelf(t,x,bc,key, mode='kryptera'):
    m = len(key) #Längden av permutationen kommer alltid bli våran modolus
   #print(m)
    sequence_len = len(t) #Så lång texten är behöver vi bara skapa en följd för
    sequence = [0] * sequence_len
    b = bc[0]
    c = bc[1]
    sequence[0] = (x[0])%m
    sequence[1] = (x[1])%m
    table = [""] * m #Vi kommer behöva något att lägga allt i


    if(mode == 'kryptera'):
        cipher = ""
        for i in range(2,sequence_len):
            sequence[i] = (b*(sequence[i-2]) + c*(sequence[i-1]))%m #Vi skapar följden
            ### x:k = b*x:k-2 + c*x:k-1
        print("Sequence:",sequence)
        for s in range(0,sequence_len): #Vi lägger den s:te bokstaven i listan med index av vad den s:te sekvensen är
            table[sequence[s]] += t[s]

        print("Table:",table)
        for n in key: #Vi kollar nyckeln, tar de från tabellen och lägger i ciphern
            cipher += table[n]
        return cipher

    if(mode == 'dekryptera'):
        decipher = ""
        #Vi beräknar följden igen
        for i in range(2,sequence_len):
            #print(b,"*",sequence[i-2],"+",c,"*",(sequence[i-1]),"=",(b*(sequence[i-2]) + c*(sequence[i-1]))%m)
            sequence[i] = (b*(sequence[i-2]) + c*(sequence[i-1]))%m
            ### x:k = b*x:k-2 + c*x:k-1
        amount_list = [0] * m
        print("Sequence:",sequence)
        for k in range(0,m): ##Vi måste veta hur många vi ska lägga in per rad, dvs räkna hur många 0or,1or,2or... som kommer upp i följden.
            ##Vi generar en tabell som säger t.ex [5,2,4,4] dvs, 0 används 5 gånger, 2 används 2 gånger, 3 används 4 gånger 4 används 4 gånger
            amount_list[k] = sequence.count(k)


        for x in key: #Vi behöver lägga in strängarna i den ordningen som keyen har.
            #Vi får något som ser ut som i hänvisningarna i för kryptot ['YNI', 'TTF', 'R', 'ADET', 'RHE']
            table[x] = t[:amount_list[x]]
            t = t[amount_list[x]:]
        print(table)

        for s in sequence: #Nu tar vi ut alla nycklar i den ordning som följden säger, och tar bort den charen som användes
            #om ['YNI', 'TTF', 'R', 'ADET', 'RHE'] är våran tabell vi har ock 0, 1, 1, 2, 3... är våran följd så tar vi ut från 0, 1, 1, osv
            decipher += table[s][0]
            table[s] = table[s][1:]
        return decipher
    else:
        print("Förstår inte :(")

        ##Några test
c = Bernelf("yttrandefrihet är bra",[3,1],[1,4],[6,1,5,2,0,4,3])
print(c)
print("\n")
c = Bernelf("rhtr r dtibaeftayneär",[3,1],[1,4],[6,1,5,2,0,4,3],'dekryptera')
print(c)
print("\n")

#b)
t = Bernelf(uppgift_3b,[1,0],[5,2],[4,2,0,5,3,1])
print(t)
print("\n")
#c)
t = Bernelf(uppgift_3c,[3,1],[1,4],[6,1,5,2,0,4,3],'dekryptera')
print(t)
print("\n")

︡7800c8b0-2117-42d1-9b19-0496a9459618︡{"stdout":"Sequence: [3, 1, 0, 1, 4, 3, 2, 4, 4, 6, 0, 6, 3, 4, 5, 3, 3, 1, 0, 1, 4]\nTable: ['tib', 'tr r', 'd', 'yneär', 'aefta', ' ', 'rh']\n"}︡{"stdout":"rhtr r dtibaeftayneär\n"}︡{"stdout":"\n\n"}︡{"stdout":"Sequence: [3, 1, 0, 1, 4, 3, 2, 4, 4, 6, 0, 6, 3, 4, 5, 3, 3, 1, 0, 1, 4]\n['tib', 'tr r', 'd', 'yneär', 'aefta', ' ', 'rh']\n"}︡{"stdout":"yttrandefrihet är bra\n"}︡{"stdout":"\n\n"}︡{"stdout":"Sequence: [1, 0, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1, 0, 5, 4, 3, 2, 1]\nTable: ['ale adioke', 'Blbeenhwcg!', 'a vpastior', 'cIe  a rte', 'i inebgb h', 'sylic n st']\n"}︡{"stdout":"i inebgb ha vpastiorale adiokesylic n stcIe  a rteBlbeenhwcg!\n"}︡{"stdout":"\n\n"}︡{"stdout":"Sequence: [3, 1, 0, 1, 4, 3, 2, 4, 4, 6, 0, 6, 3, 4, 5, 3, 3, 1, 0, 1, 4, 3, 2, 4, 4, 6, 0, 6, 3, 4, 5, 3, 3, 1, 0, 1, 4, 3, 2, 4, 4, 6, 0, 6, 3, 4, 5, 3, 3, 1, 0, 1, 4, 3, 2, 4, 4, 6, 0, 6, 3, 4, 5, 3, 3, 1, 0, 1, 4, 3]\n['ta oe gar', 'ätåhdt åöj', '  l ', 'Beu plha gnttio s.', 'rvatais  at  leca', 'ehah', 'r  ctär ']\n"}︡{"stdout":"Bättre vara ute på hal is och ha det glatt än att gå i lera och sörja.\n"}︡{"stdout":"\n\n"}︡{"done":true}
︠0d9e3627-e07c-4ea9-95b9-781cf2ca40e8︠

︡2aea6f20-e305-48ad-a0e7-324cbcec4baa︡{"done":true}









