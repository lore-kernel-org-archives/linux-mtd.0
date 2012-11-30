Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeQIO-0004n0-V0
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 13:06:23 +0000
Message-ID: <1354280829.30168.122.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: sm_ftl: Remove unused kthread stuff
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Fri, 30 Nov 2012 15:07:09 +0200
In-Reply-To: <CALF0-+X9M3eQOBXerRCtmnZHaLP01CdW0PWxv88D3EZ2J-_fMA@mail.gmail.com>
References: <1352565322-8731-1-git-send-email-elezegarcia@gmail.com>
 <1353510354.2701.10.camel@sauron.fi.intel.com>
 <CALF0-+X9M3eQOBXerRCtmnZHaLP01CdW0PWxv88D3EZ2J-_fMA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6jajU1wQyzguIPM/j941"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Maxim Levitsky <maximlevitsky@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6jajU1wQyzguIPM/j941
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 20:02 -0300, Ezequiel Garcia wrote:
> On Wed, Nov 21, 2012 at 12:05 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
> > On Sat, 2012-11-10 at 13:35 -0300, Ezequiel Garcia wrote:
> >> This driver uses workqueues, not kthreads.
> >> Remove kthread header and thread related comment.
> >>
> >> Cc: Maxim Levitsky <maximlevitsky@gmail.com>
> >> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
> >
> > Aiaiai [1]!
> >
> > Aiaiai found out that this breaks the build!
> >
> > drivers/mtd/sm_ftl.c:1025:2: error: implicit declaration of function 'I=
S_ERR' [-Werror=3Dimplicit-function-declaration]
> > drivers/mtd/sm_ftl.c:1026:3: error: implicit declaration of function 'P=
TR_ERR' [-Werror=3Dimplicit-function-declaration]
> >
> > Include <linux/err.h> instead, I guess.
>=20
> I can do that. But I can't get that error here :-(
>=20
> Mind me posting your config?

Below is the aiaiai report, and there are many configs - pick the one
you like. You can find all of them in [1].

1. git://git.infradead.org/users/dedekind/maintaining.git


$ ./verify ../l2-mtd/ < ~/tmp/sm_ftl.mbox

Tested the patch(es) on top of the following commits:
9f34d3b Quick fixes - applied by aiaiai
5bc8d0c mtd: remove the "chip" parameter in nand_get_device()
3b6bb0c mtd: remove the de-select chip code in nand_release_device()
0f722de mtd: m25p80: modify info for Micron N25Q128

---------------------------------------------------------------------------=
-----

Successfully built configuration "arm-omap2plus_defconfig,arm,arm-none-linu=
x-gnueabi-", no issues

---------------------------------------------------------------------------=
-----

Successfully built configuration "i386_defconfig,i386,", no issues

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "ia64_defconfig" (ar=
chitecture ia64)":

85f41e6 mtd: sm_ftl: Remove unused kthread stuff

drivers/mtd/nand/r852.c:964:6: warning: no previous prototype for 'r852_rem=
ove' [-Wmissing-prototypes]
drivers/mtd/nand/r852.c:995:6: warning: no previous prototype for 'r852_shu=
tdown' [-Wmissing-prototypes]
drivers/mtd/nand/r852.c:1006:12: warning: 'r852_suspend' defined but not us=
ed [-Wunused-function]
drivers/mtd/nand/r852.c:1027:12: warning: 'r852_resume' defined but not use=
d [-Wunused-function]
drivers/mtd/nand/nandsim.c:1395:5: warning: no previous prototype for 'do_r=
ead_error' [-Wmissing-prototypes]
drivers/mtd/nand/nandsim.c:1410:6: warning: no previous prototype for 'do_b=
it_flips' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:43:9: warning: no previous prototype for 'sm_attr_show=
' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:56:25: warning: no previous prototype for 'sm_create_s=
ysfs_attributes' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:109:6: warning: no previous prototype for 'sm_delete_s=
ysfs_attributes' [-Wmissing-prototypes]                                    =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:573:5: warning: no previous prototype for 'sm_get_medi=
a_info' [-Wmissing-prototypes]                                             =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:880:18: warning: no previous prototype for 'sm_get_zon=
e' [-Wmissing-prototypes]                                                  =
                                                                           =
  =20
drivers/mtd/sm_ftl.c: In function 'sm_get_zone':                           =
                                                                           =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:892:4: error: implicit declaration of function 'ERR_PT=
R' [-Werror=3Dimplicit-function-declaration]                               =
                                                                           =
    =20
drivers/mtd/sm_ftl.c:892:4: warning: return makes pointer from integer with=
out a cast [enabled by default]                                            =
                                                                           =
  =20
drivers/mtd/sm_ftl.c: At top level:                                        =
                                                                           =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:901:6: warning: no previous prototype for 'sm_cache_in=
it' [-Wmissing-prototypes]                                                 =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:911:6: warning: no previous prototype for 'sm_cache_pu=
t' [-Wmissing-prototypes]                                                  =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:919:5: warning: no previous prototype for 'sm_cache_ge=
t' [-Wmissing-prototypes]                                                  =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:930:5: warning: no previous prototype for 'sm_cache_fl=
ush' [-Wmissing-prototypes]                                                =
                                                                           =
  =20
drivers/mtd/sm_ftl.c: In function 'sm_read':                               =
                                                                           =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:1025:2: error: implicit declaration of function 'IS_ER=
R' [-Werror=3Dimplicit-function-declaration]                               =
                                                                           =
    =20
drivers/mtd/sm_ftl.c:1026:3: error: implicit declaration of function 'PTR_E=
RR' [-Werror=3Dimplicit-function-declaration]                              =
                                                                           =
    =20
cc1: some warnings being treated as errors                                 =
                                                                           =
                                                                           =
  =20
make[3]: *** [drivers/mtd/sm_ftl.o] Error 1                                =
                                                                           =
                                                                           =
  =20
                                                                           =
                                                                           =
                                                                           =
  =20
---------------------------------------------------------------------------=
-----                                                                      =
                                                                           =
  =20
Failed to build the following commit for configuration "m68k-m5208evb_defco=
nfig" (architecture m68k)":                                                =
                                                                           =
  =20
                                                                           =
                                                                           =
                                                                           =
  =20
85f41e6 mtd: sm_ftl: Remove unused kthread stuff                           =
                                                                           =
                                                                           =
  =20
                                                                           =
                                                                           =
                                                                           =
  =20
In file included from drivers/mtd/maps/latch-addr-flash.c:17:0:            =
                                                                           =
                                                                           =
  =20
include/linux/mtd/map.h:145:2: warning: #warning "No CONFIG_MTD_MAP_BANK_WI=
DTH_xx selected. No NOR chip support can work" [-Wcpp]                     =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:43:9: warning: no previous prototype for 'sm_attr_show=
' [-Wmissing-prototypes]                                                   =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:56:25: warning: no previous prototype for 'sm_create_s=
ysfs_attributes' [-Wmissing-prototypes]                                    =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:109:6: warning: no previous prototype for 'sm_delete_s=
ysfs_attributes' [-Wmissing-prototypes]                                    =
                                                                           =
  =20
drivers/mtd/sm_ftl.c: In function 'sm_break_offset':                       =
                                                                           =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:214:13: warning: comparison of distinct pointer types =
lacks a cast [enabled by default]                                          =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:215:11: warning: comparison of distinct pointer types =
lacks a cast [enabled by default]                                          =
                                                                           =
  =20
drivers/mtd/sm_ftl.c: At top level:                                        =
                                                                           =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:573:5: warning: no previous prototype for 'sm_get_medi=
a_info' [-Wmissing-prototypes]                                             =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:880:18: warning: no previous prototype for 'sm_get_zon=
e' [-Wmissing-prototypes]                                                  =
                                                                           =
  =20
drivers/mtd/sm_ftl.c: In function 'sm_get_zone':                           =
                                                                           =
                                                                           =
  =20
drivers/mtd/sm_ftl.c:892:4: error: implicit declaration of function 'ERR_PT=
R' [-Werror=3Dimplicit-function-declaration]                               =
                                                                           =
    =20
drivers/mtd/sm_ftl.c:892:4: warning: return makes pointer from integer with=
out a cast [enabled by default]
drivers/mtd/sm_ftl.c: At top level:
drivers/mtd/sm_ftl.c:901:6: warning: no previous prototype for 'sm_cache_in=
it' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:911:6: warning: no previous prototype for 'sm_cache_pu=
t' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:919:5: warning: no previous prototype for 'sm_cache_ge=
t' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:930:5: warning: no previous prototype for 'sm_cache_fl=
ush' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_read':
drivers/mtd/sm_ftl.c:1025:2: error: implicit declaration of function 'IS_ER=
R' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/sm_ftl.c:1026:3: error: implicit declaration of function 'PTR_E=
RR' [-Werror=3Dimplicit-function-declaration]
cc1: some warnings being treated as errors
make[3]: *** [drivers/mtd/sm_ftl.o] Error 1

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "mips64_defconfig" (=
architecture mips)":

85f41e6 mtd: sm_ftl: Remove unused kthread stuff

drivers/mtd/nand/r852.c:964:6: warning: no previous prototype for 'r852_rem=
ove' [-Wmissing-prototypes]
drivers/mtd/nand/r852.c:995:6: warning: no previous prototype for 'r852_shu=
tdown' [-Wmissing-prototypes]
drivers/mtd/nand/nandsim.c:1395:5: warning: no previous prototype for 'do_r=
ead_error' [-Wmissing-prototypes]
drivers/mtd/nand/nandsim.c:1410:6: warning: no previous prototype for 'do_b=
it_flips' [-Wmissing-prototypes]
drivers/mtd/nftlmount.c: In function 'NFTL_mount':
drivers/mtd/nftlmount.c:568:62: warning: variable 'nb_erases' set but not u=
sed [-Wunused-but-set-variable]
drivers/mtd/sm_ftl.c:43:9: warning: no previous prototype for 'sm_attr_show=
' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:56:25: warning: no previous prototype for 'sm_create_s=
ysfs_attributes' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:109:6: warning: no previous prototype for 'sm_delete_s=
ysfs_attributes' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:573:5: warning: no previous prototype for 'sm_get_medi=
a_info' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:880:18: warning: no previous prototype for 'sm_get_zon=
e' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_get_zone':
drivers/mtd/sm_ftl.c:892:4: error: implicit declaration of function 'ERR_PT=
R' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/sm_ftl.c:892:4: warning: return makes pointer from integer with=
out a cast [enabled by default]
drivers/mtd/sm_ftl.c: At top level:
drivers/mtd/sm_ftl.c:901:6: warning: no previous prototype for 'sm_cache_in=
it' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:911:6: warning: no previous prototype for 'sm_cache_pu=
t' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:919:5: warning: no previous prototype for 'sm_cache_ge=
t' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:930:5: warning: no previous prototype for 'sm_cache_fl=
ush' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_read':
drivers/mtd/sm_ftl.c:1025:2: error: implicit declaration of function 'IS_ER=
R' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/sm_ftl.c:1026:3: error: implicit declaration of function 'PTR_E=
RR' [-Werror=3Dimplicit-function-declaration]
cc1: some warnings being treated as errors
make[3]: *** [drivers/mtd/sm_ftl.o] Error 1

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "mips-bcm63xx_defcon=
fig" (architecture mips)":

85f41e6 mtd: sm_ftl: Remove unused kthread stuff

drivers/mtd/bcm63xxpart.c: In function 'bcm63xx_parse_cfe_partitions':
drivers/mtd/bcm63xxpart.c:76:6: warning: variable 'ret' set but not used [-=
Wunused-but-set-variable]
drivers/mtd/sm_ftl.c:43:9: warning: no previous prototype for 'sm_attr_show=
' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:56:25: warning: no previous prototype for 'sm_create_s=
ysfs_attributes' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:109:6: warning: no previous prototype for 'sm_delete_s=
ysfs_attributes' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_break_offset':
drivers/mtd/sm_ftl.c:214:13: warning: comparison of distinct pointer types =
lacks a cast [enabled by default]
drivers/mtd/sm_ftl.c:215:11: warning: comparison of distinct pointer types =
lacks a cast [enabled by default]
drivers/mtd/sm_ftl.c: At top level:
drivers/mtd/sm_ftl.c:573:5: warning: no previous prototype for 'sm_get_medi=
a_info' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:880:18: warning: no previous prototype for 'sm_get_zon=
e' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_get_zone':
drivers/mtd/sm_ftl.c:892:4: error: implicit declaration of function 'ERR_PT=
R' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/sm_ftl.c:892:4: warning: return makes pointer from integer with=
out a cast [enabled by default]
drivers/mtd/sm_ftl.c: At top level:
drivers/mtd/sm_ftl.c:901:6: warning: no previous prototype for 'sm_cache_in=
it' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:911:6: warning: no previous prototype for 'sm_cache_pu=
t' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:919:5: warning: no previous prototype for 'sm_cache_ge=
t' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:930:5: warning: no previous prototype for 'sm_cache_fl=
ush' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_read':
drivers/mtd/sm_ftl.c:1025:2: error: implicit declaration of function 'IS_ER=
R' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/sm_ftl.c:1026:3: error: implicit declaration of function 'PTR_E=
RR' [-Werror=3Dimplicit-function-declaration]
cc1: some warnings being treated as errors
make[3]: *** [drivers/mtd/sm_ftl.o] Error 1

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "ppc32_defconfig" (a=
rchitecture powerpc)":

85f41e6 mtd: sm_ftl: Remove unused kthread stuff

drivers/mtd/nftlmount.c: In function 'NFTL_mount':
drivers/mtd/nftlmount.c:568:62: warning: variable 'nb_erases' set but not u=
sed [-Wunused-but-set-variable]
drivers/mtd/sm_ftl.c:43:9: warning: no previous prototype for 'sm_attr_show=
' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:56:25: warning: no previous prototype for 'sm_create_s=
ysfs_attributes' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:109:6: warning: no previous prototype for 'sm_delete_s=
ysfs_attributes' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_break_offset':
drivers/mtd/sm_ftl.c:214:13: warning: comparison of distinct pointer types =
lacks a cast [enabled by default]
drivers/mtd/sm_ftl.c:215:11: warning: comparison of distinct pointer types =
lacks a cast [enabled by default]
drivers/mtd/sm_ftl.c: At top level:
drivers/mtd/sm_ftl.c:573:5: warning: no previous prototype for 'sm_get_medi=
a_info' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:880:18: warning: no previous prototype for 'sm_get_zon=
e' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_get_zone':
drivers/mtd/sm_ftl.c:892:4: error: implicit declaration of function 'ERR_PT=
R' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/sm_ftl.c:892:4: warning: return makes pointer from integer with=
out a cast [enabled by default]
drivers/mtd/sm_ftl.c: At top level:
drivers/mtd/sm_ftl.c:901:6: warning: no previous prototype for 'sm_cache_in=
it' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:911:6: warning: no previous prototype for 'sm_cache_pu=
t' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:919:5: warning: no previous prototype for 'sm_cache_ge=
t' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:930:5: warning: no previous prototype for 'sm_cache_fl=
ush' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_read':
drivers/mtd/sm_ftl.c:1025:2: error: implicit declaration of function 'IS_ER=
R' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/sm_ftl.c:1026:3: error: implicit declaration of function 'PTR_E=
RR' [-Werror=3Dimplicit-function-declaration]
cc1: some warnings being treated as errors
make[3]: *** [drivers/mtd/sm_ftl.o] Error 1

---------------------------------------------------------------------------=
-----
Failed to build the following commit for configuration "ppc64_defconfig" (a=
rchitecture powerpc)":

85f41e6 mtd: sm_ftl: Remove unused kthread stuff

include/linux/mtd/pfow.h:104:6: warning: variable 'chipnum' set but not use=
d [-Wunused-but-set-variable]
drivers/mtd/lpddr/lpddr_cmds.c: At top level:
drivers/mtd/lpddr/lpddr_cmds.c:391:5: warning: no previous prototype for 'd=
o_write_buffer' [-Wmissing-prototypes]
drivers/mtd/lpddr/lpddr_cmds.c:472:5: warning: no previous prototype for 'd=
o_erase_oneblock' [-Wmissing-prototypes]
drivers/mtd/lpddr/lpddr_cmds.c:706:5: warning: no previous prototype for 'd=
o_xxlock' [-Wmissing-prototypes]
drivers/mtd/lpddr/lpddr_cmds.c:751:5: warning: no previous prototype for 'w=
ord_program' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:43:9: warning: no previous prototype for 'sm_attr_show=
' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:56:25: warning: no previous prototype for 'sm_create_s=
ysfs_attributes' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:109:6: warning: no previous prototype for 'sm_delete_s=
ysfs_attributes' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:573:5: warning: no previous prototype for 'sm_get_medi=
a_info' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:880:18: warning: no previous prototype for 'sm_get_zon=
e' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_get_zone':
drivers/mtd/sm_ftl.c:892:4: error: implicit declaration of function 'ERR_PT=
R' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/sm_ftl.c:892:4: warning: return makes pointer from integer with=
out a cast [enabled by default]
drivers/mtd/sm_ftl.c: At top level:
drivers/mtd/sm_ftl.c:901:6: warning: no previous prototype for 'sm_cache_in=
it' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:911:6: warning: no previous prototype for 'sm_cache_pu=
t' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:919:5: warning: no previous prototype for 'sm_cache_ge=
t' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c:930:5: warning: no previous prototype for 'sm_cache_fl=
ush' [-Wmissing-prototypes]
drivers/mtd/sm_ftl.c: In function 'sm_read':
drivers/mtd/sm_ftl.c:1025:2: error: implicit declaration of function 'IS_ER=
R' [-Werror=3Dimplicit-function-declaration]
drivers/mtd/sm_ftl.c:1026:3: error: implicit declaration of function 'PTR_E=
RR' [-Werror=3Dimplicit-function-declaration]
cc1: some warnings being treated as errors
make[3]: *** [drivers/mtd/sm_ftl.o] Error 1

---------------------------------------------------------------------------=
-----

Successfully built configuration "x86_64_defconfig,x86_64,", no issues

---------------------------------------------------------------------------=
-----


--=20
Best Regards,
Artem Bityutskiy

--=-6jajU1wQyzguIPM/j941
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQuK99AAoJECmIfjd9wqK0gZwP/1Mhy8G5VIy5kXYoZo/vQmIk
uHkItUybRcV5GabY/Avnf/M88SuC2jCW++PXKTEyvo2xRJNjquOTn+fq4HO0OIU2
PbyTPXn1u9lShzYYm+BEzIi+JGyI2Bs71O+R+orUgTQmrsDQOM5v6nkA4GRHEkig
oP12sa2nAjTBSDHuzDrfON77fkh+wPip8HrS1gT4GbWXk2/Uy0NpJwTIhJpyrTtp
uR2ikV4nWjcfog+ImsO8xN09rhUSiRfOuFpmu9ZHODdA/BcR8KftuCq0Qsq8QpQ6
ukkRXQgmbUgi+RBhkULwofaoa0syOtmBowt18lAqtpp1/cV+jcbBjPjeZZYNWZF5
VD1iWe9C2rqaiWfNNKQpuQSi8p8iooFUoGL2cwsof9vHiNMq/NaJ/djInTRk6O4K
Dceew0xT1pS3fu7y4oWpJVltv3LTz6Q9Bv4pXdhZpn/5LBj877v1F+SY53vCWIVv
VkpjX/0k+mE1I+RxAaT8o1IYRv6ecFD8lbJb8vqLA0wlR/jrgqKYEwQzB4i2koqi
z3DWrB6E2WZeXUd1y2fvJuzyp02g4sq9RKIctUe0CDJwg7II0j2ORnCGl+3jne4p
CXqJARtrLNhTaK1sN9UgWzP6VtnCJG65ZYlAu+KH7fhA+xvzhBhduZiS2GtqyDgP
bVrPQjUrmDspMelYd9Pm
=lj66
-----END PGP SIGNATURE-----

--=-6jajU1wQyzguIPM/j941--
