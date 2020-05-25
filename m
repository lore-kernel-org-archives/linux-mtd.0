Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A92C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 19:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B61206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 19:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EUlIJRQz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10B61206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tvz9iGxHRn4XxIaWgAP2LivnGPdw6CZmlBW58fgQKU=; b=EUlIJRQzzGx41H
	ftUB6qPKE+z8Ird7QpSne5FNr+5TiyxvyxrOreCe9hEoZvhPDUkYcr1HfBszI52K4oziFv5LCdHat
	Q0YbAT5qW3MmR6VJDdprxexOsl8p+TtbqhLM9KkAmZTUb59xBvxiofeeMEVZZVY1bdk++84q+3cK9
	Ssytrhf1sg8kj3Hofk0JtcqKpzl0SlwfxZA/hzap6SOy9f/1ruiGa8TKvJ8SKs010C3IyDxrGwUXO
	dMJMy5EkXnj8z3Obx+aTT432eUT6Oe9j6xC32FTl3OfzOabAm1yv5kG7fvHiLRZq4qZEapCq0uDEj
	7Jg7yXEkOGqGr4mcrbuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdIbV-0004dS-M6; Mon, 25 May 2020 19:17:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdIbS-0004cq-Mt
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 19:17:40 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5F9F62A078D;
 Mon, 25 May 2020 20:17:37 +0100 (BST)
Date: Mon, 25 May 2020 21:17:34 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 12/19] mtd: rawnand: Rename nand_init_data_interface()
Message-ID: <20200525211734.3555265a@collabora.com>
In-Reply-To: <20200525174239.11349-13-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-13-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_121738_877571_13913BEA 
X-CRM114-Status: GOOD (  19.70  )
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

On Mon, 25 May 2020 19:42:32 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This name is a bit misleading, what we do in this helper is trying to
> find the best timings supported by the controller and the chip. In
> other words, we choose the data interface.

Well, we currently only choose the best SDR timings, not the best data
interface config (which would imply selecting between SDR and DDR). I
do agree that it's what we're aiming at, but saying that we choose the
best interface config is a bit of lie :-).

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Other than the inaccuracy in the commit message, the change itself
makes sense:

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index c8f5d4557ed5..ac08d1fc710a 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1005,7 +1005,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
>  }
>  
>  /**
> - * nand_init_data_interface - find the best data interface and timings
> + * nand_choose_data_interface - find the best data interface and timings
>   * @chip: The NAND chip
>   *
>   * Find the best data interface and NAND timings supported by the chip
> @@ -1017,7 +1017,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
>   *
>   * Returns 0 for success or negative error code otherwise.
>   */
> -static int nand_init_data_interface(struct nand_chip *chip)
> +static int nand_choose_data_interface(struct nand_chip *chip)
>  {
>  	int modes, mode, ret;
>  
> @@ -6045,8 +6045,8 @@ static int nand_scan_tail(struct nand_chip *chip)
>  	if (!mtd->bitflip_threshold)
>  		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
>  
> -	/* Initialize the ->data_interface field. */
> -	ret = nand_init_data_interface(chip);
> +	/* Find the fastest data interface for this chip */
> +	ret = nand_choose_data_interface(chip);
>  	if (ret)
>  		goto err_nanddev_cleanup;
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
