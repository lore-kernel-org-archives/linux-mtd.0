Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDb9z-0001c5-FD
	for linux-mtd@lists.infradead.org; Wed, 03 Nov 2010 11:05:45 +0000
Received: by pvg7 with SMTP id 7so178731pvg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Nov 2010 04:05:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <1288781721-31771-4-git-send-email-roman.tereshonkov@nokia.com>
References: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
	<1288781721-31771-4-git-send-email-roman.tereshonkov@nokia.com>
Date: Wed, 3 Nov 2010 20:05:40 +0900
Message-ID: <AANLkTik_YnmesYb9AF_7DPa3hf1Q5TrXV=4g35vGYxFb@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] mtd: onenand: implement cache program feature for
	4kb page onenand
From: Kyungmin Park <kyungmin.park@samsung.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Wed, Nov 3, 2010 at 7:55 PM, Roman Tereshonkov
<roman.tereshonkov@nokia.com> wrote:
> Implement cache program feature for 4KB page onenand.
> This feature improves the write data performance.
> The observed 128KB data program speed change is
> from 8827KB/s to 14156 KB/s when the feature is enabled.
>
> Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> ---
> =A0drivers/mtd/onenand/onenand_base.c | =A0 22 +++++++++++++++++++---
> =A01 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index 6b3a875..4d6e6c5 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1845,7 +1845,7 @@ static int onenand_write_ops_nolock(struct mtd_info=
 *mtd, loff_t to,
> =A0 =A0 =A0 =A0const u_char *buf =3D ops->datbuf;
> =A0 =A0 =A0 =A0const u_char *oob =3D ops->oobbuf;
> =A0 =A0 =A0 =A0u_char *oobbuf;
> - =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 int ret =3D 0, cmd;
>
> =A0 =A0 =A0 =A0DEBUG(MTD_DEBUG_LEVEL3, "%s: to =3D 0x%08x, len =3D %i\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__func__, (unsigned int) to, (int) len);
> @@ -1954,7 +1954,19 @@ static int onenand_write_ops_nolock(struct mtd_inf=
o *mtd, loff_t to,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ONENAND_SET_NEXT_BUFFERRAM=
(this);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_PROG, to, mt=
d->writesize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->ongoing =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D ONENAND_CMD_PROG;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Exclude 1st OTP and OTP blocks for cache=
 program feature */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_CACHE_PROGRAM(this) &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 likely(onenand_block(this, to) !=3D=
 0) &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ONENAND_IS_4KB_PAGE(this) &&
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((written + thislen) < len)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D ONENAND_CMD_2X_CACH=
E_PROG;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->ongoing =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, cmd, to, mtd->writesize)=
;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * 2 PLANE, MLC, and Flex-OneNAND wait her=
e
> @@ -3377,8 +3389,10 @@ static void onenand_check_features(struct mtd_info=
 *mtd)
> =A0 =A0 =A0 =A0case ONENAND_DEVICE_DENSITY_4Gb:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ONENAND_IS_DDP(this))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->options |=3D ONENAND=
_HAS_2PLANE;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if (numbufs =3D=3D 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else if (numbufs =3D=3D 1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->options |=3D ONENAND=
_HAS_4KB_PAGE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->options |=3D ONENAND_=
HAS_CACHE_PROGRAM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0case ONENAND_DEVICE_DENSITY_2Gb:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* 2Gb DDP does not have 2 plane */
> @@ -3415,6 +3429,8 @@ static void onenand_check_features(struct mtd_info =
*mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "Chip has 2 plane\n");
> =A0 =A0 =A0 =A0if (this->options & ONENAND_HAS_4KB_PAGE)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "Chip has 4KiB pagesize\=
n");
> + =A0 =A0 =A0 if (this->options & ONENAND_HAS_CACHE_PROGRAM)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_DEBUG "Chip has cache program f=
eature\n");
> =A0}
>
> =A0/**
> --
> 1.7.0.4
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
