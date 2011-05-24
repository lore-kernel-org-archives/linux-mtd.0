Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOyEZ-0003RW-IX
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 20:29:44 +0000
Received: by wwb39 with SMTP id 39so5730507wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 May 2011 13:29:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF29E@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF29E@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 25 May 2011 01:59:21 +0530
Message-ID: <BANLkTindYXPskzatCLXWt5co3VZXWVJ=7A@mail.gmail.com>
Subject: Re: [PATCH] nand: nand_base: Always initialise oob_poi before writing
	OOB data
To: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 24, 2011 at 7:02 PM, THOMSON, Adam (Adam)
<adam.thomson@alcatel-lucent.com> wrote:
> In nand_do_write_ops() code it is possible for a caller to provide
> ops.oobbuf populated and ops.mode =3D=3D MTD_OOB_AUTO, which currently
> means that the chip->oob_poi buffer isn't initialised to all 0xFF.
> The nand_fill_oob() method then carries out the task of copying
> the provided OOB data to oob_poi, but with MTD_OOB_AUTO it skips
> areas marked as unavailable by the layout struct, including the
> bad block marker bytes.
>
> An example of this causing issues is when the last OOB data read
> was from the start of a bad block where the markers are not 0xFF,
> and the caller wishes to write new OOB data at the beginning of
> another block. In this scenario the caller would provide OOB data,
> but nand_fill_oob() would skip the bad block marker bytes in
> oob_poi before copying the OOB data provided by the caller.
> This means that when the OOB data is written back to NAND,
> the block is inadvertently marked as bad without the caller knowing.
> This has been witnessed when using YAFFS2 where tags are stored
> in the OOB.
>
> This patch changes the code so that oob_poi is always initialised
> to 0xFF to make sure no left over data is inadvertently written
> back to OOB data.
>
> Signed-off-by: Adam Thomson <adam.thomson@alcatel-lucent.com>
> ---
> =A0drivers/mtd/nand/nand_base.c | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 8c21b89..cb1dec1 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1843,9 +1843,9 @@ static int nand_do_write_ops(struct mtd_info *mtd, =
loff_t to,
> =A0 =A0 =A0 =A0 =A0 =A0(chip->pagebuf << chip->page_shift) < (to + ops->l=
en))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip->pagebuf =3D -1;
>
> - =A0 =A0 =A0 /* If we're not given explicit OOB data, let it be 0xFF */
> - =A0 =A0 =A0 if (likely(!oob))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 memset(chip->oob_poi, 0xff, mtd->oobsize);
> + =A0 =A0 =A0 /* Initialise to all 0xFF, to avoid the possibility of
> + =A0 =A0 =A0 =A0 =A0left over OOB data from a previous OOB read. */

Please correct the multi-line comment style. Like this:
        /*
         * Initialise to all 0xFF, to avoid the possibility of
         * left over OOB data from a previous OOB read.
         */


> + =A0 =A0 =A0 memset(chip->oob_poi, 0xff, mtd->oobsize);


--=20
Regards,
Vimal Singh
