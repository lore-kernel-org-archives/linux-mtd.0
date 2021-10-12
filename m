Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B34FC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 07:14:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E0760EB4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 07:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0E0760EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oKbFqndRAOuKbv7v2AD2Tv3xC/+Li0hRPttCm8oNxE=; b=yWHuJfUEKucpKk
	pK6+8CQbF8nQ/7vAfa/D3lgXUO8h1cqziyr2SuuN7O1wrf6VxTd2gs5mKasV7024+kQ95N736DgL1
	hKCsAqGqgu27pluHO/V6IE1qKAsapSsUVEiqL7A/3owBh4aXm3cuDSoeuWUzrwFcqukDkHeqCt0vV
	OD/FqJCLD1jjpsnPV3Hf1azbX9SBrtf8sEShSPR2k3p7IsqjRLwuV6n9gJPJzKXpEevjitRMtmvoj
	aPaPlYPSQky+eZ2chAOeMuD8gS08etvj4bDIlW1dUaTc84zY7Au2Yf4fW8GjGQSAjOJ0LHAcaMTbu
	mhJ1QMBdM+MMqJxk0GTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maBzT-00BkFT-GK; Tue, 12 Oct 2021 07:14:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maBzQ-00BkEz-8w
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 07:14:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2C37C1F4339C;
 Tue, 12 Oct 2021 08:14:18 +0100 (BST)
Date: Tue, 12 Oct 2021 09:14:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown
 <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <p.yadav@ti.com>
Subject: Re: [PATCH v2 07/14] mtd: spinand: Allow enabling Octal DTR mode in
 the core
Message-ID: <20211012091415.4fa0ce7c@collabora.com>
In-Reply-To: <20211011204619.81893-8-a-nandan@ti.com>
References: <20211011204619.81893-1-a-nandan@ti.com>
 <20211011204619.81893-8-a-nandan@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_001420_619850_F08591E7 
X-CRM114-Status: GOOD (  35.35  )
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

On Tue, 12 Oct 2021 02:16:12 +0530
Apurva Nandan <a-nandan@ti.com> wrote:

> Enable Octal DTR SPI mode, i.e. 8D-8D-8D mode, if the SPI NAND flash
> device supports it. Mixed OSPI (1S-1S-8S & 1S-8S-8S), mixed DTR modes
> (1S-1D-8D), etc. aren't supported yet.
> 
> The method to switch to Octal DTR SPI mode may vary across
> manufacturers. For example, for Winbond, it is enabled by writing
> values to the volatile configuration register. So, let the
> manufacturer's code have their own implementation for switching to
> Octal DTR SPI mode.
> 
> Check for the SPI NAND device's support for Octal DTR mode using
> spinand flags, and if the op_templates allows 8D-8D-8D, call
> octal_dtr_enable() manufacturer op. If the SPI controller doesn't
> supports these modes, the selected op_templates will prevent switching
> to the Octal DTR mode. And finally update the spinand reg_proto
> on success.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  drivers/mtd/nand/spi/core.c | 46 +++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spinand.h |  3 +++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 8e6cf7941a0f..1210946f8447 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -257,6 +257,48 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
>  			       enable ? CFG_QUAD_ENABLE : 0);
>  }
>  
> +static bool spinand_op_is_octal_dtr(const struct spi_mem_op *op)
> +{
> +	return  op->cmd.buswidth == 8 && op->cmd.dtr &&
> +		op->addr.buswidth == 8 && op->addr.dtr &&
> +		op->data.buswidth == 8 && op->data.dtr;
> +}
> +
> +static int spinand_init_octal_dtr_enable(struct spinand_device *spinand)

I see no spinand_octal_dtr_disable(), and I feel like we'll want to get
back to single-STR mode just before rebooting/kexec-ing, or if/when
we need to execute other maintenance operations. Actually, I think we
should have something more generic to enter a new mode (see below
for a detailed explanation).

> +{
> +	struct device *dev = &spinand->spimem->spi->dev;
> +	int ret;
> +
> +	if (!(spinand->flags & SPINAND_HAS_OCTAL_DTR_BIT))
> +		return 0;
> +
> +	if (!(spinand_op_is_octal_dtr(spinand->op_templates.read_cache) &&
> +	      spinand_op_is_octal_dtr(spinand->op_templates.write_cache) &&
> +	      spinand_op_is_octal_dtr(spinand->op_templates.update_cache)))
> +		return 0;

Ok, so you check the controller-side octal-DTR capability when selecting
the read/write/update_cache variants, but what if other commands (reg
access, erase, ...) can't be issued in this mode? I really think all
the commands you might use should be tested at probe time, not just
these 3 operations.

> +
> +	if (!spinand->manufacturer->ops->octal_dtr_enable) {
> +		dev_dbg(dev,
> +			"Missing ->octal_dtr_enable(), unable to switch mode\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = spinand->manufacturer->ops->octal_dtr_enable(spinand);
> +	if (ret) {
> +		dev_err(dev,
> +			"Failed to enable Octal DTR SPI mode (err = %d)\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	spinand->reg_proto = SPINAND_OCTAL_DTR;
> +
> +	dev_dbg(dev,
> +		"%s SPI NAND switched to Octal DTR SPI (8D-8D-8D) mode\n",
> +		spinand->manufacturer->name);
> +	return 0;
> +}
> +
>  static int spinand_ecc_enable(struct spinand_device *spinand,
>  			      bool enable)
>  {
> @@ -1192,6 +1234,10 @@ static int spinand_init_flash(struct spinand_device *spinand)
>  	if (ret)
>  		return ret;
>  
> +	ret = spinand_init_octal_dtr_enable(spinand);
> +	if (ret)
> +		return ret;
> +

Why not delaying the 'enter fastest available mode' at the end of this
initialization? I fear some flashes won't support some of the
maintenance commands in 8-8-8-DTR, so it's probably safer to enter it
once you've initialized everything else.

>  	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
>  	if (ret)
>  		return ret;
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 35816b8cfe81..daa2ac5c3110 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -271,6 +271,7 @@ struct spinand_devid {
>   * @init: initialize a SPI NAND device
>   * @adjust_op: modify the ops for any variation in their cmd, address, dummy or
>   *	       data phase by the manufacturer
> + * @octal_dtr_enable: switch the SPI NAND flash into Octal DTR SPI mode
>   * @cleanup: cleanup a SPI NAND device
>   *
>   * Each SPI NAND manufacturer driver should implement this interface so that
> @@ -280,6 +281,7 @@ struct spinand_manufacturer_ops {
>  	int (*init)(struct spinand_device *spinand);
>  	void (*adjust_op)(struct spi_mem_op *op,
>  			  const enum spinand_proto reg_proto);
> +	int (*octal_dtr_enable)(struct spinand_device *spinand);

I'd probably opt for a more generic name and pass the spinand_protocol
you want to enter in:

	int (*change_mode)(struct spinand_device *spinand,
			   enum spinand_protocol proto);

This way we can get back to 1-1-1-STR if we have to, and we can also
easily extend the logic to support 4-4-4-STR and 8-8-8-STR, which,
IIRC, are a thing (at least they exist on SPI NORs).

>  	void (*cleanup)(struct spinand_device *spinand);
>  };
>  
> @@ -348,6 +350,7 @@ struct spinand_ecc_info {
>  
>  #define SPINAND_HAS_QE_BIT		BIT(0)
>  #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
> +#define SPINAND_HAS_OCTAL_DTR_BIT	BIT(2)
>  
>  /**
>   * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
