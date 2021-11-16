Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52296C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 11:08:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E3463222
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 11:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24E3463222
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5MhBDDmjqXJMGhf8hTnNHczGWjSmS3vcqG52xfFra0w=; b=tV/Xi3km/LoSqz
	UcbZphtRP1aSISviQ6x9NaLbYqs0M/s+0P9oZZ1sycFA9xdwyHkHjCZW4UJ1NAyd144Jx08F+GWAU
	voL9/DHweCp3OWGl48QSSjON6/ouqkQ4Mb5qdoEnCf3nc7LKf9EQYa1X4Gm226QwaLM4Lw4oT1DtL
	5qDtpm7jxs7JYI8NUvTAWG0p5N9Gs2A9B7JXWOKmPAdPPAJoF80tKH1hRORIMXgmlShM5+CsHFVG6
	aw4dRlRQZwx5sRxXBrC5JBK/zfQ80EmpQVaGFhU9jpNuAjxtCOrFObCV1kX7fABMeBjSsLVYkdNNs
	awcv+yhu46IOI6JHQyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmwJp-001KpJ-3r; Tue, 16 Nov 2021 11:08:05 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwJm-001KoY-Ln; Tue, 16 Nov 2021 11:08:04 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGB7TXp018391;
 Tue, 16 Nov 2021 05:07:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637060849;
 bh=W7BPQ9w6PkXWvf6AfFKAPYb5fuO29BsuaDL3eGP/S3k=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=S7x7M91uR/bjFoquOltPxVe02BwcToxqhLrKIJBLk2mi1ydL0sUZt6wI8WE8mFdc5
 wvEJes7G8YW8BD1e7+hf3swZ7hX2NzmY1c7U9LV3H6lTuB7Uyy4NQ/R5+gtE4YAKh8
 n4zNcHXLBizUFYg+wKVUmpdHx922s09mp0Nb9MbI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGB7Tw0108168
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Nov 2021 05:07:29 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 05:07:29 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 05:07:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGB7STE094989;
 Tue, 16 Nov 2021 05:07:28 -0600
Date: Tue, 16 Nov 2021 16:37:27 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 18/25] mtd: spi-nor: core: Init flash params based on
 SFDP first for new flash additions
Message-ID: <20211116110725.75qstkgfipfgjfso@ti.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-19-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211029172633.886453-19-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_030802_816290_A8DFDD61 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29/10/21 08:26PM, Tudor Ambarus wrote:
> New flash additions that support SFDP should be declared with
> SPI_NOR_PARSE_SFDP and with all the other flags that are not SFDP
> discoverable.
> Keep the old way of initializing the flash, until all the flashes
> are converted to use either SPI_NOR_PARSE_SFDP or SPI_NOR_SKIP_SFDP.
> Since we want to get rid of the default_init() hook, the rollback
> mechanism for flashes that use SPI_NOR_PARSE_SFDP does not call
> spi_nor_manufacturer_init_params().
> Split spi_nor_info_init_params() in spi_nor_init_default_params()
> and spi_nor_skip_sfdp_init_params(). spi_nor_init_default_params() is
> called for all the flashes regardless if they support SFDP or not.
> spi_nor_skip_sfdp_init_params() is called just for the flashes that
> do not define SFDP and initializes parameters and setting solely based
> on flash_info data.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
