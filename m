Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB15C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 13:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xqi4ZTccsqPHDYf3LUwQuqkTpetZsU3vJu/QvyOrMJ4=; b=bweV39DgkKF5bi
	b+M7IiQgLiN87PUpWkd+vrwmXJPC3qWShkQKle3D7DVqnOxq+ytfn0bk0xTKmHmwk9GjSvbq4Cv7t
	CoClc6gV4xBJ9BPD2Nm28m/1BMcS6atpnRoSr0qn6391JRSr+FUlo+YmRFo9fNnFYugy05ZKyJ9vo
	14z0EhCwM0FwlJGK/YFg6x4tiqtLn9bRvwwmUUHhsDtq826dbwH1zvJ6sTyekM4M2eo6aSc9Hcntl
	OQXUQ69eQdK3vE0S3Ds3gBFOAUoCmdRajPaC/ApFWzg+FLl/He4ZXDwRnEYXGrcscHNaduC5G5Gk2
	Qzk4XspLv6di2xdvbHNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3Yj-00EgI1-GJ; Fri, 18 Feb 2022 13:44:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL3Fw-00EYGF-FC
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 13:25:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso8599279wmq.4
 for <linux-mtd@lists.infradead.org>; Fri, 18 Feb 2022 05:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yrkYgpVIUXGnXP2wkyWmIbd2RYDJqfqs2Rsp+OtCt5o=;
 b=uAAaFw6RHpsnW5DW+gQVrVkaLEzP2Xzhuy4W0EJdVj+v9QPUI1dBLADu063fihlOEu
 SMmDL+vn0fseuUyOwz4U6ojcjnvO2AmogeBd02BQNAwHSuD2pcrlE/kh8xiGBAW74gk0
 VLtxRzwtsIGpUyxapMkGGRS/4St+WSxs5Ah+5sMiXD+P009Tfy8QTxz2pi2Qkhqe+hxF
 hv6LJMEvU1UKM3Gp4pilsMA012MvSbmPZjV8RfRX3qiQ03dZkCCo0OPtymcMqivDiXaK
 6WxgiHHGOQyo+j/OrC3DkLrUyDsYAju7NmHIHfHQEd1nUXxkf4Wm83SB5/0gRlrqW/3l
 OVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yrkYgpVIUXGnXP2wkyWmIbd2RYDJqfqs2Rsp+OtCt5o=;
 b=rnIbILOyMMYhZJrprDwsNSGM0/jUiYWn9/xZoy2zj+CHm73paZ9Ci1ZMxxefKGPGVx
 RWPrxrnkJUKhfLBifUu8VHRpUreOK2WQ15APzKRL933athvD8Er5VKzBsWh2uekXOK9R
 MlUr+Gfl/yGkgTkw5y9jZ1TP5oAemnDl02eR4sqmb/94vI4TZ2PeE8LeOn9HxvpefwdN
 WdmlBwqPFnKkiG+04PnlxYlTUAj3csHbj4t/WN/Uo1gm+MUGMqDIvw/rSAJ+Ph1mLBSk
 X+uD7HxEsO2bBqRvvRYuqLIETT3XH+6js84cLTxqhvGvKgkYYEdvTn3svr9qWDeLbPKB
 nttw==
X-Gm-Message-State: AOAM533i/PtsbEQ/LYCdYxE/6d8nUI5NEkfFsDlwPVvsaR2hhqz6RqV5
 n4/2utHXbSAzrRIV9t2sfF+l8Q==
X-Google-Smtp-Source: ABdhPJyVAYzbgy/AAZpsXhPLMR1fBjvqb4Dg1MygToTm7RwGLTNkBP3nvxFtcdd/zIFp23yEwgJAXg==
X-Received: by 2002:a05:600c:19ce:b0:37c:6fe:68b6 with SMTP id
 u14-20020a05600c19ce00b0037c06fe68b6mr10451900wmq.90.1645190702754; 
 Fri, 18 Feb 2022 05:25:02 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id r2sm6039032wmq.24.2022.02.18.05.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 05:25:02 -0800 (PST)
Message-ID: <e451d814-2d10-6cb6-3402-6d1580ddbce2@linaro.org>
Date: Fri, 18 Feb 2022 13:25:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/4] mtd: core: Fix a conflict between MTD and NVMEM on
 wp-gpios property
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, p.yadav@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 chenshumin86@sina.com, stable@vger.kernel.org
References: <20220217144755.270679-1-christophe.kerello@foss.st.com>
 <20220217144755.270679-5-christophe.kerello@foss.st.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220217144755.270679-5-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_052504_575179_8F2C132E 
X-CRM114-Status: GOOD (  23.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 17/02/2022 14:47, Christophe Kerello wrote:
> Wp-gpios property can be used on NVMEM nodes and the same property can
> be also used on MTD NAND nodes. In case of the wp-gpios property is
> defined at NAND level node, the GPIO management is done at NAND driver
> level. Write protect is disabled when the driver is probed or resumed
> and is enabled when the driver is released or suspended.
> 
> When no partitions are defined in the NAND DT node, then the NAND DT node
> will be passed to NVMEM framework. If wp-gpios property is defined in
> this node, the GPIO resource is taken twice and the NAND controller
> driver fails to probe.
> 
> A new Boolean flag named ignore_wp has been added in nvmem_config.
> In case ignore_wp is set, it means that the GPIO is handled by the
> provider. Lets set this flag in MTD layer to avoid the conflict on
> wp_gpios property.
> 
> Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Cc: stable@vger.kernel.org


Applied thanks,

--srini

> ---
> Changes in v3:
>   - add a fixes tag
>   - rename skip_wp_gpio by ignore_wp in nvmen_config.
> 
>   drivers/mtd/mtdcore.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 70f492dce158..eef87b28d6c8 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -546,6 +546,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
>   	config.stride = 1;
>   	config.read_only = true;
>   	config.root_only = true;
> +	config.ignore_wp = true;
>   	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
>   	config.priv = mtd;
>   
> @@ -833,6 +834,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
>   	config.owner = THIS_MODULE;
>   	config.type = NVMEM_TYPE_OTP;
>   	config.root_only = true;
> +	config.ignore_wp = true;
>   	config.reg_read = reg_read;
>   	config.size = size;
>   	config.of_node = np;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
