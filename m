Return-Path: <SRS0=IAjr=6J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251CFC55185
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 08:45:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC312206ED
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 08:45:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bgN9OWxK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC312206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PafmnnGfVyR6xVzAsVXhJOd4cyqMxuNnq8FRFgLrsR4=; b=bgN9OWxKauibwm
	alebRZZefi0MKZ0IKBgJuoIuSWlzPnnM+D+uBdkFECZGhWyMkyjzpdCPCaO90j7PYYb2ga8ByluD1
	+O9RPRAcb3Z8sUKF1hwJNFAQkimJcjixsBm3OT8p6y2f2TWrFuwHB+bv1dUh3TzJogl8ROmeQWbcY
	cLoR4sROpmMxZx7jSy08TP91D31ut1weBdLr9lOwKWPjj+Jkb60xK24YhWfG+LE1rxwIztsNR0T/+
	BzM+oKYvM8lASK9c6CCz/JrBuUz6PyAhNHqZcMOdhVw7JOKeHqxS9vzH9T46c9a7zbglYu0hvIa/6
	xOpBT3XB03ekDdz2XH/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSGQa-0008Mv-Gc; Sat, 25 Apr 2020 08:44:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSGQX-0008MR-Ch
 for linux-mtd@lists.infradead.org; Sat, 25 Apr 2020 08:44:47 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A9FDA2A2F11;
 Sat, 25 Apr 2020 09:44:43 +0100 (BST)
Date: Sat, 25 Apr 2020 10:44:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 05/10] mtd: rawnand: Rename the use_bufpoi variables
Message-ID: <20200425104440.5a3144fe@collabora.com>
In-Reply-To: <20200424173631.14311-6-miquel.raynal@bootlin.com>
References: <20200424173631.14311-1-miquel.raynal@bootlin.com>
 <20200424173631.14311-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_014445_699835_90997652 
X-CRM114-Status: GOOD (  23.70  )
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
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 24 Apr 2020 19:36:26 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Both in nand_do_read_ops() and nand_do_write_ops() there is a boolean
> called use_bufpoi which is set to true in case of unaligned request or
> when there is a need for a DMA-able buffer. It basically means "use a
> bounce buffer".
> 
> Depending on the value of use_bufpoi, the bufpoi variable is always
> used and will either point to the original buffer or to the nand_chip
> structure "internal data buffer" (this buffer is allocated with
> kmalloc() on purpose so that it will be DMA-compliant).
> 
> In all cases bufpoi is used so the boolean name is misleading. Rename
> use_bufpoi to be use_bouce_buf to be more accurate.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

I wonder if we shouldn't find a better name for bufpoi too. Not sure
what the poi means here (pointer?). So maybe just rename those into
read_buf, write_buf (since buf seems to be declared already).

> ---
>  drivers/mtd/nand/raw/nand_base.c | 34 ++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 4d8a4a20df63..0e2dd4c1b44c 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -3166,7 +3166,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
>  	uint32_t max_oobsize = mtd_oobavail(mtd, ops);
>  
>  	uint8_t *bufpoi, *oob, *buf;
> -	int use_bufpoi;
> +	int use_bounce_buf;
>  	unsigned int max_bitflips = 0;
>  	int retry_mode = 0;
>  	bool ecc_fail = false;
> @@ -3190,19 +3190,19 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
>  		aligned = (bytes == mtd->writesize);
>  
>  		if (!aligned)
> -			use_bufpoi = 1;
> +			use_bounce_buf = 1;
>  		else if (chip->options & NAND_USE_DMA_BUFFER)
> -			use_bufpoi = !virt_addr_valid(buf) ||
> -				     !IS_ALIGNED((unsigned long)buf,
> -						 chip->buf_align);
> +			use_bounce_buf = !virt_addr_valid(buf) ||
> +					 !IS_ALIGNED((unsigned long)buf,
> +						     chip->buf_align);
>  		else
> -			use_bufpoi = 0;
> +			use_bounce_buf = 0;
>  
>  		/* Is the current page in the buffer? */
>  		if (realpage != chip->pagecache.page || oob) {
> -			bufpoi = use_bufpoi ? chip->data_buf : buf;
> +			bufpoi = use_bounce_buf ? chip->data_buf : buf;
>  
> -			if (use_bufpoi && aligned)
> +			if (use_bounce_buf && aligned)
>  				pr_debug("%s: using read bounce buffer for buf@%p\n",
>  						 __func__, buf);
>  
> @@ -3223,7 +3223,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
>  				ret = chip->ecc.read_page(chip, bufpoi,
>  							  oob_required, page);
>  			if (ret < 0) {
> -				if (use_bufpoi)
> +				if (use_bounce_buf)
>  					/* Invalidate page cache */
>  					chip->pagecache.page = -1;
>  				break;
> @@ -3233,7 +3233,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
>  			 * Copy back the data in the initial buffer when reading
>  			 * partial pages or when a bounce buffer is required.
>  			 */
> -			if (use_bufpoi) {
> +			if (use_bounce_buf) {
>  				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
>  				    !(mtd->ecc_stats.failed - ecc_failures) &&
>  				    (ops->mode != MTD_OPS_RAW)) {
> @@ -4015,23 +4015,23 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
>  	while (1) {
>  		int bytes = mtd->writesize;
>  		uint8_t *wbuf = buf;
> -		int use_bufpoi;
> +		int use_bounce_buf;
>  		int part_pagewr = (column || writelen < mtd->writesize);
>  
>  		if (part_pagewr)
> -			use_bufpoi = 1;
> +			use_bounce_buf = 1;
>  		else if (chip->options & NAND_USE_DMA_BUFFER)
> -			use_bufpoi = !virt_addr_valid(buf) ||
> -				     !IS_ALIGNED((unsigned long)buf,
> -						 chip->buf_align);
> +			use_bounce_buf = !virt_addr_valid(buf) ||
> +					 !IS_ALIGNED((unsigned long)buf,
> +						     chip->buf_align);
>  		else
> -			use_bufpoi = 0;
> +			use_bounce_buf = 0;
>  
>  		/*
>  		 * Copy the data from the initial buffer when doing partial page
>  		 * writes or when a bounce buffer is required.
>  		 */
> -		if (use_bufpoi) {
> +		if (use_bounce_buf) {
>  			pr_debug("%s: using write bounce buffer for buf@%p\n",
>  					 __func__, buf);
>  			if (part_pagewr)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
