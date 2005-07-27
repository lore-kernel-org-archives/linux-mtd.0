From: =?iso-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
To: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Date: Wed, 27 Jul 2005 18:16:29 +0200
Message-ID: <000601c592c6$8c380a70$050213ac@MCaloMobile>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42E75C7D.6030303@yandex.ru>
Cc: "'Artem B. Bityuckiy'" <dedekind@yandex.ru>
Subject: R: R: I: Jffs2 space problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem,

	I have downloaded the MTD from :
http://ftp.debian.org/debian/pool/main/m/mtd/mtd_20050122.orig.tar.gz

Then I followed the instruction to patch it.

I'm facing a lot of problem to build it under uClinux (2.4.27-uc1).

Am I patched wrong kernel version? Where can I find the right for me ?

Thanks!

************************************
Erro messages after make :

make[5]: Entering directory
`/home/max/uClinux-dist-patched/linux-2.4.x/drivers/mtd/chips'
make[5]: Circular
/home/max/uClinux-dist-patched/linux-2.4.x/include/asm/arch/memory.h <-
/home/max/uClinux-dist-patched/linux-2.4.x/include/asm/page.h dependency
dropped.
arm-elf-gcc -D__KERNEL__
-I/home/max/uClinux-dist-patched/linux-2.4.x/include  -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fno-common -pipe -fno-builtin -D__linux__ -DNO_MM -mapcs-32 =
-march=3Darmv4
-mtune=3Darm7tdmi -mshort-load-bytes -msoft-float   -nostdinc =
-iwithprefix
include -DKBUILD_BASENAME=3Dchipreg  -c -o chipreg.o chipreg.c
In file included from chipreg.c:14:
/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/map.h:15:
asm/bug.h: No such file or directory
/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/map.h:127:
#error "No bus width supported. What's the point?"
In file included from chipreg.c:14:
/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/map.h: In
function `map_bankwidth_supported':
/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/map.h:151:
warning: unreachable code at beginning of switch statement
/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/map.h: At =
top
level:
/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/map.h:161:
`MAX_MAP_BANKWIDTH' undeclared here (not in a function)
/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/map.h:161: =
size
of array `x' has non-integer type
/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/map.h: In
function `map_word_equal':
/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/map.h:248:
warning: implicit declaration of function
`map_words'/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/m=
ap.
h: In function `map_word_load':
/home/max/uClinux-dist-patched/linux-2.4.x/include/linux/mtd/map.h:303:
warning: implicit declaration of function `map_bankwidth_is_large'
make[5]: *** [chipreg.o] Error 1
make[5]: Leaving directory
`/home/max/uClinux-dist-patched/linux-2.4.x/drivers/mtd/chips'
make[4]: *** [first_rule] Error 2
make[4]: Leaving directory
`/home/max/uClinux-dist-patched/linux-2.4.x/drivers/mtd/chips'
make[3]: *** [_subdir_chips] Error 2
make[3]: Leaving directory
`/home/max/uClinux-dist-patched/linux-2.4.x/drivers/mtd'
make[2]: *** [_subdir_mtd] Error 2
make[2]: Leaving directory
`/home/max/uClinux-dist-patched/linux-2.4.x/drivers'
make[1]: *** [_dir_drivers] Error 2
make[1]: Leaving directory `/home/max/uClinux-dist-patched/linux-2.4.x'
make: *** [linux] Error 1
[root@mcalolinux uClinux-dist-patched]#



-----Messaggio originale-----
Da: Artem B. Bityuckiy [mailto:dedekind@yandex.ru]=20
Inviato: mercoled=EC 27 luglio 2005 12.06
A: Cal=F2 Massimo
Oggetto: Re: R: I: Jffs2 space problem


Cal=F2 Massimo wrote:
> Hi Artem,
>=20
> 	I'm looking for "flash_eraseall" but I don't have it.
>=20
> I'm working on uClinux : do you think that I need "flash_eraseall" ?=20
> Do I have to port it to uClinux??
>=20
flash_eraseall is in the util/ directory in the MTD tree. You probably=20
want fresh MTD utilities and you may find them in that directory. Its a
userspace utility. So just compile is and use...

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
