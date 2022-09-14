Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD1CC6FA82
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Sep 2022 14:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnEk4xCI8tVS5Ys5mbmjAKdI/0pDRkN59U71QfhjgAs=; b=dTdLsuq+bwbUXb
	sZu16UGhO2YP5aaw1dmETTgdy5Ug9mopU2DrLIaEUvb2+/6WEZBKf/VJkZYtnB0h94rhxDLsi3zzO
	1JJGAs7dkoPLe6nU3c1Dzzdc/cF0F6Nq9lCPiI3b4aBFOFftKBTi3NxUSbPobTNh/v+y4AIfewA1Z
	8BF6bZLHPSZdz+sXzvRICSP5+heMim8A8LMQpi8Pzt1LpwtP2vO1B9gjrV0NfT6g6g2M1CGASEeq+
	ZCCA3/kRE7CVWCTb1hMWtBdHPopjatpRxVRofaD131fcznGZdbcMR+lbWpb864ywiq+s51RArmLc2
	3nd0lultw/fONPlDFedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSxY-001WFm-56; Wed, 14 Sep 2022 14:01:48 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYSx5-001Vce-0Y
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2022 14:01:22 +0000
Received: by mail-lj1-x22a.google.com with SMTP id s10so17751148ljp.5
        for <linux-mtd@lists.infradead.org>; Wed, 14 Sep 2022 07:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4I1nWuKw3OANLT7/DYo/zylVSp6G+u/GpJfP6xzHR3E=;
        b=brLbhteVZvljyIvgq/BZuRLdaBrU3dauTxDoV0afpm3D8G8eC+PzDhihujize4u5bY
         xgox21O6n2RkerLtHPJSxFlI9Ypd4EaaCMtXQ7yq5LZNyMV3rxWn43mV+DL93secxJ35
         4Mo/5OnJiR6EUaDKMTG+vYej6lxDoTN17UAF7qfMYvtkuVe2JYPn54zshCzOug6c4hnm
         0PMtdZptGI+KTwKQPmr17gsklS46PN+JxnAiFa0Kz1YXmHRDDEHnUiBiga5Vbxp6gH4i
         w0hl0XbK0nFJOe2yMuLg3FVQgvh34lleAXvP2oQC+kW2m8mmi10ye76Qq7J6zmCtULXy
         wI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4I1nWuKw3OANLT7/DYo/zylVSp6G+u/GpJfP6xzHR3E=;
        b=ysWnMhEMazjvUO9xx4MpIIUe04F4pEaJlGlk9ySvMmlVXqQCZ8BFKhgYA1WPL6v3hf
         NIAamG3zI9PWo1/c+TFkPGaeBGDnGZkJ0piVftjNplJZi71ONW5S7qcZFiFpKwRWsnKN
         fBGUJP1LqA9ufj3Re/wBWAWfVOQbruAHDYIIMdZtYU/JeFFA26vT/w8I4qFq5iY3gBVK
         OA4+ksBSPOVpejeHdTjb5uvBYD1OhPMldmLGp6NnAarwO3WVPU7LPpK9aLxGG+FuS7Dj
         8qrXkePpGgprYaPpYjfENv1osRRpL7sqylCnHtLubRg7zCkqTN9qIbvJK7tZxyD6OPzo
         Eurg==
X-Gm-Message-State: ACgBeo3Wlc6/5SZGHXUUfnA8bv6L8FljiwMThnn1YqABMkZdl3DX4P5N
	Kuz0pL4izzQMbP3/NP39dul+3qSr5ATmqQYHurR13g==
X-Google-Smtp-Source: AA6agR6JkJbCqyE2gTrtp6CclhDjtY75sWE4XsKvRX/lZhn/DSwVZZASJB/yTmhXGA6tUkOdrnfrqI0qNyYf9XVzF8k=
X-Received: by 2002:a05:651c:214:b0:26a:b03b:9e0c with SMTP id
 y20-20020a05651c021400b0026ab03b9e0cmr10198201ljn.463.1663164075540; Wed, 14
 Sep 2022 07:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220909212543.17428-1-jbx6244@gmail.com> <f2cb42c8-3664-a2d5-074d-5c9a10c693e8@gmail.com>
In-Reply-To: <f2cb42c8-3664-a2d5-074d-5c9a10c693e8@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Sep 2022 16:00:38 +0200
Message-ID: <CAPDyKFrF5Tn9a_hqp7mrp14YCrcX4LV6Y5qNxOz2ZSRJJuMmCA@mail.gmail.com>
Subject: Re: [PATCH v1 04/11] dt-bindings: mmc: rockchip: add rockchip,rk3128-dw-mshc
To: Johan Jonker <jbx6244@gmail.com>
Cc: kever.yang@rock-chips.com, sjg@chromium.org, philipp.tomsich@vrull.eu, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, kishon@ti.com, 
	vkoul@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, 
	gregkh@linuxfoundation.org, broonie@kernel.org, wim@linux-watchdog.org, 
	linux@roeck-us.net, zhangqing@rock-chips.com, jamie@jamieiles.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_070119_105973_C31CC570 
X-CRM114-Status: GOOD (  11.55  )
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

On Sat, 10 Sept 2022 at 00:02, Johan Jonker <jbx6244@gmail.com> wrote:
>
> Add rockchip,rk3128-dw-mshc compatible string.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index bad28bc74..95f59a5e3 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -32,6 +32,7 @@ properties:
>                - rockchip,px30-dw-mshc
>                - rockchip,rk1808-dw-mshc
>                - rockchip,rk3036-dw-mshc
> +              - rockchip,rk3128-dw-mshc
>                - rockchip,rk3228-dw-mshc
>                - rockchip,rk3308-dw-mshc
>                - rockchip,rk3328-dw-mshc
> --
> 2.20.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
