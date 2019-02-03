Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0C5C169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 10:26:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEE3C20855
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 10:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="donjmrEj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/cVNsSY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEE3C20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PyjJgNPL5J0IBduYryI7Ls8XX3sUYA9njfZQTieaj8=; b=donjmrEjKyU/sH
	tcST/u1B6YxoNus7dpxbK5URE5r4ZK9nXd2Mw9boTL8T7G7Ylz5Vlkklgh6fAkvnsdwzv3yk3MfmC
	1h5j25F0pVh9KeiQsSMQ8d0wdbYNE4fDg8ChW0AF8C01ofrzFkw+GPyJuhgbB1YdAIc8vsXcEsSUj
	tHDYrGydkVB7pkMfHjXcfHF6s5E7VwiH/9tHqvsr1xr40jtGyCltFGbru4RkQC2oQItKQr51RL+cg
	pdd+3TjE57yBzAZ0ahQM+8QTbd7Q7u81Ns/+swbTUVzXRDTY5Pp+fkfNygV3VxJby7avZUzDMwrMV
	mo/siXh+W/L6w33sCT4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqEyN-0004PX-Ol; Sun, 03 Feb 2019 10:25:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqEy8-0004D9-6h; Sun, 03 Feb 2019 10:25:46 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8258920855;
 Sun,  3 Feb 2019 10:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549189543;
 bh=SjK88TvLdzOJBa9K/8vtx9sSV/IoeN/fyPFyvUXlTU4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k/cVNsSYxiIvsUdzT/F34wCUabYYexl9v6FYmerncKRFQ+OtdjCykp2Z/r3POpKgG
 RmP6ICJynQkvCJe6bu+APAupWXUdznrCMk69BGnpX6H9D8B24vF0zrcwWb3pPPYCD6
 0xghyzeqwmLfF9tdu5tb3xHjf/ly/pylo+SdrcHk=
Date: Sun, 3 Feb 2019 11:25:31 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: wen yang <yellowriver2010@hotmail.com>
Subject: Re: [PATCH] mtd: nand: fix object reference leaks in
 atmel_pmecc_get_by_node
Message-ID: <20190203112531.080c15a7@bbrezillon>
In-Reply-To: <HK0PR02MB363421DE59A282A65E86E589B26C0@HK0PR02MB3634.apcprd02.prod.outlook.com>
References: <HK0PR02MB363421DE59A282A65E86E589B26C0@HK0PR02MB3634.apcprd02.prod.outlook.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_022544_380773_D001B4C7 
X-CRM114-Status: GOOD (  18.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 3 Feb 2019 09:37:31 +0000
wen yang <yellowriver2010@hotmail.com> wrote:

> of_find_device_by_node() takes a reference to the struct device
> when it finds a match via get_device, there is no need to call
> get_device() twice.
> We also should make sure to drop the reference to the device
> taken by of_find_device_by_node() on driver unbind.
> 

Missing Fixes tag.

> Signed-off-by: Wen Yang <yellowriver2010@hotmail.com>
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Marek Vasut <marek.vasut@gmail.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/mtd/nand/raw/atmel/pmecc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
> index 555a74e..bee6551 100644
> --- a/drivers/mtd/nand/raw/atmel/pmecc.c
> +++ b/drivers/mtd/nand/raw/atmel/pmecc.c
> @@ -878,14 +878,17 @@ static struct atmel_pmecc *atmel_pmecc_get_by_node(struct device *userdev,
>  	struct atmel_pmecc *pmecc, **ptr;
>  
>  	pdev = of_find_device_by_node(np);
> -	if (!pdev || !platform_get_drvdata(pdev))
> +	if (!pdev)
>  		return ERR_PTR(-EPROBE_DEFER);
> +	if (!platform_get_drvdata(pdev)) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
>  
>  	ptr = devres_alloc(devm_atmel_pmecc_put, sizeof(*ptr), GFP_KERNEL);
>  	if (!ptr)
>  		return ERR_PTR(-ENOMEM);
>  
> -	get_device(&pdev->dev);
>  	pmecc = platform_get_drvdata(pdev);
>  
>  	*ptr = pmecc;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
