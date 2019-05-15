Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3CBC04AA7
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 06:52:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 202E22084F
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 06:52:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WsyPS6Zz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 202E22084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JN4TVFKDhsB+9HAexL0HHuZCyN7fulFmnUu5iClj0wY=; b=WsyPS6Zz8WnP/Q
	PfiS6zg6F7VHMVwng4flZYP3V4u2NrYrrhmKtVPTD6cxIPNwLa6X7gNcmkUY4mzvV9+5OPc4MXE+U
	HEqm5k05rUjqODo/iHyCIhFmZyShnplHPyJJ89bL/NGw3PiO7h96VcGDn82cIi1xpPgVjurg9WQuv
	8ydVUSZFOZaG1cH439NUOjEbWCeK9bR1FTzcI3hHsw1RGGrzhAL9lQN2jhfPqXaQxEyl4hpYfHg7C
	2oSbS6cZw/C/qAsN29d8u33l7S/oa9ATLyQbXjIfONVWTcciz0pYOKXjeTVzXwqhJ3pmOGU3FuvI4
	8Be3ddmbDo8C3lDj1ObQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQnls-0000o5-2a; Wed, 15 May 2019 06:52:12 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQnlp-0000nG-0V
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 06:52:10 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id AC04224E2491;
 Wed, 15 May 2019 08:52:06 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 15 May
 2019 08:52:06 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Wed, 15 May 2019 08:52:06 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Jeff Kletsky <lede@allycomm.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: spinand: Add support for two-byte device IDs
Thread-Topic: [PATCH v2 2/3] mtd: spinand: Add support for two-byte device IDs
Thread-Index: AQHVCp/WPaZWYiYCKEGU6+s/F1KvdqZrnqKA
Date: Wed, 15 May 2019 06:52:06 +0000
Message-ID: <b7d79b90-a690-6b31-662e-6ad63eb93b50@kontron.de>
References: <20190514215315.19228-1-lede@allycomm.com>
 <20190514215315.19228-3-lede@allycomm.com>
In-Reply-To: <20190514215315.19228-3-lede@allycomm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <3BAF618DD1E9414784A6D8C384C38383@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: AC04224E2491.A8D1F
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, lede@allycomm.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_235209_372966_3685C676 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 14.05.19 23:53, Jeff Kletsky wrote:
> From: Jeff Kletsky <git-commits@allycomm.com>
> 
> The GigaDevice GD5F1GQ4UFxxG SPI NAND utilizes two-byte device IDs.
> 
> http://www.gigadevice.com/datasheet/gd5f1gq4xfxxg/
> 
> Signed-off-by: Jeff Kletsky <git-commits@allycomm.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

> ---
>   drivers/mtd/nand/spi/core.c | 2 +-
>   include/linux/mtd/spinand.h | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index fa87ae28cdfe..a13154785dad 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -853,7 +853,7 @@ spinand_select_op_variant(struct spinand_device *spinand,
>    */
>   int spinand_match_and_init(struct spinand_device *spinand,
>   			   const struct spinand_info *table,
> -			   unsigned int table_size, u8 devid)
> +			   unsigned int table_size, u16 devid)
>   {
>   	struct nand_device *nand = spinand_to_nand(spinand);
>   	unsigned int i;
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 05fe98eebe27..8901ba272538 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -290,7 +290,7 @@ struct spinand_ecc_info {
>    */
>   struct spinand_info {
>   	const char *model;
> -	u8 devid;
> +	u16 devid;
>   	u32 flags;
>   	struct nand_memory_organization memorg;
>   	struct nand_ecc_req eccreq;
> @@ -445,7 +445,7 @@ static inline void spinand_set_of_node(struct spinand_device *spinand,
>   
>   int spinand_match_and_init(struct spinand_device *dev,
>   			   const struct spinand_info *table,
> -			   unsigned int table_size, u8 devid);
> +			   unsigned int table_size, u16 devid);
>   
>   int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
>   int spinand_select_target(struct spinand_device *spinand, unsigned int target);
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
