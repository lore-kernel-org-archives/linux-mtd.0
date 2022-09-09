Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E26ECAAD3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 22:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwbW6QI0Lliq5KdOxUt3dh5a9c2woULGYphSbGrdSbs=; b=4WoBWVF7PUieTD
	F2Zjdprb7rAjgIfvYo4eqD0HXstGsUNmePuhF5xsMEVIEn91xxs4ldpRMvMvJyqvZlmNii/cvX8JH
	c2MmKkqrJaC1VZhREVRrwv4N5HIcf8+Ot5Yh/3arvdj8+lyBHGGa8S31qhKu14PITLb2hU2bDIjse
	Y7L5mYrOcGtOtksyrQ7kJ0BmGcbfDGSj5fFYQbznQUECBXH/QaG6EQE38nRj0YFfQR9I5dDn7jlE5
	Y7lIVAiVIemTVBypSdvyoPcIV91XQiaVFbfzLYOEihopMKyp9AXsSaf0YEpuaUjNSZ3w3E3eB3Dny
	Tmb9xBBUn9KHrh5TAh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWmA0-003Mg2-3E; Fri, 09 Sep 2022 22:07:40 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm4r-003I9M-27; Fri, 09 Sep 2022 22:02:24 +0000
Received: by mail-ej1-x62f.google.com with SMTP id go34so7162932ejc.2;
        Fri, 09 Sep 2022 15:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=tQNDp3oXurfVK0Smu+vkGPlxbSoN4p3ETIcUgt48RD0=;
        b=U5NLPAwq3xKdX787nxgjNJjfB/0IUZ1wH06ymR+Sys2j5Wr6RKnbl/ZP6OpozE7yn2
         Ugb5pDkq8bcwvjl2JqAOyFCHKVQz0yW+xATcgKO9DyS33+euwU/IWvhB+U93py/KYjhP
         xuWBPGbBIRBvsw4elZbP9W0Y0aKly4BgUY9gnUiIJkfLRMSd1yTvbRWEJiFBHfqV1iq5
         yo1mPabdk+jO82UbKNY+heP2ngZrCSrSHX7rcupYAisIKeB432d2tVi96/uTRxkIN8YJ
         3KplWG4Wnf82OZeFCvaqmH4TkbbqrtjbvdEDDhNLEgS/0zX3MfSoKtyGbTGwYbmJ7pDd
         0H6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tQNDp3oXurfVK0Smu+vkGPlxbSoN4p3ETIcUgt48RD0=;
        b=z92XQPp7s/EmccMV6gDoY5ZbYFYI8QrYjkkc2kXaf+A49FS7O0iHR8LhaYFVvCiVrV
         nhvOHXbdH4dgZOTrLgGGGxwXvfzE/TO6vhD2yQsMJ09VF7Qiih7+9goMBF0kqBSGu2b/
         0o8FnvxNcRKZ0jqtkfEubUfDQXXSrXBwDx35Idn34D0eEDjFOW3Ee1jcSYvfJcTb2rSQ
         O/VUC+pDensPbP6LoTO1RPI2WdOmc+gMA3jJnaCvXMD5EPrbmwMKfwd3hN6kNV8RFCkP
         1zkZnNU6p1NNqTUhrWX5q2OwF8alm5nqo4oBmONiBHxd9LBc789UGQtk1oNTtvsjKSPt
         skwg==
X-Gm-Message-State: ACgBeo0nntR6/DTGIJ5Vm8UFWq21A/Sskg/D99IiY9vNPTox8jQnKpb9
	WnhlEzCdnMmWCje4sKi48yA=
X-Google-Smtp-Source: AA6agR5O8Ynrf99BpPY5ZqYMGT6phDOecFf7QFfCj8+kkhvsXO9bYuF7xKmwJ/8RDq3rMUvZ+woJUg==
X-Received: by 2002:a17:906:7714:b0:74f:f771:4e0 with SMTP id q20-20020a170906771400b0074ff77104e0mr10638632ejm.623.1662760936345;
        Fri, 09 Sep 2022 15:02:16 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id eu16-20020a170907299000b0073872f367cesm790690ejc.112.2022.09.09.15.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:02:16 -0700 (PDT)
Message-ID: <f2cb42c8-3664-a2d5-074d-5c9a10c693e8@gmail.com>
Date: Sat, 10 Sep 2022 00:02:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 04/11] dt-bindings: mmc: rockchip: add
 rockchip,rk3128-dw-mshc
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
X-CRM114-CacheID: sfid-20220909_150221_287356_663F5138 
X-CRM114-Status: UNSURE (   7.12  )
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

Add rockchip,rk3128-dw-mshc compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index bad28bc74..95f59a5e3 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -32,6 +32,7 @@ properties:
               - rockchip,px30-dw-mshc
               - rockchip,rk1808-dw-mshc
               - rockchip,rk3036-dw-mshc
+              - rockchip,rk3128-dw-mshc
               - rockchip,rk3228-dw-mshc
               - rockchip,rk3308-dw-mshc
               - rockchip,rk3328-dw-mshc
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
