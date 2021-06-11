Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B868C48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 12:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2586F613AE
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 12:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2586F613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7VChmG3aSm1DPggqR75K3e6cVkzSpbRoEDqSuPisQGc=; b=tgdXYNVN+1Zy6V/3hJg5PevX1x
	Z1wyV2Wk3AvXf3y79QdXVH/HhamXSBFPcO8f6+C+ruheKusliCBN3m+1XThr6K5PHgi+MMCJ7RmRF
	4h3xy5cRrkU3uXNGB+EPkEcLPlMGke5VaHgSwmq8u82rV6SjnBoKDl69hndTzW08tRuwHPI9JPBo4
	+9Rv2MuYT1CoBejhfQ5lroWH9zv9MeqjmZkG0Q+51ndTdEVuaqKd44AX1eEO1PA9AXjqkiBLsdodN
	iTIKpF2q1rj9m7hSOVq/rVDhSrD0JEv7zou6jpj8y/gso663icuabnpJUVYGaUbzqafscr2U0DHdH
	SN7OSlAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrftB-005AvK-Eg; Fri, 11 Jun 2021 12:03:53 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrft9-005AuX-1z
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 12:03:52 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15BC3mhB056805;
 Fri, 11 Jun 2021 07:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623413028;
 bh=DBEGw1E0ljrhKOmGyJHk8mVIK0GZZzfn8jadLcCmSoE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=UDHRMMVw/IVN3ZhSDoJBOXXEanxMk3vtnkAhepxYZJLASXJGFyPxF/fGb4HjI/dWJ
 CZ3tzRNI/he+H2wcUfg1DTWTc4FtOBiGzlon2jthZsjsSrDPC2zPsI+nkjWq7+Y0HJ
 ReFOLpQMBdu6rQlaQE5SeoMftQg7j1s2WjjvXMRo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15BC3mro016805
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Jun 2021 07:03:48 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 07:03:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 07:03:48 -0500
Received: from [10.250.234.148] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15BC3hjF092989;
 Fri, 11 Jun 2021 07:03:44 -0500
Subject: Re: [PATCH 2/2] mtd: spi-nor: macronix: Fix name for mx66l51235f
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <michael@walle.cc>,
 <p.yadav@ti.com>, <masonccyang@mxic.com.tw>, <zhengxunli@mxic.com.tw>,
 <ycllin@mxic.com.tw>, <juliensu@mxic.com.tw>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210402082031.19055-1-tudor.ambarus@microchip.com>
 <20210402082031.19055-3-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <8607134e-dd03-0f44-d636-840c1f56d2a5@ti.com>
Date: Fri, 11 Jun 2021 17:33:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210402082031.19055-3-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_050351_243744_EA44EEDB 
X-CRM114-Status: GOOD (  18.12  )
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



On 4/2/21 1:50 PM, Tudor Ambarus wrote:
> According to macronix website, there is no mx66l51235l part number.
> The chip detected as such is actually mx66l51235f. Rename the flash.
> Do not update the mx66l51235l name from the spi_nor_dev_ids[], since
> there are dt that are using this compatible.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 42c2cf31702e..c8167de55e55 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -72,7 +72,7 @@ static const struct flash_info macronix_parts[] = {
>  			      SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
>  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> -	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
> +	{ "mx66l51235f", INFO(0xc2201a, 0, 64 * 1024, 1024,
>  			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_4B_OPCODES) },
>  	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
> 

Applied to spi-nor/next, thanks!
[2/2] mtd: spi-nor: macronix: Fix name for mx66l51235f
      https://git.kernel.org/mtd/c/d406f49b05

--
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
