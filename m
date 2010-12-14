Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PSIdo-0002IB-80
	for linux-mtd@lists.infradead.org; Tue, 14 Dec 2010 00:21:17 +0000
Received: by wyf22 with SMTP id 22so37546wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Dec 2010 16:21:14 -0800 (PST)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <20101213122128.20685.9312.sendpatchset@ahunter-work.research.nokia.com>
References: <20101213122042.20685.52929.sendpatchset@ahunter-work.research.nokia.com>
	<20101213122128.20685.9312.sendpatchset@ahunter-work.research.nokia.com>
Date: Tue, 14 Dec 2010 09:21:14 +0900
Message-ID: <AANLkTimaoZOPjqh80gnEdz6Qz4YzdkQGTaYqv0mu2GeM@mail.gmail.com>
Subject: Re: [PATCH 7/7] mtd: OneNAND: lighten scary initial bad block messages
From: Kyungmin Park <kmpark@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Tony Lindgren <tony@atomide.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Mon, Dec 13, 2010 at 9:21 PM, Adrian Hunter <adrian.hunter@nokia.com> wr=
ote:
> From 5fa7a6377683aabd617f78518cd6cd49eae1679e Mon Sep 17 00:00:00 2001
> From: Adrian Hunter <adrian.hunter@nokia.com>
> Date: Fri, 10 Dec 2010 12:04:20 +0200
> Subject: [PATCH 7/7] mtd: OneNAND: lighten scary initial bad block messag=
es
>
> Initial bad blocks are normal but the messages look like
> errors. =A0Make the messages less scary, make the main
> message an informational message not a warning, make the
> message displaying registers a debug message and include
> the address there instead of in the informational message.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@nokia.com>
> ---
> =A0drivers/mtd/onenand/onenand_base.c | =A0 22 ++++++++++++----------
> =A0drivers/mtd/onenand/onenand_bbt.c =A0| =A0 =A04 ++--
> =A02 files changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index bde274f..5065fc7 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1488,8 +1488,7 @@ static int onenand_bbt_wait(struct mtd_info *mtd, i=
nt state)
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
> =A0 =A0 =A0 =A0unsigned long timeout;
> - =A0 =A0 =A0 unsigned int interrupt;
> - =A0 =A0 =A0 unsigned int ctrl;
> + =A0 =A0 =A0 unsigned int interrupt, ctrl, ecc, addr1, addr8;
>
> =A0 =A0 =A0 =A0/* The 20 msec is enough */
> =A0 =A0 =A0 =A0timeout =3D jiffies + msecs_to_jiffies(20);
> @@ -1501,25 +1500,28 @@ static int onenand_bbt_wait(struct mtd_info *mtd,=
 int state)
> =A0 =A0 =A0 =A0/* To get correct interrupt status in timeout case */
> =A0 =A0 =A0 =A0interrupt =3D this->read_word(this->base + ONENAND_REG_INT=
ERRUPT);
> =A0 =A0 =A0 =A0ctrl =3D this->read_word(this->base + ONENAND_REG_CTRL_STA=
TUS);
> + =A0 =A0 =A0 addr1 =3D this->read_word(this->base + ONENAND_REG_START_AD=
DRESS1);
> + =A0 =A0 =A0 addr8 =3D this->read_word(this->base + ONENAND_REG_START_AD=
DRESS8);
>
> =A0 =A0 =A0 =A0if (interrupt & ONENAND_INT_READ) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ecc =3D onenand_read_ecc(this);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ecc =3D onenand_read_ecc(this);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ecc & ONENAND_ECC_2BIT_ALL) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "%s: ec=
c error =3D 0x%04x, "
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "controller=
 error 0x%04x\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, e=
cc, ctrl);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "%s: ecc =
0x%04x ctrl 0x%04x "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"intr 0x%04x=
 addr1 %#x addr8 %#x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__func__, ec=
c, ctrl, interrupt, addr1, addr8);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ONENAND_BBT_READ_EC=
C_ERROR;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: read timeout! ctrl=3D0=
x%04x intr=3D0x%04x\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, ctrl, interrupt);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: read timeout! ctrl 0x%=
04x "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"intr 0x%04x addr1 %#x addr8=
 %#x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__func__, ctrl, interrupt, a=
ddr1, addr8);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ONENAND_BBT_READ_FATAL_ERROR;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* Initial bad block case: 0x2400 or 0x0400 */
> =A0 =A0 =A0 =A0if (ctrl & ONENAND_CTRL_ERROR) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "%s: controller error =3D=
 0x%04x\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__, ctrl);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "%s: ctrl 0x%04x intr 0x%=
04x addr1 %#x "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"addr8 %#x\n", __func__, ctr=
l, interrupt, addr1, addr8);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ONENAND_BBT_READ_ERROR;
> =A0 =A0 =A0 =A0}
>
> diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onen=
and_bbt.c
> index 905209b..fc2c16a 100644
> --- a/drivers/mtd/onenand/onenand_bbt.c
> +++ b/drivers/mtd/onenand/onenand_bbt.c
> @@ -101,8 +101,8 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *=
buf, struct nand_bbt_descr
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret || check_short_pat=
tern(&buf[j * scanlen],
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 scanlen, this->writesize, bd)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bbm->bbt[i=
 >> 3] |=3D 0x03 << (i & 0x6);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_WARNING "Bad eraseblock %d at 0x%08x\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 i >> 1, (unsigned int) from);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_INFO "OneNAND eraseblock %d is an "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "initial bad block\n", i >> 1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->ecc_s=
tats.badblocks++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> --
> 1.7.0.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
