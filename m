Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184B6FA3726
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 10:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m3xMoQBEGjMjHrJFdUzkynomjj5JTT6qQGMVIFl+hJI=; b=3FgvoxyD89SL+8
	kgca8MQ4eL5oC8gFs/7NfXujUWqS23r6XUUj7AR7MAt6wTQx6/PIzsobCUip2Cu42Ujb6ve3lD0vy
	z32Ua6jRDqYEAFo01UjMZoAvgRpavxOvqsKe2G0QpjUJexFY9doM4ovguEHL7s7ldUjzmQr7fef1P
	eqbgqI9Dm9NdJHrmydMTlYGfF54HE3CzJBisATi1AsmsetcQ1UPVpq6CKtWR84XZBO8ayytbP5udI
	aLWBVmfOSIDjBAwNY3vOlBej7PcW667Ji22GFSDtfy7I6+oudcAgdS22DSBuKQ6ZoF6lkh0jlWr1V
	703MUh4FnM6Ad5tVsw+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbciL-000000085De-2dBG;
	Fri, 02 Jan 2026 10:49:01 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbciJ-000000085DG-1bIj
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 10:49:00 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so7326202b3a.2
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jan 2026 02:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767350938; x=1767955738; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6KeTsNq+9OMXZEJM9YqRqOnONqTztwaAzzjanzT7XI=;
        b=KXqITY73i5HLsYqqvMb+3eDOtV+IvA/S3N0JHJspjqnwBjYfEmaQ6HSHK/CntQ6Iqu
         id3B7Oof67bFBknOmSRC9/t/RtfwzN1WNt3xA/JcTVu2z7BCssG9fMYkn+ABZlg0la5V
         /iHJikDkbH7IlttclIraKRBnPK6y+5YQPMiuJv9lgV6xRnTfd+GKBC7Fh1zreJCXB/3t
         EOn5NhtimIA/mdZuk5dwwJrEwY1uNX8amEBt36v7WEmj8ISZ09fW09zN8jpUEvkmJLQT
         Fq9EIgH3+yNtiE+hOHd/HyKiNQCzMWLfJFWVniPMBFtaFCgJY1PCDiHdtBjlSNXv4A7R
         P3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767350938; x=1767955738;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6KeTsNq+9OMXZEJM9YqRqOnONqTztwaAzzjanzT7XI=;
        b=fBglDvz/v7r69f7EPa1ZeEhkKD1xksfjnPkkPBCMNcsLK154xErU4LOIk02Z8mgluC
         L4ZHd148wOJcpSoVpC4KK+c7b+g3GNHAbp1zseNWQPIqxrJmU4jpLpCYbD9+sDYtshf8
         /3UWC7J/377ylzbS/Ssjt3sVELxKC4eweLYIqxj5zrUBQdF3AyDyrig5GFae4hAx0/G5
         qAHqAlncabmXivnCRbxnY2RDeOnglxWjeXgGUQ0IR5NScOelQaHytAxi03KfUYu+FaGx
         wkDDj/4F1dGtfzqB3imYabVpERPyiGgU/PLGxR1y7xN9j3i5T+nMfMWVapQu9gaMmMr/
         UcjQ==
X-Gm-Message-State: AOJu0YxT5jGbesGloPU698i+CNAenkXtmS/WPXIiCupG1cii8T22M5qt
	Ws39nN8LK76aHRhiALW9RO/uyiirUKRR4RAHAVMzEfqCindGqZbQZ4gA
X-Gm-Gg: AY/fxX5C8SjjHKlyRN1mc6HYBpZ/nLz8L78V7GG7PGYilKLsiSJjPUDC2/Qo9N6ClBI
	9WQ15bgshe9bWzRTJVoIidIT6Pk4VU3oD7+aIjWW9tfzP41GfUGZHVz6PUw5RQ3dx/Jpa4UjfND
	te/bGagNgaECJuHIeYTD5M0TM9+aKCb9HDuM1DX2h3l/kWMlX5y0AdzC0hs5WR4jVzfok3TAvyG
	iVTwrscHLxU6ARp68GipmqLXb/9+cTOjktd+sp++RR3SnmBu84V6V34022Yr0IAYTtjWVTRVqeN
	QuXPnHflLAfAIrSyaOwK7D9cEWZsYvkMGTIcY/Fyp0IXmS3VOzV6p/Y0PNiMe4Dfan4qd9KvYsW
	nzMFNnEygFh6229b3AWK6iKMsc0190y/Hye19ychqjze/lg6oeP7600nhpuHsr09g1AhSrHFgzL
	5m5fC/9W9EmWQWyZfYP883s+JrrTrXE9OjH5Gz7Q==
X-Google-Smtp-Source: AGHT+IEDuRRb6f4Nl0WZXl0w8Ingiia4+kt7/z0dRKCuI/YyTkJWMbA69KavlxrqN82xGYL1rWD1FA==
X-Received: by 2002:a05:6a00:3497:b0:7f7:2f82:9904 with SMTP id d2e1a72fcca58-7ff642122ddmr33467525b3a.5.1767350938446;
        Fri, 02 Jan 2026 02:48:58 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.185.129.114])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f30bsm40163878b3a.48.2026.01.02.02.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 02:48:58 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Date: Fri, 02 Jan 2026 10:48:50 +0000
Subject: [PATCH v2] dt-bindings: mtd: microchip,mchp23k256: convert to DT
 schema
MIME-Version: 1.0
Message-Id: <20260102-nxp-v2-1-05f5dd947459@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJGiV2kC/1WMQQqDMBBFryKzbkoyNMV01XsUF0EnOlATSSRYJ
 HdvdOfyff57OySKTAlezQ6RMicOvgLeGugn60cSPFQGlKgVohF+W4TGJ6EZrHFooD6XSI63s/L
 pKk+c1hB/ZzSrY736WQkl7ENpR1K20rbvcbb8vfdhhq6U8geM7xDhlgAAAA==
X-Change-ID: 20251229-nxp-526e29da9f29
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_024859_434268_4FBC97DF 
X-CRM114-Status: GOOD (  15.72  )
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

Convert Microchip 23K256 SPI SRAM MTD binding to YAML format.

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
Changes in v2:
- Removed "#address-cells" and "#size-cells" from the required, properties
  and example. 
- Changed description and title for yaml.
- Link to v1: https://lore.kernel.org/r/20251229-nxp-v1-1-a415fe0080a8@gmail.com
---
 .../bindings/mtd/microchip,mchp23k256.txt          | 18 --------
 .../bindings/mtd/microchip,mchp23k256.yaml         | 49 ++++++++++++++++++++++
 2 files changed, 49 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
deleted file mode 100644
index 7328eb92a03c..000000000000
--- a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* MTD SPI driver for Microchip 23K256 (and similar) serial SRAM
-
-Required properties:
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-  representing partitions.
-- compatible : Must be one of "microchip,mchp23k256" or "microchip,mchp23lcv1024"
-- reg : Chip-Select number
-- spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
-
-Example:
-
-	spi-sram@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "microchip,mchp23k256";
-		reg = <0>;
-		spi-max-frequency = <20000000>;
-	};
diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml
new file mode 100644
index 000000000000..e928d375ae81
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp23k256.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/microchip,mchp23k256.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip 23K256 SPI SRAM
+
+maintainers:
+  - Richard Weinberger <richard@nod.at>
+
+description:
+  The Microchip 23K256 is a 256 Kbit (32 Kbyte) serial SRAM with an
+  SPI interface,supporting clock frequencies up to 20 MHz. It features
+  a 32-byte page size for writes and supports byte, page, and
+  sequential access modes.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microchip,mchp23k256
+      - microchip,mchp23lcv1024
+
+  reg:
+    maxItems: 1
+
+required:
+  - reg
+  - compatible
+  - spi-max-frequency
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sram@0 {
+            compatible = "microchip,mchp23k256";
+            reg = <0>;
+            spi-max-frequency = <20000000>;
+       };
+    };
+...

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251229-nxp-526e29da9f29

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
