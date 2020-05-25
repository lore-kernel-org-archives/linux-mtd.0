Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F429C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 19:09:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD9DD20671
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 19:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G2Zd8zgz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD9DD20671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOFc0009pgv/yVaVtOgpq8nDQ27fybakw0SHKR0W8hE=; b=G2Zd8zgz4yo2Yz
	Qs7/81PD+apwXCUGGBraCK6kIYreSp2IsxXqU39aPCe3n6lMnh9XGQQYXn+7bT8QFFy5yZWhI5CV/
	K/oFrLZpafboG647em9o6SbEnBl98EGLdI2300nLj8B08C4PNqhQOg3vC2JKGc0Yc5oduE5q0WW4G
	4EF0cH41U1ziY3xFDO/CKehj+0b43RYp6fTANW1nmmajCyXqgwEBdNpCSqPOWiQVx0gKrzcEGeCRU
	OkRFxjh4ocncplP3bmOTmDq6SmJGVmnGvGesWgwTyozeO/8fqTSq0tfjvB29IOmyD28OpsPIFIQGj
	owCSSE3xSghTrkdo5mMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdITm-0006yu-F5; Mon, 25 May 2020 19:09:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdITj-0006yH-Dy
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 19:09:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2E68B2A0D6D;
 Mon, 25 May 2020 20:09:38 +0100 (BST)
Date: Mon, 25 May 2020 21:09:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 09/19] mtd: rawnand: Use the data interface mode
 entry when relevant
Message-ID: <20200525210935.40b01b50@collabora.com>
In-Reply-To: <20200525174239.11349-10-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-10-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_120939_603762_177F50AD 
X-CRM114-Status: GOOD (  19.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Rickard Andersson <rickaran@axis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 25 May 2020 19:42:29 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> The data interface setup does not care about the default timing mode
> but cares about the actual timing mode at the time of the call of this
> helper.
> 
> Use this entry instead and let chip->default_timing_mode only be used
> at initialization time.

Yep, that's the right thing to do

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index adbc12580e2e..514ac78899ec 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -951,9 +951,8 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
>   */
>  static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
>  {
> -	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = {
> -		chip->default_timing_mode,
> -	};
> +	u8 mode = chip->data_interface.timings.mode;
> +	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { mode, };
>  	int ret;
>  
>  	if (!nand_has_setup_data_iface(chip))
> @@ -987,9 +986,9 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
>  	if (ret)
>  		goto err_reset_chip;
>  
> -	if (tmode_param[0] != chip->default_timing_mode) {
> +	if (tmode_param[0] != mode) {
>  		pr_warn("timing mode %d not acknowledged by the NAND chip\n",
> -			chip->default_timing_mode);
> +			mode);
>  		goto err_reset_chip;
>  	}
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
