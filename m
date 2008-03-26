Received: from fmmailgate04.web.de ([217.72.192.242])
	by pentafluge.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JebfB-0002OK-DE
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 19:52:00 +0000
Date: Wed, 26 Mar 2008 20:48:52 +0100
Message-Id: <213294492@web.de>
MIME-Version: 1.0
From: devzero@web.de
To: Andrew Morton <akpm@linux-foundation.org>,
	"Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: some minor issues with 2.6.25-rc6-git7-default
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
Cc: linux-acpi@vger.kernel.org, greg@kroah.com, linux-kernel@vger.kernel.org,
	david-b@pacbell.net, linux-ide@vger.kernel.org,
	linux-mtd@lists.infradead.org, alan@lxorguk.ukuu.org.uk, lenb@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > ACPI: ACPI0007:00 is registered as cooling=5Fdevice0
> > > ACPI: Processor [CPU0] (supports 8 throttling states)
> > > BUG: unable to handle kernel paging request at 1b563b0c
> > > IP: [<c020000f>] acpi=5Fps=5Fexecute=5Fmethod+0xc4/0x1f9
> > > *pde =3D 00000000
> > > Oops: 0002 [#1] SMP
> > > Modules linked in: ac(+) sg ahci libata dock sha1=5Fgeneric michael=5Fmi=
c xcbc crc32c deflate zlib=5Fdeflate
> > > tgr192 wp512 sha512 seed camellia fcrypt pcbc khazad tea arc4 cast6 =
cast5 xts gf128mul serpent blowfish
> > > sha256=5Fgeneric md4 cbc des=5Fgeneric ecb crypto=5Fblkcipher snd=5Fseq=5Fdumm=
y snd=5Fseq snd=5Ftimer snd=5Fseq=5Fdevice
> > > snd soundcore parkbd eni suni zatm uPD98402 atm lm70 hwmon ip2 ip2ma=
in parport=5Fpc parport 8250=5Fexar=5Fst16c554
> > > 8250=5Faccent 8250=5Fhub6 8250=5Fboca 8250=5Ffourport ide=5Fgeneric hpt366 ali=
m15x3 jmicron pdc202xx=5Fnew cs5535 aec62xx
> > > atiixp cs5520 it821x cs5530 hpt34x opti621 trm290 amd74xx ns87415 rz=
1000 pdc202xx=5Fold via82cxxx triflex cmd64x
> > > it8213 cy82c693 slc90e66 sc1200 serverworks sis5513 siimage ide=5Fcd=5Fm=
od cdrom mdacon capifs sctp libcrc32c
> > > 9pnet=5Ffd 9pnet sunrpc decnet dccp=5Fipv6 dccp=5Fipv4 dccp ipv6 fuse ide=5F=
pci=5Fgeneric pcnet32 piix mii intel=5Fagp
> > > ide=5Fcore agpgart ext3 mbcache jbd mptspi mptscsih mptbase scsi=5Ftrans=
port=5Fspi sd=5Fmod scsi=5Fmod [last unloaded: sbshc]
> > >=20
> > > Pid: 14520, comm: modprobe Tainted: P         (2.6.25-rc6-git7-defau=
lt #1)
>=20
> What caused the taint=3F

i don`t know. it`s completely fresh compiled kernel, vanilla source. no bi=
nary modules .
can module-init tools be a reason=3F i upgraded that package because of depm=
od memory issue (https://bugzilla.novell.com/show=5Fbug.cgi=3Fid=3D371966 ). dep=
mod was using >500mb on my system.

oh - and i didn`t tell that i`m in vmware, so this my trigger bugs which d=
oesn`t easily happen on real hardware due to timing.


> > > EIP: 0060:[<c020000f>] EFLAGS: 00010206 CPU: 0
> > > EIP is at acpi=5Fps=5Fexecute=5Fmethod+0xc4/0x1f9
> > > EAX: 1b563b0c EBX: 00000000 ECX: 0000ffff EDX: 00000093
> > > ESI: d41a6240 EDI: c032c726 EBP: 00000000 ESP: df881d98
> > >  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
> > > Process modprobe (pid: 14520, ti=3Ddf880000 task=3Dddb458f0 task.ti=3Ddf88=
0000)
> > > Stack: ffffffff c032d513 df020c8c df020c84 df021844 d41a6250 d41a624=
0 c032c726
> > >        00000000 c01fc910 00001001 d41a6240 e085f44c 00000000 c01fc44=
b e085f44c
> > >        df020ce8 d41a6a20 d41a6a20 00000004 e085f44c df020ce8 c01ec14=
5 df881dfc
> > > Call Trace:
> > >  [<c01fc910>] acpi=5Fns=5Fevaluate+0x104/0x1a0
> > >  [<c01fc44b>] acpi=5Fevaluate=5Fobject+0x16f/0x244
> > >  [<c01ec145>] acpi=5Fevaluate=5Finteger+0x84/0x104
> > >  [<e085f038>] acpi=5Fac=5Fget=5Fstate+0x22/0x53 [ac]
> > >  [<e085f20e>] acpi=5Fac=5Fadd+0x63/0x15a [ac]
> > >  [<c0207f4d>] acpi=5Fdevice=5Fprobe+0x37/0xcd
> > >  [<c022dd2b>] driver=5Fprobe=5Fdevice+0x9d/0x114
> > >  [<c022de86>] =5F=5Fdriver=5Fattach+0x52/0x87
> > >  [<c022d36b>] bus=5Ffor=5Feach=5Fdev+0x31/0x52
> > >  [<c022dbde>] driver=5Fattach+0x11/0x13
> > >  [<c022de34>] =5F=5Fdriver=5Fattach+0x0/0x87
> > >  [<c022da1e>] bus=5Fadd=5Fdriver+0x91/0x193
> > >  [<c022e039>] driver=5Fregister+0x45/0x9a
> > >  [<e0863021>] acpi=5Fac=5Finit+0x21/0x39 [ac]
> > >  [<c013c1de>] sys=5Finit=5Fmodule+0x16b6/0x17c9
> > >  [<c0208280>] acpi=5Fbus=5Fregister=5Fdriver+0x0/0x38
> > >  [<c0108a6a>] sys=5Fmmap2+0x62/0x77
> > >  [<c01059c4>] sysenter=5Fpast=5Fesp+0x6d/0xa9
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > Code: c0 b8 01 00 00 00 e8 f9 53 00 00 ff 76 08 8b 46 10 50 83 c0 08=
 50 68 13 d5 32 c0 6a ff 00 00 00 c2 2d=20
> > > c0 68 b0 c2 2d c0 68 fb 00 <00> 00 6a 40 e8 82 2a 00 00 83 c4 24 e8 =
93 fe ff ff 85 c0 89 c5
> > > EIP: [<c020000f>] acpi=5Fps=5Fexecute=5Fmethod+0xc4/0x1f9 SS:ESP 0068:df88=
1d98
>=20
> This is the serious one.

unfortunately i wasn`t yet able to reproduce :(


> > > ---[ end trace f8c13e074fc8ef52 ]---
> > >=20
> > >=20
> > > these are probably minor:
> >=20
> > CCing Greg.
> >=20
> > > Mar 23 09:17:02 opensuse103 kernel: physmap-flash: probe of physmap-=
flash.0 failed with error -12
>=20
> There are many physmap-flashes in the tree.  Is this one
> drivers/mtd/maps/physmap.c=3F

yes.


> > > Mar 23 09:17:03 opensuse103 kernel: Device 'physmap-flash.0' does no=
t have a release() function, it is broken and must be fixed.
>=20
> As the hardware probe failed, why did we ever register anything which ne=
eds
> unregistering=3F
>
> > > Mar 23 09:17:03 opensuse103 kernel: ------------[ cut here ]--------=
----
> > > Mar 23 09:17:03 opensuse103 kernel: WARNING: at drivers/base/core.c:=
114 kobject=5Frelease+0x3d/0x4f()
> > > Mar 23 09:17:03 opensuse103 kernel: Modules linked in: physmap(-) mt=
d map=5Ffuncs cfi=5Fprobe jedec=5Fprobe gen=5Fprobe chipreg parkbd eni
> > > suni zatm uPD98402 atm lm70 hwmon ip2 ip2main parport=5Fpc parport 825=
0=5Fexar=5Fst16c554 8250=5Faccent 8250=5Fhub6 8250=5Fboca 8250=5Ffourport
> > > ide=5Fgeneric hpt366 alim15x3 jmicron pdc202xx=5Fnew cs5535 aec62xx ati =
ixp cs5520 it821x cs5530 hpt34x opti621 trm290 amd74xx ns87415
> > > rz1000 pdc202xx=5Fold via82cxxx triflex cmd64x it8213 cy82c693 slc90e6=
6 sc1200 serverworks sis5513 siim age ide=5Fcd=5Fmod cdrom mdacon
> > > sg capifs sha1=5Fgeneric michael=5Fmic xcbc crc32c deflate zlib=5Fdeflate =
tgr192 wp512 sha512 seed camellia fcrypt pcbc khazad tea arc4
> > > cast6 cast5 xts gf128mul serpent blowfish sha256=5Fgeneric md4 cbc des=
=5Fgeneric ecb crypto=5Fblkcipher snd=5Fseq=5Fdummy snd=5Fseq snd=5Ftimer
> > > snd=5Fseq=5Fdevice snd soundcore sctp libcrc 32c 9pnet=5Ffd 9pnet sunrpc d=
ecnet dccp=5Fipv6 dccp=5Fipv4 dccp ipv6 fuse ide=5Fpci=5Fgeneric pcnet32
> > > piix mii intel=5Fagp ide=5Fcore agpgart ext3 mbcache jbd mptspi mptscsih=
 mpt base scsi=5Ftransport=5Fspi sd=5Fmod scsi=5Fmod [last unloaded: mtd]
> > > Mar 23 09:17:03 opensuse103 kernel: Pid: 19992, comm: modprobe Taint=
ed: P         2.6.25-rc6-git7-default #1
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c011f61f>] warn=5Fon=5Fslowpath+0=
x40/0x4f
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c0123d20>] irq=5Fexit+0x50/0x67=

> > > Mar 23 09:17:03 opensuse103 kernel:  [<c0111a4f>] smp=5Fapic=5Ftimer=5Fint=
errupt+0x6b/0x78
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c0106ad8>] apic=5Ftimer=5Finterru=
pt+0x28/0x30
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c0120192>] vprintk+0x2b9/0x2e=
d
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c01a3565>] sysfs=5Faddrm=5Ffinish=
+0x171/0x19d
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c01a35b2>] remove=5Fdir+0x21/0x=
27
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c01a3613>] sysfs=5Fremove=5Fdir+0=
x5b/0x62
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c01201da>] printk+0x14/0x18
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c01c7f64>] kobject=5Frelease+0x=
3d/0x4f
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c01c7f27>] kobject=5Frelease+0x=
0/0x4f
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c01c89f2>] kref=5Fput+0x36/0x40=

> > > Mar 23 09:17:03 opensuse103 kernel:  [<e0cb83ba>] physmap=5Fexit+0xa/0=
x14 [physmap]
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c013c8b1>] sys=5Fdelete=5Fmodule+=
0x187/0x1c6
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c015d5b5>] remove=5Fvma+0x36/0x=
3b
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c015decb>] do=5Fmunmap+0x18a/0x=
1a4
> > > Mar 23 09:17:03 opensuse103 kernel:  [<c01059c4>] sysenter=5Fpast=5Fesp+=
0x6d/0xa9
> > > Mar 23 09:17:03 opensuse103 kernel:  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > Mar 23 09:17:03 opensuse103 kernel: ---[ end trace f8c13e074fc8ef52 =
]---
> >=20
> > CCing Dave Brownell.
> >=20
> > > Mar 23 09:14:23 opensuse103 kernel: Generic RTC Driver v1.07
> > > Mar 23 09:14:23 opensuse103 kernel: proc=5Fdir=5Fentry 'rtc' already reg=
istered
> > > Mar 23 09:14:23 opensuse103 kernel: Pid: 3994, comm: modprobe Tainte=
d: P         2.6.25-rc6-git7-default #1
> > > Mar 23 09:14:23 opensuse103 kernel:  [<c019a602>] proc=5Fregister+0xf3=
/0x11f
> > > Mar 23 09:14:23 opensuse103 kernel:  [<c019a719>] create=5Fproc=5Fentry+=
0x69/0x7b
> > > Mar 23 09:14:23 opensuse103 kernel:  [<e0c5f02d>] rtc=5Fgeneric=5Finit+0=
x2d/0x54 [genrtc]
> > > Mar 23 09:14:23 opensuse103 kernel:  [<c013c1de>] sys=5Finit=5Fmodule+0x=
16b6/0x17c9
> > > Mar 23 09:14:23 opensuse103 kernel:  [<c0108a6a>] sys=5Fmmap2+0x62/0x7=
7
> > > Mar 23 09:14:23 opensuse103 kernel:  [<c01059c4>] sysenter=5Fpast=5Fesp+=
0x6d/0xa9
> > > Mar 23 09:14:23 opensuse103 kernel:  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> uh, "known problem": multiple rtc drivers are being run.
>=20
> I don't really understand why we haven't been able to fix this - there h=
ave
> been numerous reports..

i will take a closer look to determine how/when this happens.

> > >=20
> > > Mar 23 09:13:09 opensuse103 kernel: hgafb: probe of hgafb.0 failed w=
ith error -22
> > > Mar 23 09:13:09 opensuse103 kernel: Device 'hgafb.0' does not have a=
 release() function, it is broken and must be fixed.
>=20
> There is no identifiable hgafb maintainer.

the former one, Ferenc Bakonyi told that he lost his HGA card in 2001.
hercules graphics was once very populer, so not sure if this is some candi=
date to be added to feature-removal-schedule.txt !=3F

> > > Mar 23 09:13:09 opensuse103 kernel: ------------[ cut here ]--------=
----
> > > Mar 23 09:13:09 opensuse103 kernel: WARNING: at drivers/base/core.c:=
114 kobject=5Frelease+0x3d/0x4f()
> > > Mar 23 09:13:09 opensuse103 kernel: Modules linked in: hgafb(-) mdac=
on sg capifs sha1=5Fgeneric michael=5Fmic xcbc crc32c deflate=20
> > > zlib=5Fdeflate tgr192 wp512 sha512 seed camellia fcrypt pcbc khazad te=
a arc4 cast6 cast5 xts gf128mul serpent blowfish sha256=5Fgeneric=20
> > > md4 cbc des=5Fgeneric ecb crypto=5Fblkcipher snd=5Fseq=5Fdummy snd=5Fseq snd=5Ft=
imer snd=5Fseq=5Fdevice snd soundcore sctp libcrc32c 9pnet=5Ffd 9pnet=20
> > > sunrpc decnet dccp=5Fipv6 dccp=5Fipv4 dccp ipv6 fuse loop ide=5Fcd=5Fmod cdr=
om ide=5Fpci=5Fgeneric rtc=5Fcmos rtc=5Fcore pcnet32 piix i2c=5Fpiix4=20
> > > parport=5Fpc mii rtc=5Flib parport shpchp intel=5Fagp ide=5Fcore i2c=5Fcore pc=
i=5Fhotplug agpgart uhci=5Fhcd usbcore edd ext3 mbcache jbd mptsas=20
> > > scsi=5Ftransport=5Fsas mptfc scsi=5Ftransport=5Ffc scsi=5Ftgt mptspi mptscsih =
mptbase scsi=5Ftransport=5Fspi sd=5Fmod scsi=5Fmod [last unloaded: lcd]
> > > Mar 23 09:13:09 opensuse103 kernel: Pid: 30783, comm: modprobe Taint=
ed: P         2.6.25-rc6-git7-default #1
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c011f61f>] warn=5Fon=5Fslowpath+0=
x40/0x4f
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c0123d20>] irq=5Fexit+0x50/0x67=

> > > Mar 23 09:13:09 opensuse103 kernel:  [<c0111a4f>] smp=5Fapic=5Ftimer=5Fint=
errupt+0x6b/0x78
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c0106ad8>] apic=5Ftimer=5Finterru=
pt+0x28/0x30
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c0120192>] vprintk+0x2b9/0x2e=
d
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c01a3565>] sysfs=5Faddrm=5Ffinish=
+0x171/0x19d
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c01a35b2>] remove=5Fdir+0x21/0x=
27
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c01a3613>] sysfs=5Fremove=5Fdir+0=
x5b/0x62
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c01201da>] printk+0x14/0x18
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c01c7f64>] kobject=5Frelease+0x=
3d/0x4f
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c01c7f27>] kobject=5Frelease+0x=
0/0x4f
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c01c89f2>] kref=5Fput+0x36/0x40=

> > > Mar 23 09:13:09 opensuse103 kernel:  [<e08224f2>] hgafb=5Fexit+0xa/0x1=
4 [hgafb]
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c013c8b1>] sys=5Fdelete=5Fmodule+=
0x187/0x1c6
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c015d5b5>] remove=5Fvma+0x36/0x=
3b
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c015decb>] do=5Fmunmap+0x18a/0x=
1a4
> > > Mar 23 09:13:09 opensuse103 kernel:  [<c01059c4>] sysenter=5Fpast=5Fesp+=
0x6d/0xa9
> > > Mar 23 09:13:09 opensuse103 kernel:  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > Mar 23 09:13:09 opensuse103 kernel: ---[ end trace f8c13e074fc8ef52 =
]---
> > >=20
> > >=20
> > >=20
> > > Mar 23 09:06:31 opensuse103 kernel: Installing 9P2000 support
> > > Mar 23 09:06:31 opensuse103 kernel: sys=5Finit=5Fmodule: '9pnet=5Ffd'->ini=
t suspiciously returned 1, it should follow 0/-E convention
> > > Mar 23 09:06:31 opensuse103 kernel: sys=5Finit=5Fmodule: loading module =
anyway...
> > > Mar 23 09:06:31 opensuse103 kernel: Pid: 5323, comm: modprobe Not ta=
inted 2.6.25-rc6-git7-default #1
> > > Mar 23 09:06:31 opensuse103 kernel:  [<c013c253>] sys=5Finit=5Fmodule+0x=
172b/0x17c9
> > > Mar 23 09:06:31 opensuse103 kernel:  [<c0108a6a>] sys=5Fmmap2+0x62/0x7=
7
> > > Mar 23 09:06:31 opensuse103 kernel:  [<c01059c4>] sysenter=5Fpast=5Fesp+=
0x6d/0xa9
> > > Mar 23 09:06:31 opensuse103 kernel:  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >=20
>=20
> yay, I fixed one.
>=20
> --- a/net/9p/trans=5Ffd.c~a
> +++ a/net/9p/trans=5Ffd.c
> @@ -1522,7 +1522,7 @@ static int =5F=5Finit p9=5Ftrans=5Ffd=5Finit(void)
>  	v9fs=5Fregister=5Ftrans(&p9=5Funix=5Ftrans);
>  	v9fs=5Fregister=5Ftrans(&p9=5Ffd=5Ftrans);
> =20
> -	return 1;
> +	return 0;
>  }
> =20
>  module=5Finit(p9=5Ftrans=5Ffd=5Finit);

thanks!


> =5F
> > >=20
> > > Mar 23 09:31:43 opensuse103 kernel: sysfs: duplicate filename 'pata=5F=
winbond.0' can not be created
>=20
> Alan...

oh - pardon, i put this to bugzilla some time ago already and it seems to =
be a "won`t fix"

regards
roland

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Unbegrenzter Speicherplatz f=FCr Ihr E-Mail Postfach=3F Jetzt aktivieren!
http://freemail.web.de/club/landingpage.htm/=3Fmc=3D025555
