Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19iG6q-0005Ta-SA
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2003 17:16:57 +0100
Message-Id: <5.1.1.6.0.20030731180128.024a0020@192.168.2.1>
Date: Thu, 31 Jul 2003 18:16:49 +0200
To: tglx@linutronix.de,linux-mtd@lists.infradead.org
From: llandre <r&d@wawnet.biz>
In-Reply-To: <200307151945.33907.tglx@linutronix.de>
References: <5.1.1.6.0.20030715182633.027cd5c0@dns.struinfo.it>
 <5.1.1.6.0.20030715182633.027cd5c0@dns.struinfo.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: Re: Help to understand error messages (MTD on Samsung NAND
  chips)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> >- bash-2.05# eraseall /dev/mtd0
> > Erasing 16 Kibyte @ 0 --  0 % complete.
> > eraseall: /dev/mtd0: MTD Erase failure: Input/output error
> > Erasing 16 Kibyte @ 4000 --  0 % complete.
> > eraseall: /dev/mtd0: MTD Erase failure: Input/output error
> > Erasing 16 Kibyte @ 8000 --  0 % complete.
>
>This message comes either, if you try to erase a bad block, which is not
>likely, as all your blocks would be bad or the erasefunction is not
>successful
>
>Do you use the latest CVS code ?
>If yes, there were a lot of changes in NAND the last few days.
>
>Can you switch on the debugging in MTD and provide more detailed information.
>Please do a
>echo 9 >/proc/sys/kernel/printk
>before you start the erase .

Hi Thomas,

sorry for this late response, but I had to work for a couple of weeks on 
another project.

Anyway I restored the original source files included in the kernel and I 
collected the debug information printed during the execution of the 
eraseall command.
Here is a short dump of what I got:

---------------------------------------------------------------------------------------
bash-2.05# echo 9 >/proc/sys/kernel/printk
bash-2.05# eraseall /dev/mtd0
MTD_open
MTD_ioctl
Erasing 16 KibyMTD_ioctl
te @ 0 --  0 % cnand_erase: start = 0x00000000, len = 16384
omplete.nand_erase: attempt to erase a bad block at page 0x00000000

MTD_ioctl
eraseall: /dev/mnand_erase: start = 0x00004000, len = 16384
td0: MTD Erase fnand_erase: attempt to erase a bad block at page 0x00000020
ailure: Input/ouMTD_ioctl
tput error
Eranand_erase: start = 0x00008000, len = 16384
sing 16 Kibyte @nand_erase: attempt to erase a bad block at page 0x00000040
  4000 --  0 % coMTD_ioctl
mplete.
erasealnand_erase: start = 0x0000c000, len = 16384
l: /dev/mtd0: MTnand_erase: attempt to erase a bad block at page 0x00000060
D Erase failure:MTD_ioctl
  Input/output ernand_erase: start = 0x00010000, len = 16384
ror
Erasing 16nand_erase: attempt to erase a bad block at page 0x00000080
  Kibyte @ 8000 -MTD_ioctl
-  0 % complete.nand_erase: start = 0x00014000, len = 16384

eraseall: /devnand_erase: attempt to erase a bad block at page 0x000000a0
/mtd0: MTD EraseMTD_ioctl
  failure: Input/nand_erase: start = 0x00018000, len = 16384
output error
Enand_erase: attempt to erase a bad block at page 0x000000c0
rasing 16 KibyteMTD_ioctl
  @ c000 --  0 % nand_erase: start = 0x0001c000, len = 16384
complete.

erasenand_erase: attempt to erase a bad block at page 0x000000e0
all: /dev/mtd0: MTD_ioctl
MTD Erase failurnand_erase: start = 0x00020000, len = 16384
e: Input/output nand_erase: attempt to erase a bad block at page 0x00000100
error
[...]
Erasing 16nand_erase: attempt to erase a bad block at page 0x000008a0
  Kibyte @ 7c000 MTD_ioctl
--  1 % completenand_erase: start = 0x00118000, len = 16384
.
eraseall: /denand_erase: attempt to erase a bad block at page 0x000008c0
v/mtd0: MTD ErasMTD_ioctl
e failure: Inputnand_erase: start = 0x0011c000, len = 16384
/output error
nand_erase: attempt to erase a bad block at page 0x000008e0
Erasing 16 KibytMTD_ioctl
e @ 80000 --  1 nand_erase: start = 0x00120000, len = 16384
% complete.
eranand_erase: attempt to erase a bad block at page 0x00000900
seall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 88000 --  1 % complete.
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 8c000 --  1 % complete.
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 90000 --  1 % complete.
[...]
eraseall: /dev/mtd0: MTD Erase failure: Input/output error
Erasing 16 Kibyte @ 118000 --  3 % complete.
eraseall: MTD_ioctl
/dev/mtd0: MTD Enand_erase: start = 0x00124000, len = 16384
rase failure: Innand_erase: attempt to erase a bad block at page 0x00000920
put/output errorMTD_ioctl

Erasing 16 Kinand_erase: start = 0x00128000, len = 16384
byte @ 11c000 --nand_erase: attempt to erase a bad block at page 0x00000940
MTD_ioctlplete.

eraseall: /dev/nand_erase: start = 0x0012c000, len = 16384
mtd0: MTD Erase nand_erase: attempt to erase a bad block at page 0x00000960
failure: Input/oMTD_ioctl
utput error
Ernand_erase: start = 0x00130000, len = 16384
asing 16 Kibyte nand_erase: attempt to erase a bad block at page 0x00000980
@ 120000 --  3 %MTD_ioctl
  complete.
erasnand_erase: start = 0x00134000, len = 16384
eall: /dev/mtd0:nand_erase: attempt to erase a bad block at page 0x000009a0
  MTD Erase failuMTD_ioctl
re: Input/outputnand_erase: start = 0x00138000, len = 16384
  error
Erasingnand_erase: attempt to erase a bad block at page 0x000009c0
  16 Kibyte @ 124MTD_ioctl
000 --  3 % compnand_erase: start = 0x0013c000, len = 16384
lete.
eraseall:nand_erase: attempt to erase a bad block at page 0x000009e0
  /dev/mtd0: MTD MTD_ioctl
Erase failure: Inand_erase: start = 0x00140000, len = 16384
nput/output erronand_erase: attempt to erase a bad block at page 0x00000a00
r
Erasing 16 KMTD_ioctl
ibyte @ 128000 -nand_erase: start = 0x00144000, len = 16384
-  3 % complete.nand_erase: attempt to erase a bad block at page 0x00000a20

eraseall: /devMTD_ioctl
/mtd0: MTD Erasenand_erase: start = 0x00148000, len = 16384
  failure: Input/nand_erase: attempt to erase a bad block at page 0x00000a40
output error
EMTD_ioctl
rasing 16 Kibytenand_erase: start = 0x0014c000, len = 16384
  @ 12c000 --  3 nand_erase: attempt to erase a bad block at page 0x00000a60
% complete.
eraMTD_ioctl
seall: /dev/mtd0nand_erase: start = 0x00150000, len = 16384
: MTD Erase failnand_erase: attempt to erase a bad block at page 0x00000a80
ure: Input/outpuMTD_ioctl
t error
Erasinnand_erase: start = 0x00154000, len = 16384
g 16 Kibyte @ 13nand_erase: attempt to erase a bad block at page 0x00000aa0
0000 --  3 % comMTD_ioctl
plete.
eraseallnand_erase: start = 0x00158000, len = 16384
: /dev/mtd0: MTDnand_erase: attempt to erase a bad block at page 0x00000ac0
  Erase failure: MTD_ioctl
Input/output errnand_erase: start = 0x0015c000, len = 16384
or
Erasing 16 nand_erase: attempt to erase a bad block at page 0x00000ae0
Kibyte @ 134000 MTD_ioctl
--  3 % completenand_erase: start = 0x00160000, len = 16384
.
eraseall: /denand_erase: attempt to erase a bad block at page 0x00000b00
v/mtd0: MTD ErasMTD_ioctl
e failure: Inputnand_erase: start = 0x00164000, len = 16384
/output error
nand_erase: attempt to erase a bad block at page 0x00000b20
Erasing 16 KibytMTD_ioctl
e @ 138000 --  3nand_erase: start = 0x00168000, len = 16384
  % complete.
ernand_erase: attempt to erase a bad block at page 0x00000b40
aseall: /dev/mtdMTD_ioctl
0: MTD Erase fainand_erase: start = 0x0016c000, len = 16384
lure: Input/outpMTD_ioctl
ut error
Erasinand_erase: start = 0x00170000, len = 16384
ng 16 Kibyte @ 1MTD_ioctl
3c000 --  3 % conand_erase: start = 0x00174000, len = 16384
mplete.
erasealMTD_ioctl
l: /dev/mtd0: MTnand_erase: start = 0x00178000, len = 16384
D Erase failure:MTD_ioctl
  Input/output ernand_erase: start = 0x0017c000, len = 16384
ror
Erasing 16MTD_ioctl
  Kibyte @ 140000nand_erase: start = 0x00180000, len = 16384
  --  3 % completMTD_ioctl
e.
eraseall: /dnand_erase: start = 0x00184000, len = 16384
ev/mtd0: MTD EraMTD_ioctl
se failure: Inpunand_erase: start = 0x00188000, len = 16384
t/output error
MTD_ioctl
Erasing 16 Kibynand_erase: start = 0x0018c000, len = 16384
te @ 144000 --  MTD_ioctl
3 % complete.
enand_erase: start = 0x00190000, len = 16384
raseall: /dev/mtMTD_ioctl
d0: MTD Erase fanand_erase: start = 0x00194000, len = 16384
ilure: Input/outMTD_ioctl
put error
Erasnand_erase: start = 0x00198000, len = 16384
ing 16 Kibyte @ MTD_ioctl
148000 --  4 % cnand_erase: start = 0x0019c000, len = 16384
omplete.
eraseaMTD_ioctl
ll: /dev/mtd0: Mnand_erase: start = 0x001a0000, len = 16384
TD Erase failureMTD_ioctl
: Input/output enand_erase: start = 0x001a4000, len = 16384
rror
Erasing 1MTD_ioctl
6 Kibyte @ 14c00nand_erase: start = 0x001a8000, len = 16384
0 --  4 % compleMTD_ioctl
te.
eraseall: /nand_erase: start = 0x001ac000, len = 16384
dev/mtd0: MTD ErMTD_ioctl
ase failure: Inpnand_erase: start = 0x001b0000, len = 16384
MTD_ioctl error

Erasing 16 Kibnand_erase: start = 0x001b4000, len = 16384
yte @ 150000 -- MTD_ioctl
  4 % complete.
nand_erase: start = 0x001b8000, len = 16384
eraseall: /dev/mMTD_ioctl
td0: MTD Erase fnand_erase: start = 0x001bc000, len = 16384
ailure: Input/ouMTD_ioctl
tput error
Eranand_erase: start = 0x001c0000, len = 16384
sing 16 Kibyte @MTD_ioctl
  154000 --  4 % nand_erase: start = 0x001c4000, len = 16384
complete.
eraseMTD_ioctl
all: /dev/mtd0: nand_erase: start = 0x001c8000, len = 16384
MTD Erase failurMTD_ioctl
e: Input/output nand_erase: start = 0x001cc000, len = 16384
error
Erasing MTD_ioctl
16 Kibyte @ 1580nand_erase: start = 0x001d0000, len = 16384
00 --  4 % complMTD_ioctl
ete.
eraseall: nand_erase: start = 0x001d4000, len = 16384
/dev/mtd0: MTD EMTD_ioctl
rase failure: Innand_erase: start = 0x001d8000, len = 16384
put/output errorMTD_ioctl

Erasing 16 Kinand_erase: start = 0x001dc000, len = 16384
byte @ 15c000 --MTD_ioctl
nand_erase: start = 0x001e0000, len = 16384

eraseall: /dev/MTD_ioctl
mtd0: MTD Erase nand_erase: start = 0x001e4000, len = 16384
failure: Input/oMTD_ioctl
utput error
Ernand_erase: start = 0x001e8000, len = 16384
asing 16 Kibyte MTD_ioctl
@ 160000 --  4 %nand_erase: start = 0x001ec000, len = 16384
  complete.
erasMTD_ioctl
eall: /dev/mtd0:nand_erase: start = 0x001f0000, len = 16384
  MTD Erase failuMTD_ioctl
re: Input/outputnand_erase: start = 0x001f4000, len = 16384
  error
ErasingMTD_ioctl
  16 Kibyte @ 164nand_erase: start = 0x001f8000, len = 16384
000 --  4 % compMTD_ioctl
lete.
eraseall:nand_erase: start = 0x001fc000, len = 16384
  /dev/mtd0: MTD MTD_ioctl
Erase failure: Inand_erase: start = 0x00200000, len = 16384
nput/output erroMTD_ioctl
r
Erasing 16 Knand_erase: start = 0x00204000, len = 16384
ibyte @ 168000 -MTD_ioctl
-  4 % complete.nand_erase: start = 0x00208000, len = 16384

eraseall: /devMTD_ioctl
/mtd0: MTD Erasenand_erase: start = 0x0020c000, len = 16384
  failure: Input/MTD_ioctl
output error
Enand_erase: start = 0x00210000, len = 16384
rasing 16 KibyteMTD_ioctl
  @ 16c000 --  4 nand_erase: start = 0x00214000, len = 16384
ErasMTD_ioctl
ing 16 Kibyte @ nand_erase: start = 0x00218000, len = 16384
170000 --  4 % cMTD_ioctl
Erasingnand_erase: start = 0x0021c000, len = 16384
  16 Kibyte @ 174MTD_ioctl
000 --  4 % compnand_erase: start = 0x00220000, len = 16384
Erasing 16MTD_ioctl
  Kibyte @ 178000nand_erase: start = 0x00224000, len = 16384
  --  4 % completMTD_ioctl
Erasing 16 Kinand_erase: start = 0x00228000, len = 16384
byte @ 17c000 --MTD_ioctl
nand_erase: start = 0x0022c000, len = 16384
Erasing 16 KibytMTD_ioctl
e @ 180000 --  4nand_erase: start = 0x00230000, len = 16384
EraMTD_ioctl
sing 16 Kibyte @nand_erase: start = 0x00234000, len = 16384
  184000 --  4 % MTD_ioctl
Erasinnand_erase: start = 0x00238000, len = 16384
g 16 Kibyte @ 18MTD_ioctl
8000 --  4 % comnand_erase: start = 0x0023c000, len = 16384
Erasing 1MTD_ioctl
6 Kibyte @ 18c00nand_erase: start = 0x00240000, len = 16384
0 --  4 % compleMTD_ioctl
Erasing 16 Knand_erase: start = 0x00244000, len = 16384
ibyte @ 190000 -MTD_ioctl
-  4 % complete.nand_erase: start = 0x00248000, len = 16384
Erasing 16 KibyMTD_ioctl
te @ 194000 --  nand_erase: start = 0x0024c000, len = 16384
ErMTD_ioctle.
asing 16 Kibyte nand_erase: start = 0x00250000, len = 16384
@ 198000 --  4 %MTD_ioctl
Erasinand_erase: start = 0x00254000, len = 16384
ng 16 Kibyte @ 1MTD_ioctl
9c000 --  5 % conand_erase: start = 0x00258000, len = 16384
Erasing MTD_ioctl
16 Kibyte @ 1a00nand_erase: start = 0x0025c000, len = 16384
00 --  5 % complMTD_ioctl
Erasing 16 nand_erase: start = 0x00260000, len = 16384
Kibyte @ 1a4000 MTD_ioctl
--  5 % completenand_erase: start = 0x00264000, len = 16384
Erasing 16 KibMTD_ioctl
yte @ 1a8000 -- nand_erase: start = 0x00268000, len = 16384
EMTD_ioctlete.
rasing 16 Kibytenand_erase: start = 0x0026c000, len = 16384
  @ 1ac000 --  5 MTD_ioctl
Erasnand_erase: start = 0x00270000, len = 16384
ing 16 Kibyte @ MTD_ioctl
1b0000 --  5 % cnand_erase: start = 0x00274000, len = 16384
ErasingMTD_ioctl
  16 Kibyte @ 1b4nand_erase: start = 0x00278000, len = 16384
000 --  5 % compMTD_ioctl
Erasing 16nand_erase: start = 0x0027c000, len = 16384
  Kibyte @ 1b8000MTD_ioctl
  --  5 % completnand_erase: start = 0x00280000, len = 16384
Erasing 16 KiMTD_ioctl
byte @ 1bc000 --nand_erase: start = 0x00284000, len = 16384
MTD_ioctlplete.
Erasing 16 Kibytnand_erase: start = 0x00288000, len = 16384
e @ 1c0000 --  5MTD_ioctl
Eranand_erase: start = 0x0028c000, len = 16384
sing 16 Kibyte @MTD_ioctl
  1c4000 --  5 % nand_erase: start = 0x00290000, len = 16384
ErasinMTD_ioctl
g 16 Kibyte @ 1cnand_erase: start = 0x00294000, len = 16384
8000 --  5 % comMTD_ioctl
Erasing 1nand_erase: start = 0x00298000, len = 16384
6 Kibyte @ 1cc00MTD_ioctl
0 --  5 % complenand_erase: start = 0x0029c000, len = 16384
Erasing 16 KMTD_ioctl
ibyte @ 1d0000 -nand_erase: start = 0x002a0000, len = 16384
-  5 % complete.MTD_ioctl
Erasing 16 Kibynand_erase: start = 0x002a4000, len = 16384
te @ 1d4000 --  MTD_ioctl
Ernand_erase: start = 0x002a8000, len = 16384
asing 16 Kibyte MTD_ioctl
@ 1d8000 --  5 %nand_erase: start = 0x002ac000, len = 16384
ErasiMTD_ioctl
ng 16 Kibyte @ 1nand_erase: start = 0x002b0000, len = 16384
dc000 --  5 % coMTD_ioctl
Erasing nand_erase: start = 0x002b4000, len = 16384
16 Kibyte @ 1e00MTD_ioctl
00 --  5 % complnand_erase: start = 0x002b8000, len = 16384
Erasing 16 MTD_ioctl
Kibyte @ 1e4000 nand_erase: start = 0x002bc000, len = 16384
--  5 % completeMTD_ioctl
Erasing 16 Kibnand_erase: start = 0x002c0000, len = 16384
yte @ 1e8000 -- MTD_ioctl
Enand_erase: start = 0x002c4000, len = 16384
rasing 16 KibyteMTD_ioctl
  @ 1ec000 --  6 nand_erase: start = 0x002c8000, len = 16384
ErasMTD_ioctl
ing 16 Kibyte @ nand_erase: start = 0x002cc000, len = 16384
1f0000 --  6 % cMTD_ioctl
Erasingnand_erase: start = 0x002d0000, len = 16384
  16 Kibyte @ 1f4MTD_ioctl
000 --  6 % compnand_erase: start = 0x002d4000, len = 16384
Erasing 16MTD_ioctl
  Kibyte @ 1f8000nand_erase: start = 0x002d8000, len = 16384
  --  6 % completMTD_ioctl
Erasing 16 Kinand_erase: start = 0x002dc000, len = 16384
byte @ 1fc000 --MTD_ioctl
nand_erase: start = 0x002e0000, len = 16384
Erasing 16 KibytMTD_ioctl
e @ 200000 --  6nand_erase: start = 0x002e4000, len = 16384
EraMTD_ioctl
sing 16 Kibyte @nand_erase: start = 0x002e8000, len = 16384
  204000 --  6 % MTD_ioctl
Erasinnand_erase: start = 0x002ec000, len = 16384
g 16 Kibyte @ 20MTD_ioctl
8000 --  6 % comnand_erase: start = 0x002f0000, len = 16384
Erasing 1MTD_ioctl
6 Kibyte @ 20c00nand_erase: start = 0x002f4000, len = 16384
0 --  6 % compleMTD_ioctl
Erasing 16 Knand_erase: start = 0x002f8000, len = 16384
ibyte @ 210000 -MTD_ioctl
-  6 % complete.nand_erase: start = 0x002fc000, len = 16384
Erasing 16 KibyMTD_ioctl
te @ 214000 --  nand_erase: start = 0x00300000, len = 16384
ErMTD_ioctle.
asing 16 Kibyte nand_erase: start = 0x00304000, len = 16384
@ 218000 --  6 %MTD_ioctl
Erasinand_erase: start = 0x00308000, len = 16384
ng 16 Kibyte @ 2MTD_ioctl
1c000 --  6 % conand_erase: start = 0x0030c000, len = 16384
Erasing MTD_ioctl
16 Kibyte @ 2200nand_erase: start = 0x00310000, len = 16384
00 --  6 % complMTD_ioctl
Erasing 16 nand_erase: start = 0x00314000, len = 16384
Kibyte @ 224000 MTD_ioctl
--  6 % completenand_erase: start = 0x00318000, len = 16384
Erasing 16 KibMTD_ioctl
yte @ 228000 -- nand_erase: start = 0x0031c000, len = 16384
EMTD_ioctlete.
rasing 16 Kibytenand_erase: start = 0x00320000, len = 16384
  @ 22c000 --  6 MTD_ioctl
Erasnand_erase: start = 0x00324000, len = 16384
ing 16 Kibyte @ MTD_ioctl
230000 --  6 % cnand_erase: start = 0x00328000, len = 16384
ErasingMTD_ioctl
  16 Kibyte @ 234nand_erase: start = 0x0032c000, len = 16384
000 --  6 % compMTD_ioctl
Erasing 16nand_erase: start = 0x00330000, len = 16384
  Kibyte @ 238000MTD_ioctl
  --  6 % completnand_erase: start = 0x00334000, len = 16384
Erasing 16 KiMTD_ioctl
byte @ 23c000 --nand_erase: start = 0x00338000, len = 16384
MTD_ioctlplete.
Erasing 16 Kibytnand_erase: start = 0x0033c000, len = 16384
e @ 240000 --  7MTD_ioctl
Eranand_erase: start = 0x00340000, len = 16384
sing 16 Kibyte @MTD_ioctl
  244000 --  7 % nand_erase: start = 0x00344000, len = 16384
ErasinMTD_ioctl
g 16 Kibyte @ 24nand_erase: start = 0x00348000, len = 16384
8000 --  7 % comMTD_ioctl
Erasing 1nand_erase: start = 0x0034c000, len = 16384
6 Kibyte @ 24c00MTD_ioctl
0 --  7 % complenand_erase: start = 0x00350000, len = 16384
Erasing 16 KMTD_ioctl
ibyte @ 250000 -nand_erase: start = 0x00354000, len = 16384
-  7 % complete.MTD_ioctl
Erasing 16 Kibynand_erase: start = 0x00358000, len = 16384
te @ 254000 --  MTD_ioctl
Ernand_erase: start = 0x0035c000, len = 16384
asing 16 Kibyte MTD_ioctl
@ 258000 --  7 %nand_erase: start = 0x00360000, len = 16384
ErasiMTD_ioctl
ng 16 Kibyte @ 2nand_erase: start = 0x00364000, len = 16384
5c000 --  7 % coMTD_ioctl
Erasing nand_erase: start = 0x00368000, len = 16384
16 Kibyte @ 2600MTD_ioctl
00 --  7 % complnand_erase: start = 0x0036c000, len = 16384
Erasing 16 MTD_ioctl
Kibyte @ 264000 nand_erase: start = 0x00370000, len = 16384
--  7 % completeMTD_ioctl
Erasing 16 Kibnand_erase: start = 0x00374000, len = 16384
yte @ 268000 -- MTD_ioctl
Enand_erase: start = 0x00378000, len = 16384
rasing 16 KibyteMTD_ioctl
  @ 26c000 --  7 nand_erase: start = 0x0037c000, len = 16384
ErasMTD_ioctl
ing 16 Kibyte @ nand_erase: start = 0x00380000, len = 16384
270000 --  7 % cMTD_ioctl
Erasingnand_erase: start = 0x00384000, len = 16384
  16 Kibyte @ 274MTD_ioctl
000 --  7 % compnand_erase: start = 0x00388000, len = 16384
Erasing 16MTD_ioctl
  Kibyte @ 278000nand_erase: start = 0x0038c000, len = 16384
  --  7 % completMTD_ioctl
Erasing 16 Kinand_erase: start = 0x00390000, len = 16384
byte @ 27c000 --MTD_ioctl
nand_erase: start = 0x00394000, len = 16384
Erasing 16 KibytMTD_ioctl
e @ 280000 --  7nand_erase: start = 0x00398000, len = 16384
EraMTD_ioctl
sing 16 Kibyte @nand_erase: start = 0x0039c000, len = 16384
  284000 --  7 % MTD_ioctl
Erasinnand_erase: start = 0x003a0000, len = 16384
g 16 Kibyte @ 28MTD_ioctl
8000 --  7 % comnand_erase: start = 0x003a4000, len = 16384
Erasing 1MTD_ioctl
6 Kibyte @ 28c00nand_erase: start = 0x003a8000, len = 16384
0 --  7 % compleMTD_ioctl
Erasing 16 Knand_erase: start = 0x003ac000, len = 16384
ibyte @ 290000 -MTD_ioctl
...
Erasing 16MTD_ioctl
  Kibyte @ 1fb400nand_erase: start = 0x01ff8000, len = 16384
0 -- 99 % compleMTD_ioctl
Erasing 16 Knand_erase: start = 0x01ffc000, len = 16384
ibyte @ 1fb8000 MTD_close
-- 99 % completenand_sync: called
Erased 32768 Kibyte @ 0 -- 100% complete.
bash-2.05#
---------------------------------------------------------------------------------------


Hope this helps,

llandre
