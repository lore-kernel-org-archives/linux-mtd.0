Received: from nm14-vm0.bullet.mail.sp2.yahoo.com ([98.139.91.246])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RV7R5-0007hS-IG
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 20:04:22 +0000
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
 <1310988807.20738.44.camel@sauron>
 <1311707851.83484.YahooMailRC@web114602.mail.gq1.yahoo.com>
 <1313411391.2583.22.camel@sauron>
Message-ID: <1322510657.7380.YahooMailNeo@web114602.mail.gq1.yahoo.com>
Date: Mon, 28 Nov 2011 12:04:17 -0800 (PST)
From: Reginald Perrin <reggyperrin@yahoo.com>
Subject: Re: UBIFS Corruption
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
In-Reply-To: <1313411391.2583.22.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: Reginald Perrin <reggyperrin@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=A0=0A=0A> There are no interesting messages:=0A> =0A> 1. You enabled all =
UBIFS debugging messages which are too verbose and=0A> not needed. Do not e=
nable them because they "push out" the interesting=0A> diagnostic messages =
from the kernel printk ring buffer.=0A> =0A> 2. And it is strange that the =
last messages are about the commit and not=0A> about mount failure - are yo=
u sure that you typed dmesg right after the=0A> UBIFS mount failure without=
 rebooting ?=0A> =0A> -- =0A> Best Regards,=0A> Artem Bityutskiy=0A> =0A> =
=0A=0A=0AHi Artem,=0A=0AWhatever is causing this, it seems to be increasing=
 in frequency (or we are getting better at inadvertently causing it).=0A=0A=
I now have several units in this state, and have tried to change the log le=
vel to gather more information. =A0Since the ubifs volume I need to mount i=
sn't the root-file-system, I have the luxury of being able to create test k=
ernels, flash them, and boot them into the system, at which point they try =
and mount the corrupted partition.=0A=0ABelow, you can see where I tried to=
 mount this partition after booting (I discarded all old messages, so this =
is just the output of attempting to mount this volume). =A0=0A=0ANOTE: =A0M=
y #1 priority is figuring out how to recover from this -- when this happens=
, we're actually bricked, and can't recover (since all the key recovery pro=
grams are actually on this volume that can't mount). =A0=0A=0AWhat else can=
 I do to get more information to you to assist?=0A=0ATIA=0ARP=0A=0Aroot:/> =
rm /var/log/messages=A0=0Aroot:/> mount -t ubifs ubi1:home /home=0Amount: m=
ounting ubi1:home on /home failed: Structure needs cleaning=0Aroot:/> cat /=
var/log/messages=A0=0ADec 31 16:01:51 kernel: [ =A0111.400000] UBIFS DBG (p=
id 524): ubifs_getxattr: xattr 'security.capability', ino 319 ('busybox'), =
buf size 20=0ADec 31 16:01:51 kernel: [ =A0111.404000] UBIFS DBG (pid 424):=
 do_readpage: ino 69, pg 0, i_size 9, flags 0x1=0ADec 31 16:01:51 kernel: [=
 =A0111.444000] UBIFS DBG (pid 524): do_readpage: ino 319, pg 0, i_size 318=
888, flags 0x1=0ADec 31 16:01:51 kernel: [ =A0111.448000] UBIFS DBG (pid 52=
4): do_readpage: ino 133, pg 0, i_size 20396, flags 0x1=0ADec 31 16:01:51 k=
ernel: [ =A0111.452000] UBIFS DBG (pid 524): do_readpage: ino 319, pg 74, i=
_size 318888, flags 0x1=0ADec 31 16:01:51 kernel: [ =A0111.456000] UBIFS DB=
G (pid 524): do_readpage: ino 319, pg 75, i_size 318888, flags 0x1=0ADec 31=
 16:01:51 kernel: [ =A0111.460000] UBIFS DBG (pid 524): populate_page: ino =
319, pg 76, i_size 318888, flags 0x1=0ADec 31 16:01:51 kernel: [ =A0111.460=
000] UBIFS DBG (pid 524): populate_page: ino 319, pg 77, i_size 318888, fla=
gs 0x1=0ADec 31 16:01:51 kernel: [ =A0111.460000] UBIFS DBG (pid 524): do_r=
eadpage: ino 133, pg 4, i_size 20396, flags 0x1=0ADec 31 16:01:51 kernel: [=
 =A0111.464000] UBIFS DBG (pid 524): do_readpage: ino 107, pg 0, i_size 208=
3, flags 0x1=0ADec 31 16:01:51 kernel: [ =A0111.468000] UBIFS DBG (pid 524)=
: do_readpage: ino 134, pg 0, i_size 240184, flags 0x1=0ADec 31 16:01:51 ke=
rnel: [ =A0111.472000] UBIFS DBG (pid 524): do_readpage: ino 134, pg 56, i_=
size 240184, flags 0x1=0ADec 31 16:01:51 kernel: [ =A0111.472000] UBIFS DBG=
 (pid 524): do_readpage: ino 134, pg 57, i_size 240184, flags 0x1=0ADec 31 =
16:01:51 kernel: [ =A0111.476000] UBIFS DBG (pid 524): populate_page: ino 1=
34, pg 58, i_size 240184, flags 0x1=0ADec 31 16:01:51 kernel: [ =A0111.9880=
00] UBIFS DBG (pid 405): ubifs_readdir: dir ino 1, f_pos 0x0=0ADec 31 16:01=
:51 kernel: [ =A0111.988000] UBIFS DBG (pid 405): ubifs_readdir: feed 'bin'=
, ino 208, new f_pos 0x23605a=0ADec 31 16:01:51 kernel: [ =A0111.988000] UB=
IFS DBG (pid 405): ubifs_readdir: feed 'dev', ino 384, new f_pos 0x23ee05=
=0ADec 31 16:01:51 kernel: [ =A0111.992000] UBIFS DBG (pid 405): ubifs_read=
dir: feed 'etc', ino 65, new f_pos 0x24a603=0ADec 31 16:01:52 kernel: [ =A0=
112.012000] UBIFS DBG (pid 405): ubifs_readdir: feed 'lib', ino 124, new f_=
pos 0x2697fa=0ADec 31 16:01:52 kernel: [ =A0112.012000] UBIFS DBG (pid 405)=
: ubifs_readdir: feed 'opt', ino 391, new f_pos 0x27d35e=0ADec 31 16:01:52 =
kernel: [ =A0112.012000] UBIFS DBG (pid 405): ubifs_readdir: feed 'tmp', in=
o 122, new f_pos 0x295e98=0ADec 31 16:01:52 kernel: [ =A0112.012000] UBIFS =
DBG (pid 405): ubifs_readdir: feed 'sys', ino 379, new f_pos 0x2968b1=0ADec=
 31 16:01:52 kernel: [ =A0112.012000] UBIFS DBG (pid 405): ubifs_readdir: f=
eed 'var', ino 380, new f_pos 0x29ab98=0ADec 31 16:01:52 kernel: [ =A0112.0=
20000] UBIFS DBG (pid 405): ubifs_readdir: feed 'usr', ino 390, new f_pos 0=
x29e101=0ADec 31 16:01:52 kernel: [ =A0112.020000] UBIFS DBG (pid 405): ubi=
fs_readdir: feed 'logo.565', ino 378, new f_pos 0x1428f67=0ADec 31 16:01:52=
 kernel: [ =A0112.020000] UBIFS DBG (pid 405): ubifs_readdir: feed 'home', =
ino 389, new f_pos 0x19cc780=0ADec 31 16:01:52 kernel: [ =A0112.020000] UBI=
FS DBG (pid 405): ubifs_readdir: feed 'proc', ino 123, new f_pos 0x1baa5b4=
=0ADec 31 16:01:52 kernel: [ =A0112.020000] UBIFS DBG (pid 405): ubifs_read=
dir: feed 'sbin', ino 207, new f_pos 0x1c000e1=0ADec 31 16:01:52 kernel: [ =
=A0112.028000] UBIFS DBG (pid 405): ubifs_readdir: feed 'root', ino 373, ne=
w f_pos 0x1c0d8cc=0ADec 31 16:01:52 kernel: [ =A0112.028000] UBIFS DBG (pid=
 405): ubifs_readdir: dir ino 1, f_pos 0x2=0ADec 31 16:01:52 kernel: [ =A01=
12.028000] UBIFS DBG (pid 525): ubifs_getxattr: xattr 'security.capability'=
, ino 319 ('busybox'), buf size 20=0ADec 31 16:01:53 kernel: [ =A0113.08800=
0] UBIFS DBG (pid 526): ubifs_getxattr: xattr 'security.capability', ino 31=
9 ('busybox'), buf size 20=0ADec 31 16:01:53 kernel: [ =A0113.120000] UBIFS=
 DBG (pid 526): ubifs_get_sb: name ubi1:home, flags 0x8000=0ADec 31 16:01:5=
3 kernel: [ =A0113.120000] UBIFS DBG (pid 526): ubifs_get_sb: opened ubi1_0=
=0ADec 31 16:01:53 kernel: [ =A0113.120000] PM: Adding info for No Bus:ubif=
s_1_0=0ADec 31 16:01:53 kernel: [ =A0113.120000] UBIFS DBG (pid 527): ubifs=
_getxattr: xattr 'security.capability', ino 319 ('busybox'), buf size 20=0A=
Dec 31 16:01:53 kernel: [ =A0113.132000] UBIFS DBG (pid 528): ubifs_bg_thre=
ad: background thread "ubifs_bgt1_0" started, PID 528=0ADec 31 16:01:53 ker=
nel: [ =A0113.192000] UBIFS DBG (pid 527): do_readpage: ino 68, pg 0, i_siz=
e 268, flags 0x1=0ADec 31 16:01:53 kernel: [ =A0113.352000] UBIFS: recovery=
 needed=0ADec 31 16:01:54 kernel: ffffff ffffffff ffffffff ffffffff fffffff=
f ffffffff =A0................................=0ADec 31 16:01:54 kernel: [ =
=A0114.048000] 000010e0: ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff ffffffff ffffffff =A0................................=0ADec 31 16:01:54=
 kernel: [ =A0114.048000] 00001100: ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff ffffffff =A0................................=0ADec =
31 16:01:54 kernel: [ =A0114.048000] 00001120: ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff ffffffff =A0............................=
....=0ADec 31 16:01:54 kernel: [ =A0114.048000] 00001140: ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.................=
...............=0ADec 31 16:01:54 kernel: [ =A0114.048000] 00001160: ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0......=
..........................=0ADec 31 16:01:54 kernel: [ =A0114.048000] 00001=
180: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffff=
f =A0................................=0ADec 31 16:01:54 kernel: [ =A0114.04=
8000] 000011a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff ffffffff =A0................................=0ADec 31 16:01:54 kernel: =
[ =A0114.048000] 000011c0: ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff =A0................................=0ADec 31 16:01:=
54 kernel: [ =A0114.048000] 000011e0: ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff =A0................................=0ADe=
c 31 16:01:54 kernel: [ =A0114.048000] 00001200: ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff ffffffff =A0..........................=
......=0ADec 31 16:01:54 kernel: [ =A0114.048000] 00001220: ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0...............=
.................=0ADec 31 16:01:54 kernel: [ =A0114.048000] 00001240: ffff=
ffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0....=
............................=0ADec 31 16:01:54 kernel: [ =A0114.048000] 000=
01260: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff =A0................................=0ADec 31 16:01:54 kernel: [ =A0114.=
048000] 00001280: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0ADec 31 16:01:54 kernel=
: [ =A0114.048000] 000012a0: ffffffff ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff =A0................................=0ADec 31 16:0=
1:54 kernel: [ =A0114.048000] 000012c0: ffffffff ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff =A0................................=0A=
Dec 31 16:01:54 kernel: [ =A0114.048000] 000012e0: ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff =A0........................=
........=0ADec 31 16:01:54 kernel: [ =A0114.048000] 00001300: ffffffff ffff=
ffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.............=
...................=0ADec 31 16:01:54 kernel: [ =A0114.048000] 00001320: ff=
ffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0..=
..............................=0ADec 31 16:01:54 kernel: [ =A0114.048000] 0=
0001340: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff =A0................................=0ADec 31 16:01:54 kernel: [ =A011=
4.048000] 00001360: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff =A0................................=0ADec 31 16:01:54 kern=
el: [ =A0114.048000] 00001380: ffffffff ffffffff ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff =A0................................=0ADec 31 16=
:01:54 kernel: [ =A0114.048000] 000013a0: ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff =A0................................=
=0ADec 31 16:01:54 kernel: [ =A0114.048000] 000013c0: ffffffff ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.....................=
...........=0ADec 31 16:01:54 kernel: [ =A0114.048000] 000013e0: ffffffff f=
fffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0..........=
......................=0ADec 31 16:01:54 kernel: [ =A0114.048000] 00001400:=
 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0ADec 31 16:01:54 kernel: [ =A0114.0480=
00] 00001420: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffff=
f ffffffff =A0................................=0ADec 31 16:01:54 kernel: [ =
=A0114.048000] 00001440: ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff ffffffff ffffffff =A0................................=0ADec 31 16:01:54=
 kernel: [ =A0114.048000] 00001460: ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff ffffffff =A0................................=0ADec =
31 16:01:54 kernel: [ =A0114.048000] 00001480: ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff ffffffff =A0............................=
....=0ADec 31 16:01:54 kernel: [ =A0114.048000] 000014a0: ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.................=
...............=0ADec 31 16:01:54 kernel: [ =A0114.048000] 000014c0: ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0......=
..........................=0ADec 31 16:01:54 kernel: [ =A0114.048000] 00001=
4e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffff=
f =A0................................=0ADec 31 16:01:54 kernel: [ =A0114.04=
8000] 00001500: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff ffffffff =A0................................=0ADec 31 16:01:54 kernel: =
[ =A0114.052000] 00001520: ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff =A0................................=0ADec 31 16:01:=
54 kernel: [ =A0114.052000] 00001540: ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff =A0................................=0ADe=
c 31 16:01:54 kernel: [ =A0114.052000] 00001560: ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff ffffffff =A0..........................=
......=0ADec 31 16:01:54 kernel: [ =A0114.052000] 00001580: ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0...............=
.................=0ADec 31 16:01:54 kernel: [ =A0114.052000] 000015a0: ffff=
ffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0....=
............................=0ADec 31 16:01:54 kernel: [ =A0114.052000] 000=
015c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff =A0................................=0ADec 31 16:01:54 kernel: [ =A0114.=
052000] 000015e0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0ADec 31 16:01:54 kernel=
: [ =A0114.052000] 00001600: ffffffff ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff =A0................................=0ADec 31 16:0=
1:54 kernel: [ =A0114.052000] 00001620: ffffffff ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff =A0................................=0A=
Dec 31 16:01:54 kernel: [ =A0114.052000] 00001640: ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff =A0........................=
........=0ADec 31 16:01:54 kernel: [ =A0114.052000] 00001660: ffffffff ffff=
ffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.............=
...................=0ADec 31 16:01:54 kernel: [ =A0114.052000] 00001680: ff=
ffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0..=
..............................=0ADec 31 16:01:54 kernel: [ =A0114.052000] 0=
00016a0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff =A0................................=0ADec 31 16:01:54 kernel: [ =A011=
4.052000] 000016c0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff =A0................................=0ADec 31 16:01:54 kern=
el: [ =A0114.052000] 000016e0: ffffffff ffffffff ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff =A0................................=0ADec 31 16=
:01:54 kernel: [ =A0114.052000] 00001700: ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff =A0................................=
=0ADec 31 16:01:54 kernel: [ =A0114.052000] 00001720: ffffffff ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.....................=
...........=0ADec 31 16:01:54 kernel: [ =A0114.052000] 00001740: ffffffff f=
fffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0..........=
......................=0ADec 31 16:01:54 kernel: [ =A0114.052000] 00001760:=
 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0ADec 31 16:01:54 kernel: [ =A0114.0520=
00] 00001780: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffff=
f ffffffff =A0................................=0ADec 31 16:01:54 kernel: [ =
=A0114.052000] 000017a0: ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff ffffffff ffffffff =A0................................=0ADec 31 16:01:54=
 kernel: [ =A0114.052000] 000017c0: ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff ffffffff =A0................................=0ADec =
31 16:01:54 kernel: [ =A0114.052000] 000017e0: ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff ffffffff =A0............................=
....=0ADec 31 16:01:54 kernel: [ =A0114.052000] 00001800: ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.................=
...............=0ADec 31 16:01:54 kernel: [ =A0114.052000] 00001820: ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0......=
..........................=0ADec 31 16:01:54 kernel: [ =A0114.052000] 00001=
840: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffff=
f =A0................................=0ADec 31 16:01:54 kernel: [ =A0114.05=
2000] 00001860: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff ffffffff =A0................................=0ADec 31 16:01:54 kernel: =
[ =A0114.052000] 00001880: ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff =A0................................=0ADec 31 16:01:=
54 kernel: [ =A0114.052000] 000018a0: ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff =A0................................=0ADe=
c 31 16:01:54 kernel: [ =A0114.052000] 000018c0: ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff ffffffff =A0..........................=
......=0ADec 31 16:01:54 kernel: [ =A0114.052000] 000018e0: ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0...............=
.................=0ADec 31 16:01:54 kernel: [ =A0114.052000] 00001900: ffff=
ffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0....=
............................=0ADec 31 16:01:54 kernel: [ =A0114.052000] 000=
01920: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff =A0................................=0ADec 31 16:01:54 kernel: [ =A0114.=
052000] 00001940: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0ADec 31 16:01:54 kernel=
: [ =A0114.052000] 00001960: ffffffff ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff =A0................................=0ADec 31 16:0=
1:54 kernel: [ =A0114.052000] 00001980: ffffffff ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff =A0................................=0A=
Dec 31 16:01:54 kernel: [ =A0114.052000] 000019a0: ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff =A0........................=
........=0ADec 31 16:01:54 kernel: [ =A0114.052000] 000019c0: ffffffff ffff=
ffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.............=
...................=0ADec 31 16:01:54 kernel: [ =A0114.052000] 000019e0: ff=
ffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0..=
..............................=0ADec 31 16:01:54 kernel: [ =A0114.056000] 0=
0001a00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff =A0................................=0ADec 31 16:01:54 kernel: [ =A011=
4.056000] 00001a20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff =A0................................=0ADec 31 16:01:54 kern=
el: [ =A0114.056000] 00001a40: ffffffff ffffffff ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff =A0................................=0ADec 31 16=
:01:54 kernel: [ =A0114.056000] 00001a60: ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff =A0................................=
=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001a80: ffffffff ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.....................=
...........=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001aa0: ffffffff f=
fffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0..........=
......................=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001ac0:=
 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0ADec 31 16:01:54 kernel: [ =A0114.0560=
00] 00001ae0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffff=
f ffffffff =A0................................=0ADec 31 16:01:54 kernel: [ =
=A0114.056000] 00001b00: ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff ffffffff ffffffff =A0................................=0ADec 31 16:01:54=
 kernel: [ =A0114.056000] 00001b20: ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff ffffffff =A0................................=0ADec =
31 16:01:54 kernel: [ =A0114.056000] 00001b40: ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff ffffffff =A0............................=
....=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001b60: ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.................=
...............=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001b80: ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0......=
..........................=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001=
ba0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffff=
f =A0................................=0ADec 31 16:01:54 kernel: [ =A0114.05=
6000] 00001bc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff ffffffff =A0................................=0ADec 31 16:01:54 kernel: =
[ =A0114.056000] 00001be0: ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff =A0................................=0ADec 31 16:01:=
54 kernel: [ =A0114.056000] 00001c00: ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff =A0................................=0ADe=
c 31 16:01:54 kernel: [ =A0114.056000] 00001c20: ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff ffffffff =A0..........................=
......=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001c40: ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0...............=
.................=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001c60: ffff=
ffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0....=
............................=0ADec 31 16:01:54 kernel: [ =A0114.056000] 000=
01c80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff =A0................................=0ADec 31 16:01:54 kernel: [ =A0114.=
056000] 00001ca0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff =A0................................=0ADec 31 16:01:54 kernel=
: [ =A0114.056000] 00001cc0: ffffffff ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff =A0................................=0ADec 31 16:0=
1:54 kernel: [ =A0114.056000] 00001ce0: ffffffff ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff =A0................................=0A=
Dec 31 16:01:54 kernel: [ =A0114.056000] 00001d00: ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff =A0........................=
........=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001d20: ffffffff ffff=
ffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.............=
...................=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001d40: ff=
ffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0..=
..............................=0ADec 31 16:01:54 kernel: [ =A0114.056000] 0=
0001d60: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff =A0................................=0ADec 31 16:01:54 kernel: [ =A011=
4.056000] 00001d80: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff =A0................................=0ADec 31 16:01:54 kern=
el: [ =A0114.056000] 00001da0: ffffffff ffffffff ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff =A0................................=0ADec 31 16=
:01:54 kernel: [ =A0114.056000] 00001dc0: ffffffff ffffffff ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff =A0................................=
=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001de0: ffffffff ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.....................=
...........=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001e00: ffffffff f=
fffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0..........=
......................=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001e20:=
 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =
=A0................................=0ADec 31 16:01:54 kernel: [ =A0114.0560=
00] 00001e40: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffff=
f ffffffff =A0................................=0ADec 31 16:01:54 kernel: [ =
=A0114.056000] 00001e60: ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff ffffffff ffffffff =A0................................=0ADec 31 16:01:54=
 kernel: [ =A0114.056000] 00001e80: ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff ffffffff =A0................................=0ADec =
31 16:01:54 kernel: [ =A0114.056000] 00001ea0: ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff ffffffff =A0............................=
....=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001ec0: ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0.................=
...............=0ADec 31 16:01:54 kernel: [ =A0114.056000] 00001ee0: ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0......=
..........................=0ADec 31 16:01:54 kernel: [ =A0114.060000] 00001=
f00: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffffff=
f =A0................................=0ADec 31 16:01:54 kernel: [ =A0114.06=
0000] 00001f20: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff ffffffff =A0................................=0ADec 31 16:01:54 kernel: =
[ =A0114.060000] 00001f40: ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff ffffffff =A0................................=0ADec 31 16:01:=
54 kernel: [ =A0114.060000] 00001f60: ffffffff ffffffff ffffffff ffffffff f=
fffffff ffffffff ffffffff ffffffff =A0................................=0ADe=
c 31 16:01:54 kernel: [ =A0114.060000] 00001f80: ffffffff ffffffff ffffffff=
 ffffffff ffffffff ffffffff ffffffff ffffffff =A0..........................=
......=0ADec 31 16:01:54 kernel: [ =A0114.060000] 00001fa0: ffffffff ffffff=
ff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0...............=
.................=0ADec 31 16:01:54 kernel: [ =A0114.060000] 00001fc0: ffff=
ffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff =A0....=
............................=0ADec 31 16:01:54 kernel: [ =A0114.060000] 000=
01fe0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fffff=
fff =A0................................=0ADec 31 16:01:54 kernel: [ =A0114.=
060000] UBIFS error (pid 526): ubifs_recover_leb: LEB 584 scanning failed=
=0ADec 31 16:01:54 kernel: [ =A0114.060000] UBIFS DBG (pid 424): do_readpag=
e: ino 69, pg 0, i_size 9, flags 0x1=0ADec 31 16:01:54 kernel: [ =A0114.116=
000] UBIFS DBG (pid 528): ubifs_bg_thread: background thread "ubifs_bgt1_0"=
 stops=0ADec 31 16:01:54 kernel: [ =A0114.116000] PM: Removing info for No =
Bus:ubifs_1_0=0ADec 31 16:01:54 kernel: [ =A0114.116000] UBIFS DBG (pid 529=
): ubifs_getxattr: xattr 'security.capability', ino 319 ('busybox'), buf si=
ze 20=0ADec 31 16:01:54 kernel: [ =A0114.116000] UBIFS DBG (pid 529): do_re=
adpage: ino 319, pg 0, i_size 318888, flags 0x1=0ADec 31 16:01:54 kernel: [=
 =A0114.124000] UBIFS DBG (pid 529): do_readpage: ino 133, pg 0, i_size 203=
96, flags 0x1=0ADec 31 16:01:54 kernel: [ =A0114.128000] UBIFS DBG (pid 421=
): do_readpage: ino 110, pg 0, i_size 87, flags 0x1=0ADec 31 16:01:54 kerne=
l: [ =A0114.128000] UBIFS DBG (pid 529): do_readpage: ino 319, pg 74, i_siz=
e 318888, flags 0x1=0ADec 31 16:01:54 kernel: [ =A0114.132000] UBIFS DBG (p=
id 529): do_readpage: ino 319, pg 75, i_size 318888, flags 0x1=0ADec 31 16:=
01:54 kernel: [ =A0114.136000] UBIFS DBG (pid 529): populate_page: ino 319,=
 pg 76, i_size 318888, flags 0x21=0ADec 31 16:01:54 kernel: [ =A0114.136000=
] UBIFS DBG (pid 529): populate_page: ino 319, pg 77, i_size 318888, flags =
0x1=0ADec 31 16:01:54 kernel: [ =A0114.136000] UBIFS DBG (pid 529): do_read=
page: ino 133, pg 4, i_size 20396, flags 0x1=0ADec 31 16:01:54 kernel: [ =
=A0114.140000] UBIFS DBG (pid 530): ubifs_getxattr: xattr 'security.capabil=
ity', ino 319 ('busybox'), buf size 20=0ADec 31 16:01:54 kernel: [ =A0114.1=
44000] UBIFS DBG (pid 529): do_readpage: ino 107, pg 0, i_size 2083, flags =
0x1=0ADec 31 16:01:54 kernel: [ =A0114.148000] UBIFS DBG (pid 530): do_read=
page: ino 319, pg 0, i_size 318888, flags 0x1=0ADec 31 16:01:54 kernel: [ =
=A0114.152000] UBIFS DBG (pid 529): do_readpage: ino 134, pg 0, i_size 2401=
84, flags 0x1=0ADec 31 16:01:54 kernel: [ =A0114.168000] UBIFS DBG (pid 530=
): do_readpage: ino 133, pg 0, i_size 20396, flags 0x1=0ADec 31 16:01:54 ke=
rnel: [ =A0114.168000] UBIFS DBG (pid 529): do_readpage: ino 134, pg 56, i_=
size 240184, flags 0x1=0ADec 31 16:01:54 kernel: [ =A0114.172000] UBIFS DBG=
 (pid 530): do_readpage: ino 319, pg 74, i_size 318888, flags 0x1=0ADec 31 =
16:01:54 kernel: [ =A0114.176000] UBIFS DBG (pid 530): do_readpage: ino 319=
, pg 75, i_size 318888, flags 0x1=0ADec 31 16:01:54 kernel: [ =A0114.184000=
] UBIFS DBG (pid 529): do_readpage: ino 134, pg 57, i_size 240184, flags 0x=
1=0ADec 31 16:01:54 kernel: [ =A0114.184000] UBIFS DBG (pid 529): populate_=
page: ino 134, pg 58, i_size 240184, flags 0x1=0ADec 31 16:01:54 kernel: [ =
=A0114.188000] UBIFS DBG (pid 530): populate_page: ino 319, pg 76, i_size 3=
18888, flags 0x1=0ADec 31 16:01:54 kernel: [ =A0114.228000] UBIFS DBG (pid =
529): do_readpage: ino 68, pg 0, i_size 268, flags 0x1=0ADec 31 16:01:54 ke=
rnel: [ =A0114.708000] UBIFS DBG (pid 405): ubifs_readdir: dir ino 1, f_pos=
 0x0=0ADec 31 16:01:54 kernel: [ =A0114.708000] UBIFS DBG (pid 405): ubifs_=
readdir: feed 'bin', ino 208, new f_pos 0x23605a=0ADec 31 16:01:54 kernel: =
[ =A0114.708000] UBIFS DBG (pid 405): ubifs_readdir: feed 'dev', ino 384, n=
ew f_pos 0x23ee05=0ADec 31 16:01:54 kernel: [ =A0114.712000] UBIFS DBG (pid=
 405): ubifs_readdir: feed 'etc', ino 65, new f_pos 0x24a603=0ADec 31 16:01=
:54 kernel: [ =A0114.716000] UBIFS DBG (pid 405): ubifs_readdir: feed 'lib'=
, ino 124, new f_pos 0x2697fa=0ADec 31 16:01:54 kernel: [ =A0114.716000] UB=
IFS DBG (pid 405): ubifs_readdir: feed 'opt', ino 391, new f_pos 0x27d35e=
=0ADec 31 16:01:54 kernel: [ =A0114.716000] UBIFS DBG (pid 405): ubifs_read=
dir: feed 'tmp', ino 122, new f_pos 0x295e98=0ADec 31 16:01:54 kernel: [ =
=A0114.716000] UBIFS DBG (pid 405): ubifs_readdir: feed 'sys', ino 379, new=
 f_pos 0x2968b1=0ADec 31 16:01:54 kernel: [ =A0114.716000] UBIFS DBG (pid 4=
05): ubifs_readdir: feed 'var', ino 380, new f_pos 0x29ab98=0ADec 31 16:01:=
54 kernel: [ =A0114.724000] UBIFS DBG (pid 405): ubifs_readdir: feed 'usr',=
 ino 390, new f_pos 0x29e101=0ADec 31 16:01:54 kernel: [ =A0114.724000] UBI=
FS DBG (pid 405): ubifs_readdir: feed 'logo.565', ino 378, new f_pos 0x1428=
f67=0ADec 31 16:01:54 kernel: [ =A0114.724000] UBIFS DBG (pid 405): ubifs_r=
eaddir: feed 'home', ino 389, new f_pos 0x19cc780=0ADec 31 16:01:54 kernel:=
 [ =A0114.724000] UBIFS DBG (pid 405): ubifs_readdir: feed 'proc', ino 123,=
 new f_pos 0x1baa5b4=0ADec 31 16:01:54 kernel: [ =A0114.728000] UBIFS DBG (=
pid 405): ubifs_readdir: feed 'sbin', ino 207, new f_pos 0x1c000e1=0ADec 31=
 16:01:54 kernel: [ =A0114.732000] UBIFS DBG (pid 405): ubifs_readdir: feed=
 'root', ino 373, new f_pos 0x1c0d8cc=0ADec 31 16:01:54 kernel: [ =A0114.73=
2000] UBIFS DBG (pid 405): ubifs_readdir: dir ino 1, f_pos 0x2=0ADec 31 16:=
01:54 kernel: [ =A0114.732000] UBIFS DBG (pid 531): ubifs_getxattr: xattr '=
security.capability', ino 319 ('busybox'), buf size 20=0ADec 31 16:01:56 ke=
rnel: [ =A0116.228000] UBIFS DBG (pid 532): ubifs_getxattr: xattr 'security=
.capability', ino 319 ('busybox'), buf size 20=0ADec 31 16:01:56 kernel: [ =
=A0116.232000] UBIFS DBG (pid 424): do_readpage: ino 69, pg 0, i_size 9, fl=
ags 0x1=0ADec 31 16:01:56 kernel: [ =A0116.256000] UBIFS DBG (pid 532): do_=
readpage: ino 319, pg 0, i_size 318888, flags 0x1=0ADec 31 16:01:56 kernel:=
 [ =A0116.256000] UBIFS DBG (pid 532): do_readpage: ino 133, pg 0, i_size 2=
0396, flags 0x1=0ADec 31 16:01:56 kernel: [ =A0116.292000] UBIFS DBG (pid 5=
32): do_readpage: ino 319, pg 74, i_size 318888, flags 0x1=0ADec 31 16:01:5=
6 kernel: [ =A0116.292000] UBIFS DBG (pid 532): do_readpage: ino 319, pg 75=
, i_size 318888, flags 0x1=0ADec 31 16:01:56 kernel: [ =A0116.296000] UBIFS=
 DBG (pid 532): populate_page: ino 319, pg 76, i_size 318888, flags 0x1=0AD=
ec 31 16:01:56 kernel: [ =A0116.296000] UBIFS DBG (pid 532): populate_page:=
 ino 319, pg 77, i_size 318888, flags 0x1=0ADec 31 16:01:56 kernel: [ =A011=
6.316000] UBIFS DBG (pid 532): do_readpage: ino 133, pg 4, i_size 20396, fl=
ags 0x1=0ADec 31 16:01:56 kernel: [ =A0116.316000] UBIFS DBG (pid 532): do_=
readpage: ino 107, pg 0, i_size 2083, flags 0x1=0ADec 31 16:01:56 kernel: [=
 =A0116.320000] UBIFS DBG (pid 532): do_readpage: ino 134, pg 0, i_size 240=
184, flags 0x1=0ADec 31 16:01:56 kernel: [ =A0116.320000] UBIFS DBG (pid 53=
2): do_readpage: ino 134, pg 56, i_size 240184, flags 0x1=0ADec 31 16:01:56=
 kernel: [ =A0116.324000] UBIFS DBG (pid 532): do_readpage: ino 134, pg 57,=
 i_size 240184, flags 0x1=0ADec 31 16:01:56 kernel: [ =A0116.328000] UBIFS =
DBG (pid 532): populate_page: ino 134, pg 58, i_size 240184, flags 0x21=0AD=
ec 31 16:01:56 kernel: [ =A0116.836000] UBIFS DBG (pid 405): ubifs_readdir:=
 dir ino 1, f_pos 0x0=0ADec 31 16:01:56 kernel: [ =A0116.836000] UBIFS DBG =
(pid 405): ubifs_readdir: feed 'bin', ino 208, new f_pos 0x23605a=0ADec 31 =
16:01:56 kernel: [ =A0116.836000] UBIFS DBG (pid 405): ubifs_readdir: feed =
'dev', ino 384, new f_pos 0x23ee05=0ADec 31 16:01:56 kernel: [ =A0116.83600=
0] UBIFS DBG (pid 405): ubifs_readdir: feed 'etc', ino 65, new f_pos 0x24a6=
03=0ADec 31 16:01:56 kernel: [ =A0116.844000] UBIFS DBG (pid 405): ubifs_re=
addir: feed 'lib', ino 124, new f_pos 0x2697fa=0ADec 31 16:01:56 kernel: [ =
=A0116.844000] UBIFS DBG (pid 405): ubifs_readdir: feed 'opt', ino 391, new=
 f_pos 0x27d35e=0ADec 31 16:01:56 kernel: [ =A0116.844000] UBIFS DBG (pid 4=
05): ubifs_readdir: feed 'tmp', ino 122, new f_pos 0x295e98=0ADec 31 16:01:=
56 kernel: [ =A0116.844000] UBIFS DBG (pid 405): ubifs_readdir: feed 'sys',=
 ino 379, new f_pos 0x2968b1=0ADec 31 16:01:56 kernel: [ =A0116.844000] UBI=
FS DBG (pid 405): ubifs_readdir: feed 'var', ino 380, new f_pos 0x29ab98=0A=
Dec 31 16:01:56 kernel: [ =A0116.844000] UBIFS DBG (pid 405): ubifs_readdir=
: feed 'usr', ino 390, new f_pos 0x29e101=0ADec 31 16:01:56 kernel: [ =A011=
6.852000] UBIFS DBG (pid 405): ubifs_readdir: feed 'logo.565', ino 378, new=
 f_pos 0x1428f67=0ADec 31 16:01:56 kernel: [ =A0116.852000] UBIFS DBG (pid =
405): ubifs_readdir: feed 'home', ino 389, new f_pos 0x19cc780=0ADec 31 16:=
01:56 kernel: [ =A0116.852000] UBIFS DBG (pid 405): ubifs_readdir: feed 'pr=
oc', ino 123, new f_pos 0x1baa5b4=0ADec 31 16:01:56 kernel: [ =A0116.852000=
] UBIFS DBG (pid 405): ubifs_readdir: feed 'sbin', ino 207, new f_pos 0x1c0=
00e1=0ADec 31 16:01:56 kernel: [ =A0116.860000] UBIFS DBG (pid 405): ubifs_=
readdir: feed 'root', ino 373, new f_pos 0x1c0d8cc=0ADec 31 16:01:56 kernel=
: [ =A0116.860000] UBIFS DBG (pid 405): ubifs_readdir: dir ino 1, f_pos 0x2=
=0ADec 31 16:01:56 kernel: [ =A0116.860000] UBIFS DBG (pid 533): ubifs_getx=
attr: xattr 'security.capability', ino 319 ('busybox'), buf size 20=0ADec 3=
1 16:01:57 kernel: [ =A0117.968000] UBIFS DBG (pid 534): ubifs_lookup: 'cat=
' in dir ino 208=0ADec 31 16:01:57 kernel: [ =A0117.976000] UBIFS DBG (pid =
534): ubifs_iget: inode 217=0ADec 31 16:01:57 kernel: [ =A0117.976000] UBIF=
S DBG (pid 534): ubifs_getxattr: xattr 'security.capability', ino 319 ('bus=
ybox'), buf size 20=0ADec 31 16:01:58 kernel: [ =A0118.360000] UBIFS DBG (p=
id 535): ubifs_getxattr: xattr 'security.capability', ino 319 ('busybox'), =
buf size 20=0ADec 31 16:01:58 kernel: [ =A0118.364000] UBIFS DBG (pid 424):=
 do_readpage: ino 69, pg 0, i_size 9, flags 0x1=0ADec 31 16:01:58 kernel: [=
 =A0118.388000] UBIFS DBG (pid 535): do_readpage: ino 319, pg 0, i_size 318=
888, flags 0x1=0ADec 31 16:01:58 kernel: [ =A0118.392000] UBIFS DBG (pid 53=
5): do_readpage: ino 133, pg 0, i_size 20396, flags 0x1=0ADec 31 16:01:58 k=
ernel: [ =A0118.440000] UBIFS DBG (pid 535): do_readpage: ino 319, pg 74, i=
_size 318888, flags 0x1=0ADec 31 16:01:58 kernel: [ =A0118.440000] UBIFS DB=
G (pid 535): do_readpage: ino 319, pg 75, i_size 318888, flags 0x1=0ADec 31=
 16:01:58 kernel: [ =A0118.444000] UBIFS DBG (pid 535): populate_page: ino =
319, pg 76, i_size 318888, flags 0x1=0ADec 31 16:01:58 kernel: [ =A0118.444=
000] UBIFS DBG (pid 535): populate_page: ino 319, pg 77, i_size 318888, fla=
gs 0x1=0ADec 31 16:01:58 kernel: [ =A0118.444000] UBIFS DBG (pid 535): do_r=
eadpage: ino 133, pg 4, i_size 20396, flags 0x1=0ADec 31 16:01:58 kernel: [=
 =A0118.452000] UBIFS DBG (pid 535): do_readpage: ino 107, pg 0, i_size 208=
3, flags 0x1=0ADec 31 16:01:58 kernel: [ =A0118.452000] UBIFS DBG (pid 535)=
: do_readpage: ino 134, pg 0, i_size 240184, flags 0x1=0ADec 31 16:01:58 ke=
rnel: [ =A0118.456000] UBIFS DBG (pid 535): do_readpage: ino 134, pg 56, i_=
size 240184, flags 0x1=0ADec 31 16:01:58 kernel: [ =A0118.460000] UBIFS DBG=
 (pid 535): do_readpage: ino 134, pg 57, i_size 240184, flags 0x1=0ADec 31 =
16:01:58 kernel: [ =A0118.460000] UBIFS DBG (pid 535): populate_page: ino 1=
34, pg 58, i_size 240184, flags 0x21=0ADec 31 16:01:58 kernel: [ =A0118.972=
000] UBIFS DBG (pid 405): ubifs_readdir: dir ino 1, f_pos 0x0=0ADec 31 16:0=
1:58 kernel: [ =A0118.972000] UBIFS DBG (pid 405): ubifs_readdir: feed 'bin=
', ino 208, new f_pos 0x23605a=0ADec 31 16:01:58 kernel: [ =A0118.972000] U=
BIFS DBG (pid 405): ubifs_readdir: feed 'dev', ino 384, new f_pos 0x23ee05=
=0ADec 31 16:01:58 kernel: [ =A0118.976000] UBIFS DBG (pid 405): ubifs_read=
dir: feed 'etc', ino 65, new f_pos 0x24a603=0ADec 31 16:01:59 kernel: [ =A0=
118.996000] UBIFS DBG (pid 405): ubifs_readdir: feed 'lib', ino 124, new f_=
pos 0x2697fa=0ADec 31 16:01:59 kernel: [ =A0119.000000] UBIFS DBG (pid 405)=
: ubifs_readdir: feed 'opt', ino 391, new f_pos 0x27d35e=0ADec 31 16:01:59 =
kernel: [ =A0119.000000] UBIFS DBG (pid 405): ubifs_readdir: feed 'tmp', in=
o 122, new f_pos 0x295e98=0ADec 31 16:01:59 kernel: [ =A0119.000000] UBIFS =
DBG (pid 405): ubifs_readdir: feed 'sys', ino 379, new f_pos 0x2968b1=0ADec=
 31 16:01:59 kernel: [ =A0119.000000] UBIFS DBG (pid 405): ubifs_readdir: f=
eed 'var', ino 380, new f_pos 0x29ab98=0ADec 31 16:01:59 kernel: [ =A0119.0=
00000] UBIFS DBG (pid 405): ubifs_readdir: feed 'usr', ino 390, new f_pos 0=
x29e101=0ADec 31 16:01:59 kernel: [ =A0119.008000] UBIFS DBG (pid 405): ubi=
fs_readdir: feed 'logo.565', ino 378, new f_pos 0x1428f67=0ADec 31 16:01:59=
 kernel: [ =A0119.008000] UBIFS DBG (pid 405): ubifs_readdir: feed 'home', =
ino 389, new f_pos 0x19cc780=0ADec 31 16:01:59 kernel: [ =A0119.008000] UBI=
FS DBG (pid 405): ubifs_readdir: feed 'proc', ino 123, new f_pos 0x1baa5b4=
=0ADec 31 16:01:59 kernel: [ =A0119.008000] UBIFS DBG (pid 405): ubifs_read=
dir: feed 'sbin', ino 207, new f_pos 0x1c000e1=0ADec 31 16:01:59 kernel: [ =
=A0119.012000] UBIFS DBG (pid 405): ubifs_readdir: feed 'root', ino 373, ne=
w f_pos 0x1c0d8cc=0ADec 31 16:01:59 kernel: [ =A0119.012000] UBIFS DBG (pid=
 405): ubifs_readdir: dir ino 1, f_pos 0x2=0ADec 31 16:01:59 kernel: [ =A01=
19.012000] UBIFS DBG (pid 536): ubifs_getxattr: xattr 'security.capability'=
, ino 319 ('busybox'), buf size 20=0ADec 31 16:02:00 kernel: [ =A0120.56800=
0] UBIFS DBG (pid 537): ubifs_getxattr: xattr 'security.capability', ino 31=
9 ('busybox'), buf size 20=0ADec 31 16:02:00 kernel: [ =A0120.572000] UBIFS=
 DBG (pid 424): do_readpage: ino 69, pg 0, i_size 9, flags 0x1=0ADec 31 16:=
02:00 kernel: [ =A0120.596000] UBIFS DBG (pid 537): do_readpage: ino 319, p=
g 0, i_size 318888, flags 0x1=0ADec 31 16:02:00 kernel: [ =A0120.600000] UB=
IFS DBG (pid 537): do_readpage: ino 133, pg 0, i_size 20396, flags 0x1=0ADe=
c 31 16:02:00 kernel: [ =A0120.604000] UBIFS DBG (pid 537): do_readpage: in=
o 319, pg 74, i_size 318888, flags 0x1=0ADec 31 16:02:00 kernel: [ =A0120.6=
24000] UBIFS DBG (pid 537): do_readpage: ino 319, pg 75, i_size 318888, fla=
gs 0x1=0ADec 31 16:02:00 kernel: [ =A0120.628000] UBIFS DBG (pid 537): popu=
late_page: ino 319, pg 76, i_size 318888, flags 0x1=0ADec 31 16:02:00 kerne=
l: [ =A0120.628000] UBIFS DBG (pid 537): populate_page: ino 319, pg 77, i_s=
ize 318888, flags 0x1=0ADec 31 16:02:00 kernel: [ =A0120.628000] UBIFS DBG =
(pid 537): do_readpage: ino 133, pg 4, i_size 20396, flags 0x1=0ADec 31 16:=
02:00 kernel: [ =A0120.632000] UBIFS DBG (pid 537): do_readpage: ino 107, p=
g 0, i_size 2083, flags 0x1=0ADec 31 16:02:00 kernel: [ =A0120.636000] UBIF=
S DBG (pid 537): do_readpage: ino 134, pg 0, i_size 240184, flags 0x1=0ADec=
 31 16:02:00 kernel: [ =A0120.640000] UBIFS DBG (pid 537): do_readpage: ino=
 134, pg 56, i_size 240184, flags 0x1=0ADec 31 16:02:00 kernel: [ =A0120.64=
0000] UBIFS DBG (pid 537): do_readpage: ino 134, pg 57, i_size 240184, flag=
s 0x1=0ADec 31 16:02:00 kernel: [ =A0120.644000] UBIFS DBG (pid 537): popul=
ate_page: ino 134, pg 58, i_size 240184, flags 0x21=0Aroot:/>=A0=0A
