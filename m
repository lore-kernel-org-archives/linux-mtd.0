Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B759CD3436
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 01:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZzJZMVf/7vb/aKHCZFcpL8itSWDoszuIUXEYag2c4c=; b=AHtQOEKmDB23Rc
	ILsUYxC9y/7GzKYwDIychxn5aSsSGAWfTFdUdEmmMiJJ9sjaztOdiDMzcVFFukmThezSKUe+ycpUq
	tlBnYSmE2Eo+Aby2Y4eB+vPYorhNjTkhR622cGSFCxpRwgicKmjOuT1G4hkWD4touUdO2Trs/sJHI
	7yJsobKK0vRJWYPL4QzzZb2ODlETW4xgPsXnbuAzp5SU8wkjgS/feTlA27i+8CFxBRPvTtovpzS5n
	1uuZdmSDki0wZAKoaZZ9qmChtCnB0PLpq6s52YyQ1jgPcoZJ9DT+Q/7vV3k5cVwem6BI1ABdjIZWR
	LCwmmJunllAhnicWrhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4jG-0000000EpEf-0qAa;
	Tue, 05 May 2026 01:37:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK4jD-0000000EpDA-16m6
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 01:37:40 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ba4efedbeaso2646425ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 04 May 2026 18:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777945058; x=1778549858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z84dwc2PsPdYxwH32qOj6+DQ+b4iRKtcB2f35wW4+cg=;
        b=n234X4/jczw4UzjZK0Dlhxr7SUNtA6AjKPG+JRAgt0QO4NwCEQ+Cuabf/B93p3CGya
         spjwm+lCMj5maVCyULC9AVDxqBZ7MiktGfgpE17W9IoRuXhlv8w16tHP+yfjj3BwuOAU
         5WtPyviaDAsmQIaKE9hVpl1sMwDvovEd3c33d1A0Wz9w+DUmT7ey/7OKvIG91hl1Dmid
         M65YtirWrTwUckDREuHO422J4cTKBanjCJ1YTILqm/3HHdEoMM7PYEJYJVsK7oRCyWdS
         bQfWi0Payx0FiqqFNGF/TeyuU3oVlOxEwRHqlachPuWL5SVh7HmSMvayh1lGmsM+U+Xq
         aWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777945058; x=1778549858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z84dwc2PsPdYxwH32qOj6+DQ+b4iRKtcB2f35wW4+cg=;
        b=Pbnw4PEAp0FRSJdEM+RWsJtdAC3UEDYH0v60HFhge/mvEOhaylQpzEt+3b06twhYVc
         7EuukQYo97oRXsX2wFnvRkzwb6/2adYzuD9u2uzkk2TRvzuUChvvjr8SFisaY6GPiaVI
         NOj0aZo+EfiA3BsPPLBZ8Ka/2cF6HdkrAKqn3RI9qnnLML94D0T5e6oDPze6T1ToFaZv
         NILhW2rMJmfD6eCCD09qFWCZFEJMXOpZLCVxs6qnF+hffpOT0Rk+Q41iXgfzigi45UyE
         i4BAf54S0ZD0qmptniocrcbOAYhVPO/myOT9k4D7zuRGtigKBa/6AuXRDNJTAa69xp1p
         KXkQ==
X-Gm-Message-State: AOJu0Yx7sxg5KzL6GHz15jUtsbhaphjRDJLrqTymf9K0fYSVskTzeK11
	AfiBfEyefNnNkUiqYH06XrEcXLePfdeYfLWCdYfRs6SWHfs0DPF4iZ6v
X-Gm-Gg: AeBDies7ZVcFlNWk0EGk3sm2QPDLby6S5Iebq1MZOEwfO1KaTPyakqI8dJO6jxDXrTm
	fchyVUaeCCi/uNyV2K5amWQBz4iRwQFNn5rliFmXSXUcfZuxlDyO6a5s1NAuRvCrI1WJobK+WXh
	oGkEGtG6F+TSrWw3CVvevnq4P+cgU7aqA5yZF5fqEV6xsn1lO5iTD86YzzprDlKiBpWDNFsaclT
	QZWXtPASBcOipLX7CCi2drPJVLVwKXjcX9yMT9t+zQ36H+ZZjwjp5lN7iSa6N+EVIoWy0WXmj42
	5KDlOan93yIdPpwk7qDV6eCtjGICOX+5h13VXQE9s2aOWNJuFM/FAwp54oQBGZIKRnMv8+vQbNo
	rN2lalV6RaNaVjoWNI6kP+yJiPSMK++/XOmJhcstPOdAePy5PnB4+VE6YuQkcW2kBs5xAsxma8+
	sFinmR5h/z7St2dbHF03TQG68yOtEFGrIHCNenSezqh9/+IJXIe7yDCtXI
X-Received: by 2002:a17:902:7c04:b0:2b2:42f8:1a45 with SMTP id d9443c01a7336-2b9f283eaa0mr77894575ad.39.1777945057416;
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59f62sm114565335ad.70.2026.05.04.18.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:37:37 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id C3E5C4163B79;
	Tue,  5 May 2026 09:37:34 +0800 (CST)
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
Subject: [PATCH v10 1/3] dt-bindings: mtd: nand: Add nand-randomizer property
Date: Tue,  5 May 2026 09:34:51 +0800
Message-Id: <20260505013453.980249-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260505013453.980249-1-linchengming884@gmail.com>
References: <20260505013453.980249-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_183739_310126_E801FA81 
X-CRM114-Status: GOOD (  11.70  )
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
