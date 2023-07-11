Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B46FC001DD
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jul 2023 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I45v7zPhV2O9tUi/b9DWc9Ei8juy/Mwx2mNf71fbcLU=; b=ZOBpcHHYGTyc5N
	6Vx/7FZcEyh44rf1vYRF2qo5xPc7E71Dk+pfUrvJS98L8eJSbna5Ti6hWdVgIRqluqUgo5JNtzmi6
	sSuIKNCpWw7ZzTNvUz6sn7WOy0AWsjT5PG6psLmn3GTW45LcHlqtOCCcfa3Xdw/vIPgzqR7YOMnkS
	Tc1czb2gUx4EIJiAgAddzAospdcgEpUQ5zxzqt0VDOgYs+8rUXlkCe0ihlooGCH0pV9FfHIoImzT0
	Bj5u6zMzfjC9MkYqp1M7xUgXvzMkHWHzdoipM1UoNH/+pmeX58knHpGa7fcOs984+FoPejoZ3e/8G
	xGO6oz92+jz5RXE3ReJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCSf-00ErhT-0w;
	Tue, 11 Jul 2023 12:27:21 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJCSX-00Erea-1C;
	Tue, 11 Jul 2023 12:27:15 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 9415910000E;
	Tue, 11 Jul 2023 15:27:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 9415910000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689078428;
	bh=uzOFkT1cmd7+H0v/RUcwZvHpwhwpjoY7e7YIY9mdlBc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=dK57yjTCLF8I1TG4Q+uAmzvX6s8b45y5386QmGn4iH+/g2e6/xjXdG1ql7owUUWyt
	 uem3ykApd5mE/Q9fZABi9qYFbVMILxJnzaYf2ZIFKsirG0q6emvqnjsf2AvtSUHTEF
	 8FsEInyuq1k6zb42iUUcVoWwfE5hF7YNcxC9Ywero3mhkaayXZ8UM79mC3+1rNtX1i
	 TcWn3U6yjmzWgGTl7v331gkhWyuXxyckstoi5qXCHdC07xo6IqjVbgI3n9kndCcZT6
	 pq2kmgGdAiNFn2TVb9y8+UdVIqVDAVU1NLf3N5AMy6UyptHwtPaC+L4Sr7nQj7eptA
	 T1D02Yzbn1JKg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 11 Jul 2023 15:27:08 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 11 Jul 2023 15:26:59 +0300
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, Rob Herring <robh@kernel.org>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v3 1/3] dt-bindings: nand: meson: support for 512B ECC step size
Date: Tue, 11 Jul 2023 15:21:27 +0300
Message-ID: <20230711122129.2635558-2-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
References: <20230711122129.2635558-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178541 [Jul 11 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVKrasnov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 521 521 0c3391dd6036774f2e1052158c81e48587b96e95, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/11 10:54:00 #21597245
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_052714_093364_30F83FBA 
X-CRM114-Status: GOOD (  12.34  )
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

Meson NAND supports both 512B and 1024B ECC step size, so replace
'const' for only 1024B step size with enum for both sizes.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
index 28fb9a7dd70f..e81757c9e0ed 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
@@ -49,7 +49,7 @@ patternProperties:
         const: hw
 
       nand-ecc-step-size:
-        const: 1024
+        enum: [512, 1024]
 
       nand-ecc-strength:
         enum: [8, 16, 24, 30, 40, 50, 60]
-- 
2.35.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
