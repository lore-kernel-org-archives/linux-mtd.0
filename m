Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762F0C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:02:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A41665130
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A41665130
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7d9dlgK0an3Yy778FDsmfqJlWyvDC20myjQRnlKPR/Y=; b=dcR7ule8NCgCj1F+dJWuSYotI
	c5J73H1DzUm+XqRrItpa9LzgA8YIPIH9bQbwvccW/jWlPYV5A1BmpmHrB4qEhAWtvfwXHTqf5GkL+
	4oG2yXd5iuXDizv1urifRkhthrnTLbuBTissOsW71zu9crFuOdl5GybOfEmNKW2lr8Xi97fDtxhs/
	0UkYhVLUWua4xNn6tpwnmlk66f276kqOqyBHKJoWzDmPngm7nOkgSvGgldBC56eumErKrnxVFhFD5
	FZx3R+QYM5BN+hVrybbmeE9pU0hoR9DI51m5D/vM7BaiLpNc9f+JL3OptrBIV2ByIXpR5gQMuNRaB
	5UhrnWDKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJBll-00G3xi-96; Mon, 08 Mar 2021 09:01:41 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJBlf-00G3vY-QU
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 09:01:38 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12891Udw040839;
 Mon, 8 Mar 2021 03:01:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615194090;
 bh=SBc4yIYAS87btCmSKNU3cwCzlARC1dC5epWFyEK4swc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=CrRU1R4LXw0lZ6GKiU8VGPr7D1yUCi7kVXJ2nCN+s+tgIF3I93LyyMWIF4GSuVoca
 iwJdw/7vzuaA467dRhvjhgxORgFO6LRdsmrQN67xtAfNV1bH84pp8WMS1IuaFtLMcy
 KJCCUweSYACPft1Gm42F/JU2dKpheSQ3vzPtWShA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12891U3S060588
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Mar 2021 03:01:30 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Mar
 2021 03:01:30 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Mar 2021 03:01:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12891TdT085976;
 Mon, 8 Mar 2021 03:01:30 -0600
Date: Mon, 8 Mar 2021 14:31:28 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: use is_power_of_2()
Message-ID: <20210308090126.y3scr752sdm6oi5e@ti.com>
References: <20210305234552.19204-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305234552.19204-1-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_090136_179834_7FDBE0D8 
X-CRM114-Status: GOOD (  20.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 06/03/21 12:45AM, Michael Walle wrote:
> There is already a function to check if an integer is a power of 2. Use
> it.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304f52fa..4a315cb1c4db 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2336,11 +2336,8 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		 * If page_size is a power of two, the offset can be quickly
>  		 * calculated with an AND operation. On the other cases we
>  		 * need to do a modulus operation (more expensive).
> -		 * Power of two numbers have only one bit set and we can use
> -		 * the instruction hweight32 to detect if we need to do a
> -		 * modulus (do_div()) or not.
>  		 */
> -		if (hweight32(nor->page_size) == 1) {
> +		if (is_power_of_2(nor->page_size)) {
>  			page_offset = addr & (nor->page_size - 1);
>  		} else {
>  			uint64_t aux = addr;

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
