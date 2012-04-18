Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKPl1-0007zJ-IA
 for linux-mtd@lists.infradead.org; Wed, 18 Apr 2012 07:57:00 +0000
Received: by lagy4 with SMTP id y4so6245344lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Apr 2012 00:56:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
References: <1334615755-15418-1-git-send-email-computersforpeace@gmail.com>
 <1334615755-15418-2-git-send-email-computersforpeace@gmail.com>
Date: Wed, 18 Apr 2012 09:56:50 +0200
Message-ID: <CABYn4syA53-ce6ZVXEj9AmS-_xne_0vAcAqJWiS7meKQ5YZ7vQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add OOB argument to NAND {read,
 write}_page interfaces
From: Bastian Hecht <hechtb@googlemail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Viresh Kumar <viresh.kumar@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, Vipin Kumar <vipin.kumar@st.com>,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 Mike Dunn <mikedunn@newsguy.com>, Bastian Hecht <hechtb@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>, Liu Shuo <b35362@freescale.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian,

I'm currently working on the hardware ECC part of the SH Mobile flctl
and I like the patchset as it makes things more explicit when OOB data
is requested or not and such things. It's cleaner and better, thanks!

Best regards,

 Bastian Hecht


2012/4/17 Brian Norris <computersforpeace@gmail.com>:
> New NAND controllers can perform read/write via HW engines which don't ex=
pose
> OOB data in their DMA mode. To reflect this, we should rework the nand_ch=
ip /
> nand_ecc_ctrl interfaces that assume that drivers will always read/write =
OOB
> data in the nand_chip.oob_poi buffer. A better interface would pass the
> appropriate buffer explicitly when OOB data is requested and otherwise pa=
ss a
> NULL pointer, meaning that no OOB data is needed.
>
> This patch adds the 'oob' parameter to each relevant {read,write}_page
> interface; all 'oob' parameters are left unused and NULL for now. The nex=
t
> patch will set the parameter properly. Perhaps it should be utilized even=
tually
> on some of these drivers, but this is a slow process of hacking each driv=
er
> function that uses these interfaces.
>
> I renamed many 'oob' buffers to 'oobbuf' so that we can use 'oob' as an
> argument to these interface functions. I think the consistency can help i=
n the
> long run.
>
> Note: I couldn't compile-test all of these easily, as some had ARCH
> dependencies.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> =A0drivers/mtd/nand/atmel_nand.c =A0 =A0 =A0 =A0 =A0| =A0 =A07 ++-
> =A0drivers/mtd/nand/bcm_umi_bch.c =A0 =A0 =A0 =A0 | =A0 10 ++-
> =A0drivers/mtd/nand/bcm_umi_nand.c =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0drivers/mtd/nand/bf5xx_nand.c =A0 =A0 =A0 =A0 =A0| =A0 =A04 +-
> =A0drivers/mtd/nand/cafe_nand.c =A0 =A0 =A0 =A0 =A0 | =A0 26 ++++---
> =A0drivers/mtd/nand/denali.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A08 +-
> =A0drivers/mtd/nand/docg4.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 12 ++--
> =A0drivers/mtd/nand/fsl_elbc_nand.c =A0 =A0 =A0 | =A0 =A07 +-
> =A0drivers/mtd/nand/fsl_ifc_nand.c =A0 =A0 =A0 =A0| =A0 =A04 +-
> =A0drivers/mtd/nand/fsmc_nand.c =A0 =A0 =A0 =A0 =A0 | =A0 =A03 +-
> =A0drivers/mtd/nand/gpmi-nand/gpmi-nand.c | =A0 =A05 +-
> =A0drivers/mtd/nand/nand_base.c =A0 =A0 =A0 =A0 =A0 | =A0123 ++++++++++++=
++++++--------------
> =A0drivers/mtd/nand/pxa3xx_nand.c =A0 =A0 =A0 =A0 | =A0 =A04 +-
> =A0drivers/mtd/nand/sh_flctl.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A04 +-
> =A0include/linux/mtd/nand.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 11 ++--
> =A015 files changed, 127 insertions(+), 103 deletions(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.=
c
> index 2165576..95838a6 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -324,18 +324,21 @@ static int atmel_nand_calculate(struct mtd_info *mt=
d,
> =A0* mtd: =A0 =A0 =A0 =A0mtd info structure
> =A0* chip: =A0 =A0 =A0 nand chip info structure
> =A0* buf: =A0 =A0 =A0 =A0buffer to store read data
> + * oob: =A0 =A0 =A0 =A0buffer to store read OOB data
> =A0*/
> =A0static int atmel_nand_read_page(struct mtd_info *mtd,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nand_chip *chip, uint8_t *buf, int p=
age)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nand_chip *chip, uint8_t *buf, uint8=
_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0int eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> =A0 =A0 =A0 =A0uint32_t *eccpos =3D chip->ecc.layout->eccpos;
> =A0 =A0 =A0 =A0uint8_t *p =3D buf;
> - =A0 =A0 =A0 uint8_t *oob =3D chip->oob_poi;
> =A0 =A0 =A0 =A0uint8_t *ecc_pos;
> =A0 =A0 =A0 =A0int stat;
>
> + =A0 =A0 =A0 if (!oob)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob =3D chip->oob_poi;
> +
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * Errata: ALE is incorrectly wired up to the ECC controll=
er
> =A0 =A0 =A0 =A0 * on the AP7000, so it will include the address cycles in=
 the
> diff --git a/drivers/mtd/nand/bcm_umi_bch.c b/drivers/mtd/nand/bcm_umi_bc=
h.c
> index a930666..3f4e845 100644
> --- a/drivers/mtd/nand/bcm_umi_bch.c
> +++ b/drivers/mtd/nand/bcm_umi_bch.c
> @@ -22,9 +22,9 @@
>
> =A0/* ---- Private Function Prototypes ----------------------------------=
---- */
> =A0static int bcm_umi_bch_read_page_hwecc(struct mtd_info *mtd,
> - =A0 =A0 =A0 struct nand_chip *chip, uint8_t *buf, int page);
> + =A0 =A0 =A0 struct nand_chip *chip, uint8_t *buf, uint8_t *oob, int pag=
e);
> =A0static void bcm_umi_bch_write_page_hwecc(struct mtd_info *mtd,
> - =A0 =A0 =A0 struct nand_chip *chip, const uint8_t *buf);
> + =A0 =A0 =A0 struct nand_chip *chip, const uint8_t *buf, const uint8_t *=
oob);
>
> =A0/* ---- Private Variables --------------------------------------------=
---- */
>
> @@ -103,11 +103,12 @@ static struct nand_ecclayout nand_hw_eccoob_4096 =
=3D {
> =A0* =A0@mtd: =A0 =A0 =A0 mtd info structure
> =A0* =A0@chip: =A0 =A0 =A0nand chip info structure
> =A0* =A0@buf: =A0 =A0 =A0 buffer to store read data
> +* =A0@oob: =A0 =A0 =A0 buffer to store read OOB data
> =A0*
> =A0**********************************************************************=
*****/
> =A0static int bcm_umi_bch_read_page_hwecc(struct mtd_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 struct nand_chip *chip, uint8_t * buf,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0int sectorIdx =3D 0;
> =A0 =A0 =A0 =A0int eccsize =3D chip->ecc.size;
> @@ -188,10 +189,11 @@ static int bcm_umi_bch_read_page_hwecc(struct mtd_i=
nfo *mtd,
> =A0* =A0@mtd: =A0 =A0 =A0 mtd info structure
> =A0* =A0@chip: =A0 =A0 =A0nand chip info structure
> =A0* =A0@buf: =A0 =A0 =A0 data buffer
> +* =A0@oob: =A0 =A0 =A0 OOB buffer
> =A0*
> =A0**********************************************************************=
*****/
> =A0static void bcm_umi_bch_write_page_hwecc(struct mtd_info *mtd,
> - =A0 =A0 =A0 struct nand_chip *chip, const uint8_t *buf)
> + =A0 =A0 =A0 struct nand_chip *chip, const uint8_t *buf, const uint8_t *=
oob)
> =A0{
> =A0 =A0 =A0 =A0int sectorIdx =3D 0;
> =A0 =A0 =A0 =A0int eccsize =3D chip->ecc.size;
> diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_n=
and.c
> index 6908cdd..ac7a027 100644
> --- a/drivers/mtd/nand/bcm_umi_nand.c
> +++ b/drivers/mtd/nand/bcm_umi_nand.c
> @@ -341,7 +341,7 @@ static int bcm_umi_nand_verify_buf(struct mtd_info *m=
td, const u_char * buf,
> =A0 =A0 =A0 =A0 * for MLC parts which may have permanently stuck bits.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0struct nand_chip *chip =3D mtd->priv;
> - =A0 =A0 =A0 int ret =3D chip->ecc.read_page(mtd, chip, readbackbuf, 0);
> + =A0 =A0 =A0 int ret =3D chip->ecc.read_page(mtd, chip, readbackbuf, NUL=
L, 0);
> =A0 =A0 =A0 =A0if (ret < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EFAULT;
> =A0 =A0 =A0 =A0else {
> diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.=
c
> index d7b86b9..d25ab1a 100644
> --- a/drivers/mtd/nand/bf5xx_nand.c
> +++ b/drivers/mtd/nand/bf5xx_nand.c
> @@ -558,7 +558,7 @@ static void bf5xx_nand_dma_write_buf(struct mtd_info =
*mtd,
> =A0}
>
> =A0static int bf5xx_nand_read_page_raw(struct mtd_info *mtd, struct nand_=
chip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0bf5xx_nand_read_buf(mtd, buf, mtd->writesize);
> =A0 =A0 =A0 =A0bf5xx_nand_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> @@ -567,7 +567,7 @@ static int bf5xx_nand_read_page_raw(struct mtd_info *=
mtd, struct nand_chip *chip
> =A0}
>
> =A0static void bf5xx_nand_write_page_raw(struct mtd_info *mtd, struct nan=
d_chip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0bf5xx_nand_write_buf(mtd, buf, mtd->writesize);
> =A0 =A0 =A0 =A0bf5xx_nand_write_buf(mtd, chip->oob_poi, mtd->oobsize);
> diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
> index 2973d97..e4103c5 100644
> --- a/drivers/mtd/nand/cafe_nand.c
> +++ b/drivers/mtd/nand/cafe_nand.c
> @@ -375,12 +375,13 @@ static int cafe_nand_read_oob(struct mtd_info *mtd,=
 struct nand_chip *chip,
> =A0* @mtd: =A0 =A0 =A0 mtd info structure
> =A0* @chip: =A0 =A0 =A0nand chip info structure
> =A0* @buf: =A0 =A0 =A0 buffer to store read data
> + * @oob: =A0 =A0 =A0 buffer to store OOB data
> =A0*
> =A0* The hw generator calculates the error syndrome automatically. Theref=
or
> =A0* we need a special oob layout and handling.
> =A0*/
> =A0static int cafe_nand_read_page(struct mtd_info *mtd, struct nand_chip =
*chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint8_t *buf=
, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint8_t *buf=
, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0struct cafe_priv *cafe =3D mtd->priv;
>
> @@ -394,7 +395,7 @@ static int cafe_nand_read_page(struct mtd_info *mtd, =
struct nand_chip *chip,
> =A0 =A0 =A0 =A0if (checkecc && cafe_readl(cafe, NAND_ECC_RESULT) & (1<<18=
)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned short syn[8], pat[4];
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int pos[4];
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 u8 *oob =3D chip->oob_poi;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u8 *oobbuf =3D chip->oob_poi;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int i, n;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i=3D0; i<8; i+=3D2) {
> @@ -422,14 +423,14 @@ static int cafe_nand_read_page(struct mtd_info *mtd=
, struct nand_chip *chip,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0buf[0] ^=3D pat[i];
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else if (p =3D=3D 1365) =
{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buf[2047] =
^=3D pat[i] >> 4;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob[0] ^=3D=
 pat[i] << 4;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf[0] ^=
=3D pat[i] << 4;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else if (p > 1365) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((p & 1=
) =3D=3D 1) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 oob[3*p/2 - 2048] ^=3D pat[i] >> 4;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 oob[3*p/2 - 2047] ^=3D pat[i] << 4;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 oobbuf[3*p/2 - 2048] ^=3D pat[i] >> 4;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 oobbuf[3*p/2 - 2047] ^=3D pat[i] << 4;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 oob[3*p/2 - 2049] ^=3D pat[i] >> 8;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 oob[3*p/2 - 2048] ^=3D pat[i];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 oobbuf[3*p/2 - 2049] ^=3D pat[i] >> 8;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 oobbuf[3*p/2 - 2048] ^=3D pat[i];
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else if ((p & 1) =3D=3D =
1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buf[3*p/2]=
 ^=3D pat[i] >> 4;
> @@ -518,7 +519,9 @@ static struct nand_bbt_descr cafe_bbt_mirror_descr_51=
2 =3D {
>
>
> =A0static void cafe_nand_write_page_lowlevel(struct mtd_info *mtd,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct nand_chip *chip, const uint8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct nand_chip *chip,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 const uint8_t *buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0struct cafe_priv *cafe =3D mtd->priv;
>
> @@ -530,16 +533,17 @@ static void cafe_nand_write_page_lowlevel(struct mt=
d_info *mtd,
> =A0}
>
> =A0static int cafe_nand_write_page(struct mtd_info *mtd, struct nand_chip=
 *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8=
_t *buf, int page, int cached, int raw)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8=
_t *buf, const uint8_t *oob,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int page, i=
nt cached, int raw)
> =A0{
> =A0 =A0 =A0 =A0int status;
>
> =A0 =A0 =A0 =A0chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
>
> =A0 =A0 =A0 =A0if (unlikely(raw))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page_raw(mtd, chip, buf);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page_raw(mtd, chip, buf, oo=
b);
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page(mtd, chip, buf);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page(mtd, chip, buf, oob);
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * Cached progamming disabled for now, Not sure if its wor=
th the
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index a1048c7..d078470 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1084,7 +1084,7 @@ static void write_page(struct mtd_info *mtd, struct=
 nand_chip *chip,
> =A0* by write_page above.
> =A0* */
> =A0static void denali_write_page(struct mtd_info *mtd, struct nand_chip *=
chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8=
_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8=
_t *buf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0/* for regular page writes, we let HW handle all the ECC
> =A0 =A0 =A0 =A0 * data written to the device. */
> @@ -1096,7 +1096,7 @@ static void denali_write_page(struct mtd_info *mtd,=
 struct nand_chip *chip,
> =A0* write_page() function above.
> =A0*/
> =A0static void denali_write_page_raw(struct mtd_info *mtd, struct nand_ch=
ip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 const uint8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 const uint8_t *buf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0/* for raw page writes, we want to disable ECC and simply =
write
> =A0 =A0 =A0 =A0 =A0 whatever data is in the buffer. */
> @@ -1119,7 +1119,7 @@ static int denali_read_oob(struct mtd_info *mtd, st=
ruct nand_chip *chip,
> =A0}
>
> =A0static int denali_read_page(struct mtd_info *mtd, struct nand_chip *ch=
ip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, int p=
age)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, uint8=
_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0struct denali_nand_info *denali =3D mtd_to_denali(mtd);
>
> @@ -1171,7 +1171,7 @@ static int denali_read_page(struct mtd_info *mtd, s=
truct nand_chip *chip,
> =A0}
>
> =A0static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip=
 *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *bu=
f, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *bu=
f, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0struct denali_nand_info *denali =3D mtd_to_denali(mtd);
>
> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
> index b082026..7ff99c9 100644
> --- a/drivers/mtd/nand/docg4.c
> +++ b/drivers/mtd/nand/docg4.c
> @@ -786,13 +786,13 @@ static int read_page(struct mtd_info *mtd, struct n=
and_chip *nand,
>
>
> =A0static int docg4_read_page_raw(struct mtd_info *mtd, struct nand_chip =
*nand,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint8_t *buf=
, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint8_t *buf=
, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0return read_page(mtd, nand, buf, page, false);
> =A0}
>
> =A0static int docg4_read_page(struct mtd_info *mtd, struct nand_chip *nan=
d,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint8_t *buf, int pa=
ge)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint8_t *buf, uint8_=
t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0return read_page(mtd, nand, buf, page, true);
> =A0}
> @@ -952,13 +952,13 @@ static void write_page(struct mtd_info *mtd, struct=
 nand_chip *nand,
> =A0}
>
> =A0static void docg4_write_page_raw(struct mtd_info *mtd, struct nand_chi=
p *nand,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const ui=
nt8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const ui=
nt8_t *buf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0return write_page(mtd, nand, buf, false);
> =A0}
>
> =A0static void docg4_write_page(struct mtd_info *mtd, struct nand_chip *n=
and,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const uint8_t *b=
uf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const uint8_t *b=
uf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0return write_page(mtd, nand, buf, true);
> =A0}
> @@ -1002,7 +1002,7 @@ static int __init read_factory_bbt(struct mtd_info =
*mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
>
> =A0 =A0 =A0 =A0read_page_prologue(mtd, g4_addr);
> - =A0 =A0 =A0 status =3D docg4_read_page(mtd, nand, buf, DOCG4_FACTORY_BB=
T_PAGE);
> + =A0 =A0 =A0 status =3D docg4_read_page(mtd, nand, buf, NULL, DOCG4_FACT=
ORY_BBT_PAGE);
> =A0 =A0 =A0 =A0if (status)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto exit;
>
> @@ -1079,7 +1079,7 @@ static int docg4_block_markbad(struct mtd_info *mtd=
, loff_t ofs)
>
> =A0 =A0 =A0 =A0/* write first page of block */
> =A0 =A0 =A0 =A0write_page_prologue(mtd, g4_addr);
> - =A0 =A0 =A0 docg4_write_page(mtd, nand, buf);
> + =A0 =A0 =A0 docg4_write_page(mtd, nand, buf, nand->oob_poi);
> =A0 =A0 =A0 =A0ret =3D pageprog(mtd);
> =A0 =A0 =A0 =A0if (!ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->ecc_stats.badblocks++;
> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc=
_nand.c
> index 80b5264..b7d9bfd 100644
> --- a/drivers/mtd/nand/fsl_elbc_nand.c
> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> @@ -740,7 +740,7 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *m=
td)
>
> =A0static int fsl_elbc_read_page(struct mtd_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nand_c=
hip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, u=
int8_t *oob,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int page)
> =A0{
> =A0 =A0 =A0 =A0fsl_elbc_read_buf(mtd, buf, mtd->writesize);
> @@ -755,9 +755,8 @@ static int fsl_elbc_read_page(struct mtd_info *mtd,
> =A0/* ECC will be calculated automatically, and errors will be detected i=
n
> =A0* waitfunc.
> =A0*/
> -static void fsl_elbc_write_page(struct mtd_info *mtd,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct n=
and_chip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const ui=
nt8_t *buf)
> +static void fsl_elbc_write_page(struct mtd_info *mtd, struct nand_chip *=
chip,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8=
_t *buf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0fsl_elbc_write_buf(mtd, buf, mtd->writesize);
> =A0 =A0 =A0 =A0fsl_elbc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_n=
and.c
> index c30ac7b..f8a6e3e 100644
> --- a/drivers/mtd/nand/fsl_ifc_nand.c
> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> @@ -684,7 +684,7 @@ static int fsl_ifc_wait(struct mtd_info *mtd, struct =
nand_chip *chip)
>
> =A0static int fsl_ifc_read_page(struct mtd_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nand_ch=
ip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, i=
nt page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, u=
int8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0struct fsl_ifc_mtd *priv =3D chip->priv;
> =A0 =A0 =A0 =A0struct fsl_ifc_ctrl *ctrl =3D priv->ctrl;
> @@ -706,7 +706,7 @@ static int fsl_ifc_read_page(struct mtd_info *mtd,
> =A0*/
> =A0static void fsl_ifc_write_page(struct mtd_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct nan=
d_chip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8=
_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8=
_t *buf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0fsl_ifc_write_buf(mtd, buf, mtd->writesize);
> =A0 =A0 =A0 =A0fsl_ifc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
> diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
> index 1b8330e..8bb731b 100644
> --- a/drivers/mtd/nand/fsmc_nand.c
> +++ b/drivers/mtd/nand/fsmc_nand.c
> @@ -692,6 +692,7 @@ static void fsmc_write_buf_dma(struct mtd_info *mtd, =
const uint8_t *buf,
> =A0* @mtd: =A0 =A0 =A0 mtd info structure
> =A0* @chip: =A0 =A0 =A0nand chip info structure
> =A0* @buf: =A0 =A0 =A0 buffer to store read data
> + * @oob: =A0 =A0 =A0 buffer to store read OOB data
> =A0* @page: =A0 =A0 =A0page number to read
> =A0*
> =A0* This routine is needed for fsmc version 8 as reading from NAND chip =
has to be
> @@ -701,7 +702,7 @@ static void fsmc_write_buf_dma(struct mtd_info *mtd, =
const uint8_t *buf,
> =A0* max of 8 bits)
> =A0*/
> =A0static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip=
 *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint8_t =
*buf, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint8_t =
*buf, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0struct fsmc_nand_data *host =3D container_of(mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0struct fsmc_nand_data, mtd);
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gp=
mi-nand/gpmi-nand.c
> index 75b1dde..949c761 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -841,7 +841,7 @@ static void block_mark_swapping(struct gpmi_nand_data=
 *this,
> =A0}
>
> =A0static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *=
chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *bu=
f, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *bu=
f, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0struct gpmi_nand_data *this =3D chip->priv;
> =A0 =A0 =A0 =A0struct bch_geometry *nfc_geo =3D &this->bch_geometry;
> @@ -928,7 +928,8 @@ exit_nfc:
> =A0}
>
> =A0static void gpmi_ecc_write_page(struct mtd_info *mtd,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nand=
_chip *chip, const uint8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nand=
_chip *chip, const uint8_t *buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8=
_t *oob)
> =A0{
> =A0 =A0 =A0 =A0struct gpmi_nand_data *this =3D chip->priv;
> =A0 =A0 =A0 =A0struct bch_geometry *nfc_geo =3D &this->bch_geometry;
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 47b19c0..95ba987 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1066,12 +1066,13 @@ EXPORT_SYMBOL(nand_lock);
> =A0* @mtd: mtd info structure
> =A0* @chip: nand chip info structure
> =A0* @buf: buffer to store read data
> + * @oob: buffer to store read OOB data
> =A0* @page: page number to read
> =A0*
> =A0* Not for syndrome calculating ECC controllers, which use a special oo=
b layout.
> =A0*/
> =A0static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *=
chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, i=
nt page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, u=
int8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0chip->read_buf(mtd, buf, mtd->writesize);
> =A0 =A0 =A0 =A0chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> @@ -1083,17 +1084,18 @@ static int nand_read_page_raw(struct mtd_info *mt=
d, struct nand_chip *chip,
> =A0* @mtd: mtd info structure
> =A0* @chip: nand chip info structure
> =A0* @buf: buffer to store read data
> + * @oob: buffer to store read OOB
> =A0* @page: page number to read
> =A0*
> =A0* We need a special oob layout and handling even when OOB isn't used.
> =A0*/
> =A0static int nand_read_page_raw_syndrome(struct mtd_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0struct nand_chip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 uint8_t *buf, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 uint8_t *buf, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0int eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> - =A0 =A0 =A0 uint8_t *oob =3D chip->oob_poi;
> + =A0 =A0 =A0 uint8_t *oobbuf =3D chip->oob_poi;
> =A0 =A0 =A0 =A0int steps, size;
>
> =A0 =A0 =A0 =A0for (steps =3D chip->ecc.steps; steps > 0; steps--) {
> @@ -1101,22 +1103,22 @@ static int nand_read_page_raw_syndrome(struct mtd=
_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buf +=3D eccsize;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (chip->ecc.prepad) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, ch=
ip->ecc.prepad);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D chip->ecc.prepad;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf,=
 chip->ecc.prepad);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D chip->ecc.prepa=
d;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, eccbytes);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D eccbytes;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf, eccbytes);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D eccbytes;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (chip->ecc.postpad) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, ch=
ip->ecc.postpad);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D chip->ecc.postpad;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf,=
 chip->ecc.postpad);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D chip->ecc.postp=
ad;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 size =3D mtd->oobsize - (oob - chip->oob_poi);
> + =A0 =A0 =A0 size =3D mtd->oobsize - (oobbuf - chip->oob_poi);
> =A0 =A0 =A0 =A0if (size)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, size);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf, size);
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> @@ -1129,7 +1131,7 @@ static int nand_read_page_raw_syndrome(struct mtd_i=
nfo *mtd,
> =A0* @page: page number to read
> =A0*/
> =A0static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip=
 *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *bu=
f, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *bu=
f, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0int i, eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> @@ -1139,7 +1141,7 @@ static int nand_read_page_swecc(struct mtd_info *mt=
d, struct nand_chip *chip,
> =A0 =A0 =A0 =A0uint8_t *ecc_code =3D chip->buffers->ecccode;
> =A0 =A0 =A0 =A0uint32_t *eccpos =3D chip->ecc.layout->eccpos;
>
> - =A0 =A0 =A0 chip->ecc.read_page_raw(mtd, chip, buf, page);
> + =A0 =A0 =A0 chip->ecc.read_page_raw(mtd, chip, buf, oob, page);
>
> =A0 =A0 =A0 =A0for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=
=3D eccsize)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.calculate(mtd, p, &ecc_calc[i]);
> @@ -1257,12 +1259,13 @@ static int nand_read_subpage(struct mtd_info *mtd=
, struct nand_chip *chip,
> =A0* @mtd: mtd info structure
> =A0* @chip: nand chip info structure
> =A0* @buf: buffer to store read data
> + * @oob: buffer to store read OOB
> =A0* @page: page number to read
> =A0*
> =A0* Not for syndrome calculating ECC controllers which need a special oo=
b layout.
> =A0*/
> =A0static int nand_read_page_hwecc(struct mtd_info *mtd, struct nand_chip=
 *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *bu=
f, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *bu=
f, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0int i, eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> @@ -1302,6 +1305,7 @@ static int nand_read_page_hwecc(struct mtd_info *mt=
d, struct nand_chip *chip,
> =A0* @mtd: mtd info structure
> =A0* @chip: nand chip info structure
> =A0* @buf: buffer to store read data
> + * @oob: buffer to store read OOB
> =A0* @page: page number to read
> =A0*
> =A0* Hardware ECC for large page chips, require OOB to be read first. For=
 this
> @@ -1311,7 +1315,7 @@ static int nand_read_page_hwecc(struct mtd_info *mt=
d, struct nand_chip *chip,
> =A0* the data area, by overwriting the NAND manufacturer bad block markin=
gs.
> =A0*/
> =A0static int nand_read_page_hwecc_oob_first(struct mtd_info *mtd,
> - =A0 =A0 =A0 struct nand_chip *chip, uint8_t *buf, int page)
> + =A0 =A0 =A0 struct nand_chip *chip, uint8_t *buf, uint8_t *oob, int pag=
e)
> =A0{
> =A0 =A0 =A0 =A0int i, eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> @@ -1350,19 +1354,20 @@ static int nand_read_page_hwecc_oob_first(struct =
mtd_info *mtd,
> =A0* @mtd: mtd info structure
> =A0* @chip: nand chip info structure
> =A0* @buf: buffer to store read data
> + * @oob: buffer to store read OOB
> =A0* @page: page number to read
> =A0*
> =A0* The hw generator calculates the error syndrome automatically. Theref=
ore we
> =A0* need a special oob layout and handling.
> =A0*/
> =A0static int nand_read_page_syndrome(struct mtd_info *mtd, struct nand_c=
hip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint=
8_t *buf, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint=
8_t *buf, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0int i, eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> =A0 =A0 =A0 =A0int eccsteps =3D chip->ecc.steps;
> =A0 =A0 =A0 =A0uint8_t *p =3D buf;
> - =A0 =A0 =A0 uint8_t *oob =3D chip->oob_poi;
> + =A0 =A0 =A0 uint8_t *oobbuf =3D chip->oob_poi;
>
> =A0 =A0 =A0 =A0for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=
=3D eccsize) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int stat;
> @@ -1371,23 +1376,23 @@ static int nand_read_page_syndrome(struct mtd_inf=
o *mtd, struct nand_chip *chip,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->read_buf(mtd, p, eccsize);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (chip->ecc.prepad) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, ch=
ip->ecc.prepad);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D chip->ecc.prepad;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf,=
 chip->ecc.prepad);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D chip->ecc.prepa=
d;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->ecc.hwctl(mtd, NAND_ECC_READSYN);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, eccbytes);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat =3D chip->ecc.correct(mtd, p, oob, NUL=
L);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf, eccbytes);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 stat =3D chip->ecc.correct(mtd, p, oobbuf, =
NULL);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (stat < 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->ecc_stats.failed++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->ecc_stats.corrected +=
=3D stat;
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D eccbytes;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D eccbytes;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (chip->ecc.postpad) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, ch=
ip->ecc.postpad);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf,=
 chip->ecc.postpad);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oob +=3D chip->ecc.postpad=
;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> @@ -1500,14 +1505,14 @@ static int nand_do_read_ops(struct mtd_info *mtd,=
 loff_t from,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Now read the page into =
the buffer */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (unlikely(ops->mode =3D=
=3D MTD_OPS_RAW))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D chi=
p->ecc.read_page_raw(mtd, chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bufpoi, page);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D chi=
p->ecc.read_page_raw(mtd, chip, bufpoi,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NULL, page);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else if (!aligned && NAND_=
SUBPAGE_READ(chip) && !oob)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D ch=
ip->ecc.read_subpage(mtd, chip,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0col, bytes, bufpoi);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D ch=
ip->ecc.read_page(mtd, chip, bufpoi,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 page);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NULL, page);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!align=
ed)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0/* Invalidate page cache */
> @@ -1919,11 +1924,12 @@ out:
> =A0* @mtd: mtd info structure
> =A0* @chip: nand chip info structure
> =A0* @buf: data buffer
> + * @oob: OOB buffer
> =A0*
> =A0* Not for syndrome calculating ECC controllers, which use a special oo=
b layout.
> =A0*/
> =A0static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip=
 *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8=
_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8=
_t *buf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0chip->write_buf(mtd, buf, mtd->writesize);
> =A0 =A0 =A0 =A0chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> @@ -1934,16 +1940,18 @@ static void nand_write_page_raw(struct mtd_info *=
mtd, struct nand_chip *chip,
> =A0* @mtd: mtd info structure
> =A0* @chip: nand chip info structure
> =A0* @buf: data buffer
> + * @oob: OOB buffer
> =A0*
> =A0* We need a special oob layout and handling even when ECC isn't checke=
d.
> =A0*/
> =A0static void nand_write_page_raw_syndrome(struct mtd_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0struct nand_chip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 const uint8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 const uint8_t *buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0int eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> - =A0 =A0 =A0 uint8_t *oob =3D chip->oob_poi;
> + =A0 =A0 =A0 uint8_t *oobbuf =3D chip->oob_poi;
> =A0 =A0 =A0 =A0int steps, size;
>
> =A0 =A0 =A0 =A0for (steps =3D chip->ecc.steps; steps > 0; steps--) {
> @@ -1951,31 +1959,32 @@ static void nand_write_page_raw_syndrome(struct m=
td_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buf +=3D eccsize;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (chip->ecc.prepad) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oob, c=
hip->ecc.prepad);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D chip->ecc.prepad;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oobbuf=
, chip->ecc.prepad);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D chip->ecc.prepa=
d;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oob, eccbytes);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D eccbytes;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->read_buf(mtd, oobbuf, eccbytes);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D eccbytes;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (chip->ecc.postpad) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oob, c=
hip->ecc.postpad);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D chip->ecc.postpad;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oobbuf=
, chip->ecc.postpad);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D chip->ecc.postp=
ad;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 size =3D mtd->oobsize - (oob - chip->oob_poi);
> + =A0 =A0 =A0 size =3D mtd->oobsize - (oobbuf - chip->oob_poi);
> =A0 =A0 =A0 =A0if (size)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oob, size);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oobbuf, size);
> =A0}
> =A0/**
> =A0* nand_write_page_swecc - [REPLACEABLE] software ECC based page write =
function
> =A0* @mtd: mtd info structure
> =A0* @chip: nand chip info structure
> =A0* @buf: data buffer
> + * @oob: OOB buffer
> =A0*/
> =A0static void nand_write_page_swecc(struct mtd_info *mtd, struct nand_ch=
ip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const u=
int8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const u=
int8_t *buf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0int i, eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> @@ -1991,7 +2000,7 @@ static void nand_write_page_swecc(struct mtd_info *=
mtd, struct nand_chip *chip,
> =A0 =A0 =A0 =A0for (i =3D 0; i < chip->ecc.total; i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->oob_poi[eccpos[i]] =3D ecc_calc[i];
>
> - =A0 =A0 =A0 chip->ecc.write_page_raw(mtd, chip, buf);
> + =A0 =A0 =A0 chip->ecc.write_page_raw(mtd, chip, buf, oob);
> =A0}
>
> =A0/**
> @@ -1999,9 +2008,10 @@ static void nand_write_page_swecc(struct mtd_info =
*mtd, struct nand_chip *chip,
> =A0* @mtd: mtd info structure
> =A0* @chip: nand chip info structure
> =A0* @buf: data buffer
> + * @oob: OOB buffer
> =A0*/
> =A0static void nand_write_page_hwecc(struct mtd_info *mtd, struct nand_ch=
ip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const u=
int8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const u=
int8_t *buf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0int i, eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> @@ -2027,18 +2037,20 @@ static void nand_write_page_hwecc(struct mtd_info=
 *mtd, struct nand_chip *chip,
> =A0* @mtd: mtd info structure
> =A0* @chip: nand chip info structure
> =A0* @buf: data buffer
> + * @oob: OOB data buffer
> =A0*
> =A0* The hw generator calculates the error syndrome automatically. Theref=
ore we
> =A0* need a special oob layout and handling.
> =A0*/
> =A0static void nand_write_page_syndrome(struct mtd_info *mtd,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct nand_chip *chip, const uint8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct nand_chip *chip, const uint8_t *buf,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 con=
st uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0int i, eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> =A0 =A0 =A0 =A0int eccsteps =3D chip->ecc.steps;
> =A0 =A0 =A0 =A0const uint8_t *p =3D buf;
> - =A0 =A0 =A0 uint8_t *oob =3D chip->oob_poi;
> + =A0 =A0 =A0 uint8_t *oobbuf =3D chip->oob_poi;
>
> =A0 =A0 =A0 =A0for (i =3D 0; eccsteps; eccsteps--, i +=3D eccbytes, p +=
=3D eccsize) {
>
> @@ -2046,24 +2058,24 @@ static void nand_write_page_syndrome(struct mtd_i=
nfo *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->write_buf(mtd, p, eccsize);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (chip->ecc.prepad) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oob, c=
hip->ecc.prepad);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D chip->ecc.prepad;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oobbuf=
, chip->ecc.prepad);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D chip->ecc.prepa=
d;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.calculate(mtd, p, oob);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oob, eccbytes);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D eccbytes;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.calculate(mtd, p, oobbuf);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oobbuf, eccbytes);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D eccbytes;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (chip->ecc.postpad) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oob, c=
hip->ecc.postpad);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oob +=3D chip->ecc.postpad;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oobbuf=
, chip->ecc.postpad);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D chip->ecc.postp=
ad;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* Calculate remaining oob bytes */
> - =A0 =A0 =A0 i =3D mtd->oobsize - (oob - chip->oob_poi);
> + =A0 =A0 =A0 i =3D mtd->oobsize - (oobbuf - chip->oob_poi);
> =A0 =A0 =A0 =A0if (i)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oob, i);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->write_buf(mtd, oobbuf, i);
> =A0}
>
> =A0/**
> @@ -2076,16 +2088,17 @@ static void nand_write_page_syndrome(struct mtd_i=
nfo *mtd,
> =A0* @raw: use _raw version of write_page
> =A0*/
> =A0static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chi=
p,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const uint8_t *buf, =
int page, int cached, int raw)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const uint8_t *buf, =
const uint8_t *oob, int page,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int cached, int raw)
> =A0{
> =A0 =A0 =A0 =A0int status;
>
> =A0 =A0 =A0 =A0chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
>
> =A0 =A0 =A0 =A0if (unlikely(raw))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page_raw(mtd, chip, buf);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page_raw(mtd, chip, buf, oo=
b);
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page(mtd, chip, buf);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->ecc.write_page(mtd, chip, buf, oob);
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * Cached progamming disabled for now. Not sure if it's wo=
rth the
> @@ -2264,7 +2277,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, =
loff_t to,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memset(chip->oob_poi, 0xff=
, mtd->oobsize);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D chip->write_page(mtd, chip, wbuf, p=
age, cached,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D chip->write_page(mtd, chip, wbuf, N=
ULL, page, cached,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 (ops->mode =3D=3D MTD_OPS_RAW));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index def50ca..92d2eae 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -682,14 +682,14 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mt=
d, unsigned command,
> =A0}
>
> =A0static void pxa3xx_nand_write_page_hwecc(struct mtd_info *mtd,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nand_chip *chip, const uint8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nand_chip *chip, const uint8_t *buf,=
 const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0chip->write_buf(mtd, buf, mtd->writesize);
> =A0 =A0 =A0 =A0chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> =A0}
>
> =A0static int pxa3xx_nand_read_page_hwecc(struct mtd_info *mtd,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nand_chip *chip, uint8_t *buf, int p=
age)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct nand_chip *chip, uint8_t *buf, uint8=
_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0struct pxa3xx_nand_host *host =3D mtd->priv;
> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info =3D host->info_data;
> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
> index e9b2b26..d1b2731 100644
> --- a/drivers/mtd/nand/sh_flctl.c
> +++ b/drivers/mtd/nand/sh_flctl.c
> @@ -344,7 +344,7 @@ static void set_cmd_regs(struct mtd_info *mtd, uint32=
_t cmd, uint32_t flcmcdr_va
> =A0}
>
> =A0static int flctl_read_page_hwecc(struct mtd_info *mtd, struct nand_chi=
p *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *bu=
f, int page)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *bu=
f, uint8_t *oob, int page)
> =A0{
> =A0 =A0 =A0 =A0int i, eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> @@ -366,7 +366,7 @@ static int flctl_read_page_hwecc(struct mtd_info *mtd=
, struct nand_chip *chip,
> =A0}
>
> =A0static void flctl_write_page_hwecc(struct mtd_info *mtd, struct nand_c=
hip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cons=
t uint8_t *buf)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cons=
t uint8_t *buf, const uint8_t *oob)
> =A0{
> =A0 =A0 =A0 =A0int i, eccsize =3D chip->ecc.size;
> =A0 =A0 =A0 =A0int eccbytes =3D chip->ecc.bytes;
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 1482340..be9ee1f 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -363,15 +363,15 @@ struct nand_ecc_ctrl {
> =A0 =A0 =A0 =A0int (*correct)(struct mtd_info *mtd, uint8_t *dat, uint8_t=
 *read_ecc,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint8_t *calc_ecc);
> =A0 =A0 =A0 =A0int (*read_page_raw)(struct mtd_info *mtd, struct nand_chi=
p *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, int page);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, uint8_t *oob,=
 int page);
> =A0 =A0 =A0 =A0void (*write_page_raw)(struct mtd_info *mtd, struct nand_c=
hip *chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf, const u=
int8_t *oob);
> =A0 =A0 =A0 =A0int (*read_page)(struct mtd_info *mtd, struct nand_chip *c=
hip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, int page);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *buf, uint8_t *oob,=
 int page);
> =A0 =A0 =A0 =A0int (*read_subpage)(struct mtd_info *mtd, struct nand_chip=
 *chip,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uint32_t offs, uint32_t le=
n, uint8_t *buf);
> =A0 =A0 =A0 =A0void (*write_page)(struct mtd_info *mtd, struct nand_chip =
*chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf, const u=
int8_t *oob);
> =A0 =A0 =A0 =A0int (*write_oob_raw)(struct mtd_info *mtd, struct nand_chi=
p *chip,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int page);
> =A0 =A0 =A0 =A0int (*read_oob_raw)(struct mtd_info *mtd, struct nand_chip=
 *chip,
> @@ -505,7 +505,8 @@ struct nand_chip {
> =A0 =A0 =A0 =A0int (*errstat)(struct mtd_info *mtd, struct nand_chip *thi=
s, int state,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int status, int page);
> =A0 =A0 =A0 =A0int (*write_page)(struct mtd_info *mtd, struct nand_chip *=
chip,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf, int pag=
e, int cached, int raw);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const uint8_t *buf, const u=
int8_t *oob, int page,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int cached, int raw);
>
> =A0 =A0 =A0 =A0int chip_delay;
> =A0 =A0 =A0 =A0unsigned int options;
> --
> 1.7.5.4.2.g519b1
>
