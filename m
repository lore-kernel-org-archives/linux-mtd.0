Received: from nm33-vm1.bullet.mail.ne1.yahoo.com ([98.138.229.65])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RlL06-000562-J3
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2012 13:47:31 +0000
Message-ID: <1326376049.44121.YahooMailNeo@web121502.mail.ne1.yahoo.com>
Date: Thu, 12 Jan 2012 05:47:29 -0800 (PST)
From: Karsten Jeppesen <arm9263@yahoo.com>
Subject: Corrupted UBIFS, bad CRC 
To: ubifs <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Reply-To: Karsten Jeppesen <arm9263@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Guys,=0A=0AArtem was the last one to respond back in November and I have=
 been working hard on this ever since, but porting kernels takes a bit.=0AI=
 am sorry not to have included the content of the earlier emails but I am a=
ttempting to answer all the outstanding questions.=0A=0AYes, Artem, I downl=
oaded and adapted the backported tree (kernel 2.6.32 which was the closest =
to our 2.6.32.8) and it still showed the error.=0A=0AI am painfully aware o=
f that you like to look at problems close to current state and I am *really=
* trying to accomodate that.=0AI have ported kernel 3.2.0 (rudimentary thou=
gh) to test for this problem, and it still exists.=0AI am provoking the err=
or by having 16 machines powercycle at 20 secs power-on, 3 secs power-off a=
nd in 24hrs 2 machines will fail.=0A=0AI have run the speed-test (see below=
 if interested) and I will be running the stresstest later today or in the =
weekend.=0AAs I stated: this test was done on a stock kenel 3.2.0 patched t=
o our ARM9263=0A=0AYou stated last time that you were able to reclaim the b=
locks using a PC. Could this be an architectual problem PC/ARM ?=0A=0A=0A(S=
tructure needs cleaning - is there an fsck for that?)=0A=0ASincerely,=0ADr.=
 Karsten Jeppesen=0A=0A=0ALast time I submitted way to much debug. This tim=
e hope it is correct:=0A--- MOUNTING DEBUG OUTPUT (mount -t ubifs ubi0:root=
fs /skov/mnt/rootfs)=0A=0A# mount -t ubifs ubi0:rootfs /skov/mnt/rootfs=0AU=
BIFS: recovery needed=0AUBIFS error (pid 18479): ubifs_recover_leb: corrupt=
 empty space LEB 4:0, corruption starts at 144=0AUBIFS error (pid 18479): u=
bifs_scanned_corruption: corruption at LEB 4:144=0AUBIFS error (pid 18479):=
 ubifs_scanned_corruption: first 8192 bytes from LEB 4:144=0A00000000: 0000=
0000 00000000 00000000 00000000 ffffffff ffffffff ffffffff ffffffff=A0 ....=
............................=0A00000020: ffffffff ffffffff ffffffff fffffff=
f ffffffff ffffffff ffffffff ffffffff=A0 ................................=
=0A00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=
 ffffffff=A0 ................................=0A... more lines with just ff=
fffff=0A00001fc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff fff=
fffff ffffffff=A0 ................................=0A00001fe0: ffffffff fff=
fffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff=A0 ............=
....................=0AUBIFS error (pid 18479): ubifs_recover_leb: LEB 4 sc=
anning failed=0Amount: mounting ubi0:rootfs on /skov/mnt/rootfs failed: Str=
ucture needs cleaning=0A#=0A---=0A=0A--- SPEEDTEST OUTPUT=0A=0A# modprobe m=
td_speedtest dev=3D4=0A=A0=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=0Amtd_speedtest:=0AMTD device: 4=0Amtd_speedtes=
t:=0Anot NAND flash, assume page size is 512 bytes.=0Amtd_speedtest:=0AMTD =
device size 63700992, eraseblock size 131072, page size 512, count of=0Aera=
seblocks 486, pages per eraseblock 256, OOB size 0=0Amtd_speedtest:=0Atesti=
ng eraseblock write speed=0Amtd_speedtest:=0Aeraseblock write speed is 148 =
KiB/s=0Amtd_speedtest:=0Atesting eraseblock read speed=0Amtd_speedtest:=0Ae=
raseblock read speed is 1531 KiB/s=0Amtd_speedtest:=0Atesting page write sp=
eed=0Amtd_speedtest:=0Apage write speed is 149 KiB/s=0Amtd_speedtest:=0Ates=
ting page read speed=0Amtd_speedtest:=0Apage read speed is 1475 KiB/s=0Amtd=
_speedtest:=0Atesting 2 page write speed=0Amtd_speedtest:=0A2 page write sp=
eed is 147 KiB/s=0Amtd_speedtest:=0Atesting 2 page read speed=0Amtd_speedte=
st:=0A2 page read speed is 1505 KiB/s=0Amtd_speedtest:=0ATesting erase spee=
d=0Amtd_speedtest:=0Aerase speed is 334 KiB/s=0Amtd_speedtest:=0ATesting 2x=
 multi-block erase speed=0Amtd_speedtest:=0A2x multi-block erase speed is 2=
99 KiB/s=0Amtd_speedtest:=0ATesting 4x multi-block erase speed=0Amtd_speedt=
est:=0A4x multi-block erase speed is 295 KiB/s=0Amtd_speedtest:=0ATesting 8=
x multi-block erase speed=0Amtd_speedtest:=0A8x multi-block erase speed is =
293 KiB/s=0Amtd_speedtest:=0ATesting 16x multi-block erase speed=0Amtd_spee=
dtest:=0A16x multi-block erase speed is 291 KiB/s=0Amtd_speedtest:=0ATestin=
g 32x multi-block erase speed=0Amtd_speedtest:=0A32x multi-block erase spee=
d is 289 KiB/s=0Amtd_speedtest:=0ATesting 64x multi-block erase speed=0Amtd=
_speedtest:=0A64x multi-block erase speed is 286 KiB/s=0Amtd_speedtest:=0Af=
inished=0A=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=0A#=0A---=0A
