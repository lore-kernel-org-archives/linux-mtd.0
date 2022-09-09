Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B545BC6FA82
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 22:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TEJ41glD62YGYT+08mCS4kDB4uqyn0bpJ7aqkCLmt4=; b=uObpX5HvO8kzfV
	XQ7J/G8EdCTT+4/8ovnStFEWgaH9Z3cITsUcHEL4bQaEYH5c3nmVClrUEiyjjaOgiUCcITatMFHbG
	jfGXM49XMTbrTgFzBKf/Vn+fIU/yweRGAf3vSuiDJBut2FzHQuD5tj6UyMf2DiVlKCvN8vAOPCXTU
	XrGO68TGsmumcu1FI2YvrrPUAEBS/2Q+rupPWTqkFSGRdDixhxboJ+X8AnCmyzD1pECc4Inb21R+Z
	DR7Cp+mcRCbBt3PIeyR3q0aS27qvfbrDSkn93Y8oxTNx+zdIHkSnjar4WQfOo5l2FlmIE8mkwAzfr
	9UPrhy7pQOv26YM3psUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm42-003HYG-IS; Fri, 09 Sep 2022 22:01:30 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm3m-003HT0-3O; Fri, 09 Sep 2022 22:01:15 +0000
Received: by mail-ej1-x636.google.com with SMTP id r17so7103905ejy.9;
        Fri, 09 Sep 2022 15:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=sz6llQ+1OH71vS4laq85P7K98uLH6vUckiEJ0IbDFPs=;
        b=CmCgdvOgrLT0HmFV0R2flfbz2SUxQH8A18sREaOQ46ko1gPfmTtXZgMqNuf33whZhw
         alDTKt3SSIknPM5/THAcxzKa2H60MFuJoWWIgTjM4SXV9QGhISbWzRtBmakTe+NTgVFO
         4Ju4OYim9nNNH9Hfn85qtQbMPug79hPeMEM5yDQMduIoWN8YwMRD9Ek0q3TDB/m1hHi5
         7pv71T8nuAIlrJZ5PjJwHf87irhEFbQ2J9CNn2uujXBaO1sUdieSQyt4cuzRGOaV+n8w
         SSaSMdDe4WJt/WiQbzAYLHxdjRObOSXjvQ41vMlbkWzYpaxViQ4DQF84MFVgY+Sv+AU8
         g52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sz6llQ+1OH71vS4laq85P7K98uLH6vUckiEJ0IbDFPs=;
        b=sKE/LoU8nEVjZFXMgyhkVnA75e3TFr6QJ1ZUOrEDzLRC35E3ClDFUFXvtiGYOydygy
         TQU+T/atYVzZhBnxwRYv1qmcg57pPDc7Mv6F0mHWkGYiHm3gwK4FmfjsAm/pw1ILABGh
         r6M7Y5Gg0XEuuIIZKvierhWiZM35Mas4cKo6V3hRfeq/XNDP2qQzxh4Ox0P2kl9RHyg7
         2ULOjRWchXwLd+QFJqFZAvND8ZHmweVIRqg6djjc+JEzn0IbQm/1nEjN1jnwoc4B2Vr3
         kdM90805ClqdwdDqTEwWtN9lKJHugvrsdsNRBy1BM4JGD+U6U1jc5W0b610U+oCmlldc
         l4+g==
X-Gm-Message-State: ACgBeo33hk07vEY5wguZF3knk3w1SycCKFMIUqJJpXlGelY5IVGSztk7
	nvQBC6CrItDhsFFQAtAzyLU=
X-Google-Smtp-Source: AA6agR6FhMuUV5Px9YnLiiO32C6NOYgIOAi16Mb/VEiVwwYtUbx9Mv8cA8oi3K787maWCpui9D74yQ==
X-Received: by 2002:a17:907:b1b:b0:772:1dcc:a512 with SMTP id h27-20020a1709070b1b00b007721dcca512mr8747177ejl.247.1662760872352;
        Fri, 09 Sep 2022 15:01:12 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id q16-20020a170906541000b0073d7b876621sm781733ejo.205.2022.09.09.15.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:12 -0700 (PDT)
Message-ID: <f09665c1-9938-38c1-9a31-f196a3ef9cf0@gmail.com>
Date: Sat, 10 Sep 2022 00:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 11/11] dt-bindings: mtd: rockchip: add rockchip,rk3128-nfc
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
X-CRM114-CacheID: sfid-20220909_150114_180324_25F2BEA3 
X-CRM114-Status: UNSURE (   8.43  )
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

Add rockchip,rk3128-nfc compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/mtd/rockchip,nand-controller.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
index d681a4676..566f33085 100644
--- a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
@@ -19,7 +19,9 @@ properties:
       - const: rockchip,rk2928-nfc
       - const: rockchip,rv1108-nfc
       - items:
-          - const: rockchip,rk3036-nfc
+          - enum:
+              - rockchip,rk3036-nfc
+              - rockchip,rk3128-nfc
           - const: rockchip,rk2928-nfc
       - items:
           - const: rockchip,rk3308-nfc
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
