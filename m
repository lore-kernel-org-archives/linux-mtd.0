Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tze76-0002BL-RO
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 02:06:28 +0000
Message-ID: <5105DD0E.1010500@freescale.com>
Date: Mon, 28 Jan 2013 10:06:06 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 1/3] mtd: add new fields to nand_flash_dev{}
References: <1359007901-26464-1-git-send-email-b32955@freescale.com>
 <1359007901-26464-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1359007901-26464-2-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, shmulik.ladkani@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA01=D4=C224=C8=D5 14:11, Huang Shijie =D0=B4=B5=C0:
> As time goes on, we begin to meet the situation that we can not get eno=
ugh
> information from some nand chips's id data. Take some Toshiba's nand ch=
ips
> for example. I have 4 Toshiba's nand chips in my hand:
> 	TC58NVG2S0F, TC58NVG3S0F, TC58NVG5D2, TC58NVG6D2
>
> When we read these chips' datasheets, we will get the geometry of these=
 chips:
> 	TC58NVG2S0F : 4096 + 224
> 	TC58NVG3S0F : 4096 + 232
> 	TC58NVG5D2  : 8192 + 640
> 	TC58NVG6D2  : 8192 + 640
>
> But we can not parse out the correct oob size for these chips from the =
id data.
> So it is time to add some new fields to the nand_flash_dev{}, and updat=
e the
> detection mechanisms.
>
> This patch just adds some new fields to the nand_flash_dev{}.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/devices/doc2000.c     |    2 +-
>  drivers/mtd/devices/doc2001.c     |    2 +-
>  drivers/mtd/devices/doc2001plus.c |    2 +-
>  drivers/mtd/nand/nand_base.c      |    2 +-
>  drivers/mtd/nand/nand_ids.c       |  176 +++++++++++++++++++----------=
--------
>  drivers/mtd/nand/nandsim.c        |    2 +-
>  drivers/mtd/nand/pxa3xx_nand.c    |    2 +-
>  drivers/mtd/nand/sm_common.c      |   61 ++++++-------
>  include/linux/mtd/nand.h          |   10 ++-
>  9 files changed, 133 insertions(+), 126 deletions(-)
>
> diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc200=
0.c
> index a4eb8b5..93f037f 100644
> --- a/drivers/mtd/devices/doc2000.c
> +++ b/drivers/mtd/devices/doc2000.c
> @@ -379,7 +379,7 @@ static int DoC_IdentChip(struct DiskOnChip *doc, in=
t floor, int chip)
> =20
>  	/* Print and store the manufacturer and ID codes. */
>  	for (i =3D 0; nand_flash_ids[i].name !=3D NULL; i++) {
> -		if (id =3D=3D nand_flash_ids[i].id) {
> +		if (id =3D=3D nand_flash_ids[i].id[1]) {
>  			/* Try to identify manufacturer */
>  			for (j =3D 0; nand_manuf_ids[j].id !=3D 0x0; j++) {
>  				if (nand_manuf_ids[j].id =3D=3D mfr)
> diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc200=
1.c
> index f692795..15dd177 100644
> --- a/drivers/mtd/devices/doc2001.c
> +++ b/drivers/mtd/devices/doc2001.c
> @@ -206,7 +206,7 @@ static int DoC_IdentChip(struct DiskOnChip *doc, in=
t floor, int chip)
> =20
>  	/* FIXME: to deal with multi-flash on multi-Millennium case more care=
fully */
>  	for (i =3D 0; nand_flash_ids[i].name !=3D NULL; i++) {
> -		if ( id =3D=3D nand_flash_ids[i].id) {
> +		if (id =3D=3D nand_flash_ids[i].id[1]) {
>  			/* Try to identify manufacturer */
>  			for (j =3D 0; nand_manuf_ids[j].id !=3D 0x0; j++) {
>  				if (nand_manuf_ids[j].id =3D=3D mfr)
> diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/do=
c2001plus.c
> index 4f2220a..80aef1b 100644
> --- a/drivers/mtd/devices/doc2001plus.c
> +++ b/drivers/mtd/devices/doc2001plus.c
> @@ -314,7 +314,7 @@ static int DoC_IdentChip(struct DiskOnChip *doc, in=
t floor, int chip)
>  		return 0;
> =20
>  	for (i =3D 0; nand_flash_ids[i].name !=3D NULL; i++) {
> -		if (id =3D=3D nand_flash_ids[i].id) {
> +		if (id =3D=3D nand_flash_ids[i].id[1]) {
>  			/* Try to identify manufacturer */
>  			for (j =3D 0; nand_manuf_ids[j].id !=3D 0x0; j++) {
>  				if (nand_manuf_ids[j].id =3D=3D mfr)
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
> index a8c1fb4..0e80ec4 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3204,7 +3204,7 @@ static struct nand_flash_dev *nand_get_flash_type=
(struct mtd_info *mtd,
>  		type =3D nand_flash_ids;
> =20
>  	for (; type->name !=3D NULL; type++)
> -		if (*dev_id =3D=3D type->id)
> +		if (*dev_id =3D=3D type->id[1])
>  			break;
> =20
>  	chip->onfi_version =3D 0;
> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> index e3aa274..9dc2e54 100644
> --- a/drivers/mtd/nand/nand_ids.c
> +++ b/drivers/mtd/nand/nand_ids.c
> @@ -10,6 +10,8 @@
>   */
>  #include <linux/module.h>
>  #include <linux/mtd/nand.h>
> +#include <linux/sizes.h>
> +
>  /*
>  *	Chip ID list
>  *
> @@ -24,47 +26,47 @@
>  struct nand_flash_dev nand_flash_ids[] =3D {
> =20
>  #ifdef CONFIG_MTD_NAND_MUSEUM_IDS
> -	{"NAND 1MiB 5V 8-bit",		0x6e, 256, 1, 0x1000, 0},
> -	{"NAND 2MiB 5V 8-bit",		0x64, 256, 2, 0x1000, 0},
> -	{"NAND 4MiB 5V 8-bit",		0x6b, 512, 4, 0x2000, 0},
> -	{"NAND 1MiB 3,3V 8-bit",	0xe8, 256, 1, 0x1000, 0},
> -	{"NAND 1MiB 3,3V 8-bit",	0xec, 256, 1, 0x1000, 0},
> -	{"NAND 2MiB 3,3V 8-bit",	0xea, 256, 2, 0x1000, 0},
> -	{"NAND 4MiB 3,3V 8-bit",	0xd5, 512, 4, 0x2000, 0},
> -	{"NAND 4MiB 3,3V 8-bit",	0xe3, 512, 4, 0x2000, 0},
> -	{"NAND 4MiB 3,3V 8-bit",	0xe5, 512, 4, 0x2000, 0},
> -	{"NAND 8MiB 3,3V 8-bit",	0xd6, 512, 8, 0x2000, 0},
> -
> -	{"NAND 8MiB 1,8V 8-bit",	0x39, 512, 8, 0x2000, 0},
> -	{"NAND 8MiB 3,3V 8-bit",	0xe6, 512, 8, 0x2000, 0},
> -	{"NAND 8MiB 1,8V 16-bit",	0x49, 512, 8, 0x2000, NAND_BUSWIDTH_16},
> -	{"NAND 8MiB 3,3V 16-bit",	0x59, 512, 8, 0x2000, NAND_BUSWIDTH_16},
> +	{"NAND 1MiB 5V 8-bit",		{0, 0x6e}, 256, 1, 0x1000, 0},
> +	{"NAND 2MiB 5V 8-bit",		{0, 0x64}, 256, 2, 0x1000, 0},
> +	{"NAND 4MiB 5V 8-bit",		{0, 0x6b}, 512, 4, 0x2000, 0},
> +	{"NAND 1MiB 3,3V 8-bit",	{0, 0xe8}, 256, 1, 0x1000, 0},
> +	{"NAND 1MiB 3,3V 8-bit",	{0, 0xec}, 256, 1, 0x1000, 0},
> +	{"NAND 2MiB 3,3V 8-bit",	{0, 0xea}, 256, 2, 0x1000, 0},
> +	{"NAND 4MiB 3,3V 8-bit",	{0, 0xd5}, 512, 4, 0x2000, 0},
> +	{"NAND 4MiB 3,3V 8-bit",	{0, 0xe3}, 512, 4, 0x2000, 0},
> +	{"NAND 4MiB 3,3V 8-bit",	{0, 0xe5}, 512, 4, 0x2000, 0},
> +	{"NAND 8MiB 3,3V 8-bit",	{0, 0xd6}, 512, 8, 0x2000, 0},
> +
> +	{"NAND 8MiB 1,8V 8-bit",	{0, 0x39}, 512, 8, 0x2000, 0},
> +	{"NAND 8MiB 3,3V 8-bit",	{0, 0xe6}, 512, 8, 0x2000, 0},
> +	{"NAND 8MiB 1,8V 16-bit",	{0, 0x49}, 512, 8, 0x2000, NAND_BUSWIDTH_16=
},
> +	{"NAND 8MiB 3,3V 16-bit",	{0, 0x59}, 512, 8, 0x2000, NAND_BUSWIDTH_16=
},
>  #endif
> =20
> -	{"NAND 16MiB 1,8V 8-bit",	0x33, 512, 16, 0x4000, 0},
> -	{"NAND 16MiB 3,3V 8-bit",	0x73, 512, 16, 0x4000, 0},
> -	{"NAND 16MiB 1,8V 16-bit",	0x43, 512, 16, 0x4000, NAND_BUSWIDTH_16},
> -	{"NAND 16MiB 3,3V 16-bit",	0x53, 512, 16, 0x4000, NAND_BUSWIDTH_16},
> +	{"NAND 16MiB 1,8V 8-bit",	{0, 0x33}, 512, 16, 0x4000, 0},
> +	{"NAND 16MiB 3,3V 8-bit",	{0, 0x73}, 512, 16, 0x4000, 0},
> +	{"NAND 16MiB 1,8V 16-bit",	{0, 0x43}, 512, 16, 0x4000, NAND_BUSWIDTH_=
16},
> +	{"NAND 16MiB 3,3V 16-bit",	{0, 0x53}, 512, 16, 0x4000, NAND_BUSWIDTH_=
16},
> =20
> -	{"NAND 32MiB 1,8V 8-bit",	0x35, 512, 32, 0x4000, 0},
> -	{"NAND 32MiB 3,3V 8-bit",	0x75, 512, 32, 0x4000, 0},
> -	{"NAND 32MiB 1,8V 16-bit",	0x45, 512, 32, 0x4000, NAND_BUSWIDTH_16},
> -	{"NAND 32MiB 3,3V 16-bit",	0x55, 512, 32, 0x4000, NAND_BUSWIDTH_16},
> +	{"NAND 32MiB 1,8V 8-bit",	{0, 0x35}, 512, 32, 0x4000, 0},
> +	{"NAND 32MiB 3,3V 8-bit",	{0, 0x75}, 512, 32, 0x4000, 0},
> +	{"NAND 32MiB 1,8V 16-bit",	{0, 0x45}, 512, 32, 0x4000, NAND_BUSWIDTH_=
16},
> +	{"NAND 32MiB 3,3V 16-bit",	{0, 0x55}, 512, 32, 0x4000, NAND_BUSWIDTH_=
16},
> =20
> -	{"NAND 64MiB 1,8V 8-bit",	0x36, 512, 64, 0x4000, 0},
> -	{"NAND 64MiB 3,3V 8-bit",	0x76, 512, 64, 0x4000, 0},
> -	{"NAND 64MiB 1,8V 16-bit",	0x46, 512, 64, 0x4000, NAND_BUSWIDTH_16},
> -	{"NAND 64MiB 3,3V 16-bit",	0x56, 512, 64, 0x4000, NAND_BUSWIDTH_16},
> +	{"NAND 64MiB 1,8V 8-bit",	{0, 0x36}, 512, 64, 0x4000, 0},
> +	{"NAND 64MiB 3,3V 8-bit",	{0, 0x76}, 512, 64, 0x4000, 0},
> +	{"NAND 64MiB 1,8V 16-bit",	{0, 0x46}, 512, 64, 0x4000, NAND_BUSWIDTH_=
16},
> +	{"NAND 64MiB 3,3V 16-bit",	{0, 0x56}, 512, 64, 0x4000, NAND_BUSWIDTH_=
16},
> =20
> -	{"NAND 128MiB 1,8V 8-bit",	0x78, 512, 128, 0x4000, 0},
> -	{"NAND 128MiB 1,8V 8-bit",	0x39, 512, 128, 0x4000, 0},
> -	{"NAND 128MiB 3,3V 8-bit",	0x79, 512, 128, 0x4000, 0},
> -	{"NAND 128MiB 1,8V 16-bit",	0x72, 512, 128, 0x4000, NAND_BUSWIDTH_16}=
,
> -	{"NAND 128MiB 1,8V 16-bit",	0x49, 512, 128, 0x4000, NAND_BUSWIDTH_16}=
,
> -	{"NAND 128MiB 3,3V 16-bit",	0x74, 512, 128, 0x4000, NAND_BUSWIDTH_16}=
,
> -	{"NAND 128MiB 3,3V 16-bit",	0x59, 512, 128, 0x4000, NAND_BUSWIDTH_16}=
,
> +	{"NAND 128MiB 1,8V 8-bit",	{0, 0x78}, 512, 128, 0x4000, 0},
> +	{"NAND 128MiB 1,8V 8-bit",	{0, 0x39}, 512, 128, 0x4000, 0},
> +	{"NAND 128MiB 3,3V 8-bit",	{0, 0x79}, 512, 128, 0x4000, 0},
> +	{"NAND 128MiB 1,8V 16-bit",	{0, 0x72}, 512, 128, 0x4000, NAND_BUSWIDT=
H_16},
> +	{"NAND 128MiB 1,8V 16-bit",	{0, 0x49}, 512, 128, 0x4000, NAND_BUSWIDT=
H_16},
> +	{"NAND 128MiB 3,3V 16-bit",	{0, 0x74}, 512, 128, 0x4000, NAND_BUSWIDT=
H_16},
> +	{"NAND 128MiB 3,3V 16-bit",	{0, 0x59}, 512, 128, 0x4000, NAND_BUSWIDT=
H_16},
> =20
> -	{"NAND 256MiB 3,3V 8-bit",	0x71, 512, 256, 0x4000, 0},
> +	{"NAND 256MiB 3,3V 8-bit",	{0, 0x71}, 512, 256, 0x4000, 0},
> =20
>  	/*
>  	 * These are the new chips with large page size. The pagesize and the
> @@ -74,77 +76,77 @@ struct nand_flash_dev nand_flash_ids[] =3D {
>  #define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
> =20
>  	/* 512 Megabit */
> -	{"NAND 64MiB 1,8V 8-bit",	0xA2, 0,  64, 0, LP_OPTIONS},
> -	{"NAND 64MiB 1,8V 8-bit",	0xA0, 0,  64, 0, LP_OPTIONS},
> -	{"NAND 64MiB 3,3V 8-bit",	0xF2, 0,  64, 0, LP_OPTIONS},
> -	{"NAND 64MiB 3,3V 8-bit",	0xD0, 0,  64, 0, LP_OPTIONS},
> -	{"NAND 64MiB 3,3V 8-bit",	0xF0, 0,  64, 0, LP_OPTIONS},
> -	{"NAND 64MiB 1,8V 16-bit",	0xB2, 0,  64, 0, LP_OPTIONS16},
> -	{"NAND 64MiB 1,8V 16-bit",	0xB0, 0,  64, 0, LP_OPTIONS16},
> -	{"NAND 64MiB 3,3V 16-bit",	0xC2, 0,  64, 0, LP_OPTIONS16},
> -	{"NAND 64MiB 3,3V 16-bit",	0xC0, 0,  64, 0, LP_OPTIONS16},
> +	{"NAND 64MiB 1,8V 8-bit",	{0, 0xA2}, 0,  64, 0, LP_OPTIONS},
> +	{"NAND 64MiB 1,8V 8-bit",	{0, 0xA0}, 0,  64, 0, LP_OPTIONS},
> +	{"NAND 64MiB 3,3V 8-bit",	{0, 0xF2}, 0,  64, 0, LP_OPTIONS},
> +	{"NAND 64MiB 3,3V 8-bit",	{0, 0xD0}, 0,  64, 0, LP_OPTIONS},
> +	{"NAND 64MiB 3,3V 8-bit",	{0, 0xF0}, 0,  64, 0, LP_OPTIONS},
> +	{"NAND 64MiB 1,8V 16-bit",	{0, 0xB2}, 0,  64, 0, LP_OPTIONS16},
> +	{"NAND 64MiB 1,8V 16-bit",	{0, 0xB0}, 0,  64, 0, LP_OPTIONS16},
> +	{"NAND 64MiB 3,3V 16-bit",	{0, 0xC2}, 0,  64, 0, LP_OPTIONS16},
> +	{"NAND 64MiB 3,3V 16-bit",	{0, 0xC0}, 0,  64, 0, LP_OPTIONS16},
> =20
>  	/* 1 Gigabit */
> -	{"NAND 128MiB 1,8V 8-bit",	0xA1, 0, 128, 0, LP_OPTIONS},
> -	{"NAND 128MiB 3,3V 8-bit",	0xF1, 0, 128, 0, LP_OPTIONS},
> -	{"NAND 128MiB 3,3V 8-bit",	0xD1, 0, 128, 0, LP_OPTIONS},
> -	{"NAND 128MiB 1,8V 16-bit",	0xB1, 0, 128, 0, LP_OPTIONS16},
> -	{"NAND 128MiB 3,3V 16-bit",	0xC1, 0, 128, 0, LP_OPTIONS16},
> -	{"NAND 128MiB 1,8V 16-bit",     0xAD, 0, 128, 0, LP_OPTIONS16},
> +	{"NAND 128MiB 1,8V 8-bit",	{0, 0xA1}, 0, 128, 0, LP_OPTIONS},
> +	{"NAND 128MiB 3,3V 8-bit",	{0, 0xF1}, 0, 128, 0, LP_OPTIONS},
> +	{"NAND 128MiB 3,3V 8-bit",	{0, 0xD1}, 0, 128, 0, LP_OPTIONS},
> +	{"NAND 128MiB 1,8V 16-bit",	{0, 0xB1}, 0, 128, 0, LP_OPTIONS16},
> +	{"NAND 128MiB 3,3V 16-bit",	{0, 0xC1}, 0, 128, 0, LP_OPTIONS16},
> +	{"NAND 128MiB 1,8V 16-bit",     {0, 0xAD}, 0, 128, 0, LP_OPTIONS16},
> =20
>  	/* 2 Gigabit */
> -	{"NAND 256MiB 1,8V 8-bit",	0xAA, 0, 256, 0, LP_OPTIONS},
> -	{"NAND 256MiB 3,3V 8-bit",	0xDA, 0, 256, 0, LP_OPTIONS},
> -	{"NAND 256MiB 1,8V 16-bit",	0xBA, 0, 256, 0, LP_OPTIONS16},
> -	{"NAND 256MiB 3,3V 16-bit",	0xCA, 0, 256, 0, LP_OPTIONS16},
> +	{"NAND 256MiB 1,8V 8-bit",	{0, 0xAA}, 0, 256, 0, LP_OPTIONS},
> +	{"NAND 256MiB 3,3V 8-bit",	{0, 0xDA}, 0, 256, 0, LP_OPTIONS},
> +	{"NAND 256MiB 1,8V 16-bit",	{0, 0xBA}, 0, 256, 0, LP_OPTIONS16},
> +	{"NAND 256MiB 3,3V 16-bit",	{0, 0xCA}, 0, 256, 0, LP_OPTIONS16},
> =20
>  	/* 4 Gigabit */
> -	{"NAND 512MiB 1,8V 8-bit",	0xAC, 0, 512, 0, LP_OPTIONS},
> -	{"NAND 512MiB 3,3V 8-bit",	0xDC, 0, 512, 0, LP_OPTIONS},
> -	{"NAND 512MiB 1,8V 16-bit",	0xBC, 0, 512, 0, LP_OPTIONS16},
> -	{"NAND 512MiB 3,3V 16-bit",	0xCC, 0, 512, 0, LP_OPTIONS16},
> +	{"NAND 512MiB 1,8V 8-bit",	{0, 0xAC}, 0, 512, 0, LP_OPTIONS},
> +	{"NAND 512MiB 3,3V 8-bit",	{0, 0xDC}, 0, 512, 0, LP_OPTIONS},
> +	{"NAND 512MiB 1,8V 16-bit",	{0, 0xBC}, 0, 512, 0, LP_OPTIONS16},
> +	{"NAND 512MiB 3,3V 16-bit",	{0, 0xCC}, 0, 512, 0, LP_OPTIONS16},
> =20
>  	/* 8 Gigabit */
> -	{"NAND 1GiB 1,8V 8-bit",	0xA3, 0, 1024, 0, LP_OPTIONS},
> -	{"NAND 1GiB 3,3V 8-bit",	0xD3, 0, 1024, 0, LP_OPTIONS},
> -	{"NAND 1GiB 1,8V 16-bit",	0xB3, 0, 1024, 0, LP_OPTIONS16},
> -	{"NAND 1GiB 3,3V 16-bit",	0xC3, 0, 1024, 0, LP_OPTIONS16},
> +	{"NAND 1GiB 1,8V 8-bit",	{0, 0xA3}, 0, 1024, 0, LP_OPTIONS},
> +	{"NAND 1GiB 3,3V 8-bit",	{0, 0xD3}, 0, 1024, 0, LP_OPTIONS},
> +	{"NAND 1GiB 1,8V 16-bit",	{0, 0xB3}, 0, 1024, 0, LP_OPTIONS16},
> +	{"NAND 1GiB 3,3V 16-bit",	{0, 0xC3}, 0, 1024, 0, LP_OPTIONS16},
> =20
>  	/* 16 Gigabit */
> -	{"NAND 2GiB 1,8V 8-bit",	0xA5, 0, 2048, 0, LP_OPTIONS},
> -	{"NAND 2GiB 3,3V 8-bit",	0xD5, 0, 2048, 0, LP_OPTIONS},
> -	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
> -	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
> +	{"NAND 2GiB 1,8V 8-bit",	{0, 0xA5}, 0, 2048, 0, LP_OPTIONS},
> +	{"NAND 2GiB 3,3V 8-bit",	{0, 0xD5}, 0, 2048, 0, LP_OPTIONS},
> +	{"NAND 2GiB 1,8V 16-bit",	{0, 0xB5}, 0, 2048, 0, LP_OPTIONS16},
> +	{"NAND 2GiB 3,3V 16-bit",	{0, 0xC5}, 0, 2048, 0, LP_OPTIONS16},
> =20
>  	/* 32 Gigabit */
> -	{"NAND 4GiB 1,8V 8-bit",	0xA7, 0, 4096, 0, LP_OPTIONS},
> -	{"NAND 4GiB 3,3V 8-bit",	0xD7, 0, 4096, 0, LP_OPTIONS},
> -	{"NAND 4GiB 1,8V 16-bit",	0xB7, 0, 4096, 0, LP_OPTIONS16},
> -	{"NAND 4GiB 3,3V 16-bit",	0xC7, 0, 4096, 0, LP_OPTIONS16},
> +	{"NAND 4GiB 1,8V 8-bit",	{0, 0xA7}, 0, 4096, 0, LP_OPTIONS},
> +	{"NAND 4GiB 3,3V 8-bit",	{0, 0xD7}, 0, 4096, 0, LP_OPTIONS},
> +	{"NAND 4GiB 1,8V 16-bit",	{0, 0xB7}, 0, 4096, 0, LP_OPTIONS16},
> +	{"NAND 4GiB 3,3V 16-bit",	{0, 0xC7}, 0, 4096, 0, LP_OPTIONS16},
> =20
>  	/* 64 Gigabit */
> -	{"NAND 8GiB 1,8V 8-bit",	0xAE, 0, 8192, 0, LP_OPTIONS},
> -	{"NAND 8GiB 3,3V 8-bit",	0xDE, 0, 8192, 0, LP_OPTIONS},
> -	{"NAND 8GiB 1,8V 16-bit",	0xBE, 0, 8192, 0, LP_OPTIONS16},
> -	{"NAND 8GiB 3,3V 16-bit",	0xCE, 0, 8192, 0, LP_OPTIONS16},
> +	{"NAND 8GiB 1,8V 8-bit",	{0, 0xAE}, 0, 8192, 0, LP_OPTIONS},
> +	{"NAND 8GiB 3,3V 8-bit",	{0, 0xDE}, 0, 8192, 0, LP_OPTIONS},
> +	{"NAND 8GiB 1,8V 16-bit",	{0, 0xBE}, 0, 8192, 0, LP_OPTIONS16},
> +	{"NAND 8GiB 3,3V 16-bit",	{0, 0xCE}, 0, 8192, 0, LP_OPTIONS16},
> =20
>  	/* 128 Gigabit */
> -	{"NAND 16GiB 1,8V 8-bit",	0x1A, 0, 16384, 0, LP_OPTIONS},
> -	{"NAND 16GiB 3,3V 8-bit",	0x3A, 0, 16384, 0, LP_OPTIONS},
> -	{"NAND 16GiB 1,8V 16-bit",	0x2A, 0, 16384, 0, LP_OPTIONS16},
> -	{"NAND 16GiB 3,3V 16-bit",	0x4A, 0, 16384, 0, LP_OPTIONS16},
> +	{"NAND 16GiB 1,8V 8-bit",	{0, 0x1A}, 0, 16384, 0, LP_OPTIONS},
> +	{"NAND 16GiB 3,3V 8-bit",	{0, 0x3A}, 0, 16384, 0, LP_OPTIONS},
> +	{"NAND 16GiB 1,8V 16-bit",	{0, 0x2A}, 0, 16384, 0, LP_OPTIONS16},
> +	{"NAND 16GiB 3,3V 16-bit",	{0, 0x4A}, 0, 16384, 0, LP_OPTIONS16},
> =20
>  	/* 256 Gigabit */
> -	{"NAND 32GiB 1,8V 8-bit",	0x1C, 0, 32768, 0, LP_OPTIONS},
> -	{"NAND 32GiB 3,3V 8-bit",	0x3C, 0, 32768, 0, LP_OPTIONS},
> -	{"NAND 32GiB 1,8V 16-bit",	0x2C, 0, 32768, 0, LP_OPTIONS16},
> -	{"NAND 32GiB 3,3V 16-bit",	0x4C, 0, 32768, 0, LP_OPTIONS16},
> +	{"NAND 32GiB 1,8V 8-bit",	{0, 0x1C}, 0, 32768, 0, LP_OPTIONS},
> +	{"NAND 32GiB 3,3V 8-bit",	{0, 0x3C}, 0, 32768, 0, LP_OPTIONS},
> +	{"NAND 32GiB 1,8V 16-bit",	{0, 0x2C}, 0, 32768, 0, LP_OPTIONS16},
> +	{"NAND 32GiB 3,3V 16-bit",	{0, 0x4C}, 0, 32768, 0, LP_OPTIONS16},
> =20
>  	/* 512 Gigabit */
> -	{"NAND 64GiB 1,8V 8-bit",	0x1E, 0, 65536, 0, LP_OPTIONS},
> -	{"NAND 64GiB 3,3V 8-bit",	0x3E, 0, 65536, 0, LP_OPTIONS},
> -	{"NAND 64GiB 1,8V 16-bit",	0x2E, 0, 65536, 0, LP_OPTIONS16},
> -	{"NAND 64GiB 3,3V 16-bit",	0x4E, 0, 65536, 0, LP_OPTIONS16},
> +	{"NAND 64GiB 1,8V 8-bit",	{0, 0x1E}, 0, 65536, 0, LP_OPTIONS},
> +	{"NAND 64GiB 3,3V 8-bit",	{0, 0x3E}, 0, 65536, 0, LP_OPTIONS},
> +	{"NAND 64GiB 1,8V 16-bit",	{0, 0x2E}, 0, 65536, 0, LP_OPTIONS16},
> +	{"NAND 64GiB 3,3V 16-bit",	{0, 0x4E}, 0, 65536, 0, LP_OPTIONS16},
> =20
>  	/*
>  	 * Renesas AND 1 Gigabit. Those chips do not support extended id and
> @@ -156,7 +158,7 @@ struct nand_flash_dev nand_flash_ids[] =3D {
>  	 * erased in one go There are more speed improvements for reads and
>  	 * writes possible, but not implemented now
>  	 */
> -	{"AND 128MiB 3,3V 8-bit",	0x01, 2048, 128, 0x4000,
> +	{"AND 128MiB 3,3V 8-bit",	{0, 0x01}, 2048, 128, 0x4000,
>  	 NAND_IS_AND | NAND_4PAGE_ARRAY | BBT_AUTO_REFRESH},
> =20
>  	{NULL,}
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index 4c31798..d6120a4 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -770,7 +770,7 @@ static int init_nandsim(struct mtd_info *mtd)
> =20
>  	/* Detect how many ID bytes the NAND chip outputs */
>          for (i =3D 0; nand_flash_ids[i].name !=3D NULL; i++) {
> -                if (second_id_byte !=3D nand_flash_ids[i].id)
> +                if (second_id_byte !=3D nand_flash_ids[i].id[1])
>                          continue;
>  	}
> =20
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_n=
and.c
> index 37ee75c..78a8fd1 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -989,7 +989,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
>  	}
> =20
>  	pxa3xx_flash_ids[0].name =3D f->name;
> -	pxa3xx_flash_ids[0].id =3D (f->chip_id >> 8) & 0xffff;
> +	pxa3xx_flash_ids[0].id[1] =3D (f->chip_id >> 8) & 0xffff;
>  	pxa3xx_flash_ids[0].pagesize =3D f->page_size;
>  	chipsize =3D (uint64_t)f->num_blocks * f->page_per_block * f->page_si=
ze;
>  	pxa3xx_flash_ids[0].chipsize =3D chipsize >> 20;
> diff --git a/drivers/mtd/nand/sm_common.c b/drivers/mtd/nand/sm_common.=
c
> index 082bcdc..bd5cc43 100644
> --- a/drivers/mtd/nand/sm_common.c
> +++ b/drivers/mtd/nand/sm_common.c
> @@ -69,41 +69,40 @@ static int sm_block_markbad(struct mtd_info *mtd, l=
off_t ofs)
> =20
> =20
>  static struct nand_flash_dev nand_smartmedia_flash_ids[] =3D {
> -	{"SmartMedia 1MiB 5V",          0x6e, 256, 1, 0x1000, 0},
> -	{"SmartMedia 1MiB 3,3V",        0xe8, 256, 1, 0x1000, 0},
> -	{"SmartMedia 1MiB 3,3V",        0xec, 256, 1, 0x1000, 0},
> -	{"SmartMedia 2MiB 3,3V",        0xea, 256, 2, 0x1000, 0},
> -	{"SmartMedia 2MiB 5V",          0x64, 256, 2, 0x1000, 0},
> -	{"SmartMedia 2MiB 3,3V ROM",    0x5d, 512, 2, 0x2000, NAND_ROM},
> -	{"SmartMedia 4MiB 3,3V",        0xe3, 512, 4, 0x2000, 0},
> -	{"SmartMedia 4MiB 3,3/5V",      0xe5, 512, 4, 0x2000, 0},
> -	{"SmartMedia 4MiB 5V",          0x6b, 512, 4, 0x2000, 0},
> -	{"SmartMedia 4MiB 3,3V ROM",    0xd5, 512, 4, 0x2000, NAND_ROM},
> -	{"SmartMedia 8MiB 3,3V",        0xe6, 512, 8, 0x2000, 0},
> -	{"SmartMedia 8MiB 3,3V ROM",    0xd6, 512, 8, 0x2000, NAND_ROM},
> -	{"SmartMedia 16MiB 3,3V",       0x73, 512, 16, 0x4000, 0},
> -	{"SmartMedia 16MiB 3,3V ROM",   0x57, 512, 16, 0x4000, NAND_ROM},
> -	{"SmartMedia 32MiB 3,3V",       0x75, 512, 32, 0x4000, 0},
> -	{"SmartMedia 32MiB 3,3V ROM",   0x58, 512, 32, 0x4000, NAND_ROM},
> -	{"SmartMedia 64MiB 3,3V",       0x76, 512, 64, 0x4000, 0},
> -	{"SmartMedia 64MiB 3,3V ROM",   0xd9, 512, 64, 0x4000, NAND_ROM},
> -	{"SmartMedia 128MiB 3,3V",      0x79, 512, 128, 0x4000, 0},
> -	{"SmartMedia 128MiB 3,3V ROM",  0xda, 512, 128, 0x4000, NAND_ROM},
> -	{"SmartMedia 256MiB 3,3V",      0x71, 512, 256, 0x4000 },
> -	{"SmartMedia 256MiB 3,3V ROM",  0x5b, 512, 256, 0x4000, NAND_ROM},
> +	{"SmartMedia 1MiB 5V",          {0, 0x6e}, 256, 1, 0x1000, 0},
> +	{"SmartMedia 1MiB 3,3V",        {0, 0xe8}, 256, 1, 0x1000, 0},
> +	{"SmartMedia 1MiB 3,3V",        {0, 0xec}, 256, 1, 0x1000, 0},
> +	{"SmartMedia 2MiB 3,3V",        {0, 0xea}, 256, 2, 0x1000, 0},
> +	{"SmartMedia 2MiB 5V",          {0, 0x64}, 256, 2, 0x1000, 0},
> +	{"SmartMedia 2MiB 3,3V ROM",    {0, 0x5d}, 512, 2, 0x2000, NAND_ROM},
> +	{"SmartMedia 4MiB 3,3V",        {0, 0xe3}, 512, 4, 0x2000, 0},
> +	{"SmartMedia 4MiB 3,3/5V",      {0, 0xe5}, 512, 4, 0x2000, 0},
> +	{"SmartMedia 4MiB 5V",          {0, 0x6b}, 512, 4, 0x2000, 0},
> +	{"SmartMedia 4MiB 3,3V ROM",    {0, 0xd5}, 512, 4, 0x2000, NAND_ROM},
> +	{"SmartMedia 8MiB 3,3V",        {0, 0xe6}, 512, 8, 0x2000, 0},
> +	{"SmartMedia 8MiB 3,3V ROM",    {0, 0xd6}, 512, 8, 0x2000, NAND_ROM},
> +	{"SmartMedia 16MiB 3,3V",       {0, 0x73}, 512, 16, 0x4000, 0},
> +	{"SmartMedia 16MiB 3,3V ROM",   {0, 0x57}, 512, 16, 0x4000, NAND_ROM}=
,
> +	{"SmartMedia 32MiB 3,3V",       {0, 0x75}, 512, 32, 0x4000, 0},
> +	{"SmartMedia 32MiB 3,3V ROM",   {0, 0x58}, 512, 32, 0x4000, NAND_ROM}=
,
> +	{"SmartMedia 64MiB 3,3V",       {0, 0x76}, 512, 64, 0x4000, 0},
> +	{"SmartMedia 64MiB 3,3V ROM",   {0, 0xd9}, 512, 64, 0x4000, NAND_ROM}=
,
> +	{"SmartMedia 128MiB 3,3V",      {0, 0x79}, 512, 128, 0x4000, 0},
> +	{"SmartMedia 128MiB 3,3V ROM",  {0, 0xda}, 512, 128, 0x4000, NAND_ROM=
},
> +	{"SmartMedia 256MiB 3,3V",      {0, 0x71}, 512, 256, 0x4000 },
> +	{"SmartMedia 256MiB 3,3V ROM",  {0, 0x5b}, 512, 256, 0x4000, NAND_ROM=
},
>  	{NULL,}
>  };
> =20
>  static struct nand_flash_dev nand_xd_flash_ids[] =3D {
> -
> -	{"xD 16MiB 3,3V",    0x73, 512, 16, 0x4000, 0},
> -	{"xD 32MiB 3,3V",    0x75, 512, 32, 0x4000, 0},
> -	{"xD 64MiB 3,3V",    0x76, 512, 64, 0x4000, 0},
> -	{"xD 128MiB 3,3V",   0x79, 512, 128, 0x4000, 0},
> -	{"xD 256MiB 3,3V",   0x71, 512, 256, 0x4000, NAND_BROKEN_XD},
> -	{"xD 512MiB 3,3V",   0xdc, 512, 512, 0x4000, NAND_BROKEN_XD},
> -	{"xD 1GiB 3,3V",     0xd3, 512, 1024, 0x4000, NAND_BROKEN_XD},
> -	{"xD 2GiB 3,3V",     0xd5, 512, 2048, 0x4000, NAND_BROKEN_XD},
> +	{"xD 16MiB 3,3V",    {0, 0x73}, 512, 16, 0x4000, 0},
> +	{"xD 32MiB 3,3V",    {0, 0x75}, 512, 32, 0x4000, 0},
> +	{"xD 64MiB 3,3V",    {0, 0x76}, 512, 64, 0x4000, 0},
> +	{"xD 128MiB 3,3V",   {0, 0x79}, 512, 128, 0x4000, 0},
> +	{"xD 256MiB 3,3V",   {0, 0x71}, 512, 256, 0x4000, NAND_BROKEN_XD},
> +	{"xD 512MiB 3,3V",   {0, 0xdc}, 512, 512, 0x4000, NAND_BROKEN_XD},
> +	{"xD 1GiB 3,3V",     {0, 0xd3}, 512, 1024, 0x4000, NAND_BROKEN_XD},
> +	{"xD 2GiB 3,3V",     {0, 0xd5}, 512, 2048, 0x4000, NAND_BROKEN_XD},
>  	{NULL,}
>  };
> =20
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 7ccb3c5..5293447 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -585,7 +585,7 @@ struct nand_chip {
>  /**
>   * struct nand_flash_dev - NAND Flash Device ID Structure
>   * @name:	Identify the device type
> - * @id:		device ID code
> + * @id:		ID data
>   * @pagesize:	Pagesize in bytes. Either 256 or 512 or 0
>   *		If the pagesize is 0, then the real pagesize
>   *		and the eraseize are determined from the
> @@ -593,14 +593,20 @@ struct nand_chip {
>   * @erasesize:	Size of an erase block in the flash device.
>   * @chipsize:	Total chipsize in Mega Bytes
>   * @options:	Bitfield to store chip relevant options
> + * @id_len:	The valid length of the id data.
> + * @oobsize:	OOB size
> + * @ecc_len:	The required ECC length.
>   */
>  struct nand_flash_dev {
>  	char *name;
> -	int id;
> +	u8 id[8];
>  	unsigned long pagesize;
>  	unsigned long chipsize;
>  	unsigned long erasesize;
>  	unsigned long options;
> +	unsigned int id_len;
> +	unsigned long oobsize;
> +	unsigned long ecc_len;
I think it's better to submit another patch set to solve the ECC problem.

Huang Shijie


>  };
> =20
>  /**
