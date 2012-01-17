Received: from nm3-vm0.bullet.mail.ne1.yahoo.com ([98.138.91.55])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rn84l-0002ky-GA
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2012 12:23:47 +0000
References: <1326376049.44121.YahooMailNeo@web121502.mail.ne1.yahoo.com>
 <1326630286.2201.3.camel@koala>
 <1326701907.78896.YahooMailNeo@web121503.mail.ne1.yahoo.com>
 <1326709475.14299.34.camel@sauron.fi.intel.com>
 <1326717654.83444.YahooMailNeo@web121506.mail.ne1.yahoo.com>
 <1326718253.14299.82.camel@sauron.fi.intel.com>
Message-ID: <1326803021.33329.YahooMailNeo@web121505.mail.ne1.yahoo.com>
Date: Tue, 17 Jan 2012 04:23:41 -0800 (PST)
From: Karsten Jeppesen <arm9263@yahoo.com>
Subject: Re: Corrupted UBIFS, bad CRC
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: Karsten Jeppesen <arm9263@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,=0A=0ASorry for the delay, but Im down with the flu and thus I hav=
e snot for brains.=0AThis took *a lot* of kernel compiles to sample this da=
ta.=0AErr - that doesn't mean I don't appreciate your efforts - I really do=
.=0A=0A=0AArtem: Would it help you in any =0Away if I get a some of these u=
nits sent to you? They are like 15 x 15 cm=0A Single board. I would send it=
 with all needed (battery included :-) ) =0Aand never to be returned=A0 (Yo=
u can keep everything).=0AI=0A am asking because it seems to me that you ha=
ve only limited hardware to=0A test on and maybe thats the problem? The 64/=
256 seems to be real and a =0Aproblem to be taken serious=0A=0A=0A=0A1. Whe=
re are the patches for 3.2? git://git.infradead.org/~dedekind/ubifs-v3.2.gi=
t ?? To get the max_write output I changed the dbg_msg to ubi_msg.=0A=0A2. =
UBI: max_write_size=A0=A0 64=0A3. Confirmed 64 from data sheets=0A4 Theory =
unfortunately bust.=0A5. See below=0A=0ANow for the weird part: Setting the=
 write buffer INCORRECTLY to 256 does mount the system - but is that health=
y???: And what are the implications of setting it to a 4 times wrong value?=
=0A=0AUBI: attaching mtd4 to ubi0=0AUBI: max_write_size=A0=A0 256=A0=A0 <<<=
<< forced via kernel patch=0AUBI: physical eraseblock size:=A0=A0 131072 by=
tes (128 KiB)=0AUBI: logical eraseblock size:=A0=A0=A0 130944 bytes=0AUBI: =
smallest flash I/O unit:=A0=A0=A0 1=0AUBI: VID header offset:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 64 (aligned 64)=0AUBI: data offset:=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 128=0AUBI: max. sequence number:=A0=A0=A0=A0=A0=A0 17=
653=0AUBI: attached mtd4 to ubi0=0AUBI: MTD device name:=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 "User"=0AUBI: MTD device size:=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 28 MiB=0AUBI: number of good PEBs:=A0=A0=A0=A0=A0=A0=A0 230=0AUBI: n=
umber of bad PEBs:=A0=A0=A0=A0=A0=A0=A0=A0 0=0AUBI: number of corrupted PEB=
s:=A0=A0 0=0AUBI: max. allowed volumes:=A0=A0=A0=A0=A0=A0 128=0AUBI: wear-l=
eveling threshold:=A0=A0=A0 4096=0AUBI: number of internal volumes: 1=0AUBI=
: number of user volumes:=A0=A0=A0=A0 1=0AUBI: available PEBs:=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 0=0AUBI: total number of reserved PEBs: 230=0AUBI:=
 number of PEBs reserved for bad PEB handling: 0=0AUBI: max/mean erase coun=
ter: 31/5=0AUBI: image sequence number:=A0 1704669600=0AUBI: background thr=
ead "ubi_bgt0d" started, PID 1734=0AUBI device number 0, total 230 LEBs (30=
117120 bytes, 28.7 MiB), available 0 LEBs (0 bytes), LEB size 130944 bytes =
(127.9 KiB)=0A# mkdir -p /skov/mnt/rootfs=0A# Starting dropbear=0Amount -t =
ubifs ubi0:rootfs /skov/mnt/rootfs=0AUBIFS: recovery needed=0AUBIFS: recove=
ry completed=0AUBIFS: mounted UBI device 0, volume 0, name "rootfs"=0AUBIFS=
: file system size:=A0=A0 28414848 bytes (27748 KiB, 27 MiB, 217 LEBs)=0AUB=
IFS: journal size:=A0=A0=A0=A0=A0=A0 1440384 bytes (1406 KiB, 1 MiB, 11 LEB=
s)=0AUBIFS: media format:=A0=A0=A0=A0=A0=A0 w4/r0 (latest is w4/r0)=0AUBIFS=
: default compressor: lzo=0AUBIFS: reserved for root:=A0 1342103 bytes (131=
0 KiB)=0A=0Admesg gives no additional info.=0A=0A=0A=0A----- Original Messa=
ge -----=0AFrom: Artem Bityutskiy <dedekind1@gmail.com>=0ATo: Karsten Jeppe=
sen <arm9263@yahoo.com>=0ACc: ubifs <linux-mtd@lists.infradead.org>=0ASent:=
 Monday, January 16, 2012 1:50 PM=0ASubject: Re: Corrupted UBIFS, bad CRC=
=0A=0ATo recap the most important things - but refer to my todays reply=0Aa=
nyway.=0A=0A1. Pick printing fixes from ubifs-v3.2=0A2. Find out what UBIFS=
 tells about your max_write_size=0A3. Check your _real_ buffer size from yo=
ur flash docs and the driver and=0Averify that it is correct.=0A4. My theor=
y that you should have 256 ore larger NOR flash write buffer=0Asize.=0A5. W=
ith the hack I sent I can mount successfully. To verify my theory=0Ayou can=
 test with this hack and see if you can reproduce the problem. If=0Ayou can=
, then either write-buffer is larger than 256 or my theory is=0Aincorrect.=
=0A=0ABTW, here is what I used to test your image in mtdram, just for=0Aref=
erence:=0A=0A$ sudo dmesg -c > /dev/null && sudo ./unload_all.sh && sudo mo=
dprobe mtdram total_size=3D29440 && sudo dd if=3D~/tmp/Karsten/corrupt_mtd4=
_20120116.img of=3D/dev/mtd0 && sudo modprobe ubi mtd=3D0 && sudo modprobe =
ubifs && sudo sh -c 'echo "format \"UBIFS DBG\" +p" > /sys/kernel/debug/dyn=
amic_debug/control' && sudo mount -t ubifs /dev/ubi0_0 /mnt/ubifs=0A=0AYeah=
, I know it is long and ugly, I wrote it on-the-spot to quickly=0Adebug you=
r issue. If you need, you can decompose it.=0A=0A-- =0ABest Regards,=0AArte=
m Bityutskiy=0A=0A______________________________________________________=0A=
Linux MTD discussion mailing list=0Ahttp://lists.infradead.org/mailman/list=
info/linux-mtd/
