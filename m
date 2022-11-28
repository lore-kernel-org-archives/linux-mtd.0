Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8373BC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 09:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrKuCSmsn4yCABs9SLibSTUeTradnUIo38ASSpfkHeo=; b=gkAZG7oa50flIr
	liHC53nGdjww4YNpJW2faJ37PFg/WcOFnWF5XZApDX+W6cOV7nml8cGZsOMob7aOAnYcbUXqwh2E7
	olKa6bSGqJeR7ecJ3ryFwTo6Wrol89ASNCqkYms8LP4FquVBGdHuEG8AfmF1eAdeD/z0QGIrLK7hJ
	vsX+UEOv6ZEN3VG6gnCob/pFbfcIZrCZKDfLFBIkbg5P7G7iZYwpxpgG8HWlFjyNG5BUDe7BHoCBO
	hye9UQ9PqhlFTcK8OlozHja0F9wlZQcc7p8F9U2KdN6SFgOpzTZSbWzr1wLnkl72lJD/r0hWbUN9g
	lOocIxEQHAQ/Tb6Npkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozaDa-000Xx5-Kb; Mon, 28 Nov 2022 09:14:26 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozaDX-000XvN-Nv
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2022 09:14:25 +0000
Received: by mail-lf1-x131.google.com with SMTP id p8so16321888lfu.11
        for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2022 01:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkReJ90VlXZipcieJP+LxMqlEDeh2xQTKCDZfX+e1iE=;
        b=wMluYro34AD5YgTFiG7abKf7uRqzvRZwq0jFIS8ouvvUhtMZLzlTDoMrkgnzfeFmMR
         su2WZFTnt5ec0GZhSxo3pFYqxlteZFhk3UJp++QWBAvOihEh9hI3ujRGvO1/HOJXh7vb
         JgTSYMjlTXBeBG/LlSHC7Nd+bKYjV5uFoJ9Vpm6JrNzBur9yJb0+Jjz0J1AlzREAgoA/
         r/WN5wqxhLqaYP4ip1KFCUt7TzOO4V9YRlPeNkT303ileUsb5J4aJyKdjDl+vcrcaNgZ
         8ZxLcCEeCaMYQhAyoqsv6QAincEuo7FVWKKXfaNEpjh8p5N4UFjGg5RY9Maj9a/p6/Oj
         6lbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkReJ90VlXZipcieJP+LxMqlEDeh2xQTKCDZfX+e1iE=;
        b=5q8sJHXJqxSidMNSodlpYNLZQFKBpMAbdoQ9OndvWB0hclK3SE3pF7+dmi0eadn4i8
         ijYhxuLPZjcISIqFe1C84mz/1Gp3PcPddy9uvamWGNMCwaXvBfZA6pQAbKyq9CGT5eX7
         5ZFdJK6W/CEpWAo/TMzWDXp2PfkDnI6TRGjlkhEgStini6YpTtI4gmrCFq4NSwt+DPOU
         H/2RO/Dii8RBuSWO0Y47KW+Eiw1ZEDkEinWp3elyZbO9+oSta1PIEOjfH0U1bhiuDsVW
         Q6Mk/WL/V7gSCDmB5QF+/spiqeHocwrGuRLYTwj6uryXMsFpGYzhmfWwLSIkm2dnfH5U
         H9jQ==
X-Gm-Message-State: ANoB5pnq3V+e3a5VSKcBp8tDYW3LmdtcHmmJOYJVzvIqcF99FPZfhdfs
	lGLVrnquSqMQ9bhtVc2QE9zejQ==
X-Google-Smtp-Source: AA0mqf7VFF7KlQ5JNG7Nu5DqZjr/9kNS2XZ5IQebDCCdPMcFPsF7VNqsyT7UYbNNPNMPIwCGw4EaeA==
X-Received: by 2002:a05:6512:108a:b0:4a9:9827:68ed with SMTP id j10-20020a056512108a00b004a9982768edmr9970612lfg.45.1669626862175;
        Mon, 28 Nov 2022 01:14:22 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f9-20020a19dc49000000b004979df1c1fasm1645867lfj.61.2022.11.28.01.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 01:14:21 -0800 (PST)
Message-ID: <7c99678b-8df5-5022-b2d9-33098f885203@linaro.org>
Date: Mon, 28 Nov 2022 10:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 9/9] dt-bindings: mtd: ecc-mtk: add mt7986 IC ecc bindings
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
 <20221128020613.14821-10-xiangsheng.hou@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221128020613.14821-10-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_011423_804631_CDDAB89C 
X-CRM114-Status: UNSURE (   8.05  )
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

On 28/11/2022 03:06, Xiangsheng Hou wrote:
> add mt7986 IC ecc bindings

Use full sentences. "ecc" is an acronym, so ECC. Same in the subject.

Subject: drop second, redundant "bindings".

> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
