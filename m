Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A19DC61DD3
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 08:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ci3qazzOAzhuqupIsuRz/49OfkulqtNtd0DReymoQZ4=; b=Yp4rJGcAhDP0ov
	anxOILLX3pCilZwfSZ4Eh7ErzoGdZkBLtWH0WiD3oiG46eB+rKTIOUxvUN5dC0hnqBfMtLcnilUH3
	qOzqYgUveBnUop1ZtlFbfiU7EvTJbm+CDsdPRzUDZIogChpcUfiTcwjyi4WIQAEi6CrAcJ/EB0b0Q
	7lcszGiSh/CwbmgUO3CE+KMS7TNfFPcnhRmghLf5oENY+sYK0Ew8Q4FWIfXA2+8GqTew23Na+qZqa
	Qe0Jk/w72elWUF0DEPDUnmuiYdmHFWBdg/hiqx2Avw/UddQ7D6IMW6NkD4rwo43KZe+xBTX5X5vYA
	kgNzOzdiubRWGWyNPVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x0s-00000008mvV-0TYR;
	Mon, 31 Aug 2026 08:05:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x0o-00000008mug-23Cy
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 08:05:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 76E6F4E41467;
	Mon, 31 Aug 2026 08:04:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48153601E1;
	Mon, 31 Aug 2026 08:04:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A29EE11C78A49;
	Mon, 31 Aug 2026 10:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788163494; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=p6zvmtgsiOUzohtx86HE9K0SwzngVzGSbSvDkBLEb2k=;
	b=zbbpfDYfWAb0Y6NmntridsWzZcvyp2yFsABX43u0aVTS827dwGyDRDVzXuhEdPPYBJoP4d
	tQuDloYAn0Qh2d+XDYSa2THJeOVx7EyNnoAyu8sagbttIj08Yr+d2eHjcksDBDTkT6nas2
	nVJWR/6ai2Nqv2pvGXfYVBHkDN8hy47O7lxR+T6Upw62n7Gq9OBRIjVfkKkHqljPu+fFRJ
	/vq9vHiTmEgKjBXOfFU2ryCL3KqxSt8nidocCDxqayjRjR+ND1qRLpuuvYPj5YtQhQhQg5
	giHx+So2S2YZ9BnH59LRE7eH0M5sFsLASvrbfa1URSaw5yddcWq8621P+bIsvA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Stefan Agner <stefan@agner.ch>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with
 more than 64 bytes of OOB
In-Reply-To: <20260828085337.3916199-2-mehmet.fide@gmail.com> (Mehmet Fide's
	message of "Fri, 28 Aug 2026 10:53:36 +0200")
References: <20260828085337.3916199-1-mehmet.fide@gmail.com>
	<20260828085337.3916199-2-mehmet.fide@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 31 Aug 2026 10:04:52 +0200
Message-ID: <87v78qbtqz.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_010502_813435_A0AEA5C6 
X-CRM114-Status: GOOD (  35.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Mehmet,

On 28/08/2026 at 10:53:36 +02, Mehmet Fide <mehmet.fide@gmail.com> wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> The controller transfers 64 spare bytes per page and the driver only
> implements the matching 64-byte ECC layout, so attach_chip() shrinks
> mtd->oobsize when the chip provides more. That clamp does not survive:
> nand_scan_tail() runs nanddev_init() after ->attach_chip(), and it
> restores mtd->oobsize from the memory organization, which still holds
> the value detected from the chip. The driver then transfers writesize
> plus the chip's full OOB size, the hardware ECC parity ends up at a
> different offset than the layout the controller was set up for, and
> every ECC-protected read fails with -EBADMSG.
>
> Measured on a Colibri VF61 (MX30LF4G28AC, 2048-byte pages, 112 bytes of
> OOB): with the clamp lost, UBI cannot read the erase counter headers of
> the pages U-Boot has just written, and the on-flash bad block table
> written by an older kernel reads back with ECC errors, so the board
> does not boot. Kernels before commit a7ab085d7c16 ("mtd: rawnand:
> Initialize the nand_device object") are not affected because nothing
> overwrote the clamp there, which is why the same chip works with a v4.4
> kernel and with U-Boot, whose copy of this driver has no memory
> organization to restore the value from. Edward Karpicz reported that
> the clamp no longer takes effect on this chip; see the link below.
>
> Instead of modifying the memory organization, keep the detected OOB
> size and give the driver its own mtd_ooblayout_ops: the same layout the
> NAND core uses for large pages, but computed on the first 64 OOB bytes
> instead of the whole OOB, so the ECC bytes stay where U-Boot and the
> old kernels put them. The data paths transfer writesize plus those 64
> bytes, as the controller always has.
>
> Reported-by: Edward Karpicz <webmaster@toradex.com>
> Link: https://community.toradex.com/t/colibri-vf50-vf61-on-the-current-bsp-mainline-u-boot-v2026-07-and-linux-6-18-lts/30735
> Fixes: a7ab085d7c16 ("mtd: rawnand: Initialize the nand_device object")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> v2:
>  - keep the detected OOB size and add driver ooblayout_ops computed on
>    the first 64 OOB bytes instead of clamping the memory organization
>    (Miquel)

Since it is a total rewrite of the former approach, this is probably a
good candidate for a Suggested-by.

>  - clamp the spare transfer size in the data paths so the controller
>    keeps reading and writing 64 spare bytes
>  - drop the truncation dev_info() and with it the %d format for a u32
>    (Sashiko report)
>
>  drivers/mtd/nand/raw/vf610_nfc.c | 59 ++++++++++++++++++++++++++------
>  1 file changed, 48 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
> index 9940681810cf..9104db19dd29 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -505,6 +505,12 @@ static int vf610_nfc_exec_op(struct nand_chip *chip,
>  				      check_only);
>  }
>  
> +/* The controller transfers 64 spare bytes; larger OOBs keep using
> the first 64 */

Is it a real controller constraint? Or is this a compatibility fix only?
If this is a real constraint, you can keep the comment, otherwise I
would drop it.

> +static inline unsigned int vf610_nfc_spare_size(struct mtd_info *mtd)

No explicit inline please.

> +{
> +	return min_t(unsigned int, mtd->oobsize, 64);
> +}
> +
>  static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
>  					 uint8_t *oob, int page)
>  {
> @@ -522,7 +528,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
>  		return ecc_count;
>  
>  	nfc->data_access = true;
> -	nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
> +	nand_read_oob_op(&nfc->chip, page, 0, oob, vf610_nfc_spare_size(mtd));
>  	nfc->data_access = false;
>  
>  	/*
> @@ -530,7 +536,7 @@ static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
>  	 * at least less then half of the ECC strength.
>  	 */
>  	return nand_check_erased_ecc_chunk(dat, nfc->chip.ecc.size, oob,
> -					   mtd->oobsize, NULL, 0,
> +					   vf610_nfc_spare_size(mtd), NULL, 0,
>  					   flips_threshold);
>  }
>  
> @@ -551,7 +557,7 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
>  {
>  	struct vf610_nfc *nfc = chip_to_nfc(chip);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	int trfr_sz = mtd->writesize + mtd->oobsize;
> +	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
>  	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
>  	int stat;
>  
> @@ -581,7 +587,7 @@ static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
>  		vf610_nfc_rd_from_sram(chip->oob_poi,
>  				       nfc->regs + NFC_MAIN_AREA(0) +
>  						   mtd->writesize,
> -				       mtd->oobsize, false);
> +				       vf610_nfc_spare_size(mtd), false);
>  
>  	stat = vf610_nfc_correct_data(chip, buf, chip->oob_poi, page);
>  
> @@ -599,7 +605,7 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
>  {
>  	struct vf610_nfc *nfc = chip_to_nfc(chip);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	int trfr_sz = mtd->writesize + mtd->oobsize;
> +	int trfr_sz = mtd->writesize + vf610_nfc_spare_size(mtd);
>  	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
>  	u8 status;
>  	int ret;
> @@ -740,6 +746,42 @@ static void vf610_nfc_init_controller(struct vf610_nfc *nfc)
>  	}
>  }
>  
> +/* The default large page layout, clamped to the 64 transferred bytes */
> +static int vf610_nfc_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				   struct mtd_oob_region *oobregion)
> +{
> +	struct nand_device *nand = mtd_to_nanddev(mtd);
> +	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
> +
> +	if (section || !total_ecc_bytes)
> +		return -ERANGE;
> +
> +	oobregion->length = total_ecc_bytes;
> +	oobregion->offset = vf610_nfc_spare_size(mtd) - oobregion->length;
> +
> +	return 0;
> +}
> +
> +static int vf610_nfc_ooblayout_free(struct mtd_info *mtd, int section,
> +				    struct mtd_oob_region *oobregion)
> +{
> +	struct nand_device *nand = mtd_to_nanddev(mtd);
> +	unsigned int total_ecc_bytes = nand->ecc.ctx.total;
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length = vf610_nfc_spare_size(mtd) - total_ecc_bytes - 2;
> +	oobregion->offset = 2;
> +
> +	return 0;
> +}
> +
> +static const struct mtd_ooblayout_ops vf610_nfc_ooblayout_ops = {
> +	.ecc = vf610_nfc_ooblayout_ecc,
> +	.free = vf610_nfc_ooblayout_free,
> +};
> +
>  static int vf610_nfc_attach_chip(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -770,12 +812,7 @@ static int vf610_nfc_attach_chip(struct nand_chip *chip)
>  		return -ENXIO;
>  	}
>  
> -	/* Only 64 byte ECC layouts known */
> -	if (mtd->oobsize > 64)
> -		mtd->oobsize = 64;
> -
> -	/* Use default large page ECC layout defined in NAND core */

Please modify this comment to express why we use our own layout here.

> -	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
> +	mtd_set_ooblayout(mtd, &vf610_nfc_ooblayout_ops);
>  	if (chip->ecc.strength == 32) {
>  		nfc->ecc_mode = ECC_60_BYTE;
>  		chip->ecc.bytes = 60;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
