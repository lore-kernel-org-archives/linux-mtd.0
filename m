Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDHPn-0000Pu-2a
	for linux-mtd@lists.infradead.org; Tue, 02 Nov 2010 14:00:44 +0000
Received: by pvg7 with SMTP id 7so916943pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Nov 2010 07:00:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1288697130-12772-4-git-send-email-roman.tereshonkov@nokia.com>
References: <1288697130-12772-1-git-send-email-roman.tereshonkov@nokia.com>
	<1288697130-12772-4-git-send-email-roman.tereshonkov@nokia.com>
Date: Tue, 2 Nov 2010 23:00:41 +0900
Message-ID: <AANLkTinq7HS5VHww8aq2XPKCwGnjEYSintsN4qRFJq1o@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: onenand: implement cache program feature for 4kb
	page onenand
From: Kyungmin Park <kmpark@infradead.org>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Nov 2, 2010 at 8:25 PM, Roman Tereshonkov
<roman.tereshonkov@nokia.com> wrote:
> Implement cache program feature for 4KB page onenand.
> This feature improves the write data performance.
> The observed 128KB data program speed change is
> from 8827KB/s to 14156 KB/s when the feature is enabled.
>
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> ---
> =A0drivers/mtd/onenand/omap2.c =A0 =A0 =A0 =A0| =A0 12 ++++++++--
> =A0drivers/mtd/onenand/onenand_base.c | =A0 39 ++++++++++++++++++++++++++=
++++++++-
> =A02 files changed, 46 insertions(+), 5 deletions(-)

Please make separate the two patches, one for OMAP, another is for
onenand_base.c

>
> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
> index 9f322f1..da25a90 100644
> --- a/drivers/mtd/onenand/omap2.c
> +++ b/drivers/mtd/onenand/omap2.c
> @@ -108,8 +108,9 @@ static void wait_warn(char *msg, int state, unsigned =
int ctrl,
> =A0static int omap2_onenand_wait(struct mtd_info *mtd, int state)
> =A0{
> =A0 =A0 =A0 =A0struct omap2_onenand *c =3D container_of(mtd, struct omap2=
_onenand, mtd);
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> =A0 =A0 =A0 =A0unsigned int intr =3D 0;
> - =A0 =A0 =A0 unsigned int ctrl;
> + =A0 =A0 =A0 unsigned int ctrl, ctrl_mask;
> =A0 =A0 =A0 =A0unsigned long timeout;
> =A0 =A0 =A0 =A0u32 syscfg;
>
> @@ -180,7 +181,8 @@ retry:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (result =3D=3D 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Timeout=
 after 20ms */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ctrl =3D r=
ead_reg(c, ONENAND_REG_CTRL_STATUS);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ctrl & =
ONENAND_CTRL_ONGO) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ctrl & =
ONENAND_CTRL_ONGO &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 !th=
is->ongoing) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 * The operation seems to be still going
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 * so give it some more time.
> @@ -269,7 +271,11 @@ retry:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EIO;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 if (ctrl & 0xFE9F)
> + =A0 =A0 =A0 ctrl_mask =3D 0xFE9F;
> + =A0 =A0 =A0 if (this->ongoing)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl_mask &=3D ~0x8000;
> +
> + =A0 =A0 =A0 if (ctrl & ctrl_mask)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0wait_warn("unexpected controller status", =
state, ctrl, intr);
>
> =A0 =A0 =A0 =A0return 0;
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index 6b3a875..b2c3e97 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -440,6 +440,19 @@ static int onenand_command(struct mtd_info *mtd, int=
 cmd, loff_t addr, size_t le
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ONENAND_IS_2PLANE(this=
) && cmd =3D=3D ONENAND_CMD_PROG)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cmd =3D ON=
ENAND_CMD_2X_PROG;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Exclude 1st OTP and OTP =
blocks */
Are there any reason? I think 1st OTP block is just block 0 so no need
to consider block 0 case.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_CACHE_PROGRA=
M(this) &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 likely(onenand_bloc=
k(this, addr) !=3D 0) &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_IS_4KB_PAGE=
(this)) {
and I think no need to check 4KB_PAGE.
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (cmd =3D=
=3D ONENAND_CMD_CACHE_PROG)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 cmd =3D ONENAND_CMD_2X_CACHE_PROG;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if (cm=
d =3D=3D ONENAND_CMD_CACHE_PROG_LAST)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 cmd =3D ONENAND_CMD_PROG;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dataram =3D ONENAND_CURREN=
T_BUFFERRAM(this);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> @@ -1845,7 +1858,7 @@ static int onenand_write_ops_nolock(struct mtd_info=
 *mtd, loff_t to,
> =A0 =A0 =A0 =A0const u_char *buf =3D ops->datbuf;
> =A0 =A0 =A0 =A0const u_char *oob =3D ops->oobbuf;
> =A0 =A0 =A0 =A0u_char *oobbuf;
> - =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 int ret =3D 0, cmd;
>
> =A0 =A0 =A0 =A0DEBUG(MTD_DEBUG_LEVEL3, "%s: to =3D 0x%08x, len =3D %i\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__func__, (unsigned int) to, (int) len);
> @@ -1954,7 +1967,25 @@ static int onenand_write_ops_nolock(struct mtd_inf=
o *mtd, loff_t to,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ONENAND_SET_NEXT_BUFFERRAM=
(this);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_PROG, to, mt=
d->writesize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->ongoing =3D 0;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Exclude 1st OTP and OTP blocks */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_CACHE_PROGRAM(this) &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 likely(onenand_block(this, to) !=3D=
 0) &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_IS_4KB_PAGE(this)) {
check the length here instead of 4KB_PAGE.
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((written + thislen) < l=
en) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D ONE=
NAND_CMD_CACHE_PROG;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->ongoi=
ng =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D ONE=
NAND_CMD_CACHE_PROG_LAST;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
Need to check how to pass the cmd properly. How/When send the CACHE_PROG_LA=
ST?
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D ONENAND_CMD_PROG;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, cmd, to, mtd->writesize)=
;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * 2 PLANE, MLC, and Flex-OneNAND wait her=
e
> @@ -3380,6 +3411,8 @@ static void onenand_check_features(struct mtd_info =
*mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else if (numbufs =3D=3D 1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->options |=3D ONENAND=
_HAS_4KB_PAGE;
>
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->options |=3D ONENAND_HAS_CACHE_PROGRA=
M;
It also needs to set CACHE_PROGRAM option.
> +
> =A0 =A0 =A0 =A0case ONENAND_DEVICE_DENSITY_2Gb:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 2Gb DDP does not have 2 plane */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!ONENAND_IS_DDP(this))
> @@ -3415,6 +3448,8 @@ static void onenand_check_features(struct mtd_info =
*mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "Chip has 2 plane\n");
> =A0 =A0 =A0 =A0if (this->options & ONENAND_HAS_4KB_PAGE)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "Chip has 4KiB pagesize\=
n");
> + =A0 =A0 =A0 if (this->options & ONENAND_HAS_CACHE_PROGRAM)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "Chip has cache program f=
eature\n");
> =A0}

Thank you,
Kyungmin Park
