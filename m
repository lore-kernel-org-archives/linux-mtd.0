Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44456C83F1A
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jul 2025 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hn9nneqBhpRRF9T9dtCfDHFZcOAJWovguRMMIkEteU=; b=iJcptP+8snhzrG
	5iH2yIPE8FPO5JzQz7pyq/JQ5qM/LQkvHWrs4IQ4ZGz2NiZCRfdurrUIWNF9BVb6+iui6dmiRsGY1
	1CrkSy9CQjk1kWh3EKt4p4g9iu8yT4pSizuN/ueRpfbg2y82fQbV74ES4N9RnP0ByD5tp3EQA1WTk
	PV3kr5zsQ+hdhoa+HcfZPI298pxQwUMHZo8Q3swi3eNDLaT98ddt/xJiDhijTW6JxMMAwPbAe37Zb
	1IXBcdDBmtpKA6W5p8NsBYvfHjfgIu8AXXT56DbEAxOr//dDcjX3ShUUu5cuVaa0LsS3BHJ2HvPqt
	/Uz8tAMH1KSQ8W/eE0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPTg-0000000F1tK-2WKI;
	Sun, 20 Jul 2025 08:33:00 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPTd-0000000F1sV-27TZ;
	Sun, 20 Jul 2025 08:32:58 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-af51596da56so2427714a12.0;
        Sun, 20 Jul 2025 01:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753000377; x=1753605177; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4FB/4XgRToAosI3f28efm3RMFKFbeCd/sui2PSXsGM=;
        b=ShayZ5IdQVYl8Wd4brP/ykF0PETEDZYr2OsFHdmh9sDSQEJ5oVSxrNKAbzxnViu0Gu
         l9cWDwVn9bjbKM37jKggOZkQ4EQkweH7CVlaez4jGHZCfuuBrA0QrBpdmUSWsm45ph9d
         7jD9aPHM/70uAvgyBqkhM47byt+8KzYVpZYVFNYlkcCRb3Ze1cFdhixdupixn9fbQhbA
         a3m4U2kLvAd7dPxec7PVdXtr2SyV9u4Ch7ck+wZPZcDNqBmS8jhn/XbZonmjdR3QsDfM
         XpWGv8QjewOOtQywz4lWhXfaf14DpjELgWgYKSSXOq90ERFi1iKoPXRyfepxsVB0cgdy
         ttmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000377; x=1753605177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4FB/4XgRToAosI3f28efm3RMFKFbeCd/sui2PSXsGM=;
        b=FKTSaVCzS4P9zl3vy24MkxOX6Lq58gyW2Mp1HYRDjjHYktepshagaxuK4gWRvFedsF
         Z8WkbemeH3haWxFGQgJhOmMsCmWQUVx0FWhhUfd7WsDY0NiG8qlVWY7L5l+owPmyWPpv
         01c1gTvXw0OqOJLFd/XeFGmbEPEg7FbkyqMjyRvlgFY1B/NV/J+4Oa/NBAbUUTlC7aKo
         WvTYOXpSDjtnx/08yVE7COXNrTHTU6u4Zbi9XA4RqlAK8WaGRIVFthQ/LQZ43OQvdkli
         OyU5YFy3EJDBWEzEl0kklD459kSV/fihRevFwyS5BibPvVdZOGk0+aR6TzHTxtmHUp4s
         VItQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfXw6411Idf1nTKElSNkFcHgOzpRrIdjCUREXbepEuBBdZ3SqjLfUQ8gYrH+Nc61eJF94JGCo+i37h6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6xgMfhsPyqWlp3DdVqM5VWzAJvPFIxcdkoW3OkhJrbpw5DfM/
	sPpk/vxOxQhmbPReRvIWRiLtynhnGBZ7kNK6+LUT8zRs/dHgAvKU8EoX
X-Gm-Gg: ASbGnct+ju5LnT/9l4IqstZsCeNODQo9pNWxC9bAcFxXTd6DshoKC2hAubmCdJdAFIL
	PTrPpdfcLLowDzoQQx2V53kXzGJC8Dt6GfAH+W00eVM3WSQqEfm86Z6EwnmRr9V+leOp30/f+v6
	1Q1Wmu3jHDep9oCl1DwUSG6QvqktUXHVk3zOjKUNGpTy2tVcS6wRt+1kXCOpncWP3+OKElJfIcI
	zIdC5+YG3W1cGXkOS+eWhk9r3ku42M0iRXn0IMldHgyaPCFNCvxOTeMZzAblXk0MPp08TwyJsan
	TWDCauO12DckZnrNLntZIWVEJwhHmiy11E18JMVmyCk1JoH/R+2SNZZ+Bjv2Zkf2itiJtiCIxGx
	RrXs/lbKca+N83w==
X-Google-Smtp-Source: AGHT+IGc2/z5P087dO/qIeMpZJTqXF9gedh8hHC8SAN7DoJxqGInUWHeRnUabLfomatBcIrBDZkwDw==
X-Received: by 2002:a17:90b:3b90:b0:311:e358:c4af with SMTP id 98e67ed59e1d1-31c9f4c4604mr24803623a91.16.1753000376153;
        Sun, 20 Jul 2025 01:32:56 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1002::1d55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46b97sm4079721a91.41.2025.07.20.01.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:32:55 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 20 Jul 2025 16:31:43 +0800
Subject: [PATCH v4 1/4] spi: dt-bindings: spi-sg2044-nor: Change SOPHGO
 SG2042
MIME-Version: 1.0
Message-Id: <20250720-sfg-spifmc-v4-1-033188ad801e@gmail.com>
References: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
In-Reply-To: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753000358; l=1309;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=vXVFaJbRIh2MrD1GhRV05+9e2Sip1lBqq2iHYXA3CvA=;
 b=3o2MOgX78qIjiz9F1HO7Wk7wo7kw8ovqc2mY18T8AXZYgNczjEjwHyyr+V7WsmvJ027qnTQcb
 S/Q02IqrdGZBWMqDtI+mbWQYu+cRWtZQ3o2yDzWGKWUJ9L8qO50qZte
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_013257_553664_C80D06F6 
X-CRM114-Status: UNSURE (   8.72  )
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

With further testing, directly using the spi-sg2044-nor driver on SG2042
does not work. SG2042 is found to lack full compatibility with SG2044.
SG2044 has OPT register and it's necessary to write but SG2042 does not.
Due to other possible hardware detail differences, it is better
to bind SG2042 independently.

Fixes: 8450f1e0d3d0 ("spi: dt-bindings: spi-sg2044-nor: Add SOPHGO SG2042")
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
index 66e54dedab140a167ad84c43f312f93af2bfa06a..0e7ead7637052a008c64b82477d060d180c43acf 100644
--- a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
@@ -14,12 +14,9 @@ allOf:
 
 properties:
   compatible:
-    oneOf:
-      - const: sophgo,sg2044-spifmc-nor
-      - items:
-          - enum:
-              - sophgo,sg2042-spifmc-nor
-          - const: sophgo,sg2044-spifmc-nor
+    enum:
+      - sophgo,sg2042-spifmc-nor
+      - sophgo,sg2044-spifmc-nor
 
   reg:
     maxItems: 1

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
