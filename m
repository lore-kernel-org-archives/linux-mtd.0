Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4E9C4363C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 07:49:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 382DB2083B
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 07:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ss6ifOqO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bx3/xdYQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 382DB2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Awvd4N+VNiqeYRtzSfQkUXuPn+y612bRQYPRKQy/4c=; b=ss6ifOqOgc1nceKjJvDDKJrvh
	PJTY/iTAIO91fnl2058U9H4pwTd3XDIfKdtcdeslg8pggNPFytxmhuEIFHKpJKWcAgmV2FphbbJI/
	dmNqee/wJGsHjWKpRwtsmVIXWouiH4tCqfFryB8FxL15RFhQsToy2Tv6y2Be4ps6B430z16KW37z6
	FN6vPG8jju8FqY7crgK+hb4VIMrUsupwzDBRS6bHsm1pFovymqmQomXSywbRSSQ2xKAyqP6B7K6F0
	ox1+IHB3VLQDMmsU+826F7CrXn/mRXEqt7tM9qkKhNc6kz4b/Gy951QSLcUVvz8naczNr0bupOR7D
	sfphOjaoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ4Bu-0005fc-TJ; Wed, 07 Oct 2020 07:48:50 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ4Br-0005f6-QV
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 07:48:48 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0977mdxS050552;
 Wed, 7 Oct 2020 02:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1602056920;
 bh=GP3WVCcpQFbTTaD6QJrC4uojd9leE6jMcWf1qPGAsVI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=bx3/xdYQgH2j90nbcj+R2qf42jXYmX5ObfAIbTaw494zcJpkylMztMcRruHb2CRZF
 WF1WLRY8ylk43BEy8LvRzqWf1Wa4HWQU992hh7vdXIbdmOtjx3qo4w6AIZYBq0k3+J
 8pptdRjoC4VvCNQ2/MrJ4+YhpnyL5AX/7C8Y7Fug=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0977mdP2029170
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 7 Oct 2020 02:48:39 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 7 Oct
 2020 02:48:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 7 Oct 2020 02:48:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0977mcqQ070527;
 Wed, 7 Oct 2020 02:48:39 -0500
Date: Wed, 7 Oct 2020 13:18:38 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [RESEND PATCH v2] mtd: spi-nor: Fix address width on flash chips
 > 16MB
Message-ID: <20201007074836.dyljsotpw3kkrtz3@ti.com>
References: <20201006132346.12652-1-bert@biot.com>
 <20201006151807.2pckm7ncply7uomc@ti.com>
 <096b2b97-6b6b-a46e-1239-e5d257e80c0b@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <096b2b97-6b6b-a46e-1239-e5d257e80c0b@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_034847_943356_2E361F70 
X-CRM114-Status: GOOD (  21.09  )
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
Cc: Bert Vermeulen <bert@biot.com>, tudor.ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 07/10/20 12:59PM, Vignesh Raghavendra wrote:
> 
> 
> On 10/6/20 8:48 PM, Pratyush Yadav wrote:
> > On 06/10/20 03:23PM, Bert Vermeulen wrote:
> >> If a flash chip has more than 16MB capacity but its BFPT reports
> >> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, the spi-nor framework defaults to 3.
> >>
> >> The check in spi_nor_set_addr_width() doesn't catch it because addr_width
> >> did get set. This fixes that check.
> >>
> >> Fixes: f9acd7fa80be ("mtd: spi-nor: sfdp: default to addr_width of 3 for configurable widths")
> >> Signed-off-by: Bert Vermeulen <bert@biot.com>
> >> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  drivers/mtd/spi-nor/core.c | 8 +++++---
> >>  1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index 0369d98b2d12..a2c35ad9645c 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -3009,13 +3009,15 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
> >>  		/* already configured from SFDP */
> >>  	} else if (nor->info->addr_width) {
> >>  		nor->addr_width = nor->info->addr_width;
> >> -	} else if (nor->mtd.size > 0x1000000) {
> >> -		/* enable 4-byte addressing if the device exceeds 16MiB */
> >> -		nor->addr_width = 4;
> >>  	} else {
> >>  		nor->addr_width = 3;
> >>  	}
> >>  
> >> +	if (nor->addr_width == 3 && nor->mtd.size > 0x1000000) {
> > Nitpick:    ^^^^^^^^^^^^^^^^^^^^^^^^ you can drop this part. But its 
> > fine either way.
> > 
> 
> I don't think its a good idea to drop nor->addr_width == 3 check as
> nor->info->addr_width is permitted to have a value > 4 (although there
> is no such flash today)...

The check below for SPI_NOR_MAX_ADDR_WIDTH will return an error when 
nor->addr_width > 4, but I see your point.
 
> > Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> > 
> >> +		/* enable 4-byte addressing if the device exceeds 16MiB */
> >> +		nor->addr_width = 4;
> >> +	}
> >> +
> >>  	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
> >>  		dev_dbg(nor->dev, "address width is too large: %u\n",
> >>  			nor->addr_width);
> > 
> 
> Regards
> Vignesh

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
