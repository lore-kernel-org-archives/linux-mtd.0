Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57454EB64DD
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jul 2023 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q51d0tRmZCenBohavJ0kwyGoYhF+cbbgHWU9bkqJHM=; b=RrD8SN5Cj8kRMxz+GnScjVrCO3
	8pbFoiG6WkW0v3CoXX6zZw6POzp2j6h0RAx81Oc399c599IRrt8vKZk2gBfbOL6Ryn4dW1gIC62+j
	qSr5yMtGZKaHEn2Cw8rzkwXWwnOhkLWEloLQ6UiLJaOmZpyKV+RDS85GKozP1nNcQ7cEPAiDE0NOi
	K3nDLOTSxsvX57J8KYxFd9GBbKdR1L51KxM0u0e2wvq4PMJa4NITubquCsQTMhkdpZo/rdZ2/NjOP
	xqpUjzrsRen4ZuS7dSurizg7BukhP0Vavl6e6z8yyc9s5XejEa6vGvv2pcbOqByop5qiCx/PpAxVm
	sNo/7RMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJYh-00Acoq-32;
	Mon, 03 Jul 2023 13:25:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJYc-00AclD-2M
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jul 2023 13:25:37 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so43532705e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 03 Jul 2023 06:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688390733; x=1690982733;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IOndpcYQZRei86HjTSa6sLCOIMedJ10F8ZmbDKThl2M=;
        b=vd7G70PqJmphoqcC5/iGI9byEgifXwK6Rj3mJrKjAIB8uLw1hpzkudZj36bLUzAfkk
         CjzNWks5k2enqZ83uiheJk1bPKP4uBNGIYPZq9fUuff3p2KtuZ3rqJncJyFJqF58Wk11
         z3wyE/Lpomy7vrHjrlZWBHS1lrFctL5sXDGQirjHnrOynrP0Lsyxy/RUFfpaiizpZ15D
         m2niLhmeobmjKoqyeci4H11VdTtxm8S2YpJ4x7pVGDNNw+N9JpOT8TaCH2LRBE6AMkMV
         2n86A3zQAeyy55sfLbSPXNIM5/Y7R6C5jvxqBMMqtnupqZrKysuVl4uSym0zdS0BCsLV
         ydtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688390733; x=1690982733;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOndpcYQZRei86HjTSa6sLCOIMedJ10F8ZmbDKThl2M=;
        b=apvq7Cgmx8NHA2htU9tI2dFhZIfO0fPUUj1ziunUN0qIy0XKnTPkxgT05CjEJD0l/D
         7AD5r+LjbcMJ3XiJHprUZN7uww8tBCLROxrQN/r8mM62YY+WtBC3U7IBm07vEud/uZj7
         paXLuXJ+UMhhmqKP7BMb67M1mp35iI+KTzdfSkCoyyrdRQlPvow52UY5tVilbdIo6gWe
         RFYW6LRzlXCtQmLTnmY3gQTxyBSogDO3tD7GrEq/IDSCmNC85YmUAxrlcxiLvEdOxLdZ
         oz51Mvu0Paq//y39ivTzhxUVthCmJdfWrfB7oGdZONygfhVa+AX9aZLHoWWWUhIkIhba
         ELZQ==
X-Gm-Message-State: ABy/qLbw61kRHWL0kHGY5DO5DNegTucxALkAwKdV+kygWLhGVyWoXYTn
	J4a8Hik5bkDzVI41MNxtJPtoTg==
X-Google-Smtp-Source: APBJJlFRFQcvat3EQxFgB5SI6iSmXIGa31iU1VkZvt3I+z99Hnaof/6yj4+br2u7++97LUjZHWQZuw==
X-Received: by 2002:a1c:790e:0:b0:3fb:db66:8332 with SMTP id l14-20020a1c790e000000b003fbdb668332mr1599049wme.40.1688390733118;
        Mon, 03 Jul 2023 06:25:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf0b:9dd4:190:b74f? ([2a01:e0a:982:cbb0:cf0b:9dd4:190:b74f])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c205300b003fbc2c0addbsm10279849wmg.42.2023.07.03.06.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 06:25:32 -0700 (PDT)
Message-ID: <1ed2eca7-b5bf-8d25-d38e-15022a8c8a39@linaro.org>
Date: Mon, 3 Jul 2023 15:25:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_062534_854569_5CD3303B 
X-CRM114-Status: UNSURE (   9.32  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/07/2023 20:23, Krzysztof Kozlowski wrote:
> The DTS code coding style expects spaces around '=' sign.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rob,
> 
> Maybe this could go via your tree? Rebased on your for-next:
> v6.4-rc2-45-gf0ac35049606
> ---
>   .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
>   .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
>   .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-
>   .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
>   .../display/rockchip/rockchip-vop.yaml         |  4 ++--
>   .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
>   .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
>   .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
>   .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
>   .../bindings/net/mediatek-dwmac.yaml           |  2 +-
>   .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
>   .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
>   .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-

For amlogic ones:

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>


>   .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
>   .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
>   15 files changed, 30 insertions(+), 30 deletions(-)
> 

<snip>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
