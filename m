Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE858EB64DA
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 13:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pjrm9V2rUghrjT0ffbf7ga7d5Kf2Qwm2qYDVChWS6ng=; b=UkCPGPm+2LSaO/
	D1ugT+XUzeFXu3MRaOjv9xeU+O6A4RLZK3Ec9ImisDehSSM1eXe+/Ph7P2xlVd+RjPTTF4j+FgCup
	v3zsCYL4OdADGfRjlG5OS7EYGFazl4PXepScPbBoFJOxBfiSLD6vods6cLxZYk8AfE8Q5NfDHBwUg
	M23ck11sNku1aOlv234ClTXyqcZEu+RNoBL34sJVfLVafVgQRfYDn5IoufRnNQPiRxw8/k4f2Z6M3
	Pa+7y4vbIyTZFBfF0rvc3nteQWAqV4juc/LOPxKmrritRzy0J6UhGD6PEMHmKVa8Aigl2gEkSRWfR
	gBipW1RDw4lCZv0xhxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgLy-00DQni-2Y;
	Tue, 04 Jul 2023 13:46:02 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgLt-00DQkG-2N
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 13:46:00 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-c5e76dfcc36so509779276.2
        for <linux-mtd@lists.infradead.org>; Tue, 04 Jul 2023 06:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688478351; x=1691070351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4AMLUs9zdYkz13PYZ3sZgfaLBUzB3BRb9jZF/zG6Gy4=;
        b=f//c71F+CiiJ0nQYLNnQXUSbAHrEMuUk0nw1wwalcqczyC4cibu2CBc5Bqq1RtJtEK
         FXsYoEaQ7ltPESn8l7IvqYRBWfzWOkclLdWaPGFVrKHk+5accVNfp1ogMQeHL57mySgK
         7REX07YJruKKEqpeJ1dFpEAhuIMJL793hsMehXu3dJIkAXpGsq2VMuqxiKntG4+N+dhi
         m1YwWB8Dp0tYJs5Z1Epaw+dcPiE1gnPCw1dfO9E/U1X/Fe4jvfwhFUGRUdFPE5QKYlk+
         j3l5fF84hhm/UUWt+erN34P6+c7IDsRD/GAzIQeE+5mP6ziVCt7nHB6EakqfCgM6laVa
         8abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688478351; x=1691070351;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AMLUs9zdYkz13PYZ3sZgfaLBUzB3BRb9jZF/zG6Gy4=;
        b=mCcl2wp4qVcQocmn+z7x3HQS8Z+wGHPNsehB7n0phSmMyloHNcOdW7C5CI37DjErUY
         ttCmpTDXAJdMEGHrFcUCtg/tMG1X34NHN39o0aTlixYin1jZ4mGeOQ9hjGV5FSn6rcbT
         5+WTMzZ+cNIGhd9kr/io/g54FlwSvtmorOpz+vY0xiW1b0eRmOT0+n3vrh5Q8/DJ/5pa
         EacwGXgbf7jimJQMYdccNbuv5nyJigHWQXtVtzkICJ7PqoHdKr9sunNIKqL9ZKz1ofp5
         9r9NnS1ezVbG1sMyj9zN80rUl+0CQibSBeSzLtjOCzqMrpfux5Tit7KcGs+R+FaZk/xA
         LUzA==
X-Gm-Message-State: ABy/qLZ5g+J39WgEqzYCXj6LmshPBG0toLHNMSw1samwE4SVHxFFFEO5
	fVfvMaCH6HxUTw0mkAvu26jEDIbXxPi3kVRcUrOROA==
X-Google-Smtp-Source: APBJJlEleHWeClZf2D74mZ0WM0CjCPjrraHn2hhQsLjcjs+MPeKaQJowGKx5dWhdHhQ6pcRJZwraIGBorgd0saV7QNw=
X-Received: by 2002:a25:c5c3:0:b0:bc1:dfa5:83a4 with SMTP id
 v186-20020a25c5c3000000b00bc1dfa583a4mr11215700ybe.13.1688478351717; Tue, 04
 Jul 2023 06:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 16:45:40 +0300
Message-ID: <CAA8EJppVOc0_e_o3CX_U9BvDWFKaz2-0FSZsXt11kDg5SXBn5A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230704_064557_773008_AE65CD1C 
X-CRM114-Status: GOOD (  10.94  )
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

On Sun, 2 Jul 2023 at 21:23, Krzysztof Kozlowski
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

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #display/msm

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


-- 
With best wishes
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
