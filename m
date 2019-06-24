Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011A6C48BE8
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 07:38:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9382089F
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 07:38:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AH3gVDeY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9382089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoyOfL9n/UQY57GgC7PGIKGIbnrFdaUWXinC8UJ6iQ4=; b=AH3gVDeYvphVOG
	Zx4G0ETgTPBKfT0YV6LZbbmPj/wUtUYo2hGnFsm94srt4PP/haH+LOfyeqNAm1GQsH0ZN+qIk57Vk
	YvqthWFMJYfjFrf+rs4RhP5MpP5IvbB9SRIWr41q+SgAE5HKO3ACN6MibmGVEAHFLHNIhwEGahuCK
	kfSzPdqQXKpC4fhugjr+nFCBdfP7axpJ7fToiVLSBIVcOSUDUahmr3Kq6rm1G/L5prUje9PdD3HHs
	8crAXxiSRXgQ+kNqPedW03w2zRCRuV25AALzlcXPdNVIbhzy+39QoZDPMQbayGbfle9lDp86vtVsb
	6eh6u2lQdmtsdeNchZSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfJYG-0006yX-Dw; Mon, 24 Jun 2019 07:38:08 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfJXz-0006lp-Np
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 07:37:53 +0000
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 55C2A67A866;
 Mon, 24 Jun 2019 09:37:45 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 24 Jun
 2019 09:37:44 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Mon, 24 Jun 2019 09:37:44 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: liaoweixiong <liaoweixiong@allwinnertech.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, 
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Peter Pan <peterpandong@micron.com>, "Jeff
 Kletsky" <git-commits@allycomm.com>
Subject: Re: [PATCH v2] mtd: spinand: read return badly if the last page has
 bitflips
Thread-Topic: [PATCH v2] mtd: spinand: read return badly if the last page has
 bitflips
Thread-Index: AQHVJwOfUanKNwqMXUOnQCnAkBatBqaqT90A
Date: Mon, 24 Jun 2019 07:37:44 +0000
Message-ID: <d406a968-a489-f457-2bde-1912618879fa@kontron.de>
References: <1560992416-5753-1-git-send-email-liaoweixiong@allwinnertech.com>
In-Reply-To: <1560992416-5753-1-git-send-email-liaoweixiong@allwinnertech.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <44B2B8BBC59D1345937FB8A85C0FB59B@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 55C2A67A866.AE508
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, frieder.schrempf@exceet.de,
 git-commits@allycomm.com, liaoweixiong@allwinnertech.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com,
 peterpandong@micron.com, richard@nod.at, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_003752_110072_57572FA2 
X-CRM114-Status: GOOD (  16.22  )
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 20.06.19 03:00, liaoweixiong wrote:
> In case of the last page containing bitflips (ret > 0),
> spinand_mtd_read() will return that number of bitflips for the last
> page. But to me it looks like it should instead return max_bitflips like
> it does when the last page read returns with 0.
> 
> Signed-off-by: liaoweixiong <liaoweixiong@allwinnertech.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

This should probably be resent with the following tags:

Cc: stable@vger.kernel.org
Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI 
NANDs")

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
