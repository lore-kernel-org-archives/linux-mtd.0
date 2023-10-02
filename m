Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E11BE74906
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Oct 2023 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+jk55Nx6mPEDvysJrzGj3Orfo/BiWE0MBaCYzxGYa0=; b=kxZk8UHzSRXh24
	Iwi/4LHdR36cTGa9/iYU0tYI54hBYIuJwEncqfIvYotSpy1C2HacgkKOU/tMg2LOa3TKdtHB5YLOA
	iYEyoecBVgNeMao48PBn7+R7awCD9EDjjfy9382YORa7LOocW0mhS2uuuYxehLoWNn1u5soQYTQFO
	s5lRpyb2lESLNPRdC31Jahc738QLjDs0XhcgWSxMZWg//i9LcptI0OYmA3KpoSU3IKNLZt8xm6ma5
	WkA23NReYX1iFUVmcHTztMDA6Nr4e8KnEuPYVD+gttEKBSOFrJJPMGwK2RtoLh/HI9Oy0hTfnY8Go
	B7aMyYa3DlFV0qF44PJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnN43-00DATz-0L;
	Mon, 02 Oct 2023 17:50:39 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnN40-00DATI-00
	for linux-mtd@lists.infradead.org;
	Mon, 02 Oct 2023 17:50:37 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7a27254cd12so11939f.3
        for <linux-mtd@lists.infradead.org>; Mon, 02 Oct 2023 10:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696269035; x=1696873835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2OIh/G3vvfH8cT1f+jhivcT+xHStCXj54HHC5DhSlw=;
        b=V2OLuwILLTaVuSYkLk3WzWh97HGr8ZrRLE8699UKZN7Bvp2wwN2ywQom/8u4fzu8XQ
         ek42y52oBLsoxH+gbJQCghF0IehOYzhUKoCPHnCc6RQ8Kdqn/H0e+89Ps41kpigZyw4V
         Ovg+BBpnEjwgSxK5cR92FstLf/9acaHCGIbv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696269035; x=1696873835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2OIh/G3vvfH8cT1f+jhivcT+xHStCXj54HHC5DhSlw=;
        b=S8DsNPodUnvRptWKsmmg0dUE8/N1eY3M0uYvOX2FowTBJD6HQ/uDIfXYBtv8rQ+Eai
         bKNWHwsUuLBeEHBc1wMhoROmSBmjTgCCm/2IAW1aoYy0tIQhtUcJkTcSVE7cnmmVRsBk
         fz7QzFX2hfuyLDwW8Myyc+bo/wETkeP82b6JhHVZ1t/ot4ucQcvhgvn7m+BAOX889X7x
         w6jwFRsPiuYOlc9yaMo5+VpVubvuwi3+4axmggsaYxPFiI+m3cA8JJ0Px3Ifoaf6g1e6
         GzyvLagluINJn4n4+VcKWVvxh3JVv4iU70Lt+dIJA/tTWO5ChxIOJFRTx3XzUydmSGaL
         Ad2g==
X-Gm-Message-State: AOJu0YzjEGMRzEtpV9xKgY9K3Pr/Klyz67MIDuU73CiEnKWYJWHfYbnG
	mXGWP3dJvT2LCU8dG2B7fmLsyg==
X-Google-Smtp-Source: AGHT+IEajo7AgZ09G/o1FHYBl5iibeG+V+B1CsR5q6ZjwznpqxMf8wOSm4wNhvKtLK5z7hs1GK8trg==
X-Received: by 2002:a5d:9cd5:0:b0:799:36c2:fa49 with SMTP id w21-20020a5d9cd5000000b0079936c2fa49mr12850092iow.15.1696269034885;
        Mon, 02 Oct 2023 10:50:34 -0700 (PDT)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:63cd:2673:520:2e9])
        by smtp.gmail.com with ESMTPSA id s23-20020a02c517000000b0042b2e309f97sm6919562jam.177.2023.10.02.10.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:50:34 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	linux-mtd@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: mtd: binman-partition: Add binman labels
Date: Mon,  2 Oct 2023 11:49:41 -0600
Message-ID: <20231002174948.1015223-2-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231002174948.1015223-1-sjg@chromium.org>
References: <20231002174948.1015223-1-sjg@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_105036_061302_C2896E99 
X-CRM114-Status: GOOD (  15.25  )
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

Add two labels for binman entries, as a starting point for the schema.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Use plain partition@xxx for the node name

 .../mtd/partitions/binman-partition.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
new file mode 100644
index 000000000000..406a8997d3e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/binman-partition.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2023 Google LLC
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/binman-partition.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binman partition
+
+maintainers:
+  - Simon Glass <sjg@chromium.org>
+
+select: false
+
+description: |
+  This corresponds to a binman 'entry'. It is a single partition which holds
+  data of a defined type.
+
+allOf:
+  - $ref: /schemas/mtd/partitions/partition.yaml#
+
+properties:
+  label:
+    items:
+      enum:
+        - u-boot       # u-boot.bin from U-Boot projec6t
+        - atf-bl31     # bl31.bin or bl31.elf from TF-A project
+
+additionalProperties: false
+
+examples:
+  - |
+    partitions {
+        compatible = "binman", "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@100000 {
+            label = "u-boot";
+            reg = <0x100000 0xf00000>;
+        };
+
+        partition@200000 {
+            label = "atf-bl31";
+            reg = <0x200000 0x100000>;
+        };
+    };
-- 
2.42.0.582.g8ccd20d70d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
