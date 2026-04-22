Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA36F94CDE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Apr 2026 07:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZzJZMVf/7vb/aKHCZFcpL8itSWDoszuIUXEYag2c4c=; b=4+DYh1W+mGjVez
	zgcV1HZxLgv3k7j1YvSjc2uMqhEdlRjlwMqJqaNE/3aYZW3aAAK+9+KQzF+kmBc4JpV6IaFofVNJM
	U9mSpnJO3k27NPHrUtVi5lx2nDfUpGonYWYpSXV8ISI6wTwG3+rtwr0IZ+ELxEf1whWrVstkNDTM3
	VsPFPWnfc/ioZB8zGG5V+2bWuZotj9wlqpHI/6gx0A4QPejA4tEnI5eq1Y2G58PZTPCgsPQUcqoqR
	lWEUgm+L3bO/k59fa1gp2tLG5HpVihFIEODjD3/U0yJtl3Ar8PQFwHGrZrzZhQsSbg53WgROJEtOM
	JSFjZR18aZEjncGFg4vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRcW-00000009hDA-087r;
	Wed, 22 Apr 2026 07:03:36 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRcT-00000009hBr-2kXH
	for linux-mtd@lists.infradead.org;
	Wed, 22 Apr 2026 07:03:34 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so3182579a91.0
        for <linux-mtd@lists.infradead.org>; Wed, 22 Apr 2026 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776841412; x=1777446212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z84dwc2PsPdYxwH32qOj6+DQ+b4iRKtcB2f35wW4+cg=;
        b=Wrl3uNyK85b31wTqIJ6pL7KvKYu7a7cQD/RGLks9sjYZIUpa04L1G/m0eDnEATdQJq
         2gQFSavChxMqJ+04m7RltZAfv8I9Qyd2qGRyW1ZkH+v8zZHRROJiJVAHlQfRpa5zdnHx
         xuFMnWP1Ql2/digZzjF7Q3jl7EcKxwE9Lo0Z8pPnh8GcxPfruQ5QchYBBE/VK1WbL80O
         vfuy3/RTN9zygMZBb5ctrX0mN0d5C3vW9IgTjbPzCUiTC6+KEkTyftiVUGgSUMJcdOJR
         s3koKnQW+nX8OL2ym0PPHSY72ZXZOFWKtTSZ1tWeSz42QYsmc8J/sYyjwxZ+9CkQsAwp
         pBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776841412; x=1777446212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z84dwc2PsPdYxwH32qOj6+DQ+b4iRKtcB2f35wW4+cg=;
        b=D5LmXSxvyanB9DR3+CNu9AE0rL6rYDs7NDPU/xdAwrSjPPwJ+RsNurRekpO6NFeNL/
         /rStB43AJ4bsPHaMj+ze1db5Eel1ji3KAR5lFXHunUA4BlBerdTE6SOxNfDWir/Ztqrg
         UAFKwySY9j5aB86v5jVLQDOijR3CWJQlL6NNeCBA4WmEJ4atyPon7NvkC4GP3pCn9WKH
         6/RHoKrkBdOlMh+u89BocPjo5KaTbs8xmwsDhykd0hVkqE6xz34Q7sCrBXg1WdDYuNeL
         QYVx4wx2G/jEL0bkUHi1Ljv9Ii8ALzQzDL1wlNxEfh6HLf9Jjp5J4bocGCPWhCdSn0vl
         rPdA==
X-Gm-Message-State: AOJu0Yxg1KJle6IkGM5TVLHr69UCmCFxsp4I4oGe8cbFD3ZzB6F15Tfk
	G/KEoUxN9Fe3SmMLmHl4iM9TAtyvFaLIzqwklp04MnJQSKzdkeQ6u/c8
X-Gm-Gg: AeBDiev5MltH+lK50uL3uJXFN2CtrF2TfxSvSz5i/CpSbqjfAdmh8/Zzx6KXpzzA8lu
	C/kizIOPnhgRfbne8i8d8+uxTT3lyS6IiyKlRsF69Soqn69gbbfCg1DBLAXfS2lGVA+H5D7JPmU
	HRWWlVKOu4yw4+nMhbKlOHGXfihlrBl2FwGz8RD7XbCDtQMW5dozTSkH1aqpePgamDmvlpUfp8r
	lP3ONR0CjH58pqTIx6T9qup9A4muDDpTsE72yxAfxIVzFGRe6nsr3lClzgX3SGnt+g1T50FImB0
	s/38gSW/FsI4I5d9hCK5HRxQCPfw8VJpYn9REgmxoxAn+yO6TVTkywCagfR/d/oss9DcsnD1PzV
	LodGPxWTH3bOoxcjDG+EUZR6DHODWO2PBLdEf3fZ5vM4v9rgBwPjmz/JhQMBpiVU1c8Yi8S6ppM
	rUejUTExAibIfmkU1cH7dMk7FH7gCRmvk1BT1I21g61TPe4HFvpkAOPk+TgCYL0LGPKSA=
X-Received: by 2002:a17:903:1b03:b0:2b2:5637:1480 with SMTP id d9443c01a7336-2b5f9ff44d3mr218370865ad.40.1776841411469;
        Wed, 22 Apr 2026 00:03:31 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cdd1sm155088635ad.38.2026.04.22.00.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 00:03:30 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 21DED416A043;
	Wed, 22 Apr 2026 15:03:28 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v9 1/3] dt-bindings: mtd: nand: Add nand-randomizer property
Date: Wed, 22 Apr 2026 15:02:01 +0800
Message-Id: <20260422070203.698716-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260422070203.698716-1-linchengming884@gmail.com>
References: <20260422070203.698716-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_000333_695931_18D1B199 
X-CRM114-Status: GOOD (  10.91  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add the 'nand-randomizer' property to control the data randomizer
feature. This is used to improve data reliability by reducing
cell-to-cell interference.

Depending on the hardware architecture, this property is designed to be
generic and can apply to either the NAND chip's internal randomizer
or the hardware randomizer engine embedded in the NAND host controller.

This property is defined as a uint32 enum (0 or 1) instead of a simple
boolean. This design choice explicitly supports the "not present" case.
If the property is omitted, the driver will not interfere and will leave
the randomizer in its current state (e.g., as already configured by the
bootloader or hardware default).

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 Documentation/devicetree/bindings/mtd/nand-chip.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 8800d1d07..effdc4f99 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -23,6 +23,15 @@ properties:
     description:
       Contains the chip-select IDs.
 
+  nand-randomizer:
+    description: |
+      Control the data randomizer feature.
+      0: Disable randomizer.
+      1: Enable randomizer.
+      If absent, the current hardware state is left unchanged.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
 required:
   - reg
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
