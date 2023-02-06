Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2E9C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJFWBT5GSyJfcxCSP1oj0FmR0cBb2lv5/dklpPxxgHU=; b=AI5Eo3c5rPQLuC
	Wz+TP6LAteU+WwqEHvkBAfAD/1kIp1J7o6Vvbbh2544cZs7FRQPcds6ezELlAsoMR2gGJDEfrqYq5
	7EquDI+Jhw6Anpvyz7iU/5cr8RSMxJhAg0vg8CjsUyFhHiGHlVm5UoCFZchC6rJ/EoP7z1+KLBMCv
	orAG9M7ZV5Q4P/RDr5y98HQ9iT0Nkl+3X6r4KzrgUMWOhcVcj8K5eNkLQ0ZUpt8hHsoi6rHNJKkL+
	PL1WnHznsVC9GDYMWDA1yEF9sLQFrneX/s1ZHFoqmoB27tqvlGU7tOLIKiHzAHjntqROMRSpupOuq
	7fbQXXnbYFmBIkwRpY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxmI-007rfE-Cg; Mon, 06 Feb 2023 09:27:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxlm-007rUX-Ru
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2023 09:26:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso10283144wms.0
        for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2023 01:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv8S5H3Ovr1YQgdvQexv/ddLSC0cqfieNvtl/a724Uc=;
        b=gA3qKsbNqpXbyWk0xcX3LHDibx+UXkCv3awjvieOBKO+9dHKPjk18MrnJztoFM3EQx
         ydnUV3vJhR4ggozL2Ywu5Y2EICUYpBYSV9fiZXE6b9JPkOM6R01xHQmjpWjCl5PjmFmT
         2flTXc8VMk9DFkUoxmHLVS6zAJBZC1aPX/dGqQ95C3Jj95U1Fu6tID2NGwJH9QJoQ/CR
         YjDmzFEFS1qpthRElBoPGHG0X1Q3uELpWGIX0hC0O9sMJ2GVnYPswkixMJnIlrFymE1k
         rYsDuRHL8+JtHq1vzV/qsGUG6AgiY9NRNpGZjOJnlMXzuY80XRAQkZeNnW5jc/4C+Sks
         Nkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gv8S5H3Ovr1YQgdvQexv/ddLSC0cqfieNvtl/a724Uc=;
        b=ETs8dYmosJIu/cnmtTsiEv/sr4/K+p6x1moCd0XYs1CPeVQVyWoqzUH8z4JqSkWhTM
         1qa/7+hDfax4wcP6g9Z09riJuHjbpKuVep/LFzC2u5smRVB/fNfDEB67am1LMIctn0vI
         LgUfVBUmfZ+YT116NtNv9bywEx7dtbuSUMTWsqIMEXae+JQE7OHrge9jSw9iB5Teidy2
         mg8qOqQtTVBMk695pkCOy4aKQt5OmV8RaGAX2B3FmZ1vYe+pOIo2iZnW7W0E3nNfWTjH
         ZSgEhyv72aPi+3b9A4C3ye5Ik/LIGm21dOcyBzOVLYTdLYM/TicDZgo+tuwGEjbcA91V
         fCmA==
X-Gm-Message-State: AO0yUKWGTHTCZGNmN+C0O4dOdaBUMVRkXoBAEJYIy6aRq22FTIzgfaAM
	gkwysJ/iGFozRJh+wQH739g8cg==
X-Google-Smtp-Source: AK7set/g9k2tas0Z2ue87Vyd49Xy03J9aJSThb8Zynjak5G+lcGDdlvSuI1KRVpV7uE3LkhqUowWjQ==
X-Received: by 2002:a05:600c:4f06:b0:3da:b40f:7a55 with SMTP id l6-20020a05600c4f0600b003dab40f7a55mr10603447wmq.6.1675675597722;
        Mon, 06 Feb 2023 01:26:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m5-20020a7bcb85000000b003de8a1b06c0sm15722568wmi.7.2023.02.06.01.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 01:26:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Marek Vasut <marex@denx.de>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 3/3] dt-bindings: serial: restrict possible child node names
Date: Mon,  6 Feb 2023 10:26:24 +0100
Message-Id: <20230206092624.22922-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230206092624.22922-1-krzysztof.kozlowski@linaro.org>
References: <20230206092624.22922-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_012638_939331_BDAFFE21 
X-CRM114-Status: GOOD (  11.43  )
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

The re-usable serial.yaml schema matches every property with ".*"
pattern, thus any other schema referencing it will not report unknown
(unevaluated) properties.  This hides several wrong properties.  It is
a limitation of dtschema, thus provide a simple workaround: expect
children to be only of few names matching upstream usage (Bluetooth,
GNSS, GPS and MCU).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/devicetree/bindings/serial/serial.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index e05ad3ac2abc..c9231e501f1f 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -96,7 +96,7 @@ then:
     rts-gpios: false
 
 patternProperties:
-  ".*":
+  "^bluetooth|gnss|gps|mcu$":
     if:
       type: object
     then:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
