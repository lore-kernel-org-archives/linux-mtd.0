Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CFEC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:49:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2B2B21734
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JLOr2YXx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkLaoiz2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2B2B21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha72IdCglX5I2VMZsXHnk6dnCgg/xSmMM6pUzd8Ft00=; b=JLOr2YXx34gJIKY2jrH9RtZMKI
	u0n/quTcLPcP7QyZGkamSeMav0AwmBb4vDDamscCrBvd6MnLrk0RDnb2W6f/XsllEVBbaylQDDfeQ
	klEefqrbRskoCOt9y8EZSPydEvDpwR9ljtdaibKzZfnQTK2KXI7KSIUHOiDzUiEVy+mVm04InAm7D
	okAXN/4lUErxXg1pnGuo2nrsrZWjojCaRKpNK05yz+BjXk4rvQNXUgF+NUFfTXQIo0ZL51ymAe0Gg
	TwrGOS7gF7lDb0rVOHQeDKucRDaN4oTOWU0vobkh+2eY8iEL4fJN66hgNNT744lq2oA3qRxX+6Ws+
	R0+BWcsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf56H-00078J-L9; Tue, 17 Nov 2020 17:49:05 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf56E-000774-FE
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 17:49:03 +0000
Received: by mail-pj1-x1036.google.com with SMTP id gi3so912901pjb.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 09:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jVl81ZS9fFrGd+ufPYRPV6WNHXbkD50mNDrAZQnv39A=;
 b=hkLaoiz2lCG8tln82zm7qfOl0cDYLureyURBuaXH0PW+24+gvVK577hO5cNqI/F2aV
 +GzMDYmWlne/pkBM+dzDfJnQpgrLbniED7sUDitRpnxxKZjuzR8aLV0dYiozsnsOmwn1
 9UHgFxx1EGsPczmBiB4PDynbbKEf8EDnIK5/jsO+eUuGGwO2CW6vU/uolWJExRUfW0Ig
 G4Fn3d8qgVU/z/93B6Yaq4oInZigk7lXpZpyUcXiaajbhasY2FeLedNhRlai/r3pYYrb
 XXb4u2iaMe7ReCIl9scVlGdGRvnn7UWb7invf8vBpD0I8VswVGhoBQLc5gUaHPzdyVph
 yqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jVl81ZS9fFrGd+ufPYRPV6WNHXbkD50mNDrAZQnv39A=;
 b=KyDVjW1l+sN3BTPRDHkaDB1VeXpaRZN79AMMCT0oV143dSkdQ4hhuuGU9Vy6zKtv7c
 IVj/q6MWbK401qdg1YF/d39Tn5UHz/7zk9p3xYxGs99ohMU5cOLLTG/0zIgbpWBl8Ue6
 FiyMJuzj2pN04gPLFnd0c2JwDUo22Vb1fj1n5njMlBzowyxftm6J7yX5+zdh7wwrk44o
 QrmXUkS6h1McrviB0bkqa6X/icKXhQdnwOeO5N42VS9wGJC9mKSz5FMIhwgnFN5jcs9Z
 c9CmeviTnOBa/oLtrhrLyZzYWEYx2QxkLreaU+BgVyN8Slzx5+uL2t1ZfSkwF1IFtUo9
 UEYA==
X-Gm-Message-State: AOAM531qxLufCQDyZHn3K8EMjDdsG74rKe3VISh0qrW6NTkHocIFQQ5h
 CpqWRHyE1vGq7P0YgkIEDSyj
X-Google-Smtp-Source: ABdhPJxZXnb+Y1pWwUT4dnxesIRY7MEakGxf2a8hxor9743lNW9sz1zrysWJ+bDn30ZzJWekwpI2UA==
X-Received: by 2002:a17:90a:1b44:: with SMTP id
 q62mr201421pjq.59.1605635340003; 
 Tue, 17 Nov 2020 09:49:00 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id
 192sm22222810pfz.200.2020.11.17.09.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:48:59 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v2 1/4] dt-bindings: mtd: partitions: Add binding for Qcom
 SMEM parser
Date: Tue, 17 Nov 2020 23:18:42 +0530
Message-Id: <20201117174845.28684-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_124902_561870_BA82DA64 
X-CRM114-Status: GOOD (  14.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add YAML binding for Qualcomm Shared Memory (SMEM) Flash partition
parser.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../mtd/partitions/qcom,smem-part.yaml        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
new file mode 100644
index 000000000000..cf3f8c1e035d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/qcom,smem-part.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SMEM NAND flash partition parser binding
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  The Qualcomm SoCs supporting the NAND controller interface features a Shared
+  Memory (SMEM) based partition table scheme. The maximum partitions supported
+  varies between partition table revisions. V3 supports maximum 16 partitions
+  and V4 supports 48 partitions.
+
+properties:
+  compatible:
+    const: qcom,smem-part
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    flash {
+        partitions {
+            compatible = "qcom,smem-part";
+        };
+    };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
