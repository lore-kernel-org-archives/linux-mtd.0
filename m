Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D89C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyuZqdN1ZT79skuULE1TgixK3+YtIBds9XQW7EtDvGo=; b=scRPRrwud3w1vX
	2XCza8ENB1A8sUQZ0TcTFp7pmrugFAc/PwPURp8ls119WLotDgQWdhxZfN9UG8CKSPJQfTI0gfAAq
	jqhpBS2HvEvx+dWHEvBT/SQkb0gTE7DjULjYOh8VCGRsGCCKAnFURsc4dGTs+8TK1e36g3bPq4FLH
	NSAjDfDLPsFBl+mniqRYpH+T4qjPUmSlMEmbjshkKbTfcYtpYCPSLXNFazHT1vJiugEg1fxtdZj1r
	/caD3Y/e+g68rF/savX2bgUM8Jb4st+oz5kVRWka/muMDWO2QRNUdC6tdL097mYulNx1EZhl2dfZL
	9dvk7W/xbuYgZ23Rj9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npV5d-00GBgB-Nm; Fri, 13 May 2022 13:12:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npV5U-00GBbZ-O6
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 13:12:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id k2so11414670wrd.5
 for <linux-mtd@lists.infradead.org>; Fri, 13 May 2022 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LGxOhx8g+uzMEucXSgcWuDgXr4IlXAOmT59wc9xxNUQ=;
 b=wRQl3HzxSMdYo3oAFiLxfCpRXx68CvABA7PTFHJ4KoYFsSKoKYI2o0kck84GVkrBPy
 Ydmi/opjnQr49lORQ2aUaZSPE+/GVtznPLLirTIhAGKxyF9K+8SkFklnqG8THPvEnIl9
 4OnyFli6+XLHcvlwPFcd/Lruz0Fk2j8qyZ0QhBnKLJzDsnJjuHoUuslW66qfhOHUDICf
 FYaXMNNqGc7u+UnZbaWj8jLEL35mH0fsJEnNRtrBKIZ1clKfzNQhhoetCB5ScLqSg8/J
 idGnNG0BGzsGtIvpg4JMSLaF5jqun0MxhJPpGU0TfZaAvlaDKAHhqGaxavFd2yb+/dB2
 vveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LGxOhx8g+uzMEucXSgcWuDgXr4IlXAOmT59wc9xxNUQ=;
 b=gfzKlaV4b3DCMLcwyhxegohOjh8v2WJLKbsViTxQkKhAEsPTjNnMYAYJzYEHyVh3w6
 AOcjAeIIXXyqfLhQqNptS0gFlXQYGTKhgy3hoCrendQX3r7GwchoY0amjUxbnbuMbWcI
 iP03Nq29IyR/OZlaPAZjSAHNAs670CuKgsKMADhLBk8oF/xRNj+Knc1cq0d/Tw+IH8oE
 swgYNxns2FCGHNL8zeYODm3WPxUTkErY6f/vyrfNNAAF8ZFR0k1Md6qlI5qH06FpzgCj
 m+K8pOgoHyZFdhdMEgXfnOaxGM0Qw/BjuMURWnT2WK1YG68WUtkTtXD9Trb5THONKHhO
 XJIQ==
X-Gm-Message-State: AOAM531hn8IfSvuaUovZm57P8gS1w56h8Vjt9UsXxgPv2EeNakm4X1zY
 UyfKEecyNj6D5LPihqtjBBz1bw==
X-Google-Smtp-Source: ABdhPJzqtxMi8tXdBozGwPO/lz7/uf3fxfcq7tdNkmA+KiH+k9aO4jgE0qPxI3t/ZmZJHJs6tODIAw==
X-Received: by 2002:adf:cc83:0:b0:20a:ca0c:ca1 with SMTP id
 p3-20020adfcc83000000b0020aca0c0ca1mr3817869wrj.553.1652447524944; 
 Fri, 13 May 2022 06:12:04 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:7639:a43b:f4c1:258d?
 ([2001:861:44c0:66c0:7639:a43b:f4c1:258d])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c460a00b003947e11c3ecsm2204392wmo.17.2022.05.13.06.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 06:12:04 -0700 (PDT)
Message-ID: <d0730221-537c-ba0e-378b-388a37a2a736@baylibre.com>
Date: Fri, 13 May 2022 15:12:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 3/4] mtd: rawnand: meson: refine resource getting in
 probe
Content-Language: en-US
To: Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu
 <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220513123404.48513-1-liang.yang@amlogic.com>
 <20220513123404.48513-4-liang.yang@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220513123404.48513-4-liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_061208_835394_127D166E 
X-CRM114-Status: GOOD (  14.93  )
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

On 13/05/2022 14:34, Liang Yang wrote:
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index cc93667a1e7f..6e50387475bb 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -1378,7 +1378,6 @@ static int meson_nfc_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct meson_nfc *nfc;
> -	struct resource *res;
>   	int ret, irq;
>   
>   	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
> @@ -1395,8 +1394,7 @@ static int meson_nfc_probe(struct platform_device *pdev)
>   
>   	nfc->dev = dev;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nfc->reg_base = devm_ioremap_resource(dev, res);
> +	nfc->reg_base = devm_platform_ioremap_resource_byname(pdev, "nfc");
>   	if (IS_ERR(nfc->reg_base))
>   		return PTR_ERR(nfc->reg_base);
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
