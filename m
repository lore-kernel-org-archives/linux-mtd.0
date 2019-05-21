Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41B2C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 868EE216B7
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 08:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F0oEhHvU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 868EE216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxFyLR6IMyz1VhiBX1Uogc7ayvlHBLEZSUpmuaBA8fY=; b=F0oEhHvUQRFUoB
	XMbqi/terFyRkDyus3tBdyY1sJf0jsoAFQnoWyA1MocmxumeAy1Nn5ZS6b7a4rVkCGKlsyC+J/0/Y
	iOm8CjB4hg6ofSxzilyXoaykKU5nP+CwZwPgF0y2z1vUYwUfoH2xXcSIsyV/Sf7Vb9wDXjT+hUlsF
	0KTPrN9MGg8YixA4ab8zoxzYT1+PkhkJoHaa9JDxIRCqqdhIsZI7FAbb2muEtof8DtoVWqbufh7zb
	iKy3kokXP4GAgX8YjmNXIpzK30rtjeJevAmcPmSANTGKp+zl/61AK6OJY4qWV1DSsQ+9hXOGCKuow
	i15MeCSeLmw9DMOzIAAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT08I-0005Sw-GF; Tue, 21 May 2019 08:28:26 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT08F-0005Rb-4g
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 08:28:25 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id CAAE4661183;
 Tue, 21 May 2019 10:28:11 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 21 May
 2019 10:28:11 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Tue, 21 May 2019 10:28:11 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Sascha Hauer <s.hauer@pengutronix.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: rawnand: initialize ntargets with maxchips
Thread-Topic: [PATCH] mtd: rawnand: initialize ntargets with maxchips
Thread-Index: AQHVD62xHqqsWJwxXU+40Fy31j0KXKZ1HVwA
Date: Tue, 21 May 2019 08:28:11 +0000
Message-ID: <6b610b81-2fae-571f-f1fe-3f7f3dd07163@kontron.de>
References: <20190521081721.541-1-s.hauer@pengutronix.de>
In-Reply-To: <20190521081721.541-1-s.hauer@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <FBB3F51977F59F4A830BECE5E073A642@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: CAAE4661183.AE8C6
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 richard@nod.at, s.hauer@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_012823_509949_5BF4E4FC 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 21.05.19 10:17, Sascha Hauer wrote:
> memorg->ntargets is initialized with '1'. It should be initialized with
> the maxchips argument from nand_scan() instead. Otherwise multi chip
> support errors out on the secondary chip selects when trying to call
> nand_reset() on them:
> 
> WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/internals.h:114
> nand_reset_op+0x194/0x1c4
> 
> With this memorg->ntargets is initialized with the maximum number of
> chip selects supported by the driver. After having detected the number
> of actually connected chips memory->ntargets is updated with that
> number.
> 
> Fixes: 2813e288414 ("mtd: rawnand: Get rid of chip->numchips")
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

Thanks for reporting/fixing this.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/mtd/nand/raw/nand_base.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 7db0f04cf52b..0c717f3fb906 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4621,7 +4621,8 @@ nand_manufacturer_name(const struct nand_manufacturer *manufacturer)
>   /*
>    * Get the flash and manufacturer id and lookup if the type is supported.
>    */
> -static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
> +static int nand_detect(struct nand_chip *chip, unsigned int maxchips,
> +		       struct nand_flash_dev *type)
>   {
>   	const struct nand_manufacturer *manufacturer;
>   	struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -4638,7 +4639,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>   	memorg = nanddev_get_memorg(&chip->base);
>   	memorg->planes_per_lun = 1;
>   	memorg->luns_per_target = 1;
> -	memorg->ntargets = 1;
> +	memorg->ntargets = maxchips;
>   
>   	/*
>   	 * Reset the chip, required by some chips (e.g. Micron MT29FxGxxxxx)
> @@ -5004,7 +5005,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
>   		return ret;
>   
>   	/* Read the flash type */
> -	ret = nand_detect(chip, table);
> +	ret = nand_detect(chip, maxchips, table);
>   	if (ret) {
>   		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
>   			pr_warn("No NAND device found\n");
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
