Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609E8EB64D9
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHzi81Zb7Y/Wic1Cru2M/CbvmNdUxwef64uIp4ohxEo=; b=nlaeCMQuRFDc0O
	Xj1MgxfDSFvAP86+n65gcEi711VFORn1uj22EqI2fkedc/COjyYboUBp/o3M7m9tmDrceiH1Ff6lh
	kfw2O2KjSrcYUL2B84L4p5ADGcjgpU3wXb1eCOILoUEHDOfP28hyXcPaHVUjj8+tCEwqOka2L0hCu
	nZc9VrU62Bp5z33uOqW/Zu01IvL0qOil3obv2HDETSX6KxuvkXpICFiaI7ZdhD6Qfn6tF8R/CpY7A
	qyvX7lCQ49WACZBZdsBK6DJscffXjW0syqke7USGgD6iWuk/TNfZjI+Jpucfo0Bebxe/1fCl/of9F
	eYjjTuKj23xH7FRe3izA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhEu-00DXXE-1n;
	Tue, 04 Jul 2023 14:42:48 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhEq-00DXUn-0r;
	Tue, 04 Jul 2023 14:42:45 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-440954dc5fcso1918297137.2;
        Tue, 04 Jul 2023 07:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688481762; x=1691073762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cxhjD7KY5JD674i+41mIILyrwvbeMopv+PbB7rT3+IE=;
        b=qXoDuKf7tijC6nBenqA4HmNXCVz12f5ddVrWo/iBC08Xy5X/GCcU43sZ0mtpwstHzz
         GGG4rED1L0Z3jHx0ObuuPnqTWgOV3lvgb0UgCTp0CeJLzQJEGAmTwNjVcNLWi2mplii/
         gTzcErjfLOJvdkMr/rbh3rwy+y80EnZd7ymGi3sD7e4+hc0QpRfU1gEicpQvVZGtzAVf
         6EUu76BBqp0jaLUX1ZJLF1j0K7hxvYq5PwkFk8Ccvmvlcutquq7I+RgTWyWu/YG1H3fa
         w3VIu5zXhiZjEGvEfADAqF0uBRfL7T9poR368enlmGkLswEIk/idT17/IjIAC8boz7sh
         McZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688481762; x=1691073762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxhjD7KY5JD674i+41mIILyrwvbeMopv+PbB7rT3+IE=;
        b=a1K/oGQEWqjqGRabAAEl36gK8HcfEcioPq3srygP69oCdyzDmssVZQxeQ2nxu/DE0U
         uJQEsstJSkTrcmX3PCd0SbDAmKwY8BLlu6v6NIzwELw5DxHSkUI9lSPrEEeUHn6yBoMG
         vZgnV4CYMxvpydIQ5rPemDin04ogFnoN4aFykee1DaCtz7GtGnlgP1lK1tDxJCM3K+Yd
         BLHLl7pSU6Kh662fOegpvmV1cgkM22rvIP4uihvvcF7C1eS7xsYASz7D8hug8gik2U9y
         QLNoR+uFiPOAO0/7ctUzIdknyrLM/tBQ833ZZBBg64ljaU8MTGDrf/iTGovGjBj1YGBr
         RLcw==
X-Gm-Message-State: ABy/qLZGGYWhav9508TRM5nSrSf1J0YfYemejoQCXHr69bENTN//fOjm
	i8StU/RfjnwV/ZA7B+VnQUwofLyZAmxuNejLYbY=
X-Google-Smtp-Source: APBJJlEzBfrRFFxw3waM7f1ipL7WWKBgZ8jQmyUjVtnbM0TCNsn4+zGfKdFXtaZmMtcuMEXY1XjZXuAM/dQift4uNtI=
X-Received: by 2002:a67:f3d5:0:b0:443:7170:b048 with SMTP id
 j21-20020a67f3d5000000b004437170b048mr6639880vsn.27.1688481761915; Tue, 04
 Jul 2023 07:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 4 Jul 2023 16:42:30 +0200
Message-ID: <CAOiHx=kreUEnqssO7y_+UqAxsnXaLPbwBz8h3JRkdEq+pkdW2A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_074244_302940_CF9E67C7 
X-CRM114-Status: GOOD (  13.95  )
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

On Sun, 2 Jul 2023 at 20:24, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
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
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 0c5b875cb654..d6c84b6e7fe6 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -287,7 +287,7 @@ examples:
>              arm,trig-in-sigs = <0 1>;
>              arm,trig-in-types = <PE_DBGTRIGGER
>                                   PE_PMUIRQ>;
> -            arm,trig-out-sigs=<0 1 2 >;
> +            arm,trig-out-sigs = <0 1 2 >;

There's a space before the closing > you could drop as well.

Best Regards,
Jonas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
