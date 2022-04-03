Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6958C433EF
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+T5jB5/pCvYh43SjYQVOH6GldtUWwEK1FU/iZCF1avo=; b=sPy9hEdf5KnXgT
	RtcL4FaosfaRQr16+Ovki/fygCgvcx3xMqcGM6/MEP/Q/C8ZmKZqEv6mzeur1rOx3VLqK0rM5nVKC
	Yd/NK0gDWgy0oUCftockpn+LpELMVH5shggSz6O0cm0M798wpsiOkSmdV3i93xWGE1Dgz0i+ILT1o
	j6Uvr+zfS1NaTM2xuf8Zhy07pj6TaNHnsjBJgvcWuCrBe6SmS/d4poJrKRmMKmutAO3hLFHoLZu6Y
	QeirVP+oBmCCBu2iFJ4yJx804ZtoSN/4mt6dZOwk38g4kmXV7DaA6smUvrXc59Yh1HOLZpo7cV0v/
	9Uhhfmwlrd50UXOrFPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb2JX-00Bil7-7Q; Sun, 03 Apr 2022 15:38:51 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb2JJ-00BieC-3H
 for linux-mtd@lists.infradead.org; Sun, 03 Apr 2022 15:38:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id q19so4017513wrc.6
 for <linux-mtd@lists.infradead.org>; Sun, 03 Apr 2022 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sEXxi1oey9g2W1h5KyCkUsYbDt35qHocHgmTe1tpXso=;
 b=JcpLNe9/pudDEVRHxP+QM8uFpur6LRnLKIvN74+hO6fHL1sIymSzFuSaQyxNjmwYv2
 s08Q71x4QJOW7Nh/1LbUf3OIY+3t8DFVw3/w/m14RKBsVEjJ8N737SMA2WP2SfEVwxyZ
 PtGiXUoDTa+sVdEwFlcPzAYunvHinNAb1BuxiifJ/b3ac3Lsunq+Nn/6a661aRBmNlRw
 N/7oCshyxl+lICX2Tf3oMNRyPrdhwhKCzAOmpahP1FkeCt+QwPTz0gJzgNnMXsS9XUX/
 0w6UuhpvnLqRjGUYqWZebaQs7UBuhnEB0uCU0WAmpuwMVW6WYOc1qY9Wrjb2WbFz069y
 A/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sEXxi1oey9g2W1h5KyCkUsYbDt35qHocHgmTe1tpXso=;
 b=CC0ICBNSSDS3YORMASFY2KFiRFOX7GYzBc0QkDHXAVtz9S0WRvUvV6FSpE9ZeKwIQQ
 NHKcIy9AmP2H2KokEex5i8I7PAB4RnbtYkt2rbhSI9Ljab8n1M59kq+7HIuaa57/rqG6
 +4lKqLtH+HdICwgSF5LruTodOqlYZsR6mNoMbCHYK0Z77W7bujGJThUJSNp5L11rdHJH
 uXrGQHfinNt69oKp+jF3FqE6UoGhzOCB7egZNMg6Vw53P9qcequkFASDoBf2T5QFvyoU
 he9e1q+x92lv0fnbo7mbF0Q2t9h+LS9lAwuy8yauIfyyydn1Et/9CB78KqpVRTJmF/S0
 TdNg==
X-Gm-Message-State: AOAM5323U0oeskbbapXRl7J3KF+P1/flIYmmhM0yOZvydW+2t2QOuX3S
 JPd4+wR5GylYJNpMu4riM+vMUg==
X-Google-Smtp-Source: ABdhPJzjTyPm0Buqxb9GeLrcApRwPGIC65Z+MHoPlQL+zDOwSv6J3ZSmjdbYZuXDAfLM93+fdC300w==
X-Received: by 2002:a5d:64c4:0:b0:206:10a0:4034 with SMTP id
 f4-20020a5d64c4000000b0020610a04034mr1155255wri.104.1649000315078; 
 Sun, 03 Apr 2022 08:38:35 -0700 (PDT)
Received: from [192.168.0.172] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm14788866wmq.12.2022.04.03.08.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Apr 2022 08:38:34 -0700 (PDT)
Message-ID: <d2815bca-22c2-691c-1fc0-07fe87a401f2@linaro.org>
Date: Sun, 3 Apr 2022 17:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH resend 3/4] dt-bindings: spi: add binding doc for
 spi-mtk-snfi
Content-Language: en-US
To: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>, Florian Fainelli
 <f.fainelli@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>
References: <20220403131453.1269229-1-gch981213@gmail.com>
 <20220403131453.1269229-4-gch981213@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220403131453.1269229-4-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_083837_151186_BA5539A1 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

On 03/04/2022 15:14, Chuanhong Guo wrote:
> Add device-tree binding documentation for Mediatek SPI-NAND Flash
> Interface.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

I responded to you first version.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
