Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8094BC6FA86
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 22:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTqjnT6+Cf0hoHTtjiAvUW09GzZPF+GelJhXYJwj/1w=; b=u1vcidL00rOT9a
	hlHryhmO4vqccU2dT1tPzdSpRcVlVwwQWoU9uO58FTth7Q6wDD1euAKOouf2E2n9v8QwiBFJqartT
	pXJ4va29ZPkoh/sTLttom+veIg4/SnayBSQS7aHUT8rnPsed0aOYEDl2TcpiCXjg6ogoTO3CK0jQH
	X3JfaWHgXoi4mrpN2CnDsQUhjyLxV/ns1jKri0DO+Xqw5knF3dVbFtlVtO3CVUwz0GT+mgr6tvPPh
	T/sS0sh8Kw4SexIQBnys/XRAdCRMTiGXg+CZ/ITxD8ivVk3kx8xSi7yAARHr0Y+EUALCCT0mdw4rZ
	ODkUoeQfvLvE9DPc3vvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm5n-003IsF-2Y; Fri, 09 Sep 2022 22:03:19 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm4L-003HmT-7k; Fri, 09 Sep 2022 22:01:50 +0000
Received: by mail-ej1-x62e.google.com with SMTP id lc7so7234304ejb.0;
        Fri, 09 Sep 2022 15:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=qFqPSvBGjdUsVcV5ZS+65QeMy/XEKV7OnAaz6pLKOfw=;
        b=Aq5Txh40RV1S3WvnnQtQzYz5b6rkZkPkiAyjnO9W76im/RXn3A2CAdtcAYKu0saeBm
         64v/qE8X8Gr28VFWaGyrnaU13aylc0AlCIa/ukAeLVpbxe074XQLC9kLGoV77aTfl+CJ
         M9abehot3L1NFJHP3YN6hiUlPZdXzgkLtTIrvTfCqFPBtbHbtuXaiGqBmXAjaf5S0iHT
         FUTDEWefWwxLWd3rRFj7YNuOXV88AEIhmvwwNwJ+tGhJL6ty5kHxYymOVbIZnLHlF2uv
         lyVsuD/BFZVmnEYsIZMQF3+j6XJMo/0NbGfN83pAbkfMGStus+ceoL5jyjbcnddIegbZ
         vr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qFqPSvBGjdUsVcV5ZS+65QeMy/XEKV7OnAaz6pLKOfw=;
        b=TJ6QAcwpp7o52zxCmeKDUp08oARKcajfjfxT8qrjp3QbPE3BCOfkvkIjSBasLHKry4
         v3TCaowUXQrSFXEQ1AaZYhaFrSL75FixTRb0Oe2VCm/gaKZ8kRo0JP4HUbU7zrunQ2Lr
         CZ3t6eyB8SDlaDGI9vZ+1CcpuQhS/wbbEfZ8N5I4rLDjvJWFUUFtIFZcz7jVNjBQVIpJ
         owgK8o5CLtLGFotcoAqlfgUJsVd5oxfWTbLd/A/ATNppcjb2bbEoGmJHJyE6qAGZqgdv
         8w60APuDp/lURTi7WtdAG0uUu3MIbJohx9XWltFLhv7cBhvfU0T4xs5bJPGfZhVQAROj
         KRXw==
X-Gm-Message-State: ACgBeo0DvNOvMWo4zaZphd6cXf/0/uvqxWOx/FCN+LBoDN4kOFvNKmga
	PRUcKtuQI0XDr96d24yu0/I=
X-Google-Smtp-Source: AA6agR6kays4kR8/EPe2OVFsWoVLEdWSsiVS+SIhxyvMVF8om26ABaEGzg1Jko+NH6t0J2E828rBUw==
X-Received: by 2002:a17:907:7242:b0:742:7c5:46b5 with SMTP id ds2-20020a170907724200b0074207c546b5mr11460741ejc.274.1662760907774;
        Fri, 09 Sep 2022 15:01:47 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906329100b007742cf42836sm812553ejw.144.2022.09.09.15.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:47 -0700 (PDT)
Message-ID: <d477a077-a68f-e752-5192-807db80a9e68@gmail.com>
Date: Sat, 10 Sep 2022 00:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 09/11] dt-bindings: phy: phy-rockchip-inno-usb2: add
 rockchip,rk3128-usb2phy
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
References: <20220909212543.17428-1-jbx6244@gmail.com>
Content-Language: en-US
In-Reply-To: <20220909212543.17428-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_150149_366638_730EB493 
X-CRM114-Status: UNSURE (   7.06  )
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

Add rockchip,rk3128-usb2phy compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
index 4b7528973..f71920082 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - rockchip,px30-usb2phy
+      - rockchip,rk3128-usb2phy
       - rockchip,rk3228-usb2phy
       - rockchip,rk3308-usb2phy
       - rockchip,rk3328-usb2phy
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
