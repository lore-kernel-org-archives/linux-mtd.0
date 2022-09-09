Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7128CECAAD3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 22:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7SI8/cQrwvQXCnRvZqD6Leuwk6ocWaOCbOc0R1IWjc=; b=TDXqewbcqebAul
	UwFHw/4++iL1/ZGVdNRlbi9y75pXY54Pvh/re+zadpWamE4kjUwyXi1JOm6BaXuBTuzM3Y7m/jm33
	7S08eEor8iKVzjFTl0aaI/jX0zC22VuxLGCFmOwu7W1RLhr6fKM2YBucuT0ULDFDWGxa2VkGJaCtN
	W6uug77OYYafso+ldaCPAVZzg6S0aXHIfQrJElVSp7yG6/mV1NHITjoSdNF2KIe2gNPreWxVrl4HV
	Pwf2AZlpQdRFnzlq/QeAd9d3jHnV7ds2gBiaRBkUS7WtFFCtK4bocxyyp4l9uV/12gx02H+s8KqyV
	yd6JPOZb4sWRD2uyANtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm94-003Lou-B5; Fri, 09 Sep 2022 22:06:42 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm4j-003I2a-O0; Fri, 09 Sep 2022 22:02:15 +0000
Received: by mail-ej1-x631.google.com with SMTP id v16so7095951ejr.10;
        Fri, 09 Sep 2022 15:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=84IeXs7nTrhn2LPjfnNsoXr0C5Os+SqTZDjnVNhpIt8=;
        b=f9B4QIN9JsapOYlcnM2DFoO6Pti4hR6siI8xX3lgGGSC0KtLXVcrucJ9+EKx6R7rr8
         fhxc45Hj+QSyINyLkc9/ylw3a0Tq6TrDFHsXCNfUsnI3V0PIQhmKMXZjBrybrOOvgF+C
         iGamfzYZ5I2n7bGh1gJP7B1Kxsvkc8zrjcidUi7e697c82noA7Qos/kMr9HKoD/emT8f
         G87feDf2ZrXP4IlJgJriY4ni+H5V8PasGm2MyAJ7LZkbwISLTmJ4vj/uRI1n10KfZae9
         GhlSPqCm8AfdVzAr8HHhnidLL7hbxdAnmv0XPQrFqbQaUVamxuGjx0c96z0m3CWunsqs
         zvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=84IeXs7nTrhn2LPjfnNsoXr0C5Os+SqTZDjnVNhpIt8=;
        b=JS3TxZjCesWPzUBgH4aQH0w5kgLxjCSY9SJ9Ccr4EfvE/FQuF4iaOoopLNOd4cws4f
         ZiezQHuQf+ag/SmincLl0YxgvEdO92obUjbTxpcv1p+fll9sILqao3JilHd/AMItCT7m
         J2unmc0ln7+ULmm/Gq1EOgmdEYAhZjQFCUykMI81jidUtbF3t/jXWzSvJeH4Pg99zJ4X
         fk463erfC5bR+YUTMmsOPoL3yD8r1W/vud0FzUPsWSQIOgUHRPgeOIsR+jAI6a3Z4Mhw
         0YqWIryrrg552EG6xtaaDuAg3PZctbRkcJinRBNjz29NSzf7JNBQmyggnUK3UkAcPMx1
         GtdA==
X-Gm-Message-State: ACgBeo0ib7NH56xEBmgAoFJTEmGOneMRRqUsUgZ1/rM2u7gpf9f6AkKr
	Rcmh+gTpO06j3oeN0t9gFpY=
X-Google-Smtp-Source: AA6agR6QJDpctQ7oGxmXZ3T0dXBhchTVyDBgORO5ngJq8sbHWtn/5k7WNrJOnVADlIvqVEPKsumCRA==
X-Received: by 2002:a17:906:5d0e:b0:742:7a6:a1c3 with SMTP id g14-20020a1709065d0e00b0074207a6a1c3mr10861826ejt.732.1662760929935;
        Fri, 09 Sep 2022 15:02:09 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id k16-20020a170906681000b0072b13ac9ca3sm778129ejr.183.2022.09.09.15.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:02:09 -0700 (PDT)
Message-ID: <c05fb9a3-ebf7-adec-e8ca-bd137d157f50@gmail.com>
Date: Sat, 10 Sep 2022 00:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 05/11] dt-bindings: spi: rockchip: add rockchip,rk3128-spi
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
X-CRM114-CacheID: sfid-20220909_150213_949832_96371F4E 
X-CRM114-Status: UNSURE (   7.22  )
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

Add rockchip,rk3128-spi compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
index 21f2de785..52768894b 100644
--- a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - rockchip,px30-spi
+              - rockchip,rk3128-spi
               - rockchip,rk3188-spi
               - rockchip,rk3288-spi
               - rockchip,rk3308-spi
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
