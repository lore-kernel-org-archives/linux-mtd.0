Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E72ECAAD3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 22:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+S6pt9Hc0P7v8E5F7cC1ipCHkdxbxrg08LQ65qxO60=; b=dlEPPo6mYxN7LN
	EzcfkhcI0Vd83OuWMEe5oXQxxNlGmfGPsJclhOIEaOk3EiZTOvV3AVk9P4pdK6XIVtCh2hUYpebmg
	Ipk5myldnd4meZ3LDx+k8MkYvMS3453Pn0VgXGRjghysQPCNgawZgszB2naEK32wRBufeIdd3xN0b
	N1xBOeQVcGkrB4is9WyDul99/DYqp4L47zIBoYNGw7Nm0VxVuQqGwdy95qfBulXbtUu30qHGEDLdl
	3TIoPw/c4GoE9rce8d2ipBE5fOOux6Nj+SQv8IQjaJyg3ePipkAyhVlhos/vUgJSh9/8YWx90ygEU
	hSCgdlXvrOAxiffeFKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm5G-003IX5-PA; Fri, 09 Sep 2022 22:02:47 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWm4E-003Hey-RK; Fri, 09 Sep 2022 22:01:44 +0000
Received: by mail-ej1-x62a.google.com with SMTP id y3so7184906ejc.1;
        Fri, 09 Sep 2022 15:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date;
        bh=/Iy585fR3X6UvC3KDzJ3yTvDIvdDJpLP2lUgFyTemrQ=;
        b=SObLg3/vIipr/q+a7GFlW/5snMqk+u7gFyCIEYk1QhzSHWzvRy+8ZXztMfCpQg8JSm
         24inwyaHPI9Yb1t63xDhrnbjMEcQAVeyUZ1WApa/r8rvPzOTZ6diu0S3y9Ihs1LMK8Ug
         LdxtiRdDozexZneI5mFLycdvXR0sTIuqW/05aXwfvCIBdGO4RbcEp/LDrXdq83ETso6n
         hyhuV+Y19Xpvulk3D6Q9nDhto/1lXn8OgEFwTvMo0KvGk3IemELvnXIlFu7bwzU+Rpbc
         V1XUgHKOeuPuozwh/frmFeIDkq6bFmNCtm6LBitqZKKeb696g/3AiLkOnq4PTD26EyHy
         q15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/Iy585fR3X6UvC3KDzJ3yTvDIvdDJpLP2lUgFyTemrQ=;
        b=3tjNJBe2CHMM52sM6E+8jpvGpESua1p3kj5R8buGgHQnhClvQrVYAyxWxlPQJcw3WQ
         BHacYy8CHirocHi1d/Za8Gs+cV5TOMoHGe6PP8w2R2pzEfE3LdQWTabKHxOB4IfS1E3y
         6JYttgVf0VCzoh+VkwJwT0Vxb8ZTL5Exx/cbN9RoUSSG+/jKGz5N08b8sKZBWyT568hD
         2fP9W9w1dKo6r4FQe4M4SeS5Z6wle5MDx/u6DYsTm9V2f2zbzSYxiVjgIVGcis1NpoVx
         yBdizM8WbO0b6tGsGLN4/XEisAqhx/Hs2yWp+emOfgh3zkG6PxF5iz9XlNxRlxcSZ/eW
         /XDg==
X-Gm-Message-State: ACgBeo0hJP1+nmi+C27rwK8L3PTkVVN5rc09fR6TX6fJWbhMi6QtuU++
	5cfNxhT8w9uaYmPI++dVc6Y=
X-Google-Smtp-Source: AA6agR5P9E5vqAGDDOsYqL8PtNRRaRQx2Dg4tkI6iIxekx/dkEqXrSPGKyrP3NMOo3ogKmfDUT2kDQ==
X-Received: by 2002:a17:906:4fc4:b0:73d:d4e9:2d6e with SMTP id i4-20020a1709064fc400b0073dd4e92d6emr11327995ejw.165.1662760901076;
        Fri, 09 Sep 2022 15:01:41 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906275200b0073dd0b0ba67sm776683ejd.200.2022.09.09.15.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 15:01:40 -0700 (PDT)
Message-ID: <fddc23ff-0c87-4998-1bdf-4dbfa4c74046@gmail.com>
Date: Sat, 10 Sep 2022 00:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 10/11] dt-bindings: soc: rockchip: grf: add
 rockchip,rk3128-grf
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
X-CRM114-CacheID: sfid-20220909_150142_933912_666A7EE8 
X-CRM114-Status: UNSURE (   7.47  )
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

Add rockchip,rk3128-grf compatible string.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 75a2b8bb2..08d705ab4 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -28,6 +28,7 @@ properties:
               - rockchip,px30-usb2phy-grf
               - rockchip,rk3036-grf
               - rockchip,rk3066-grf
+              - rockchip,rk3128-grf
               - rockchip,rk3188-grf
               - rockchip,rk3228-grf
               - rockchip,rk3288-grf
@@ -178,6 +179,7 @@ allOf:
           contains:
             enum:
               - rockchip,px30-usb2phy-grf
+              - rockchip,rk3128-grf
               - rockchip,rk3228-grf
               - rockchip,rk3308-usb2phy-grf
               - rockchip,rk3328-usb2phy-grf
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
