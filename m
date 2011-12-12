Received: from nm25.bullet.mail.sp2.yahoo.com ([98.139.91.95])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ra6sn-0003Sl-As
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 14:29:36 +0000
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
 <1310988807.20738.44.camel@sauron>
 <1311707851.83484.YahooMailRC@web114602.mail.gq1.yahoo.com>
 <1313411391.2583.22.camel@sauron>
 <1322510657.7380.YahooMailNeo@web114602.mail.gq1.yahoo.com>
 <1323278383.39855.YahooMailNeo@web114617.mail.gq1.yahoo.com>
 <1323380555.2074.3.camel@koala>
Message-ID: <1323700170.52922.YahooMailNeo@web114608.mail.gq1.yahoo.com>
Date: Mon, 12 Dec 2011 06:29:30 -0800 (PST)
From: Reginald Perrin <reggyperrin@yahoo.com>
Subject: Re: UBIFS Corruption
To: MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <1323380555.2074.3.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Reply-To: Reginald Perrin <reggyperrin@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> IOW, add "log_buf_len=3D64M ignore_loglevel" options to you kernel boot=
=0A=0A> options.=0A> =0A> Artem.=0A> =0A> What is your flash exactly?=0A> =
=0A> Artem.=0A> =0A=0A=0AHi Artem,=0A=0AWe're using ST/Nymonyx 1Gb NAND: =
=A0NAND device: Manufacturer ID: 0x20, Chip ID: 0xf1 (ST Micro NAND 128MiB =
3,3V 8-bit)=0A=0A=0AApologies for missing the kernel boot instructions -- I=
 kept rebuilding the kernel trying to get the parameters right, so I never =
got the right results. =A0Once I used the command line parameters, I think =
I have it now. =A0Our system has 64M of RAM, so I had to switch to 32M. =A0=
Below is the info that I think you want (it's from the boot console output)=
. =A0When I switch to 32M buffer, dmesg fails due to an out-of-memory error=
.=0A=0AJan =A01 19:33:33 kernel: [ =A0 =A03.772000] Freeing unused kernel m=
emory: 124k freed=0AJan =A01 19:33:33 kernel: [ =A0 =A05.432000] UBI: attac=
hing mtd5 to ubi1=0AJan =A01 19:33:33 kernel: [ =A0 =A05.436000] UBI: physi=
cal eraseblock size: =A0 131072 bytes (128 KiB)=0AJan =A01 19:33:33 kernel:=
 [ =A0 =A05.440000] UBI: logical eraseblock size: =A0 =A0129024 bytes=0AJan=
 =A01 19:33:33 kernel: [ =A0 =A05.444000] UBI: smallest flash I/O unit: =A0=
 =A02048=0AJan =A01 19:33:33 kernel: [ =A0 =A05.448000] UBI: sub-page size:=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0512=0AJan =A01 19:33:33 kernel: [ =A0 =A05.4520=
00] UBI: VID header offset: =A0 =A0 =A0 =A0 =A0512 (aligned 512)=0AJan =A01=
 19:33:33 kernel: [ =A0 =A05.456000] UBI: data offset: =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A02048=0AJan =A01 19:33:33 kernel: [ =A0 =A05.808000] PM: Adding i=
nfo for No Bus:ubi1=0AJan =A01 19:33:33 kernel: [ =A0 =A05.820000] PM: Addi=
ng info for No Bus:ubi1_0=0AJan =A01 19:33:33 kernel: [ =A0 =A05.828000] UB=
I: attached mtd5 to ubi1=0AJan =A01 19:33:33 kernel: [ =A0 =A05.832000] UBI=
: MTD device name: =A0 =A0 =A0 =A0 =A0 =A0"home"=0AJan =A01 19:33:33 kernel=
: [ =A0 =A05.836000] UBI: MTD device size: =A0 =A0 =A0 =A0 =A0 =A093 MiB=0A=
Jan =A01 19:33:33 kernel: [ =A0 =A05.840000] UBI: number of good PEBs: =A0 =
=A0 =A0 =A0749=0AJan =A01 19:33:33 kernel: [ =A0 =A05.844000] UBI: number o=
f bad PEBs: =A0 =A0 =A0 =A0 1=0AJan =A01 19:33:33 kernel: [ =A0 =A05.852000=
] UBI: max. allowed volumes: =A0 =A0 =A0 128=0AJan =A01 19:33:33 kernel: [ =
=A0 =A05.856000] UBI: wear-leveling threshold: =A0 =A04096=0AJan =A01 19:33=
:33 kernel: [ =A0 =A05.860000] UBI: number of internal volumes: 1=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A05.864000] UBI: number of user volumes: =A0 =A0 =
1=0AJan =A01 19:33:33 kernel: [ =A0 =A05.868000] UBI: available PEBs: =A0 =
=A0 =A0 =A0 =A0 =A0 0=0AJan =A01 19:33:33 kernel: [ =A0 =A05.872000] UBI: t=
otal number of reserved PEBs: 749=0AJan =A01 19:33:33 kernel: [ =A0 =A05.87=
6000] UBI: number of PEBs reserved for bad PEB handling: 7=0AJan =A01 19:33=
:33 kernel: [ =A0 =A05.880000] UBI: max/mean erase counter: 3/1=0AJan =A01 =
19:33:33 kernel: [ =A0 =A05.884000] UBI: image sequence number: 1651720779=
=0AJan =A01 19:33:33 kernel: [ =A0 =A05.904000] UBI: background thread "ubi=
_bgt1d" started, PID 355=0AJan =A01 19:33:33 kernel: [ =A0 =A05.964000] PM:=
 Adding info for No Bus:ubifs_1_0=0AJan =A01 19:33:33 kernel: [ =A0 =A05.97=
6000] UBIFS DBG (pid 359): ubifs_bg_thread: background thread "ubifs_bgt1_0=
" started, PID 359=0AJan =A01 19:33:33 kernel: [ =A0 =A06.048000] UBIFS: re=
covery needed=0AJan =A01 19:33:33 kernel: [ =A0 =A06.616000] UBIFS error (p=
id 357): ubifs_recover_leb: garbage=0AJan =A01 19:33:33 kernel: [ =A0 =A06.=
620000] UBIFS error (pid 357): ubifs_scanned_corruption: corruption at LEB =
498:81920=0AJan =A01 19:33:33 kernel: [ =A0 =A06.624000] UBIFS error (pid 3=
57): ubifs_scanned_corruption: first 8192 bytes from LEB 498:81920=0AJan =
=A01 19:33:33 kernel: [ =A0 =A06.628000] 00000000: 17100610 b01ee889 000000=
00 02e40000 00010000 04ae0000 00930000 00002000 =A0........................=
..... ..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.632000] 00000020: 00000000 =
10000000 00010000 0b000000 632e6364 7ef2bf00 00030079 3a9a88e3 =A0.........=
.......dc.c...~y......:=0AJan =A01 19:33:33 kernel: [ =A0 =A06.636000] 0000=
0040: 00bb8306 0000195d 00000004 01004d09 1d0000cc 6f6d6552 57206574 75656b=
61 =A0....]........M......Remote Wakeu=0AJan =A01 19:33:33 kernel: [ =A0 =
=A06.640000] 00000060: 65722070 73657571 20646574 656a6572 64657463 7473202=
c 3d657461 52206425 =A0p requested rejected, state=3D%d R=0AJan =A01 19:33:=
33 kernel: [ =A0 =A06.644000] 00000080: bd504957 00584500 73750008 2e636462=
 8b680000 7fb30c93 923a209b 9387fd01 =A0WIP..EX...usbdc...h...... :.....=0A=
Jan =A01 19:33:33 kernel: [ =A0 =A06.648000] 000000a0: 9c7b340c 01923a20 0c=
93e451 209d7204 7f01923a d50c9376 3a209e68 b42f0192 =A0.4{. :..Q....r. :...=
v...h. :../.=0AJan =A01 19:33:33 kernel: [ =A0 =A06.652000] 000000c0: b28e0=
c93 923a20b0 90e88001 1eeb010c 4b744a35 0000b207 00000200 ac07d000 =A0.....=
 :.........5JtK............=0AJan =A01 19:33:33 kernel: [ =A0 =A06.656000] =
000000e0: 00014800 44410003 48542043 204d5245 28776172 20296425 0078566d 63=
700009 =A0.H....ADC THERM raw(%d) mVx...pc=0AJan =A01 19:33:33 kernel: [ =
=A0 =A06.660000] 00000100: 706d6574 8400632e 1b0892db b108b149 1c0108d0 6c0=
0000d 0208f000 54414256 =A0temp.c......I..........l....VBAT=0AJan =A01 19:3=
3:33 kernel: [ =A0 =A06.664000] 00000120: 01103054 6c6f7606 00632e74 08921d=
b6 08b1734c 705cdc26 bd00ec07 5cdc2d5c =A0T0...volt.c.....Ls..&.\p....\-.\=
=0AJan =A01 19:33:33 kernel: [ =A0 =A06.668000] 00000140: 696e6903 5c616974=
 0b16275c 088ba44b 00006ecc aa352019 9341aa0c 376a4c0c =A0.initia\\'..K....=
n... 5...A..Lj7=0AJan =A01 19:33:33 kernel: [ =A0 =A06.672000] 00000160: 01=
923a20 0c93fb60 203865cd 0e01913a 614d2ea7 923a2039 87a7c401 3a581e19 =A0 :=
..`....e8 :.....Ma9 :.......X:=0AJan =A01 19:33:33 kernel: [ =A0 =A06.67600=
0] 00000180: 01923a20 0c93f851 203b539e 3a01923a 6f0c939b 3a203c4a a16e0192=
 45ef0c93 =A0 :..Q....S; :..:...oJ< :..n....E=0AJan =A01 19:33:33 kernel: [=
 =A0 =A06.680000] 000001a0: 923a203d 939d4901 3e3cc00c 01923a20 0c931cfb 20=
3f3840 3101923a 120c93a6 =A0=3D :..I....<> :......@8? :..1....=0AJan =A01 1=
9:33:33 kernel: [ =A0 =A06.684000] 000001c0: 3a20441d 380a0192 b7010c90 205=
9d5b7 df148e19 e70893a8 0890d621 148e1520 =A0.D :...8......Y ........!... .=
..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.688000] 000001e0: 08928e7b 08b047=
67 148d1320 974ca316 109cd747 148e3520 149faea5 00004318 =A0{...gG.. .....L=
.G... 5.......C..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.692000] 00000200: =
7d01933a 0c979e5d 20d93e98 0a01963a 190c93ce 3a20da3a 440f0192 35990c93 =A0=
:..}]....>. :.......:. :...D...5=0AJan =A01 19:33:33 kernel: [ =A0 =A06.696=
000] 00000220: 923a20db 93782801 dc311a0c 01923a20 0c9393b3 20dd2c9a 130192=
3a 1b0c93f5 =A0. :..(x...1. :.......,. :.......=0AJan =A01 19:33:33 kernel:=
 [ =A0 =A06.700000] 00000240: 3a20de28 7f160192 1eeb0c93 923a20df 93e7e301 =
e015bc0c 01923a20 0c93d829 =A0(. :......... :......... :..)...=0AJan =A01 1=
9:33:33 kernel: [ =A0 =A06.704000] 00000260: 20ef6843 b601923a 010c9090 697=
69082 14921920 0892f41c 08b0bab2 14921520 =A0Ch. :.........vi ........... .=
..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.712000] 00000280: 0893d285 847724=
e2 92132011 00002e14 78206308 35200888 12461492 1be30c93 =A0.....$w.. .....=
..c x.. 5..F.....=0AJan =A01 19:33:33 kernel: [ =A0 =A06.716000] 000002a0: =
923a2079 93ee4e01 7a17640c 01923a20 0c9392f7 207b12e4 ee01923a 650c933f =A0=
y :..N...d.z :........{ :...?..e=0AJan =A01 19:33:33 kernel: [ =A0 =A06.720=
000] 000002c0: 3a207c0e dfdf0192 e5010c90 205d7d09 6001963a 010c945d 5e7d05=
66 1101943b =A0.| :.........}] :..`]...f.}^;...=0AJan =A01 19:33:33 kernel:=
 [ =A0 =A06.724000] 000002e0: 20310000 18312e30 582b0610 b01fe643 00000000 =
02dd0000 00010000 04ae0000 =A0..1 0.1...+XC...................=0AJan =A01 1=
9:33:33 kernel: [ =A0 =A06.728000] 00000300: 00940000 00002000 00000000 100=
00000 00010000 19000000 57206574 75656b61 =A0..... ..................te Wak=
eu=0AJan =A01 19:33:33 kernel: [ =A0 =A06.732000] 00000320: 65722070 736575=
71 20646574 656a6572 64657463 7473202c 3d657461 52206425 =A0p requested rej=
ected, state=3D%d R=0AJan =A01 19:33:33 kernel: [ =A0 =A06.736000] 00000340=
: bd504957 00584500 75001000 00006273 ee00632e 00797ea9 bc360003 06695e7d =
=A0WIP..EX....usb...c...~y...6.}^i.=0AJan =A01 19:33:33 kernel: [ =A0 =A06.=
740000] 00000360: 5d00bb83 04000019 09000000 cc01004d 65520500 65746f6d 192=
05720 ddfb0196 =A0...]........M.....Remote W .....=0AJan =A01 19:33:33 kern=
el: [ =A0 =A06.744000] 00000380: b7b60c97 923a207f 93be9001 80ae870c 01923a=
20 0c93e973 20902e4e 3901933a =A0..... :......... :..s...N.. :..9=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A06.748000] 000003a0: 0c945e7d 17694d01 07327079 =
000000b2 00000002 00ac07d0 03000148 43444100 =A0}^...Mi.yp2.............H..=
..ADC=0AJan =A01 19:33:33 kernel: [ =A0 =A06.752000] 000003c0: 45485420 722=
04d52 25287761 6d202964 09007856 74637000 2e706d65 6f210063 =A0 THERM raw(%=
d) mVx...pctemp.c.!o=0AJan =A01 19:33:33 kernel: [ =A0 =A06.756000] 000003e=
0: 5d7d0893 b108b593 1c0108d4 6c00000d 0208f400 54414256 01143054 00007606 =
=A0..}]...........l....VBATT0...v..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.=
760000] 00000400: 00632e74 08960158 08b1bdae 7043dc26 bd00ec07 43dc2d43 696=
e6903 54616974 =A0t.c.X.......&.Cp....C-.C.initiaT=0AJan =A01 19:33:33 kern=
el: [ =A0 =A06.764000] 00000420: 098e2750 088b9a78 9418b92e 8a352019 932b53=
09 19b4af0c 01920000 0c93dcd3 =A0P'..x........ 5..S+.............=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A06.768000] 00000440: 201ab02f d701923a af0c93b2 =
3a201bab a49d0192 a2800c93 923a201c 93c75401 =A0/.. :......... :......... :=
..T..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.772000] 00000460: 1d99500c 019=
23a20 0c93c85a 201e9021 4301913a 86f1a4bb 923a201f 84ba0801 =A0.P.. :..Z...=
!.. :..C..... :.....=0AJan =A01 19:33:33 kernel: [ =A0 =A06.776000] 0000048=
0: 7dc20119 3a20205d 5d3c0196 74920c97 923a2021 936d1601 2c39b70c 01923a20 =
=A0...}] =A0:..<]...t! :...m...9, :..=0AJan =A01 19:33:33 kernel: [ =A0 =A0=
6.780000] 000004a0: 0c90caaf b846c901 96192088 9202d314 b070f908 92152008 9=
214cf14 b0967908 =A0......F.. ........p.. .......y..=0AJan =A01 19:33:33 ke=
rnel: [ =A0 =A06.784000] 000004c0: 92132008 8bd90c14 b996a908 35201990 27da=
1492 922a0c93 913a20ba 3fafcc01 =A0. ............ 5...'..*.. :....?=0AJan =
=A01 19:33:33 kernel: [ =A0 =A06.788000] 000004e0: 20bb8daa ca01923a 2b1987=
24 3a20bc89 0f420192 00000c93 923a20bd 931cc301 =A0... :...$..+.. :..B.....=
. :.....=0AJan =A01 19:33:33 kernel: [ =A0 =A06.792000] 00000500: be802c0c =
01923a20 0c93dee2 20bf76fc 4501923a 010c904a c0725d7d 01963a20 =A0.,.. :...=
....v. :..EJ...}]r. :..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.796000] 0000=
0520: 0c97d097 20c16dfd 9101923a 010c9099 c2695e7d 01963a20 0c97d387 20cd41=
63 =A0.....m. :.......}^i. :......cA.=A0=0AJan =A01 19:33:33 kernel: [ =A0 =
=A06.800000] 00000540: c501923a 010c9097 98591ae4 14961920 08921374 08b0451=
4 14961520 08927095 =A0:.........Y. ...t....E.. ....p..=0AJan =A01 19:33:33=
 kernel: [ =A0 =A06.804000] 00000560: 08b06f44 14961320 088b7cbe 905a6ac5 9=
6352019 93cb2714 5b66450c 01923a20 =A0Do.. ....|...jZ.. 5..'...Ef[ :..=0AJa=
n =A01 19:33:33 kernel: [ =A0 =A06.808000] 00000580: 0c93cf75 205c61c6 9b01=
913a 58968baf 923a205d 87b3d201 5e541719 01923a20 =A0u....a\ :......X] :...=
....T^ :..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.812000] 000005a0: 0c93874=
f 205f4f97 0501923a 180c9391 3a20604b abf60000 6141e869 01902520 =A0O....O_=
 :.......K` :....i.Aa %..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.816000] 00=
0005c0: 40000011 18310218 c8ae0610 b0209636 00000000 01b90000 00010000 04ae=
0000 =A0...@..1.....6. .................=0AJan =A01 19:33:33 kernel: [ =A0 =
=A06.820000] 000005e0: 00950000 00002000 00000000 066b0000 00010000 1b00000=
0 253d5049 00002064 =A0..... ........k.........IP=3D%d ..=0AJan =A01 19:33:=
33 kernel: [ =A0 =A06.824000] 00000600: 64253d45 62737500 632e6364 7ef5b400=
 00030079 986238b8 00bb8306 0000195d =A0E=3D%d.usbdc.c...~y....8b.....]...=
=0AJan =A01 19:33:33 kernel: [ =A0 =A06.828000] 00000620: 00000004 01004d09=
 150000cc 6f6d6552 57206574 75656b61 65722070 73657571 =A0.....M......Remot=
e Wakeup reques=0AJan =A01 19:33:33 kernel: [ =A0 =A06.832000] 00000640: 20=
646574 656a6572 64657463 7473202c 54657461 5220020a bc504957 01922b00 =A0te=
d rejected, stateT.. RWIP..+..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.83600=
0] 00000660: 0c9352a6 20632f89 da01923a 010c939f 3a207395 21340192 af010c90=
 78a7f9b3 =A0.R.../c :........s :..4!.......x=0AJan =A01 19:33:33 kernel: [=
 =A0 =A06.840000] 00000680: 00b20000 00020000 07d00000 014800ac 41000300 54=
204344 4d524548 77617220 =A0..............H....ADC THERM raw=0AJan =A01 19:=
33:33 kernel: [ =A0 =A06.844000] 000006a0: 29642528 78566d20 70000900 6d657=
463 00632e70 08938dc2 91fa2290 08d0b108 =A0(%d) mVx...pctemp.c......"......=
=0AJan =A01 19:33:33 kernel: [ =A0 =A06.848000] 000006c0: 000d1c01 f0006c00=
 42560208 30545441 76060110 2e746c6f e0010063 48100892 =A0.....l....VBATT0.=
..volt.c......H=0AJan =A01 19:33:33 kernel: [ =A0 =A06.852000] 000006e0: c0=
2608b1 ec077037 2d37a100 690337c0 6974696e 27374061 46f207ee 4cf0088b =A0..=
&.7p....7-.7.initia@7'...F...L=0AJan =A01 19:33:33 kernel: [ =A0 =A06.85600=
0] 00000700: 20109cfb e407ee35 710c93b0 3a20fc48 9b6c0192 3f410c93 923a20fd=
 9384c601 =A0... 5......qH. :..l...A?. :.....=0AJan =A01 19:33:33 kernel: [=
 =A0 =A06.860000] 00000720: fe36120c 01923a20 0c934430 20ff3192 8f01923a 01=
0c90c6 a8002d12 00005874 =A0..6. :..0D...1. :........-..tX..=0AJan =A01 19:=
33:33 kernel: [ =A0 =A06.864000] 00000740: 792707e2 23e30c93 923a2001 93242=
801 021f630c 01923a20 0c936bd7 20031634 =A0..'y...#. :..($..c.. :...k..4..=
=A0=0AJan =A01 19:33:33 kernel: [ =A0 =A06.868000] 00000760: d801923a b40c9=
3f7 3a200411 00240192 7f690c93 933a200e 7e6fea01 00000011 =A0:......... :..=
$...i.. :...o~....=0AJan =A01 19:33:33 kernel: [ =A0 =A06.872000] 00000780:=
 00000000 18310000 7a710610 00003003 00000000 001c0000 00050000 005c0000 =
=A0......1...qz.0................\.=0AJan =A01 19:33:33 kernel: [ =A0 =A06.=
876000] 000007a0: 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A06.880000] 000007c0: 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000 00000000 =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A06.884000] 000007e0: 00000000 00000000 00000000 =
00000000 00000000 00000000 00000000 00000000 =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A06.888000] 00000800: 9185bf39 b02=
20000 00000000 00000000 00000000 04a80000 20000093 00000000 =A09.....".....=
............... ....=0AJan =A01 19:33:33 kernel: [ =A0 =A06.892000] 0000082=
0: 00000000 00001000 00000001 20763200 30203033 33353a38 2033303a 6e72656b =
=A0.............2v 30 08:53:03 kern=0AJan =A01 19:33:33 kernel: [ =A0 =A06.=
896000] 00000840: 203a6c65 3520205b 382e3038 30303830 73205d30 74726f70 617=
47320 20737574 =A0el: [ =A0580.808000] sport status=A0=0AJan =A01 19:33:33 =
kernel: [ =A0 =A06.900000] 00000860: 6f727265 54203a72 0a465655 20766f4e fe=
383033 20343600 0200fc1a 2e310000 =A0error: TUVF.Nov 308..64 ......1.=0AJan=
 =A01 19:33:33 kernel: [ =A0 =A06.904000] 00000880: fd1d2032 1d203700 20360=
0fd 3501fd0d 0104fc2c 33322e33 01fc0c20 3300ff2f =A02 ...7 ...6 ...5,...3.2=
3 .../..3=0AJan =A01 19:33:33 kernel: [ =A0 =A06.908000] 000008a0: 0b203631=
 fd2f03fc 1e203600 279801fc 07fd0920 03ff2c36 20302e34 2f01fc0d =A016 .../.=
.6 ....' ...6,..4.0 .../=0AJan =A01 19:33:33 kernel: [ =A0 =A06.912000] 000=
008c0: 323100fe 08fc0c20 3400fd2f 01fc0f20 5b337a07 5d313036 c822203a 36250=
062 =A0..12 .../..4 ....z3[601]: ".b.%6=0AJan =A01 19:33:33 kernel: [ =A0 =
=A06.916000] 000008e0: 3835373a 2d313120 322d3033 20313130 55424544 725f204=
7 73696765 74617274 =A0:758 11-30-2011 DEBUG _registrat=0AJan =A01 19:33:33=
 kernel: [ =A0 =A06.920000] 00000900: 2e6e6f69 3a707063 33343220 565a2022 3=
a70696f 0054763a 65520100 65764567 =A0ion.cpp: 243" ZVoip::vT...RegEve=0AJa=
n =A01 19:33:33 kernel: [ =A0 =A06.924000] 00000920: 2928746e 65735520 3020=
2072 01684420 206c6c69 070007ac 64657265 0000202e =A0nt() User =A00 Dh.ill =
....ered. ..=0AJan =A01 19:33:33 kernel: [ =A0 =A06.928000] 00000940: 20704=
b20 20656874 74696166 2e2e2e68 0d522d20 52322036 20303702 20025304 =A0 Kp t=
he faith... -R.6 2R.70 .S.=A0=0AJan =A01 19:33:33 kernel: [ =A0 =A06.932000=
] 00000960: 50273139 74530402 20747261 04178052 6e697265 9d752067 06203112 =
182b01c4 =A091'P..Start R...ering u..1 ...+.=0AJan =A01 19:33:33 kernel: [ =
=A0 =A06.936000] 00000980: 4e490204 33204f46 2f300419 69020418 72657473 070=
41827 3722202c 20223231 =A0..INFO 3..0/...ister'..., "712"=A0=0AJan =A01 19=
:33:33 kernel: [ =A0 =A06.940000] 000009a0: 2f272031 21646502 020e0420 0520=
3138 372003d4 2e370629 33380b7e 0e7c0c20 =A01 '/.ed! ...81 ... 7).7.~.83 .|=
.=0AJan =A01 19:33:33 kernel: [ =A0 =A06.948000] 000009c0: 3900fd2f 09205b7=
8 fe2d0d7c 982e3500 fe1a2063 20343300 2f177c0c 179801fc =A0/..9x[ .|.-..5..=
c ...34 .|./....=0AJan =A01 19:33:33 kernel: [ =A0 =A06.952000] 000009e0: 0=
1fc0b20 5b337a03 29383438 37020d7c 3430393a 200b2930 00600000 00000000 =A0 =
....z3[848)|..7:9040). ..`.....=0AJan =A01 19:33:33 kernel: [ =A0 =A06.9560=
00] 00000a00: bc616964 076b0000 00003820 00002220 00004d72 28200000 6f666e4=
9 3a290000 =A0dia...k. 8.. "..rM.... (Info..):=0AJan =A01 19:33:33 kernel: =
[ =A0 =A06.960000] 00000a20: 203a3834 4c746547 516b6e69 696c6175 29287974 3=
5343620 20736d32 027a202d =A048: GetLinkQuality() 6452ms - z.=0AJan =A01 19=
:33:33 kernel: [ =A0 =A06.964000] 00000a40: d874315b 2f530a00 352d5b4e 392d=
2f37 35332033 6d626420 6552205d 65697274 =A0[1t...S/N[-57/-93 35 dbm] Retri=
e=0AJan =A01 19:33:33 kernel: [ =A0 =A06.968000] 00000a60: 73545b73 2e30090=
0 46205d30 6d676172 73746e65 2039315b 5d392e32 73694d20 =A0s[Ts..0.0] Fragm=
ents[19 2.9] Mis=0AJan =A01 19:33:33 kernel: [ =A0 =A06.972000] 00000a80: 0=
0782763 736d3401 0aa82e22 542f0000 550920de 542c3804 2e350109 0c203537 =A0c=
'x..4ms"...../T. .U.8,T..5.75 .=0AJan =A01 19:33:33 kernel: [ =A0 =A06.9760=
00] 00000aa0: fc2d18d4 2e360100 327c3430 1ed40820 3100fd2f 19201880 203400f=
d 2f09540d =A0..-...6.04|2 .../..1.. ...4 .T./=0AJan =A01 19:33:33 kernel: =
[ =A0 =A06.980000] 00000ac0: 983501fd fd1920ce 62983601 00fe0720 fc2c3031 2=
e380105 0b203630 fd300c54 =A0..5.. ...6.b ...10,...8.06 .T.0.=0AJan =A01 19=
:33:33 kernel: [ =A0 =A06.984000] 00000ae0: 0c203200 fd3024d4 0c203400 fd30=
03fc 0c203600 fc3120d4 fd0d2000 fe2e3101 =A0.2 ..$0..4 ...0..6 .. 1.. ...1.=
.=0AJan =A01 19:33:33 kernel: [ =A0 =A06.988000] 00000b00: 20373804 3114550=
b 3900ff2d 0d20302e fd2f06fc 1e203200 0d2001fc fe3020d4 =A0.87 .U.1-..9.0 .=
../..2 ... .. 0.=0AJan =A01 19:33:33 kernel: [ =A0 =A06.992000] 00000b20: 2=
0383402 2f08fc0c 4f9802fc 10fe0820 ff2c3231 382e3905 17207f78 390100fc =A0.=
48 .../...O ...12,..9.8x. ....9=0AJan =A01 19:33:33 kernel: [ =A0 =A06.9960=
00] 00000b40: 80302e30 fc082008 2c0c0000 d2543039 03fc0c20 2000fc2f 2f04fc0=
e 353600fe =A00.0.. .....,90T. .../.. .../..65=0AJan =A01 19:33:33 kernel: =
[ =A0 =A07.000000] 00000b60: 09fc0c20 5e33d42c 2039381f 3115fd0b 3100ff2d 0=
c20302e fe3014fc 20393200 =A0 ...,.3^.89 ...1-..1.0 ...0..29=A0=0AJan =A01 =
19:33:33 kernel: [ =A0 =A07.004000] 00000b80: 3102ff1b 0d20342e fe2f0bfc 20=
323502 2f06fc0c 0d2000fc 343134d6 2b2b8022 =A0...1.4 .../..52 .../.. ..414"=
.++=0AJan =A01 19:33:33 kernel: [ =A0 =A07.008000] 00000ba0: 31032054 30323=
a34 57342031 34383220 36205533 36205524 0320543e 34203932 =A0T .14:201 4W 2=
843U 6$U 6>T .29 4=0AJan =A01 19:33:33 kernel: [ =A0 =A07.012000] 00000bc0:=
 0120362e 2c312055 3901362c 20312e33 31392c0c 0d2000fc fc2f0954 392c3501 =
=A0.6 .U 1,,6.93.1 .,91.. .T./..5,9=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
016000] 00000be0: b5000011 06101831 7f2edd2d 00000000 00000000 0000001c 000=
00005 00000000 =A0....1...-.......................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.020000] 00000c00: 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000 00000000 =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.024000] 00000c20: 00000000 00000000 00000000 =
00000000 00000000 00000000 00000000 00000000 =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.028000] 00000c40: 00000000 000=
00000 00000000 00000000 00000000 00000000 00000000 00000000 =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.032000] 00000c6=
0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
036000] 00000c80: 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.040000] 00000ca0: 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000 00000000 =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.044000] 00000cc0: 00000000 00000000 00000000 =
00000000 00000000 00000000 00000000 00000000 =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.048000] 00000ce0: 00000000 000=
00000 00000000 00000000 00000000 00000000 00000000 00000000 =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.052000] 00000d0=
0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
056000] 00000d20: 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.060000] 00000d40: 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000 00000000 =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.068000] 00000d80: 00000000 00000000 00000000 =
00000000 00000000 00000000 00000000 00000000 =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.072000] 00000da0: 00000000 000=
00000 00000000 00000000 00000000 00000000 00000000 00000000 =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.076000] 00000dc=
0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
080000] 00000de0: 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.084000] 00000e00: 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000 00000000 =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.088000] 00000e20: 00000000 00000000 00000000 =
00000000 00000000 00000000 00000000 00000000 =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.092000] 00000e40: 00000000 000=
00000 00000000 00000000 00000000 00000000 00000000 00000000 =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.096000] 00000e6=
0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
100000] 00000e80: 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.104000] 00000ea0: 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000 00000000 =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.108000] 00000ec0: 00000000 00000000 00000000 =
00000000 00000000 00000000 00000000 00000000 =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.112000] 00000ee0: 00000000 000=
00000 00000000 00000000 00000000 00000000 00000000 00000000 =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.116000] 00000f0=
0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
120000] 00000f20: 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.124000] 00000f40: 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000 00000000 =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.128000] 00000f60: 00000000 00000000 00000000 =
00000000 00000000 00000000 00000000 00000000 =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.132000] 00000f80: 00000000 000=
00000 00000000 00000000 00000000 00000000 00000000 00000000 =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.136000] 00000fa=
0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
140000] 00000fc0: 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.144000] 00000fe0: 00000000 00000000 00000000 00000000 000000=
00 00000000 00000000 00000000 =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.148000] 00001000: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.152000] 00001020: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.156000] 0000104=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
160000] 00001060: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.164000] 00001080: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.168000] 000010a0: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.172000] 000010c0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.176000] 000010e=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
184000] 00001100: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.188000] 00001120: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.192000] 00001140: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.196000] 00001160: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.200000] 0000118=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
204000] 000011a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.208000] 000011c0: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.212000] 000011e0: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.216000] 00001200: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.220000] 0000122=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
224000] 00001240: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.228000] 00001260: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.232000] 00001280: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.236000] 000012a0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.240000] 000012c=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
244000] 000012e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.248000] 00001300: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.252000] 00001320: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.256000] 00001340: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.260000] 0000136=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
264000] 00001380: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.268000] 000013a0: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.272000] 000013c0: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.276000] 000013e0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.280000] 0000140=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
284000] 00001420: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.288000] 00001440: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.292000] 00001460: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.296000] 00001480: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.300000] 000014a=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
308000] 000014e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.312000] 00001500: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.316000] 00001520: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.320000] 00001540: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.324000] 0000156=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
328000] 00001580: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.332000] 000015a0: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.336000] 000015c0: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.340000] 000015e0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.344000] 0000160=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
348000] 00001620: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.352000] 00001640: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.356000] 00001660: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.360000] 00001680: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.364000] 000016a=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
368000] 000016c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.372000] 000016e0: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.376000] 00001700: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.380000] 00001720: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.384000] 0000174=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
388000] 00001760: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.392000] 00001780: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.396000] 000017a0: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.400000] 000017c0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.404000] 000017e=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
408000] 00001800: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.412000] 00001820: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.420000] 00001840: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.424000] 00001860: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.428000] 0000188=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
432000] 000018a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.436000] 000018c0: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.440000] 000018e0: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.444000] 00001900: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.448000] 0000192=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
452000] 00001940: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.456000] 00001960: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.460000] 00001980: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.464000] 000019a0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.468000] 000019c=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
472000] 000019e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.476000] 00001a00: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.480000] 00001a20: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.484000] 00001a40: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.488000] 00001a6=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
492000] 00001a80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.496000] 00001aa0: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.500000] 00001ac0: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.504000] 00001ae0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.508000] 00001b0=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
512000] 00001b20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.516000] 00001b40: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.520000] 00001b60: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.524000] 00001b80: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.528000] 00001ba=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
532000] 00001bc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.536000] 00001be0: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.540000] 00001c00: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.544000] 00001c20: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.548000] 00001c4=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
552000] 00001c60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.556000] 00001c80: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.560000] 00001ca0: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.564000] 00001cc0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.568000] 00001ce=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
572000] 00001d00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.576000] 00001d20: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.580000] 00001d40: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.584000] 00001d60: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.588000] 00001d8=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
592000] 00001da0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.596000] 00001dc0: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.600000] 00001de0: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.604000] 00001e00: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.608000] 00001e2=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
612000] 00001e40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.616000] 00001e60: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.620000] 00001e80: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.624000] 00001ea0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.628000] 00001ec=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
632000] 00001ee0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.636000] 00001f00: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.640000] 00001f20: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.644000] 00001f40: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.648000] 00001f6=
0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.=
656000] 00001f80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0AJan =A01 19:33:33 kern=
el: [ =A0 =A07.660000] 00001fa0: ffffffff ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff =A0................................=0AJan =A0=
1 19:33:33 kernel: [ =A0 =A07.664000] 00001fc0: ffffffff ffffffff ffffffff =
ffffffff ffffffff ffffffff ffffffff ffffffff =A0...........................=
.....=0AJan =A01 19:33:33 kernel: [ =A0 =A07.668000] 00001fe0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0............=
....................=0AJan =A01 19:33:33 kernel: [ =A0 =A07.672000] UBIFS e=
rror (pid 357): ubifs_recover_leb: LEB 498 scanning failed=0AJan =A01 19:33=
:34 kernel: [ =A0 =A07.692000] UBIFS DBG (pid 359): ubifs_bg_thread: backgr=
ound thread "ubifs_bgt1_0" stops=0AJan =A01 19:33:34 kernel: [ =A0 =A07.696=
000] PM: Removing info for No Bus:ubifs_1_0=0A
