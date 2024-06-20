Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F3EC27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75e+0FUVDNUCY2RllR5iRILMObzixdreblLlNg5/n/k=; b=FGh9oMAX/MkCW8
	5oJQhUPU8iNGeDSgGjVeLMs8a/oUt/7Y19JAnYUojVCK94KVbFbPdLwGxzMIFJXBk2Sx76dZHUasF
	/Id3zAf2c2hfm+p6ZKEJ4B/McoamdQfEQZBqvyVd5n4nOqkfG5QOruSmHHWI/I/pgodnJ5uSNJNuD
	xLWS5/ce3TJmUBeJr0ZVSPDk1ZxyBV/fFGxZGdB2T5S+xVU8TyEiV+CKfCsOtAyK5YB9LTud8ziS1
	HT47r/Ca7eZVB1BHm+PuPdXcF4QGNEfNX/GOdW6oEjMQ3uIpWXEM691NtaV6PwvyZHg1odBL5F924
	y6D5tBlUaG7g/+ZzuCiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM3p-00000006BHu-1zQm;
	Thu, 20 Jun 2024 17:59:01 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM3B-00000006Atk-3Csk
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 17:58:25 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-57d26a4ee65so819637a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2024 10:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906300; x=1719511100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dj3DX12QYavc1OOQJN+Lhj+prqOyJf9zJxwWhTZ5aE8=;
        b=K7yi2reJ9Rtwgmzt3inHr8HNXWN5U547a073/6DcdCS54Tlkr/IDz5iBxRs8nAmf9o
         X87ngMTLbhWJfPAHriy6hwblrWyQLUB5b2fK8F3YOciPA/U1IVPgtSN6wAscGp1Hzq+t
         RwqwZ8wC1uhGNQPg17c1kHlQUESekJbFmqcjDXDSnXLERAFP1V9HtqNbnAUv3/347Kod
         GrWWE/nzP9lpzM5XjqowHceozJN1MhJFSOSm78Bd0wH4Kw55i0/oGRv+JfvHxVD4UUYX
         J4rvRa1UwfrFuyOgtMCeFYvQV+54L9BCKmWDIqLOSCmDo8nL/+Btk0TXDoB+bQaKKxSj
         4g4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906300; x=1719511100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dj3DX12QYavc1OOQJN+Lhj+prqOyJf9zJxwWhTZ5aE8=;
        b=mEKmvPZcDNXJPAg06Oml4JQ4HTOOt+1RsveF/BpkeAcTSfrGXxtVjDE1FLff6lALkz
         9yZg5fDhzlSSu9xIrn5LS966059jwKH37YRHFjdtXAEwGc7kAtwss6Vh6eqd3WZFajNF
         9E2qHphWlsw1+BhE6oh0/MH5k4ppYzFpSLdYp4FGpT6PVKUh7JHJ+9QyKUealfHoyU6w
         cTRZDbn6DM2ADJ+tMTVpKoXNfPvmh1ec5dbVp7/ymchGEAbbfwpsrpKYpxZ2TP7I0M7g
         RTJCbHrdqTBUMCK9N8AYc/a2cUmj2bX/5x45knA4XHATY0GBST0KdJdbU8TwiV3ZH6xZ
         mpwg==
X-Forwarded-Encrypted: i=1; AJvYcCUmVTbefLfX/T4phTv8Avx7fg2XvGGt5spYAL1uOs8tgZjAaxCMMNfIGIaw2jgHcGIKioUQOEbbbROsHZtam8RP6HzcTF7XcJg9EAG46w==
X-Gm-Message-State: AOJu0Yzk1VFpiJqUQb+IpDN5O4fQHJZFJpvp9qHG/c84VjT2lHs/cJlS
	Q+1mkoCl3FiMphz6yptPr0Yhum1R3dY1ffMQwpK6aEmi+0NosRUYxuaAsXk1WpU=
X-Google-Smtp-Source: AGHT+IEhPPFEKagTHzQMOwX7NrYh9+xyhRsxpQErqvlswtZC5Lb/tm5y+kINO8slxfzNDjQFWUOp4Q==
X-Received: by 2002:a17:907:a646:b0:a6f:5192:6f4d with SMTP id a640c23a62f3a-a6fab60321fmr428721866b.8.1718906299800;
        Thu, 20 Jun 2024 10:58:19 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:19 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 02/10] dt-bindings: dma: Add lpc32xx DMA mux binding
Date: Thu, 20 Jun 2024 19:56:33 +0200
Message-Id: <20240620175657.358273-3-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_105821_995125_D96B25C9 
X-CRM114-Status: GOOD (  18.53  )
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

LPC32XX SoCs use pl080 dma controller which have few request signals
multiplexed between peripherals. This binding describes how devices can
use the multiplexed request signals.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 56 +++++++++++++++++++
 MAINTAINERS                                   |  9 +++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
new file mode 100644
index 000000000000..a5384b6c67fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/nxp,lpc3220-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DMA multiplexer for LPC32XX SoC (DMA request router)
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dma-router.yaml#
+
+properties:
+  "#dma-cells":
+    const: 3
+    description: |
+      First two cells same as for device pointed in dma-masters.
+      Third cell represents mux value for the request.
+
+  compatible:
+    const: nxp,lpc3220-dmamux
+
+  dma-masters:
+    description: phandle to a dma node compatible with arm,pl080
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - dma-masters
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@40004000 {
+      compatible = "nxp,lpc3220-creg", "syscon", "simple-mfd";
+      reg = <0x40004000 0x114>;
+      ranges = <0 0x40004000 0x114>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      dma-router@7c {
+        compatible = "nxp,lpc3220-dmamux";
+        reg = <0x7c 0x8>;
+        #dma-cells = <3>;
+        dma-masters = <&dma>;
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index aacccb376c28..f7adf9f66dfa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2396,6 +2396,15 @@ F:	drivers/usb/host/ohci-nxp.c
 F:	drivers/watchdog/pnx4008_wdt.c
 N:	lpc32xx
 
+ARM/LPC32XX DMAMUX SUPPORT
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
+N:	lpc32xx
+
 ARM/Marvell Dove/MV78xx0/Orion SOC support
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
