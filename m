Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB33EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 15:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7kwxL9fQU145wEUR4/orxQb4emd0xxAEu5zUkte4h70=; b=HmWlqQDNRgsiq/
	iCWJ7D/LrZcxw5HACJpM3mAoQ9Iju8eNZEqp8lUVLsDQx95ppE1vK9eIqzd2WjlfD5jVLJK7cDDCk
	p+Z6HMBIVWP13SR0G2Mo4NxCjghyyVPK/p/ll4UV6WkzggdFK/lycw0cVjrMzk1vlCNrClXFXiXxd
	g4M2VPastRIYKAMI8IQD3rWu0d+cCNLdLbuqVW/ix7ApuCrVkZa8Fxq3VzkxWKGEj2XrenF5c3tft
	NZMppoTvKtrCTwX+LKxQ4TkX9ZkVMKANEzso79Sk4Zi1EYX4+tpAeMOSgXL/lFIq7g8NZ1dk9fRRz
	YxnKRVTggzDCpjk057VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4pQ-00GOxH-1f;
	Wed, 05 Jul 2023 15:54:04 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4pM-00GOue-2U;
	Wed, 05 Jul 2023 15:54:01 +0000
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-78362f57500so333921839f.3;
        Wed, 05 Jul 2023 08:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688572438; x=1691164438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RLbkYBSMtZSZWsdqOipQPRF1AXaIm7IXw5H9F31xDg=;
        b=eQ/QSvp+6VorQRfrrC8cYP+wh2GHofAQUp0FMl8JBryzMJ6ka3837eohpe3fpQ9OGT
         vUSoeKOug3eIaUHm0FCiEIzJtbAwLo+NWjpKCtWP5qRwi2Ym/7EUOm4vijm3cR8iF1Fx
         uMOPjrFPAhCVu0vEV7CXL4UMHd66GRK4NXsRKfR2XopXiF6mDXoSqHugtN+Zq+cQjqiE
         uxtw5g+p4wqPea8HtO9nmX1n9rFw9WoJIblOZEVmvvgzbCxtKuGEZXQDCrKXuqWS5Yuo
         fnb5xcjeEq+gtIjWEefeDfuB9TKboxX5kS6S7CywIeqAuPv5m4FoX+4tIu5wiOT5D/k/
         xY2A==
X-Gm-Message-State: AC+VfDyrvfllhJ3P6zt5q7Aj58N4M3f0TQHlw8YT5r3eUmWytqU3ZctY
	Q+G4qXc0aL+dSfsT2gyfCZhTnr0mWw==
X-Google-Smtp-Source: ACHHUZ73QtYKyynoI9ylI1XEWC2lq+A/sJ6q02lzFpAinNpUOyDvzNhBset5FBiQu0bFE/MLWXDyOg==
X-Received: by 2002:a5e:8811:0:b0:785:ca70:46a2 with SMTP id l17-20020a5e8811000000b00785ca7046a2mr18137083ioj.4.1688572438444;
        Wed, 05 Jul 2023 08:53:58 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id q15-20020a02c8cf000000b0042ad6abe0bbsm6425382jao.20.2023.07.05.08.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 08:53:57 -0700 (PDT)
Received: (nullmailer pid 691642 invoked by uid 1000);
	Wed, 05 Jul 2023 15:53:55 -0000
Date: Wed, 5 Jul 2023 09:53:55 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mtd@lists.infradead.org, freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, linux-media@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, coresight@lists.linaro.org, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
Message-ID: <168857243311.691536.13322875472425620659.robh@kernel.org>
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_085400_811470_E07F151C 
X-CRM114-Status: UNSURE (   9.22  )
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


On Sun, 02 Jul 2023 20:23:08 +0200, Krzysztof Kozlowski wrote:
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
>  .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
>  .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
>  .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-
>  .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
>  .../display/rockchip/rockchip-vop.yaml         |  4 ++--
>  .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
>  .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
>  .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
>  .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
>  .../bindings/net/mediatek-dwmac.yaml           |  2 +-
>  .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
>  .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-
>  .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
>  .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
>  15 files changed, 30 insertions(+), 30 deletions(-)
> 

Applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
