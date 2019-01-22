Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05025C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:29:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72A62084C
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 16:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gw6JTarR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhBF2L5P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C72A62084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrT5KKFwK7wkQGhEJr7210uc7Mm58DcgiotOBEFluOY=; b=Gw6JTarRsZ1aJI
	H+mcn2pUtExgshNtzWC40svBTyzfHYMg+joE8ZLlia9cFtTgQpL9PtEDwqzRW65OE7a/cr2ydDsjZ
	fM1RO/fF0eB5tKBtu18nkm01cNUj5zHlJz3ALNMVvh8hOB15Jb5X1iXdIsefPErrv53U4/vkf6kam
	ZDN2XkaV847r3hDxeoDwkiec6i23hDqSNBXxVNRWxmj1aUTnLsOUvRerUnaAVjmsOxZtKsteK1n+a
	uTUolurbsXQA0cNVNVvzw2+osMf8sbJgJPWjnM9MhIE3F7oOSYHBEcJ8AZklYRYNwrk1TJz5XD9GP
	510bu8G162nLWJ3Un6DQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glyv2-0006Ld-5w; Tue, 22 Jan 2019 16:28:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glyuz-0006LG-NM
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 16:28:55 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2E0A2085A;
 Tue, 22 Jan 2019 16:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548174533;
 bh=ZI+xnBU5OJzwlF+oyj/gaqOn1LGJeEAsSOJfjTpm780=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lhBF2L5PZ/xYEHwP5t3tfjbWIRIPQsdyA9tWr3X+SeUfKnB7eru/rLrch2Sk6xo/v
 YXnKQhOJ69LrB2OJbQuax+JRenVZu/ooiS2xhIl5enoqFFLLX0xTax8lfDeSAlud4j
 ZL4mjT2l2b3Ili2qd6lXTy989HLXuyogwfZ99dps=
Date: Tue, 22 Jan 2019 17:28:42 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH v2 4/4] mtd: rawnand: AMD: Also use the last page for
 bad block markers
Message-ID: <20190122172842.0c36876f@bbrezillon>
In-Reply-To: <20190122112258.20042-5-frieder.schrempf@kontron.de>
References: <20190122112258.20042-1-frieder.schrempf@kontron.de>
 <20190122112258.20042-5-frieder.schrempf@kontron.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_082853_774062_A503C02B 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 22 Jan 2019 11:23:33 +0000
Schrempf Frieder <frieder.schrempf@kontron.de> wrote:

> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> According to the datasheet of some Cypress SLC NANDs, the bad
> block markers can be in the first, second or last page of a block.
> So let's check all three locations.
> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

> ---
>  drivers/mtd/nand/raw/nand_amd.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_amd.c b/drivers/mtd/nand/raw/nand_amd.c
> index 6202cbf7ee8d..2ffcddff3e27 100644
> --- a/drivers/mtd/nand/raw/nand_amd.c
> +++ b/drivers/mtd/nand/raw/nand_amd.c
> @@ -40,7 +40,13 @@ static void amd_nand_decode_id(struct nand_chip *chip)
>  static int amd_nand_init(struct nand_chip *chip)
>  {
>  	if (nand_is_slc(chip))
> -		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE;
> +		/*
> +		 * According to the datasheet of some Cypress SLC NANDs,
> +		 * the bad block markers can be in the first, second or last
> +		 * page of a block. So let's check all three locations.
> +		 */
> +		chip->options |= NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE |
> +				 NAND_BBM_LASTPAGE;
>  
>  	return 0;
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
