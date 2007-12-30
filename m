Received: from fmmailgate09.web.de ([217.72.192.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J8y11-0000mA-V1
	for linux-mtd@lists.infradead.org; Sun, 30 Dec 2007 13:15:51 +0000
Message-Id: <76599944@web.de>
MIME-Version: 1.0
From: devzero@web.de
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH]: 2.6.24-rc5: mtd: PNC-2000 oops
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
Cc: randy.dunlap@oracle.com, linux-mtd@lists.infradead.org,
	hidave.darkstar@gmail.com, lcapitulino@mandriva.com.br
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Sun, 30 Dec 2007 13:15:51 -0000

while doing some systematical driver load/unload testing i have also come =
across this one.

searched lkml and found/tried this patch - seems to work fine, at least dr=
iver now behaves as expected:
insmod: error inserting 'pnc2000.ko': -1 No such device or address

if it really =5Fworks=5F is another story, but how can we know =3F have searched=
 the net a while for this hardware, but didn`t find =5Fany=5F reference that t=
his hardware either exists or existed at all, so it looks that this hardwa=
re is very ancient or being used by japanese secret service, only !=3F :)

> The driver is broken for a long time. I ever ping the writer
> info@crossnet.co.jp (seems a company's email address), but got no
> response.

i have found email @crossnet from two people who seem to be involved in so=
ftware development more or less. have sent them a mail and asked if they k=
now anything about this or could re-establish a contact to the author. =20

anyway, i vote for the patch being merged to avoid people investigate into=
 this oops or complain here again.

if there is fear, that this breaks the driver even more, what about puttin=
g some message into the driver initialization =3F

>>> PNC-2000 seems to be very ancient/rare hardware and the driver appears=
 unmaintained=20
>>> for a while. Due to missing testing capabilities, there`s no guarantee=
, that this driver still =20
>>> works.  If you own such hardware or if the driver doesn`t work for you=
, please report to=20
>>> linux-kernel@vger.kernel.org=20

regards
roland





List:       linux-kernel
Subject:    [PATCH]: 2.6.24-rc5: mtd: PNC-2000 oops
From:       "Luiz Fernando N. Capitulino" <lcapitulino () mandriva ! com !=
 br>
Date:       2007-12-14 16:00:26
Message-ID: 20071214140026.621c9007 () mandriva ! com ! br
[Download message RAW]

Em Fri, 14 Dec 2007 10:06:20 +0800
"Dave Young" <hidave.darkstar@gmail.com> escreveu:

> On Dec 14, 2007 1:04 AM, Luiz Fernando N. Capitulino
> <lcapitulino@mandriva.com.br> wrote:
> >=20
> > Hi there,
> >=20
> > If I run:
> >=20
> > # modprobe pnc2000
> >=20
> > In a machine w/o mtd hardware, I get the following oops:
> >=20
> > Photron PNC-2000 flash mapping: 400000 at bf000000
> > BUG: unable to handle kernel paging request at virtual address bf00000=
0
> > printing eip: e0bfe05b *pde =3D 00000000
> > Oops: 0002 [#1]
> > Modules linked in: cfi=5Fprobe gen=5Fprobe pnc2000 mtd chipreg map=5Ffuncs n=
fsd lockd \
> > nfs=5Facl auth=5Frpcgss sunrpc exportfs af=5Fpacket snd=5Fseq=5Fdummy snd=5Fseq=5Fos=
s \
> > snd=5Fseq=5Fmidi=5Fevent snd=5Fseq snd=5Fpcm=5Foss ipv6 snd=5Fmixer=5Foss binfmt=5Fmisc =
loop \
> > dm=5Fmirror dm=5Fmod sata=5Fvia libata scsi=5Fmod floppy cpufreq=5Fondemand \
> > cpufreq=5Fconservative cpufreq=5Fpowersave freq=5Ftable firewire=5Fohci firewi=
re=5Fcore \
> > crc=5Fitu=5Ft snd=5Fvia82xx gameport snd=5Fac97=5Fcodec ac97=5Fbus snd=5Fpcm snd=5Ftim=
er \
> > snd=5Fpage=5Falloc snd=5Fmpu401=5Fuart snd=5Frawmidi snd=5Fseq=5Fdevice i2c=5Fviapro e=
hci=5Fhcd snd \
> > uhci=5Fhcd i2c=5Fcore soundcore 8139cp ide=5Fcd cdrom ohci1394 usbcore ieee1=
394 via=5Fagp \
> > 8139too mii agpgart shpchp pci=5Fhotplug evdev ext3 jbd ide=5Fdisk ide=5Fgen=
eric \
> > via82cxxx ide=5Fcore
> >=20
> > Pid: 4067, comm: modprobe Not tainted (2.6.24-0.rc5.1mdv #1)
> > EIP: 0060:[<e0bfe05b>] EFLAGS: 00010286 CPU: 0
> > EIP is at simple=5Fmap=5Fwrite+0x2a/0x34 [map=5Ffuncs]
> > EAX: 00000004 EBX: e0c3f5d0 ECX: bf000000 EDX: 00f000f0
> > ESI: e0c3f5d0 EDI: 00000002 EBP: dc913dbc ESP: dc913db8
> > DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
> > Process modprobe (pid: 4067, ti=3Ddc912000 task=3Ddf0409f0 task.ti=3Ddc91200=
0)
> > Stack: 00000004 dc913e18 e0cc1277 dc913e30 c012b89b 00000000 00000001 =
00000002
> > c04a2b7c 00000008 00000000 00000000 c043cde4 00000000 c0357ccb dc913e1=
c
> > dc913e1c 00000204 00000000 00000000 e0c00a54 e0cc119d 00000002 0000000=
2
> > Call Trace:
> > [<c01054f2>] show=5Ftrace=5Flog=5Flvl+0x1a/0x2f
> > [<c01055a2>] show=5Fstack=5Flog=5Flvl+0x9b/0xa3
> > [<c0105650>] show=5Fregisters+0xa6/0x177
> > [<c0105823>] die+0x102/0x1ee
> > [<c02cb4d2>] do=5Fpage=5Ffault+0x561/0x63f
> > [<c02c9d1a>] error=5Fcode+0x6a/0x70
> > [<e0cc1277>] cfi=5Fprobe=5Fchip+0xda/0x9c7 [cfi=5Fprobe]
> > [<e0c43123>] mtd=5Fdo=5Fchip=5Fprobe+0x77/0x2d4 [gen=5Fprobe]
> > [<e0cc119b>] cfi=5Fprobe+0xd/0xf [cfi=5Fprobe]
> > [<e0c00142>] do=5Fmap=5Fprobe+0x3d/0x5a [chipreg]
> > [<e0c4103b>] init=5Fpnc2000+0x3b/0x68 [pnc2000]
> > [<c0140d10>] sys=5Finit=5Fmodule+0x12c6/0x1394
> > [<c0103e42>] sysenter=5Fpast=5Fesp+0x6b/0xc9
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Code: c3 55 89 e5 53 89 c3 8b 40 18 83 f8 01 75 07 03 4b 10 88 11 eb 1=
7 83 f8 02 \
> > 75 08 03 4b 10 66 89 11 eb 0a 83 f8 04 75 05 03 4b 10 <89> 11 f0 83 04=
 24 00 5b \
> > 5d c3 55 89 e5 57 89 d7 8b 55 08 56 89
> > EIP: [<e0bfe05b>] simple=5Fmap=5Fwrite+0x2a/0x34 [map=5Ffuncs] SS:ESP 0068:d=
c913db8
> >=20
> > --
>=20
> This issue has been reported several times.

 Oh.

> The driver is broken for a long time. I ever ping the writer
> info@crossnet.co.jp (seems a company's email address), but got no
> response.
>=20
> So how about kill (or disable =3F) this driver until it is fixed=3F

 Well, looks like there's an ioremap() call missing there.

 The following patch does what every driver of that kind does. It
fixes the load OOPS for me but we need someone with the hardware
to test whether it works (or some mtd person to review it).

 If the patch is wrong I think we should disable the module, yes.

------

mtd: pnc2000: initializaion fix

pnc2000 should map bus memory before trying to access it, also
fix wrong struct map=5Finfo setup.

Signed-off-by: Luiz Fernando N. Capitulino <lcapitulino@mandriva.com.br>

Index: linux-2.6.23/drivers/mtd/maps/pnc2000.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.23.orig/drivers/mtd/maps/pnc2000.c
+++ linux-2.6.23/drivers/mtd/maps/pnc2000.c
@@ -30,8 +30,7 @@ static struct map=5Finfo pnc=5Fmap =3D {
 	.name =3D "PNC-2000",
 	.size =3D WINDOW=5FSIZE,
 	.bankwidth =3D 4,
-	.phys =3D 0xFFFFFFFF,
-	.virt =3D (void =5F=5Fiomem *)WINDOW=5FADDR,
+	.phys =3D WINDOW=5FADDR,
 };
=20
=20
@@ -64,16 +63,29 @@ static struct mtd=5Finfo *mymtd;
=20
 static int =5F=5Finit init=5Fpnc2000(void)
 {
+	int err;
+
 	printk(KERN=5FNOTICE "Photron PNC-2000 flash mapping: %x at %x\n", WINDOW=5F=
SIZE, \
WINDOW=5FADDR); =20
+	pnc=5Fmap.virt =3D ioremap(WINDOW=5FADDR, WINDOW=5FSIZE);
+	if (!pnc=5Fmap.virt) {
+		printk("init=5Fpnc2000(): failed to ioremap\n");
+		return -EIO;
+	}
+
 	simple=5Fmap=5Finit(&pnc=5Fmap);
=20
 	mymtd =3D do=5Fmap=5Fprobe("cfi=5Fprobe", &pnc=5Fmap);
 	if (mymtd) {
 		mymtd->owner =3D THIS=5FMODULE;
-		return add=5Fmtd=5Fpartitions(mymtd, pnc=5Fpartitions, 3);
+		err =3D add=5Fmtd=5Fpartitions(mymtd, pnc=5Fpartitions, 3);
+		if (err) {
+			printk("init=5Fpnc2000(): add=5Fmtd=5Fpartitions failed\n");
+			iounmap(pnc=5Fmap.virt);
+		}
 	}
=20
+	iounmap(pnc=5Fmap.virt);
 	return -ENXIO;
 }
=20
@@ -82,6 +94,7 @@ static void =5F=5Fexit cleanup=5Fpnc2000(void)
 	if (mymtd) {
 		del=5Fmtd=5Fpartitions(mymtd);
 		map=5Fdestroy(mymtd);
+		iounmap(pnc=5Fmap.virt);
 	}
 }
=20



=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Jetzt neu! Sch=FCtzen Sie Ihren PC mit McAfee und WEB.DE. 30 Tage
kostenlos testen. http://www.pc-sicherheit.web.de/startseite/=3Fmc=3D022220
