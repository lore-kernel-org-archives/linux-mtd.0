Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A092AC433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 07:27:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74E942086D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 07:27:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="caojr/Se";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f6HisGZK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74E942086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMf6sv4gJJfVBcYAJsqFu6WDhR5z9TybMJve8pMJrfg=; b=caojr/SefaOaGy
	xBdZlzNCoF56+bT2kSkB1kOhk1TRDZJgympkKUeJ1hzYQbn0OR1liZP1GSc+QXrlot10xUBa2L5cM
	cQxzQ+IJWHOjXqA4CrjSj4R++lHywngh+/B1Tjl1Ll05C0rFAOQUW2f042qLo7aWs72NT1BKTYvlP
	+30jcw5Z4jIPf89EJKWwXWzbUX0NlXAFdoiQgJK4nY0NLJCk3sdBVA/54NNvxdPD9s1lxx1oczRkz
	UpwHzyiV5RmH0vpHPGAFfE2NKTBGyI1fP4NLZAsgOpHC3UjK+ZZ9lFZqyxogGRILX64wgn/x6gC1X
	+KokxSXeqUSHkR99TBVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huXOT-00009J-AO; Mon, 05 Aug 2019 07:26:57 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huXOQ-00008n-S2
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 07:26:56 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x757QbJG095128;
 Mon, 5 Aug 2019 02:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564989997;
 bh=uidjpdewfqTdZ5riSTkbMqc93TtOR+1gb9Qd4hk0vgY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=f6HisGZKsNmeoV1HocrEiJg35w2RV+ih3ZCkUAYKnJLkInX7z0GFEwTLuQZj/VKJh
 m6+kcdxNAQo4Lt8l2t8wS2bMJXD3MtOGldsI0Q3twcOI0pjlSLIYQvrxQpoGodEa5c
 akcogifgJHDe+QQvRWmNiw0BXiie9jcYkGWBEH9Q=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x757QbPZ069705
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Aug 2019 02:26:37 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 5 Aug
 2019 02:26:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 5 Aug 2019 02:26:37 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x757QYBJ027450;
 Mon, 5 Aug 2019 02:26:35 -0500
Subject: Re: [PATCH] mtd: hyperbus: Kconfig: Fix HBMC_AM654 dependencies
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
References: <20190719082912.10316-1-vigneshr@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <ee11628f-46b7-bfd8-4b32-b87bc133f6d2@ti.com>
Date: Mon, 5 Aug 2019 12:57:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719082912.10316-1-vigneshr@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_002654_985679_8F9F43C1 
X-CRM114-Status: GOOD (  17.68  )
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mao Wenan <maowenan@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 19/07/19 1:59 PM, Vignesh Raghavendra wrote:
> On x86_64, when CONFIG_OF is not disabled:
> 
> WARNING: unmet direct dependencies detected for MUX_MMIO
>   Depends on [n]: MULTIPLEXER [=y] && (OF [=n] || COMPILE_TEST [=n])
>   Selected by [y]:
>   - HBMC_AM654 [=y] && MTD [=y] && MTD_HYPERBUS [=y]
> 
> due to
> config HBMC_AM654
> 	tristate "HyperBus controller driver for AM65x SoC"
> 	select MULTIPLEXER
> 	select MUX_MMIO
> 
> Fix this by making HBMC_AM654 imply MUX_MMIO instead of select so
> that dependencies are taken care of. MUX_MMIO is optional for
> functioning of driver.
> 
> Fixes: b07079f1642c ("mtd: hyperbus: Add driver for TI's HyperBus memory controller")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>> ---

Applied to mtd/fixes.

>  drivers/mtd/hyperbus/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
> index cff6bbd226f5..1c691df8eff7 100644
> --- a/drivers/mtd/hyperbus/Kconfig
> +++ b/drivers/mtd/hyperbus/Kconfig
> @@ -15,7 +15,7 @@ if MTD_HYPERBUS
>  config HBMC_AM654
>  	tristate "HyperBus controller driver for AM65x SoC"
>  	select MULTIPLEXER
> -	select MUX_MMIO
> +	imply MUX_MMIO
>  	help
>  	 This is the driver for HyperBus controller on TI's AM65x and
>  	 other SoCs
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
