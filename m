Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66895ECAAD3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 22:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JzPA4rIt44UiNUBidO9HGw4wmBWjwLZzv5AVI3mXGJ8=; b=zAmFups//MYRrG
	W07H0beRi6tBo9du1NTxuVz09rvhhoRo4P8fNFM0a71s+HKdDnoHNBQG6MHMjtEMb9p3oivNcy3Ed
	2sfyGrX3yfJ/0dt29WR34I6x/j4FI4X1RTz6chvmEBVyYwkrH6myxKknd6xzi5hTN4z7A925ICId4
	jnbMw2pZSeVLWTP4o0158vtnMPT4IPpflwGSLZ1y3dBKASfkJga7wOLfnym/FQMwlq3Q5kCILlInP
	uuM7kM2cv6z2RQXXUTeU1+YVQ4GAo48rVJx/y4hzg2k7zA8x38KkAjpqjiDWlpN7zMqmxKhbeCOSf
	0/8ORlTUp9513ifqZ97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm3q-003HU7-TX; Fri, 09 Sep 2022 22:01:18 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm3b-003HQU-TD; Fri, 09 Sep 2022 22:01:08 +0000
Received: by mail-ej1-x629.google.com with SMTP id bj12so7056321ejb.13;
        Fri, 09 Sep 2022 15:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=BKCyjdc9y8jyZoNI0vZvSlCBXggxKRCrFRR6O6ctF+w=;
        b=iOMkKAyZEmwtbu4LUS927kV1V1ohVFL8tTMhjnHGf51srGxC3EyXBFcD6yL09+ncjj
         qID+niTIpLJob8iV0ZpTosx/Lzal4h1bYKDwO5KuaKeho+EF6hhtb9T1o8JcysOCc/uI
         nFN01b3iKP6X8eLEWsg4jBzVF8ksHYEOmxX+ochFPe02jgedQZLnjUrssAEBbG6ADase
         SuUohINaiD96DNsEpr05A4i9zSR6E9An+kHuRgE5TuWS7MSJc57ZgscY7ZrwVbqiEpNY
         4U9dgQY/8ywa7hMaLhHTpdQ3OhewmIJG/lrcR2gDWZZ0NM/ASt1mJJOTrAvrIIsHjUHE
         WZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=BKCyjdc9y8jyZoNI0vZvSlCBXggxKRCrFRR6O6ctF+w=;
        b=Z9qEHFRbPUFop2qfVPcIlVhkxqa1/V1UzYIoEmPB+1m6ahNfxE4xCiTVhnNftgF3OQ
         musRXN/0QAcQ2GSKIYU1r5AO1ft9TSTROgOd2+abxUnUHc1Ko2lQkruLfiRNlCDwrdho
         kqDHP22/CTj7rhZuLPhUFf57d6aEhrm8saUlNoKeMWEUDDAdtCgReBGCoOMToyaQRwVi
         9zGeWNzzQKW9+ZisbD6BpdttjxAKQSpY0o4OIzahbBRRG28g8mUOhJU5TR01v1f1YxWd
         jUzc/hmY4dxC+RZA/wyY3+uP/OJPJbF9+ZS7MLemJAbjSdzxB94LC9HYYlE3MTagr0FV
         Gb2w==
X-Gm-Message-State: ACgBeo1l2mgozhp70nbQeQuCN0881rFrsI7bKMoq1QI4uiAiPKmS74bA
	10eITKF7j/aP/ugfItzSNrE=
X-Google-Smtp-Source: AA6agR503tkKhQAd5Imgm4BPLKzov2ax/W4FLtg+tbq9EVWiAyuvxJRq+pRJaeUnfeqG3X9/MdTZ8Q==
X-Received: by 2002:a17:907:6d05:b0:73d:8092:91ea with SMTP id sa5-20020a1709076d0500b0073d809291eamr11258913ejc.280.1662760862538;
        Fri, 09 Sep 2022 15:01:02 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id kx25-20020a170907775900b0073d70df6e56sm797592ejc.138.2022.09.09.15.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:02 -0700 (PDT)
Message-ID: <3ed145c6-f400-ee75-ccac-894b0a0d15d2@gmail.com>
Date: Sat, 10 Sep 2022 00:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 00/11] Add more Rockchip rk3128 compatible strings
To: kever.yang@rock-chips.com
Cc: sjg@chromium.org, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, ulf.hansson@linaro.org,
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_150104_342507_4E79CD91 
X-CRM114-Status: UNSURE (   8.11  )
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

Mainline U-boot has some support for legacy Rockchip SoC rk3128.
The rk3128.dtsi file is in need for some upgrading.
To verify the nodes more Rockchip rk3128 compatible strings are needed.

Not tested with hardware.
No intent to port drivers or dts files to Linux for now without physical board.
So pure for the bindings. 

https://lore.kernel.org/u-boot/421195e1-472c-f337-e87a-b0b6d520b808@gmail.com/T/#u

Johan Jonker (11):
  dt-bindings: serial: rockchip: add rockchip,rk3128-uart
  dt-bindings: i2c: rockchip: add rockchip,rk3128-i2c
  dt-bindings: pwm: rockchip: add rockchip,rk3128-pwm
  dt-bindings: mmc: rockchip: add rockchip,rk3128-dw-mshc
  dt-bindings: spi: rockchip: add rockchip,rk3128-spi
  dt-bindings: usb: dwc2: rockchip: add rockchip,rk3128-usb
  dt-bindings: watchdog: rockchip: add rockchip,rk3128-wdt
  dt-bindings: arm: rockchip: pmu: add rockchip,rk3128-pmu
  dt-bindings: phy: phy-rockchip-inno-usb2: add rockchip,rk3128-usb2phy
  dt-bindings: soc: rockchip: grf: add rockchip,rk3128-grf
  dt-bindings: mtd: rockchip: add rockchip,rk3128-nfc

 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml       | 2 ++
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml           | 1 +
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml   | 1 +
 .../devicetree/bindings/mtd/rockchip,nand-controller.yaml     | 4 +++-
 .../devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml       | 1 +
 Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml       | 1 +
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 1 +
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml       | 2 ++
 Documentation/devicetree/bindings/spi/spi-rockchip.yaml       | 1 +
 Documentation/devicetree/bindings/usb/dwc2.yaml               | 1 +
 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml   | 1 +
 11 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
