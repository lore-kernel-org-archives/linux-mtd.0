Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9C2C10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 16:33:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319A92084F
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 16:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeruqFdP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CGar+k86"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319A92084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=st52d2nOFxtq166kNVmR+oTpclZaFeXL1E3IQxCdrXw=; b=MeruqFdPjXuqFn
	xyXASJDuJhYjiSkTRb82Bqgp/wc/pRvJOuGLwyjgWqBrFGx8rm97By//GNp5u7tpeboU7X1rcPQkm
	G7KHscEJAhMi/7L49xCa09MF/zbQdZ5mhqt8Rzd3SETK2ok0tajJHdf5qBpQbQzOzRnYWngeHdYT1
	GD/NYPjZiwNXA0LbtxXnWN7SF9FeouATpyuPYanvRKc+wgHk9XkSZlUqNuLWHs0MjRZm/bWQvJgrK
	DN2qc05FZCnrc8wLr/AskXtaFrd6z8XLDKvr7FS3uEeRLb3wtJPvNV6v0biCoV/Y/TbFD9kIaoSRu
	mxTbufr+6WAB2amqUCvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDtgn-0006ci-01; Tue, 09 Apr 2019 16:33:37 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDtgf-0006bj-P5
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 16:33:35 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x39GXIhA120592;
 Tue, 9 Apr 2019 11:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1554827598;
 bh=H0f8JzA2EvzqpHCG0iiPR3RwkzJ55FApyeOi4DBekrI=;
 h=From:Subject:To:CC:References:Date:In-Reply-To;
 b=CGar+k866S/evfBSNW8OdIFWnxlckEQa9HNZx5cCxGZK+cVXT5l8Jpkd1oqvS7xQM
 OUc7Y/CGHCO9RyezZ5vRtn3DCfyOUr1JWQ44U4zyeX1pQObfXTJGWIFE09UjhPTmcE
 vahumBGc+Y4O8/xzVDD2NIc3QovwDlSeZclayCnY=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x39GXIPm019810
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Apr 2019 11:33:18 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Apr
 2019 11:33:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Apr 2019 11:33:18 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x39GXEbR005623;
 Tue, 9 Apr 2019 11:33:15 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Add myself as MTD maintainer
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>
References: <20190401150938.10607-1-miquel.raynal@bootlin.com>
Message-ID: <8650c373-5f21-4776-f598-a13a7a2df1c8@ti.com>
Date: Tue, 9 Apr 2019 22:04:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190401150938.10607-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_093329_854492_12DAD385 
X-CRM114-Status: GOOD (  18.62  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 01/04/19 8:39 PM, Miquel Raynal wrote:
> Help Richard and hopefully Tudor and Vignesh maintaining MTD since
> Boris is leaving.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8a0a549c2fdf..383915d69a51 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9998,6 +9998,7 @@ MEMORY TECHNOLOGY DEVICES (MTD)
>  M:	David Woodhouse <dwmw2@infradead.org>
>  M:	Brian Norris <computersforpeace@gmail.com>
>  M:	Marek Vasut <marek.vasut@gmail.com>
> +M:	Miquel Raynal <miquel.raynal@bootlin.com>
>  M:	Richard Weinberger <richard@nod.at>
>  M:	Vignesh Raghavendra <vigneshr@ti.com>
>  L:	linux-mtd@lists.infradead.org
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
