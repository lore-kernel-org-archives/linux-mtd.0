Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A101C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 06:55:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B4D561040
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 06:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B4D561040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4L1qHqncEx5sliu23hyRsbW4cqXV25tro48IetbMiug=; b=fxBeWNgKVZpCYs
	NZSLFmXYu0cy3dMlkQuRNHoXMuV7zQIVdTjdPZBigWq3ikcthaskYthcIUSP11t/t7qarwQzu65DB
	sgJ/h2ucd1Cx8mbqW78sJojWdJZu9FeeGUUhpJwLOr0TN+qonOp4IwO56ThfnD+1702yy/cNclndt
	2YzV08Cez1Ley+WTdO+X4r8uv4O+T5TqkXlCBu7AaOXBv9IuwNrCHDbxMXk88g8TgKalKKgh0c3XU
	1jGRFo4/+mFziz3A5VqPj9sdyIZLRQcxUxvgH3cnqjalpQ74WCjWYehdtBV3OgZhpQpacyRg11Esv
	9KEEsRypXpjpU2MJ9J0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maBgR-00BimR-6n; Tue, 12 Oct 2021 06:54:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maBgO-00BilA-Jf
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 06:54:42 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E611E1F410A6;
 Tue, 12 Oct 2021 07:54:38 +0100 (BST)
Date: Tue, 12 Oct 2021 08:54:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v2 05/14] mtd: spinand: Add adjust_op() in
 manufacturer_ops to modify the ops for manufacturer specific changes
Message-ID: <20211012085435.1aedfb7f@collabora.com>
In-Reply-To: <20211011204619.81893-6-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
 <20211011204619.81893-6-a-nandan@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_235440_814372_E23B9CE7 
X-CRM114-Status: GOOD (  24.17  )
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

On Tue, 12 Oct 2021 02:16:10 +0530
Apurva Nandan <a-nandan@ti.com> wrote:

> Manufacturers might use a variation of standard SPI NAND flash
> instructions, e.g. Winbond W35N01JW changes the dummy cycle length for
> read register commands when in Octal DTR mode.
> 
> Add new function in manufacturer_ops: adjust_op(), which can be called
> to correct the spi_mem op for any alteration in the instruction made by
> the manufacturers. And hence, this function can also be used for
> incorporating variations of SPI instructions in Octal DTR mode.

Okay, so now we have reg accesses differing between vendors in DTR.
Looks like we should have an OP-table for non-IO commands too (similar
to the op_variants mechanism we have for IO commands), at least when
operating in DTR. The reg access path would just end up doing:

	struct spi_mem_op op =
		spinand->templates[spinand->protocol][cmd];

This way you get rid of all this live-patching/vendor-specific
adjustment (which is likely to get more and more complex since flash
vendors have a tendency of diverging from the common behavior), and
everything gets initialized at probe time.

> 
> Datasheet: https://www.winbond.com/export/sites/winbond/datasheet/W35N01JW_Datasheet_Brief.pdf
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  drivers/mtd/nand/spi/core.c | 3 +++
>  include/linux/mtd/spinand.h | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 4da794ae728d..8e6cf7941a0f 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -61,6 +61,9 @@ static void spinand_patch_op(const struct spinand_device *spinand,
>  		op->data.buswidth = op_buswidth;
>  		op->data.dtr = op_is_dtr;
>  	}
> +
> +	if (spinand->manufacturer->ops->adjust_op)
> +		spinand->manufacturer->ops->adjust_op(op, spinand->reg_proto);
>  }
>  
>  static void spinand_patch_reg_op(const struct spinand_device *spinand,
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index f6093cd98d7b..ebb19b2cec84 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -257,6 +257,8 @@ struct spinand_devid {
>  /**
>   * struct manufacurer_ops - SPI NAND manufacturer specific operations
>   * @init: initialize a SPI NAND device
> + * @adjust_op: modify the ops for any variation in their cmd, address, dummy or
> + *	       data phase by the manufacturer
>   * @cleanup: cleanup a SPI NAND device
>   *
>   * Each SPI NAND manufacturer driver should implement this interface so that
> @@ -264,6 +266,8 @@ struct spinand_devid {
>   */
>  struct spinand_manufacturer_ops {
>  	int (*init)(struct spinand_device *spinand);
> +	void (*adjust_op)(struct spi_mem_op *op,
> +			  const enum spinand_proto reg_proto);
>  	void (*cleanup)(struct spinand_device *spinand);
>  };
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
