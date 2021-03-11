Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54012C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:04:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB80B64FCE
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB80B64FCE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PUGK27pkSRZltUTjkZlrcny6qjN+osWIzQzKsuCnkWY=; b=i0zMn7DybB08gdBdbJCyQwQ5M
	VMzcsl6VA17ZQxMpXnnV7IdvAgX/J9qt7rGt1REUVCNUFF4IAvEHNemd2FylgdJAo7OmSv55Og/ng
	zyc5sYurXL8djeN4W5TerhF6iMdMmNq7ilZMAmG7MrIIkiogvtac6x74kd/L7Es7eRAOmNP2mEgds
	BskjAGT7UOyfmAbB5cPjB6XFemZnhISRXALQTGTIQjE+zVWKuCCdmJoIPi5lg1crmiRgHUj+oH9Le
	4aTsYju/ys3GkNU/qym6+HlQHBK81aY/BckTNuLsYNJV2JjXp+ygWtKEvyiBLI+/i3HDG9Ec2LVp6
	mxChGc8Nw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKOjP-009e7g-JM; Thu, 11 Mar 2021 17:04:15 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKOj1-009e2o-UH
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 17:03:54 +0000
Received: by mail-ej1-x636.google.com with SMTP id c10so47615182ejx.9
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 09:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n5Nl3CoPrKUbvXcQoRdyX4Oe5Nctcc661QmqCsoFZxk=;
 b=q6FIKJwkFQWBJ1OXleqfTG1T2TT3DkkLrAwZdQI3EH9fhKo5oEz9qft+OYmencIYQ4
 jz7IDbNM3N5Nk8gEmiPbI17fjhnNGvcUS1PHGTeRBHyiIpbh0h+7uJ2owsdpeNpOPgV5
 zNttiPoV+Ax6V699cZE2C/M2rvXwe8eoQtgEeG9rOzVeqX4mdbV/riILcIHXcQCsPPHQ
 uFah9LhZ2M8BXkll+vIYAI5iwpXX+OT4rlduJKeRDp1nyBhXJU0u3u+IrGPFZzl/KwJx
 PFHO4KJrRgWtJG1lHljMuHwL0vDKBmp2RLeNnbYE2yXzG26+11zwSGI4fhxKttWn48x4
 spgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n5Nl3CoPrKUbvXcQoRdyX4Oe5Nctcc661QmqCsoFZxk=;
 b=IiscLo/9Wrh8uY7m+AP2ZQvL90SGN2RD39TMEVJB88r7c3pDfyqkNrL3vHl/cVwDKK
 nD0IYyzo4nuPOLezKT5vVqPbJkHeBRYk4hejjPlmKEzxc5phB8ATZ38Wr90shHukSBkc
 ikKKHLLViluW8pBpmbT/NP4nmL26Ysq/yYZrxqPqGc29xJuVnL2UlIK2tGARS/I3Q0BY
 WEQZaVu9AvdACsMPb4uIOlRzIhBZtBs8ceSkivuWw13rs1rZA4WjRZ1JCLQqyZHlbYZu
 m3K5oGsipvJAjUCbB0Lb9H+ku2AGkj3ZNGyr/hQpAFZgbacP1f7DjrBSNhW8GNx8+4LG
 02Lw==
X-Gm-Message-State: AOAM530nEQ0VBBOCyoz0Dkd4crsb7EMGY99hIJCsSiTDZDTxoSXMtY1W
 LMX0THF45cKDcs3bE0UtyOE=
X-Google-Smtp-Source: ABdhPJzq/YatFckEfu+VF1H6Ea1sveBij0Xf3qb2wyQA4o1MhfevCcixqQxnAVUri761sfyZf4SLXw==
X-Received: by 2002:a17:907:76bb:: with SMTP id
 jw27mr3981655ejc.366.1615482230637; 
 Thu, 11 Mar 2021 09:03:50 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it.
 [93.35.189.2])
 by smtp.googlemail.com with ESMTPSA id b4sm1627205edh.40.2021.03.11.09.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:03:50 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Date: Thu, 11 Mar 2021 10:57:00 +0100
Message-Id: <20210311095715.17048-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210311095715.17048-1-ansuelsmth@gmail.com>
References: <20210311095715.17048-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_170352_797740_E42B6D3F 
X-CRM114-Status: GOOD (  13.63  )
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

Document nvmem-cells compatible used to treat mtd partitions as a
nvmem provider.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../bindings/mtd/partitions/nvmem-cells.yaml  | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
new file mode 100644
index 000000000000..b53faf87d4e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/nvmem-cells.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nvmem cells
+
+description: |
+  Any partition containing the compatible "nvmem-cells" will register as a
+  nvmem provider.
+  Each direct subnodes represents a nvmem cell following the nvmem binding.
+  Nvmem binding to declare nvmem-cells can be found in:
+  Documentation/devicetree/bindings/nvmem/nvmem.yaml
+
+maintainers:
+  - Ansuel Smith <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: "../../nvmem/nvmem.yaml#"
+
+properties:
+  compatible:
+    const: nvmem-cells
+
+required:
+  - compatible
+
+additionalProperties: true
+
+examples:
+  - |
+    partitions {
+      compatible = "fixed-partitions";
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      /* ... */
+
+      };
+      art: art@1200000 {
+        compatible = "nvmem-cells";
+        reg = <0x1200000 0x0140000>;
+        label = "art";
+        read-only;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        macaddr_gmac1: macaddr_gmac1@0 {
+          reg = <0x0 0x6>;
+        };
+
+        macaddr_gmac2: macaddr_gmac2@6 {
+          reg = <0x6 0x6>;
+        };
+
+        pre_cal_24g: pre_cal_24g@1000 {
+          reg = <0x1000 0x2f20>;
+        };
+
+        pre_cal_5g: pre_cal_5g@5000{
+          reg = <0x5000 0x2f20>;
+        };
+      };
+  - |
+    partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+            label = "bootloader";
+            reg = <0x000000 0x100000>;
+            read-only;
+        };
+
+        firmware@100000 {
+            compatible = "brcm,trx";
+            label = "firmware";
+            reg = <0x100000 0xe00000>;
+        };
+
+        calibration@f00000 {
+            compatible = "nvmem-cells";
+            label = "calibration";
+            reg = <0xf00000 0x100000>;
+            ranges = <0 0xf00000 0x100000>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            wifi0@0 {
+                reg = <0x000000 0x080000>;
+            };
+
+            wifi1@80000 {
+                reg = <0x080000 0x080000>;
+            };
+        };
+    };
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
