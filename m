Return-Path: <SRS0=/vOe=RA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE96C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 16:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DBA720684
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Feb 2019 16:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dmPfAG28";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="VFEtUOzH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DBA720684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OQeHIe35O6ExvO/jlPvQO36mOICG33+p03Rvzo+YuY=; b=dmPfAG28YzsYBp
	BlcNM8ew5cJti+5jtGpQys7wft7/WTGP2W5gHeqA2qmUbAi6B8gUSdSIeyTB+aoqiOtsxHSwhSbnO
	zi8OiSILvXdLv1XipTVv4JvxD8Esg6YHfAszCA65HEAFwLeSnbSmpFHjinu4mfTQPhKUYAOaXeWf6
	T+eABwwxyVU4XGJqdZhAQKmGIIPiAUaRUZJbhdO2kSuzAXZPB9jo3wAWmYhqn7yz3RRU5L9oe5LBp
	rBRg/6R35PD/8NhORtb5CaH+/zT5dgvmSDZPYpR2bOD2Wdb96wNQhNg5hIe4B6J8eVzyJ6jsUXewc
	S/G8Iaj5XbjNk7zQ4qkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyJ8G-00010y-Vm; Mon, 25 Feb 2019 16:29:33 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyJ86-0000sg-Ni
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2019 16:29:24 +0000
Received: by mail-lj1-x243.google.com with SMTP id d14so7930972ljl.9
 for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2019 08:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=77QWyaOvI4TWPkxmGkA0CNCiytGViRfoudTqrVdJ1sA=;
 b=VFEtUOzHjjMvjKjWe28jdukO6Eqb1NTwUui0nv9p0cWKhkLU5mV6KCail7FeJ7OJIs
 AumIQ9rgIlFy3zXvPOJ0BNUgWXuP4f28CPm13HpUsgrkTU6SvLuHpQOJVNGv/KrqpvHz
 03WU+x0fKLYIuOV/ndcJ5r88dRnee8LX6k22w3b8yknMyvrMig51UUEsJML2hOPfAXph
 B/sMxl4BWKhsnVIc6bp7+8697m71pXS8Tvw+O51RGpw37Rz204Pxnzx3Q/tBLDPQCuKv
 1DHXdryAbWGkpeI5wS6+OZzrWKo37S23Ms+2USe1eew6SybQY/HDNk2VOSDSx2b3vkxi
 1yOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=77QWyaOvI4TWPkxmGkA0CNCiytGViRfoudTqrVdJ1sA=;
 b=Y7h5+Uhx1MF+E3juSg43VII6tSgE5fyzSgba1LFXaDBfgANgpEF1BLbO80TqHTWvAS
 2uGR5VXgUuiz3cV4Ew5h/JHuNoj1ddudF8Js0BhtwVaTrc5Jmf+robxjjVkRA2sFf8LH
 ruw/3m0YAuDkjJMVcjY17rreN4zpjkohVNYRLpKlHew69QcblLAjTFL7AFTfo60BAG5d
 Z1fiGRTjn+1ouBO16yRJ78p0uQCqTA2ASJWeMTZqmnX9jjoiedXTS2sa6jKnZbBCZRiR
 tXQFG2WeJz6r9bjrXv0UgyjudWelovNYJEHECOrpprYOy4YZkkxCcxtyquQxEKNHUDl3
 yf1w==
X-Gm-Message-State: AHQUAuaMdik/yGg+gFVZwJdKzOXdHAfAVkWpPReIW6bu7deFyt4eYDeR
 joBJ3EiagOdMl6E1nlZH04RhPg==
X-Google-Smtp-Source: AHgI3IYYdp8ellX2609vk7mUpmN7j1raOop0Ut9baFTdGn7sWHszjVWlrWh8+ZWGmp3MGqsf4W4hrQ==
X-Received: by 2002:a2e:5d59:: with SMTP id r86mr9097130ljb.158.1551112159217; 
 Mon, 25 Feb 2019 08:29:19 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.138])
 by smtp.gmail.com with ESMTPSA id i15sm2361409ljb.48.2019.02.25.08.29.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Feb 2019 08:29:18 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
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
Organization: Cogent Embedded
Message-ID: <907041d1-8412-22ca-3716-109a56251850@cogentembedded.com>
Date: Mon, 25 Feb 2019 19:29:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190219063607.29949-6-vigneshr@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_082923_210430_D3DB6E66 
X-CRM114-Status: GOOD (  23.99  )
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

Hello!

On 02/19/2019 09:36 AM, Vignesh R (by way of Boris Brezillon <bbrezillon@kernel.org>) wrote:

> Add driver for Hyperbus memory controller on TI's AM654 SoC. Programming
> IP is pretty simple and provides direct memory mapped access to
> connected Flash devices.

   Are you sure you posted the _complete_ driver?

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
[...]
> +static int am654_hbmc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct am654_hbmc_priv *priv;
> +	struct resource *res;
> +	int err;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (IS_ERR(res)) {
> +		dev_err(&pdev->dev, "failed to get memory resource\n");
> +		return -ENOENT;
> +	}
> +
> +	priv->regbase = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->regbase)) {
> +		dev_err(dev, "Cannot remap controller address.\n");
> +		return PTR_ERR(priv->regbase);
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
> +	err = pm_runtime_get_sync(&pdev->dev);

   That's all nice but where's the code that accesses the actual registers?

> +	if (err < 0) {
> +		pm_runtime_put_noidle(&pdev->dev);

   Calling "put" with previously failed "get" sees strange...

> +		return err;
> +	}
> +
> +	priv->hbdev.needs_calib = true;
> +	priv->hbdev.dev = &pdev->dev;
> +	priv->hbdev.np = of_get_next_child(dev->of_node, NULL);
> +	err = hb_register_device(&priv->hbdev);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to register controller\n");
> +		goto err_destroy;
> +	}
> +
> +	return 0;
> +
> +err_destroy:
> +	hb_unregister_device(&priv->hbdev);

   Calling "unregister" with "register" previously failed also looks strange...

> +	pm_runtime_put_sync(&pdev->dev);

   Why the sync() version?

> +	return err;
> +}
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
