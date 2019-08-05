Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6208EC433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 07:26:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 366652086D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 07:26:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LdFNVA0z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="peY2ayuo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 366652086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=35ocYhtybXiQH8vggYGR1Zw3WD4H8xNQdwXKfU3k7Z4=; b=LdFNVA0zzJm8uW
	k037DXuXHrRf7arnd8nR/E3u6cRuAfIWf9kI3XR1Nc9ueH+D/nLHLSK6LVYYHSqsTjAiw1Kd4oqK8
	goY2Yks2se4dn83+TWu4vRZX8B///KWqou+scV0t6MB1z5nUu5AcC9eisQO0VTN8pmCVcOydFN4Xf
	Yma0DBORWumvjmDLmT2EGIitWHX6eX2R6kwJCUXvaBhNA9C+HKVXoT7WYgU4rC7vypF/VaW1gZSvl
	6WWWwbKaTJiRIT6iXobqU2GD3YEsFlzXQ+2REau07YhTgkC2g6+fcO3w++mY2Ib2zLJD0f02hhSp4
	+hFcP4H7qx9v8acGWbEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huXNL-0008GN-NT; Mon, 05 Aug 2019 07:25:47 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huXMm-0007W0-2M
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 07:25:17 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x757P6n8050623;
 Mon, 5 Aug 2019 02:25:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1564989906;
 bh=VeeVOgQ4mkFmWT5x4Yg0sVBKI07YWSb3w9ap5akHIDA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=peY2ayuoP7e3SBmtHunlCl5wNTlR4YXWH8rtEUzH7qcVgxiPWpcWuT16Hh9RIWJJt
 xviBing+tJEYH+rUEdjTo5RGXAR+KrEGwOxbsgoop3GxejoAP7CaI7qmMR0GThOcNk
 CtKn3+Si4GaZ1/LDtNtwPn3PB4qY+f7ObnlYQpwo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x757P6gx068211
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Aug 2019 02:25:06 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 5 Aug
 2019 02:25:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 5 Aug 2019 02:25:05 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x757P3fg025554;
 Mon, 5 Aug 2019 02:25:05 -0500
Subject: Re: [PATCH] mtd: hyperbus: Add hardware dependency to AM654 driver
To: Jean Delvare <jdelvare@suse.de>, Miquel Raynal <miquel.raynal@bootlin.com>
References: <20190731100706.724654c0@endymion>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <5157b20a-a436-5c89-330e-cd6f7259f6e3@ti.com>
Date: Mon, 5 Aug 2019 12:55:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731100706.724654c0@endymion>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_002513_296426_55AADA76 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 31/07/19 1:37 PM, Jean Delvare wrote:
> The hbmc-am654 driver is for the TI AM654, which is an ARM64 SoC, so
> don't propose this driver on other architectures unless
> build-testing.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Thanks for the patch! Applied to mtd/fixes.

>  drivers/mtd/hyperbus/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-5.3-rc2.orig/drivers/mtd/hyperbus/Kconfig	2019-07-28 21:47:02.000000000 +0200
> +++ linux-5.3-rc2/drivers/mtd/hyperbus/Kconfig	2019-07-31 09:31:39.155086783 +0200
> @@ -14,6 +14,7 @@ if MTD_HYPERBUS
>  
>  config HBMC_AM654
>  	tristate "HyperBus controller driver for AM65x SoC"
> +	depends on ARM64 || COMPILE_TEST
>  	select MULTIPLEXER
>  	select MUX_MMIO
>  	help
> 
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
