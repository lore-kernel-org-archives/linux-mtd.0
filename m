Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E35C3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:52:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3966E206D7
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:52:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R9iMPalp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3966E206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cN6qOk24BEkPbpujgfzeW42E1jrBPEkQLK3SDJDj308=; b=R9iMPalp4YHQHm
	yKN1HRdF03WkXQ1PXYUx+rVRndQDIGS5tr1dDP2vxJbJ0Xm6ADEeb3m94r/sMJ7xCUuRZe3jbNV1W
	CD7ms9K7NwxZAUvkMWXd0+XRKnDTtuSdpZZv1uDG0U1+7uEGttq+jyF3NZ/G9RgWtKMKRxWF3yVT1
	6ZHMUhyYeoX61VxpSYb7zKLFcDlxj6QUTYX7/E1N+FwG8JGGAtCqL4uDu7fvPd7YPP8FDp2LD3eyK
	r5/puIG1EEbspYAPQHaDkJcCFvLh2l4s97VSb/BjggJTuXTaBTY9esf2WXiOU+MrYe0vq1IXXe3gV
	2amQawFfrlcWFKlWMcvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVWpM-000875-4a; Mon, 04 May 2020 08:51:52 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVWpJ-00086H-3e
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 08:51:50 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BCD582A03D3;
 Mon,  4 May 2020 09:51:47 +0100 (BST)
Date: Mon, 4 May 2020 10:51:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 10/13] mtd: rawnand: jedec: Adapt the parameter page
 read to constraint controllers
Message-ID: <20200504105144.6273643b@collabora.com>
In-Reply-To: <20200504082414.7327-11-miquel.raynal@bootlin.com>
References: <20200504082414.7327-1-miquel.raynal@bootlin.com>
 <20200504082414.7327-11-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_015149_284532_6E55F005 
X-CRM114-Status: GOOD (  24.98  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  4 May 2020 10:24:11 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> We already know that there are controllers not able to read the three
> copies of the parameter page in one go. The workaround was to first
> request the controller to assert command and address cycles on the
> NAND bus to trigger a parameter page read, and then do a read
> operation for each page.
> 
> But there are also controllers which are not able to split the
> parameter page read between the command/address cycles and the actual
> data operation.
> 
> Let's use a regular PARAMETER PAGE READ operation for the first
> iteration and use eithe a CHANGE READ COLUMN or a simple DATA READ
> operation for the following copies, depending on what the controller
> supports. The default for non-exec-op compliant drivers remains
> unchanged: use a SIMPLE READ.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_jedec.c | 34 ++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
> index 63069f1948a8..be270b36317e 100644
> --- a/drivers/mtd/nand/raw/nand_jedec.c
> +++ b/drivers/mtd/nand/raw/nand_jedec.c
> @@ -25,8 +25,9 @@ int nand_jedec_detect(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	struct nand_memory_organization *memorg;
> -	struct nand_jedec_params *p;
> +	struct nand_jedec_params *p = NULL, *pbuf;
>  	struct jedec_ecc_info *ecc;
> +	bool use_datain = false;
>  	int jedec_version = 0;
>  	char id[5];
>  	int i, val, ret;
> @@ -40,25 +41,32 @@ int nand_jedec_detect(struct nand_chip *chip)
>  		return 0;
>  
>  	/* JEDEC chip: allocate a buffer to hold its parameter page */
> -	p = kzalloc(sizeof(*p), GFP_KERNEL);
> -	if (!p)
> +	pbuf = kzalloc(sizeof(*pbuf) * JEDEC_PARAM_PAGES, GFP_KERNEL);
> +	if (!pbuf)
>  		return -ENOMEM;
>  
> -	ret = nand_read_param_page_op(chip, 0x40, NULL, 0);
> -	if (ret) {
> -		ret = 0;
> -		goto free_jedec_param_page;
> -	}
> +	if (!nand_has_exec_op(chip) ||
> +	    (nand_read_data_op(chip, &pbuf[0], sizeof(*pbuf), true, true) == 0))
> +		use_datain = true;
>  
>  	for (i = 0; i < JEDEC_PARAM_PAGES; i++) {
> -		ret = nand_read_data_op(chip, p, sizeof(*p), true, false);
> +		if (!i)
> +			ret = nand_read_param_page_op(chip, 0x40, &pbuf[i],
> +						      sizeof(*pbuf));
> +		else if (use_datain)
> +			ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf),
> +						true, false);
> +		else
> +			ret = nand_change_read_column_op(chip, sizeof(*pbuf) * i,
> +							 &pbuf[i], sizeof(*pbuf),
> +							 true);

Now that you only ever read a page at a time, and given you don't do
the majority_bit() thing when all pages are corrupted, I'd suggest
sticking to one sizeof(*p) allocation and getting rid of the pbuf var.

But it's not a big deal, so feel free to add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

if you don't want to send a new version.

>  		if (ret) {
>  			ret = 0;
>  			goto free_jedec_param_page;
>  		}
>  
> -		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)p, 510);
> -		if (crc == le16_to_cpu(p->crc))
> +		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)&pbuf[i], 510);
> +		if (crc == le16_to_cpu(pbuf[i].crc))
>  			break;
>  	}
>  
> @@ -67,6 +75,8 @@ int nand_jedec_detect(struct nand_chip *chip)
>  		goto free_jedec_param_page;
>  	}
>  
> +	p = &pbuf[i];
> +
>  	/* Check version */
>  	val = le16_to_cpu(p->revision);
>  	if (val & (1 << 2))
> @@ -122,6 +132,6 @@ int nand_jedec_detect(struct nand_chip *chip)
>  	ret = 1;
>  
>  free_jedec_param_page:
> -	kfree(p);
> +	kfree(pbuf);
>  	return ret;
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
