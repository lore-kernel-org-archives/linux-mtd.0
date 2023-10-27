Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8712EC25B6E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vFxCPHAhWvNkUNL9HpC9oUmwqPdH1PiKTrEifsna0I0=; b=vuca+6wKpimIXR
	Z7nJIlLQGwt2UqnNIVfIeHHxcqiv/22l2Y/E0o1kdo77aBAEh1oTPmY33Z8F15A7mAIbjvD/93ScE
	aqTAkTv0CSvC48mVXd//VWHA2IGu+cIUw8aLgJh/8fsmhZLWR6LBZrB0F7DdPhc1LEKlCuA/V34eu
	5O18+fWaGlwtTd+Dxq8XSIzBdZSxfMTy93iiholwnCd0YrWjMFW9hQLRLdwQWlOsJ9lFK78E+7ru5
	Sww05+m7Yhk+zrf1/Sn7v0k4n2uD5O4BKkL2W8GjA8aOtYvKYSW5/MeW1pGNN9JmhPK8SOW41Gd3U
	8ygl2g4iD/TBjRSaN/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJQV-00G3iy-2x;
	Fri, 27 Oct 2023 09:46:47 +0000
Received: from smtp161.vfemail.net ([146.59.185.161])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwJQT-00G3hS-1L
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 09:46:46 +0000
Received: (qmail 28681 invoked from network); 27 Oct 2023 09:46:43 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 27 Oct 2023 09:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=openmail.cc; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=2018; bh=hle8SC8oQYe3hUk/lyn2FO0kf
	0Ff2mlV8GXo803pPyU=; b=CH+Qd/QbAiCVWAvHMIvg/wNRYBwWAp5uusKkg2Eko
	Qm7GaUKdRAfSsevWXfe75Uh8T9l4tWpSGafnqyRnGwz/07zNhAmWWwo3jI9e87EW
	TmbArOkT0y6Ws7j890m/aa6cogqoL3ArOzwqBgUXnuF/le8ci795ovexrLMhb6/d
	Uc=
Received: (qmail 19515 invoked from network); 27 Oct 2023 09:46:43 -0000
Received: by simscan 1.4.0 ppid: 19049, pid: 19509, t: 0.3358s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (ZXF1dUBvcGVubWFpbC5jYw==@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 27 Oct 2023 09:46:42 -0000
From: Edward Chow <equu@openmail.cc>
To: Rob Herring <robh+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lech Perczak <lech.perczak@camlingroup.com>,
	Edward Chow <equu@openmail.cc>
Subject: [PATCH v2 2/2] dt-bindings: mtd: partitions: Document special values
Date: Fri, 27 Oct 2023 17:46:10 +0800
Message-ID: <20231027094610.1022114-3-equu@openmail.cc>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027094610.1022114-1-equu@openmail.cc>
References: <20231025052937.830813-1-equu@openmail.cc>
 <20231027094610.1022114-1-equu@openmail.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_024645_755583_EB4C1C7E 
X-CRM114-Status: UNSURE (   8.02  )
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

Add examples for special values in linux/mtd/partitions.h.

Signed-off-by: Edward Chow <equu@openmail.cc>
---
 .../mtd/partitions/fixed-partitions.yaml      | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index 331e564f29dc..e7bf466c395f 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -164,3 +164,33 @@ examples:
             read-only;
         };
     };
+
+  - |
+    #include <dt-bindings/mtd/partitions.h>
+    partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        partition@0 {
+            label = "bootloader";
+            reg = <0 0x000000 0x020000>;
+            read-only;
+        };
+
+        firmware@1 {
+            label = "firmware";
+            /* From the end of the last partition, occupying as mush
+             * as possible, retaining 0x010000 after it,
+             * "MTDPART_OFS_SPECIAL MTDPART_OFS_NXTBLK" similar to
+             * this, but always beginning at erase block boundary. */
+            reg = <MTDPART_OFS_SPECIAL MTDPART_OFS_RETAIN 0x010000>;
+        };
+
+        calibration@2 {
+            compatible = "fixed-partitions";
+            label = "calibration";
+            /* Appending to the last partition, occupying 0x010000 */
+            reg = <MTDPART_OFS_SPECIAL MTDPART_OFS_APPEND 0x010000>;
+        };
+    };
-- 
2.42.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
