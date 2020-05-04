Return-Path: <SRS0=hi6L=6S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609BAC3A5A9
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:47:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F03206D7
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2020 08:47:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HShiF1Hk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F03206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UeWwY1rIcbP0dq5uRe5RwroBPqNfWt4iauj9wBgpozo=; b=HShiF1HkUi7trQ
	cdGqJth7mfCcQQ11eelu/eX1Zq0RSyZ1wqSpLSecAFYKUfYU6uHq1J2fUVBC9ED7RiDe4CLV7ba4j
	RxW2d+3tji9uFbadv85+BIMYkOrK9TQ+vh/LuAAT1iWRLqGMxlvFJVKGal2bpdGWGb9GnxbJaT/Hl
	TaVH5XGVXk+awu0Q6bXgi2//+4Ubgks2RlMzLGngooAEZUfzXsiq4whE5ve4y7qCEpQS2kdApczX6
	5VA1gyq/use2iWy9x7OkgavuCZjyl1GwonSN87AsP5d/SpslNpeGEvDUoVGFnNjpxR6ZM3ABnc2qe
	dYIl0Ty2hoclnzN4TpXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVWl9-00041b-5p; Mon, 04 May 2020 08:47:31 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVWl6-00040A-8T
 for linux-mtd@lists.infradead.org; Mon, 04 May 2020 08:47:29 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 18BD32A0E11;
 Mon,  4 May 2020 09:47:26 +0100 (BST)
Date: Mon, 4 May 2020 10:47:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 09/13] mtd: rawnand: onfi: Adapt the parameter page
 read to constraint controllers
Message-ID: <20200504104722.5dfe66eb@collabora.com>
In-Reply-To: <20200504082414.7327-10-miquel.raynal@bootlin.com>
References: <20200504082414.7327-1-miquel.raynal@bootlin.com>
 <20200504082414.7327-10-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_014728_430225_75923DBB 
X-CRM114-Status: GOOD (  22.80  )
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

On Mon,  4 May 2020 10:24:10 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> We already know that there are controllers not able to read the three
> copies of the parameter page in one go. The workaround was to first
> request the controller to assert command and address cycles on the
> NAND bus to trigger a parameter page read, and then do a simple read
> operation for each page.
> 
> But there are also controllers which are not able to split the
> parameter page read between the command/address cycles and the actual
> data operation.
> 
> Let's use a regular PARAMETER PAGE READ operation for the first
> iteration and use either a CHANGE READ COLUMN or a simple DATA READ
> operation for the following copies, depending on what the controller
> supports. The default behavior for non-exec-op compliant drivers
> remains the same: DATA READ.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_onfi.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
> index e6ffbe8c9a0c..49cb04c02e9f 100644
> --- a/drivers/mtd/nand/raw/nand_onfi.c
> +++ b/drivers/mtd/nand/raw/nand_onfi.c
> @@ -143,6 +143,7 @@ int nand_onfi_detect(struct nand_chip *chip)
>  	struct nand_memory_organization *memorg;
>  	struct nand_onfi_params *p = NULL, *pbuf;
>  	struct onfi_params *onfi;
> +	bool use_datain = false;
>  	int onfi_version = 0;
>  	char id[4];
>  	int i, ret, val;
> @@ -160,15 +161,21 @@ int nand_onfi_detect(struct nand_chip *chip)
>  	if (!pbuf)
>  		return -ENOMEM;
>  
> -	ret = nand_read_param_page_op(chip, 0, NULL, 0);
> -	if (ret) {
> -		ret = 0;
> -		goto free_onfi_param_page;
> -	}
> +	if (!nand_has_exec_op(chip) ||
> +	    (nand_read_data_op(chip, &pbuf[0], sizeof(*pbuf), true, true) == 0))

Just nitpicking, but isn't checkpatch complaining about unneeded parens?
Any reason you didn't use

	    !nand_read_data_op(chip, &pbuf[0], sizeof(*pbuf), true, true)

here?

The rest looks good,

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> +		use_datain = true;
>  
>  	for (i = 0; i < ONFI_PARAM_PAGES; i++) {
> -		ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf), true,
> -					false);
> +		if (!i)
> +			ret = nand_read_param_page_op(chip, 0, &pbuf[i],
> +						      sizeof(*pbuf));
> +		else if (use_datain)
> +			ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf),
> +						true, false);
> +		else
> +			ret = nand_change_read_column_op(chip, sizeof(*pbuf) * i,
> +							 &pbuf[i], sizeof(*pbuf),
> +							 true);
>  		if (ret) {
>  			ret = 0;
>  			goto free_onfi_param_page;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
