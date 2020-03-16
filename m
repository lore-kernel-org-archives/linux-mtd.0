Return-Path: <SRS0=Xhow=5B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC285C0044D
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 09:17:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF16320674
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 09:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DJ0jdv+n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oqoFvlro"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF16320674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsx3iB29aQTm8r9keFF0sg2taBQ090M7WEfgGh9nWcU=; b=DJ0jdv+nvcIGeu
	4L2dgSSY3h5CTAaG5jrNlP34wmEo95PIkghcF+3+Jk7TVYcnW8b3hBBu28rzbDgcTdhHoHRfl+UVK
	P+6i19i102XR/i0gmLl5toTiiewH+U98NTPavNjwt7nAnPXpZnDdbBazH0OyMy3ooCYbYzZL9Qt3I
	5ZKH3Pdt+vLbeMckjR9HXNj1cdYLiTuuNzfCZcC9FIn23ezsBknVV4gf4lY2Prp5of5Y7LbNjHfNq
	BJDX0ApZQr62cPtRu9UvRzQ4flfrRQd/fpbzcJLN98OjZCfhWaNuZNvisoZchLzTrbBgZS5ve5cT7
	DgcP0N76I5yGPa+ISISw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDlrx-0006Xz-1c; Mon, 16 Mar 2020 09:17:09 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDlrt-0006XX-DB; Mon, 16 Mar 2020 09:17:06 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02G9GuXB130408;
 Mon, 16 Mar 2020 04:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1584350216;
 bh=6yg8oYcf8z+TgHLkRvASbzJeF/TeWeUnldQ/HEB/VzY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=oqoFvlroiHTwRAQjAQk5K1uHkpGXSXrkzLn/mUmI+hTBHfh5/UhMPqZDPhlpXVFGk
 AZHxW6DQKnqtrm5qv9eNc/LayFM3fk7AwmeiRwSnUFDis1Q03OtedRCjwSw+k+ILH/
 QNXEDRSeH+526Yot3arzKPnhzAkHlhANAX80gAxs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02G9Gu0C025899
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Mar 2020 04:16:56 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 04:16:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 04:16:56 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02G9Gnel097875;
 Mon, 16 Mar 2020 04:16:52 -0500
Subject: Re: [PATCH v2 04/25] mtd: spi-nor: Move SFDP logic out of the core
To: <Tudor.Ambarus@microchip.com>, <bbrezillon@kernel.org>
References: <20200313194130.342251-1-tudor.ambarus@microchip.com>
 <20200313194130.342251-5-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <4d451278-7e09-f824-7a7f-1d81c33021a5@ti.com>
Date: Mon, 16 Mar 2020 14:47:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200313194130.342251-5-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_021705_491313_DF47310B 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: richard@nod.at, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 14/03/20 1:12 am, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> It makes the core file a bit smaller and provides better separation
> between the SFDP parsing and core logic.
> 
> Keep the core.h and sfdp.h definitions private in drivers/mtd/spi-nor/.
> Both expose just the definitions that are required by the core and
> manufacturer drivers. None of the SPI NOR controller drivers should
> include them.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
