Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35408C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 07:25:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00FC46109E
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 07:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00FC46109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKAzpHcKWpySkLm30io7EIcHrtFNC7V05O5j2EEpt6E=; b=XOodKZPbF/BLrD
	lDsJnzSGZ649sUol323hdZO2Xd4CaiTIz5krO/JnQpY85bL/TygFyVYPWk5YCKtrGvysawing6v0q
	H4ODibBK156vKTxWPRNMSoeHc05Wva3s3lBCdhLzPH+jFPYafCbIMPjC2EM9kBLO3TstDY3vtAjXQ
	dXXcnJ/bx970ln903/lGhNo5/YVWbMDAtRY9ZsgWs7/g5LpOcA/4XSq+t5c4SMlDdDDLmcDo1Nu2N
	cM//qBXnWdlepHctwNOcV7UPGtPI5u4qE+h8PO3qMaPuCeurPGBisMgLBPuYq48P8DvhqWBHvZ25u
	ZyKaQeT/cR67Hokv2S6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maCA0-00Blgw-O8; Tue, 12 Oct 2021 07:25:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maC9x-00BlgT-5Z
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 07:25:14 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 904081F42FFF;
 Tue, 12 Oct 2021 08:25:11 +0100 (BST)
Date: Tue, 12 Oct 2021 09:25:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v2 11/14] mtd: spinand: Perform Power-on-Reset on the
 flash in mtd_suspend()
Message-ID: <20211012092508.1647047b@collabora.com>
In-Reply-To: <20211011204619.81893-12-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
 <20211011204619.81893-12-a-nandan@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_002513_379231_5EFB57F0 
X-CRM114-Status: GOOD (  29.50  )
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

On Tue, 12 Oct 2021 02:16:16 +0530
Apurva Nandan <a-nandan@ti.com> wrote:

> A soft reset using FFh command doesn't erase the flash's configuration
> and doesn't reset the SPI IO mode also. This can result in the flash
> being in a different SPI IO mode, e.g. Octal DTR, when resuming from
> sleep. This could put the flash in an unrecognized SPI IO mode, making
> it unusable.
> 
> Perform a Power-on-Reset (PoR), if available in the flash, when
> performing mtd_suspend(). This would set the flash to clean
> state for reinitialization during resume and would also ensure that it
> is in standard SPI IO mode (1S-1S-1S) before the resume begins.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  drivers/mtd/nand/spi/core.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 9b570570ee81..60408531979a 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1316,6 +1316,11 @@ static void spinand_mtd_resume(struct mtd_info *mtd)
>  	int ret;
>  
>  	spinand->reg_proto = SPINAND_SINGLE_STR;
> +	/*
> +	 * PoR Reset (if available by the manufacturer) is performed at the suspend
> +	 * time. Hence, those flashes remain in power-on-state at this point, in a
> +	 * standard SPI IO mode. So, now the core unanimously performs a soft reset.
> +	 */
>  	ret = spinand_reset_op(spinand);
>  	if (ret)
>  		return;
> @@ -1327,6 +1332,21 @@ static void spinand_mtd_resume(struct mtd_info *mtd)
>  	spinand_ecc_enable(spinand, false);
>  }
>  
> +static int spinand_mtd_suspend(struct mtd_info *mtd)
> +{
> +	struct spinand_device *spinand = mtd_to_spinand(mtd);
> +	int ret;
> +
> +	if (!(spinand->flags & SPINAND_HAS_POR_CMD_BIT))
> +		return 0;
> +
> +	ret = spinand_power_on_rst_op(spinand);
> +	if (ret)
> +		dev_err(&spinand->spimem->spi->dev, "suspend() failed\n");
> +
> +	return ret;
> +}

I suspect you need to implement the spi_mem_driver.shutdown() method
and do a PoR in that case too. If the device doesn't support the PoR
command, we should at least switch back to the 1-1-1-STR mode manually.

> +
>  static int spinand_init(struct spinand_device *spinand)
>  {
>  	struct device *dev = &spinand->spimem->spi->dev;
> @@ -1399,6 +1419,7 @@ static int spinand_init(struct spinand_device *spinand)
>  	mtd->_erase = spinand_mtd_erase;
>  	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
>  	mtd->_resume = spinand_mtd_resume;
> +	mtd->_suspend = spinand_mtd_suspend;
>  
>  	if (nand->ecc.engine) {
>  		ret = mtd_ooblayout_count_freebytes(mtd);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
