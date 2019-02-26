Return-Path: <SRS0=THda=RB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990A8C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 18:28:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65FF32173C
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Feb 2019 18:28:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jNnKYC3q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Y3JgxTQH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65FF32173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbtBw7ovuJQ8atB4U3pMxAr5CiI+W9vZLQa6HCFBfPI=; b=jNnKYC3qIjKBJH
	3ml3J4vEPRul22l2FzB6SaYsv1uubb/SY1br3edfOR44KOXobnSxagkMF0qEKLHuSFmNfMo88mRpd
	cZxSd5Z5g5WU3GjAJ1FYId1r/udJn69ZctSPzsnU3CdBruzqkVOcDKuaewB/uCTAlxsP6ZYantSLZ
	wEdx2wniNVJnoIfOFSFq9tnqyK4uVAuE/cinwbZZiTilqyC+kg5IFqyJHm1fLMW2eAjoJD3vvLsU8
	d3Qr1GamZ3PPSwN8eblqk9pLcRRul6BlnHPih9jsy8JeGyOIjJMo7gJ7Ux+q7PmmH3A+TSNgC00I5
	PWzBiHlYa+G8/ZjEqLtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyhSr-0002aH-G0; Tue, 26 Feb 2019 18:28:25 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyhSn-0002Z9-Vf
 for linux-mtd@lists.infradead.org; Tue, 26 Feb 2019 18:28:23 +0000
Received: by mail-lj1-x243.google.com with SMTP id a17so11654396ljd.4
 for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2019 10:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bLpnNHAsXYeTMUo78HRM2QnmksqH5fmT7cGzmEMRAOI=;
 b=Y3JgxTQHu9gHW/Gn4f+FyhRmBRRVr5YeaJ1hu+s+XHpndpcvccBgy+HntzAob+cbq7
 oXJ437K+PAgR75PEj4GBYHd9UeTgh69NoKGkZhdwoIWQoHWNtMEckokK7YY1WOH1svJt
 CrGj/Ezhmh/s0v3UGbGMaxDT8mxHe7FTEGDuu9/vSahRs1snt5CnwfsnmfNXizHC67aC
 NsrZGKf/zkyoKYzzK339ZHuIXzWjmgdrG9almFsUx7wuJBSO847kIVCTDqYnw0C5apHx
 1OdHF2HUH6Mi9O3L++NeH8Mu3z1qWihxhAhsiVOzgECnJ/1zwl7nQiDgGuYb/SR57tp+
 4Uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bLpnNHAsXYeTMUo78HRM2QnmksqH5fmT7cGzmEMRAOI=;
 b=RMMJPARceHqcpjKZb48N2jM7P3lraqYamdeGinWsu7nymflW1fzZ6o7MuO4+YWyuVl
 cyguuikPQ+7RVtFOca8uEiDNRGC+7GbctGIkiCNBu1cWT2ooeldU0fmZIZun7/+a2zMi
 sC3L2k8NKTI0LYruK+fVKnEltT6rluUkKuQowZUctNVzHfL0QD5GDbD46dZEHP5n11L4
 knSBV8yUTtN5Ocytg/KzYAIG9omw8Sl54I8Vdj3qqBYiRRRUMmghfMxpVtbvkvuTn20e
 bVDVkiBlBCGF2geY32Ph3gJVO+mI5rfBeg8IVvSMOgyDYYgfxKTatB6bxp20RG7fKPpU
 6syQ==
X-Gm-Message-State: AHQUAubCAjycky4eE9XAOoe226TQROYYsEcLhN29wBKJYuEXxqB5GymC
 cuHT93PVDBnfMkUtQNU77dmTwQ==
X-Google-Smtp-Source: AHgI3IZENB2wSiagUzwcZqG0Fd7+YIzsH6UcxiSQ6DwQ4zPeLlqHuDiNNUXmGASynfjHrC5gtR5dUQ==
X-Received: by 2002:a2e:3807:: with SMTP id f7mr14223743lja.9.1551205699070;
 Tue, 26 Feb 2019 10:28:19 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.110])
 by smtp.gmail.com with ESMTPSA id d25sm3413914lji.9.2019.02.26.10.28.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Feb 2019 10:28:18 -0800 (PST)
Subject: Re: [RFC PATCH 5/5] mtd: hyperbus: Add driver for TI's Hyperbus
 memory controller
To: "Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>)"
 <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>
References: <20190219063607.29949-1-vigneshr@ti.com>
 <20190219063607.29949-6-vigneshr@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <4d2e31e3-0130-14a1-ab06-e6ffeae1cd22@cogentembedded.com>
Date: Tue, 26 Feb 2019 21:28:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190219063607.29949-6-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_102822_019391_72505AD5 
X-CRM114-Status: GOOD (  21.61  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/19/2019 09:36 AM, Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>) wrote:

> Add driver for Hyperbus memory controller on TI's AM654 SoC. Programming
> IP is pretty simple and provides direct memory mapped access to
> connected Flash devices.
> 
> Add basic support for the IP without DMA. Second ChipSelect is not
> supported for now.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
>  drivers/mtd/hyperbus/hbmc_am654.c | 105 ++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 drivers/mtd/hyperbus/hbmc_am654.c
> 
> diff --git a/drivers/mtd/hyperbus/hbmc_am654.c b/drivers/mtd/hyperbus/hbmc_am654.c
> new file mode 100644
> index 000000000000..1f0d2dc52f9f
> --- /dev/null
> +++ b/drivers/mtd/hyperbus/hbmc_am654.c
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
> +// Author: Vignesh R <vigneshr@ti.com>
> +
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mtd/hyperbus.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/types.h>
> +
> +struct am654_hbmc_priv {
> +	struct hb_device hbdev;
> +	void __iomem	*regbase;

   Isn't regbase a controller's data, not a slave device's?

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
