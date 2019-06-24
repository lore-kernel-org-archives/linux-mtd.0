Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE3DC43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 14:48:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55E0B2063F
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 14:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VAkM4BvW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55E0B2063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MaP/xyRLsK3ETk+s7RpcY/UUIiODOGz/OyZaIn/qH3s=; b=VAkM4BvW9QBtma
	i5Dl4ZRepstA5Q4+JPMUfftD+Qiz4AhLsFMioW+c0qj0skwTYQv/7qWXHc1ENbfur2jDEyVH0k0SM
	EAYCOVfLF1NHnUEPAZnWak8c9QnJkyair2WMbujh5GnIpX768UBoGeY2eaokUQHo258tzV7OT0oga
	MEn5Vz1nf5WDtEMv7sKmJE0SDYAOSNXkPoYOS/8HyhKqeKTM6YKLbOk3C6qnZGyGSLHJP+hZmCxeh
	Gm0n7ahtbpzHU5M59C9VMDBahZyApnlHrRLG7HQMhNuhGx+4aV4Gzfw1sa9L316fNFc9grkWsIMJv
	IdHtew2IndwvcTWDAkZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfQGe-0007eE-3E; Mon, 24 Jun 2019 14:48:24 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfQGJ-0007Ns-7E
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 14:48:06 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 7D8DA67A90A;
 Mon, 24 Jun 2019 16:47:51 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 24 Jun
 2019 16:47:50 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Mon, 24 Jun 2019 16:47:50 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: liaoweixiong <liaoweixiong@allwinnertech.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, 
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Peter Pan <peterpandong@micron.com>, "Chuanhong
 Guo" <gch981213@gmail.com>
Subject: Re: [RESEND PATCH v2] mtd: spinand: read return badly if the last
 page has bitflips
Thread-Topic: [RESEND PATCH v2] mtd: spinand: read return badly if the last
 page has bitflips
Thread-Index: AQHVKoaYbYsysfnJPUKsxvje/QcCeKaqwQIA
Date: Mon, 24 Jun 2019 14:47:50 +0000
Message-ID: <f86e6750-6b4f-daf7-3f0c-1c5e63b5b95d@kontron.de>
References: <1561378534-26119-1-git-send-email-liaoweixiong@allwinnertech.com>
In-Reply-To: <1561378534-26119-1-git-send-email-liaoweixiong@allwinnertech.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <9FE31BB9AAE8204BAD101611478CAFA2@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 7D8DA67A90A.A00F2
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, frieder.schrempf@exceet.de, gch981213@gmail.com,
 liaoweixiong@allwinnertech.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, peterpandong@micron.com, richard@nod.at,
 stable@vger.kernel.org, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_074803_688912_215CB5B1 
X-CRM114-Status: GOOD (  16.97  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 24.06.19 14:15, liaoweixiong wrote:
> In case of the last page containing bitflips (ret > 0),
> spinand_mtd_read() will return that number of bitflips for the last
> page. But to me it looks like it should instead return max_bitflips like
> it does when the last page read returns with 0.
> 
> Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Frieder Schrempf <frieder.schrempf@kontron.de>

Why did you change our Reviewed-by tags to Acked-by tags?

> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> ---
>   drivers/mtd/nand/spi/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 556bfdb..6b9388d 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -511,12 +511,12 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
>   		if (ret == -EBADMSG) {
>   			ecc_failed = true;
>   			mtd->ecc_stats.failed++;
> -			ret = 0;
>   		} else {
>   			mtd->ecc_stats.corrected += ret;
>   			max_bitflips = max_t(unsigned int, max_bitflips, ret);
>   		}
>   
> +		ret = 0;
>   		ops->retlen += iter.req.datalen;
>   		ops->oobretlen += iter.req.ooblen;
>   	}
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
