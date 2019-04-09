Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DEEC10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 10:50:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5336C2084C
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 10:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MaqMirvN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F21bkXrx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5336C2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUuwu3Rzv1wnlLT1+AaTeSsmIxgVVleUMoq+joJLE2A=; b=MaqMirvNX4mfRB
	XW6eIGWCu6JgLToLvO9TIhlnIL/pAhj+XI4lfCZ5dJVjWALK9QiD/Wwmi6BXnaRV4x3BoP/gcX1Ow
	6h+7E5LQ0PCWzX/kp1f3IGS1AlBhCVUd+2Nn4gPZlzrjQ1rBMgUN0vNVWBmVvecTJFYB2o83zteTe
	Fo8xQMjpJPO/10deu0UOclR4fyQCvIaOhxeOxDJdFb2JAA63+wbyIm8gSMS/5Kog2Rm0et4PtGlE8
	MtozxERTrSUARRzzRV25WwWpnzndZlRBpIMe0vFdZM4wuyalyvSB+6aqgA0Mrt3pfscFx4WcljbWe
	nlaRkZE03OSE9/uHgktA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDoKa-0006Bu-UN; Tue, 09 Apr 2019 10:50:20 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDoKX-0006BW-Sy
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 10:50:19 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x39AnrC1047784;
 Tue, 9 Apr 2019 05:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1554806993;
 bh=CgRXcBR8umdVWoutcx4vOvOa55IENYFWhQNepuqf/Ns=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=F21bkXrx9sLYUqF0/AmH/MBnoNr6d1+bXdJpPlhyUqcZMa6w73WXZBhzkEX0sAMdF
 BhqO1C08uT790jr/LpE1UE2CVizD0gw7hD1h37BHgHrBIwh1ktlaJdonV9lEu1goMW
 DDlo53kzS9nltxGOnLA2rJKt7KKjBRc0rmQDW9/8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x39AnrfC053031
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Apr 2019 05:49:53 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Apr
 2019 05:49:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Apr 2019 05:49:53 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x39Annq6041870;
 Tue, 9 Apr 2019 05:49:50 -0500
Subject: Re: [PATCH] mtd: spi-nor: cadence-quadspi: add reset control
To: Dinh Nguyen <dinguyen@kernel.org>, <linux-mtd@lists.infradead.org>
References: <20190408165046.24310-1-dinguyen@kernel.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <0e2b4c71-e634-6489-bccf-fd58b593288c@ti.com>
Date: Tue, 9 Apr 2019 16:20:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190408165046.24310-1-dinguyen@kernel.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_035018_046879_F821C299 
X-CRM114-Status: GOOD (  17.95  )
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
Cc: marex@denx.de, Tien-Fong Chee <tien.fong.chee@intel.com>,
 tudor.ambarus@microchip.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/04/19 10:20 PM, Dinh Nguyen wrote:
> Get the reset control for the QSPI controller and bring it out of reset.
> 
> Suggested-by: Tien-Fong Chee <tien.fong.chee@intel.com>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 792628750eec..710a853f9d13 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -34,6 +34,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/sched.h>
>  #include <linux/spi/spi.h>
>  #include <linux/timer.h>
> @@ -1336,6 +1337,7 @@ static int cqspi_probe(struct platform_device *pdev)
>  	struct cqspi_st *cqspi;
>  	struct resource *res;
>  	struct resource *res_ahb;
> +	struct reset_control *rstc;
>  	const struct cqspi_driver_platdata *ddata;
>  	int ret;
>  	int irq;
> @@ -1362,6 +1364,14 @@ static int cqspi_probe(struct platform_device *pdev)
>  		return PTR_ERR(cqspi->clk);
>  	}
>  
> +	/* Obtain QSPI reset control */
> +	rstc = devm_reset_control_get_exclusive(dev, NULL);
> +	if (!IS_ERR(rstc)) {
> +		reset_control_assert(rstc);
> +		udelay(1);
> +		reset_control_deassert(rstc);
> +	}
> +

If reset is optional here why not use
devm_reset_control_get_optional_exclusive() and handle error codes (like
-EPROBE_DEFER) appropriately instead of ignoring them?

>  	/* Obtain and remap controller address. */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	cqspi->iobase = devm_ioremap_resource(dev, res);
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
