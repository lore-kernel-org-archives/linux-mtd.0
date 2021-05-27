Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB20C47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 10:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D9F6109F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 10:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D9F6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+FSjodYm5HV+QXBObiJF+d1DxdOj2pnvkZtTKdNX5Y=; b=vKHgUujahWRBur
	i48p+HMXO4P19lIdD7ZMDJqRTtuycy5j0LYMGVTcz/Gqsg3YeKftwnJgKK66w/aWfmFnm45nCIxdc
	UstPSzONRA8VCwVrQywc854rrkst+WTG/nDQ1pNKudiwQlt0TANl3SfLxShqzupRrzgn8bwoHNdBb
	eLCRCY5xVJ3UmrD0i8UD0hGkhB0YSTKGv+ef+gId9rWxD5gqE46e5H5olkcwIme8r8glzaUcAH8Ap
	kEFas3AOtbBr4ZT4FSRQ9Yeo9/kgXPwEc3ZROAOwG7vtRbgMN2Z2WeruavlrjQXcBY9JRw/OhdIiI
	uAazonKVGlgLrsecERuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmD3n-004i5y-Sy; Thu, 27 May 2021 10:16:16 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmD3j-004i1K-Kt; Thu, 27 May 2021 10:16:12 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14RAG43G129392;
 Thu, 27 May 2021 05:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1622110564;
 bh=brCM6veexmGsxjJbq5ECYAme3NvM/lriyvQsSrvoTE4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RO06g1mM8RoWLQO23gm/Hin7YS3TZDx6d6uopskVHUBwZOSyjNW4dz5HKqIbXTQHB
 DtKTa8n2JawSEfIFQYsBIb3i9rlG7F5K/Z/z92Bu8J/oV7bUm6f9bf/mslSP1G9LFT
 1r9cCxsZmuX5WgmYuUKlmMtQuh3BeIag+b2HQxSo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14RAG3A7078327
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 27 May 2021 05:16:04 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 05:16:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 05:16:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14RAG30w126589;
 Thu, 27 May 2021 05:16:03 -0500
Date: Thu, 27 May 2021 15:46:01 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Chris Morgan <macroalpha82@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <andy.yan@rock-chips.com>, <yifeng.zhao@rock-chips.com>,
 <sugar.zhang@rock-chips.com>, <tudor.ambarus@microchip.com>,
 <michael@walle.cc>, <heiko@sntech.de>, <robh+dt@kernel.org>,
 <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>, Chris
 Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: add rockchip serial flash controller
 driver
Message-ID: <20210527101601.24qauggye5yzjfad@ti.com>
References: <20210526181636.1130-1-macroalpha82@gmail.com>
 <20210526181636.1130-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526181636.1130-2-macroalpha82@gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_031611_747973_DD4D1807 
X-CRM114-Status: GOOD (  10.23  )
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

On 26/05/21 01:16PM, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the rockchip serial flash controller (SFC) driver.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/mtd/spi-nor/controllers/Kconfig       |   7 +
>  drivers/mtd/spi-nor/controllers/Makefile      |   1 +
>  .../mtd/spi-nor/controllers/rockchip-sfc.c    | 944 ++++++++++++++++++

NACK. Please don't add controller drivers here. Instead use the SPI MEM 
(drivers/spi/spi-mem.c) framework and put the drivers in drivers/spi/. 
See the history for drivers/spi/spi-cadence-quadspi.c for an example 
conversion. I recall mentioning this on IRC as well, but maybe my memory 
misleads me.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
