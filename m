Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B012BC54FB3
	for <linux-mtd@archiver.kernel.org>; Sun, 25 May 2025 14:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HV3tmbfQ8JuKM+qBxHhkx6b/Ho68bGAfelBnDDJc0g=; b=aHuZZbvo0ORerR
	ENH25q4ltixX7vioV6xNWWXSgF8y3yM48L06LupyGtPHLYBqEdBtsEQWL3YuwN9AYTtGvzI+kv9s3
	XMvH5uPb1iKphh9L2O5kNOYWSMF+SpFggCl6D4LwIckmT9nML840kfHdUi6un3VQ43vKhRpKT52uv
	W6xY1FjvHmI3TPuMuJyby0hRLBE/A/rrjnPNHwzJ/nrx2+BlHKAIKTnS8DVbwh2DdFWnqlUnJnnWP
	TLCKfrrRyKaLeJ5nNZCb0tA5PDXM5oixYheL8UHoL9Mn1o8KbtA23h15jsDrkdsnjW9E1KgBryerF
	tWrihQ7xM4yPyDva92SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCpB-00000007E6e-1A9A;
	Sun, 25 May 2025 14:59:41 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCp9-00000007E5Q-0lrZ;
	Sun, 25 May 2025 14:59:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-23035b3edf1so8586485ad.3;
        Sun, 25 May 2025 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748185179; x=1748789979; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2v8T6KWNdY86EGnTj0qWjYV1Oss6TPbGlyKa00x9/Y=;
        b=PixUmEHpupTrGcrR7DoZBDM7HS1f15nF3H3gF6ASrIVRUnyXRqAIkVN7xwrOBSv5Eb
         cuRDEYyS5nBwaMYXl1dKau4Al+B75JkSbm3PyUrQgaWyMiDlhctAfKYJQooujDxO1wDC
         8eUyEUqn9kOmwpaawbgPCftdyFx0pVx8EZJ4+yjxSOOpwxswGj7/fvBEieI57vD0sFr5
         Rxr9WsYh/eeuk67MF9AaOkkg68VgT7t0ciRtYis6a4SPADpC6crpKvcOyZrhj48Y807e
         XyN70/tBZDZPqL0WNvxnIFnXpqWWf9+H05VneWNPqr39JVTOq0bg9lZmO4njyDiphSPZ
         OJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748185179; x=1748789979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2v8T6KWNdY86EGnTj0qWjYV1Oss6TPbGlyKa00x9/Y=;
        b=XbmK3gM7MuL2oQseqQPuTyC7W9wmP++kMRQ6dGs/IO1NsRXXQxjjBagUSEITOlz0OE
         QSNgNhqBNPdzIAZlCi7tmSDMHzFu0eQQqcmLprTv4Z3MsolkLUN84We39tA9sf4ADb4k
         Jtmu+JR3BuR0f1HKhTSUhRg/yZewDx8klOpPX+3WqO2U39Jv5kIgMNsYH0K4mU/K/c+w
         Xl5YR280KPIKz944SUtWHokDihLTFfapYdEscoYkPRH/Sa1JW4c7ilmy3GXKTI5kNNle
         J7Wd3lgGqaB5vGjQG18srJMJ6PHzRElYErbEuvEzl8JYn1YjDy1hWvozzNl8auK2CyDf
         lxhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvkK+jcqVceSt9sIaVqk02arxRSmgiumUpFZrMise5czHmlGUkWrVQEhRgfL/dm+mObNi5LAqB4qOiKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPe+PQdNOQe8SYQukq9FXbpOkXwV4X4VjlgcFypF/W/qbws7wS
	88iXRlTgE2rHKG4z3WdpM8Fy+wJg/Aq171x09T8nCJ0Lu7zDYhNb19r9
X-Gm-Gg: ASbGncsq3nZSkPt0I6enADs6Ap6utJSKYJzCF9vebBuQE78q+okOi6z+rC49fGPTc8z
	//XQ9snOaBAH893DB1Ve8CtIOphdlre1G7tPJRWpqSSTQr8krbb72OMhqb156pLPTjMfPuhuoAs
	mRqGptGBwV7yttDhc/mbjXybnlpGzh1DIzKS0RLnumWpf6UFAP9Hg95LMa6nemZx3wrN6KOthSy
	blpQ/CL6yxQm74dXE00sXxQVtrAuxhRiKerL252vwRh+zEWhCXS42ywo668QvDCLi6lGh0Hr8gZ
	mdxU8VOiB9kq6DyQlun2S7tmGLo92C07L5ioz8FdYNI=
X-Google-Smtp-Source: AGHT+IF3VxyOXCOt5MifU2/DGUUb39EyyEwfytGdkDvdcnGlAfj/NomQNLMDPNZlESfRl5TpLDFVyw==
X-Received: by 2002:a17:902:cf4b:b0:224:1579:5e8e with SMTP id d9443c01a7336-23414f490d3mr103435265ad.1.1748185178225;
        Sun, 25 May 2025 07:59:38 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2343f8e2fbesm12204845ad.250.2025.05.25.07.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 07:59:37 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 25 May 2025 22:58:41 +0800
Subject: [PATCH v2 1/3] spi: dt-bindings: spi-sg2044-nor: Add SOPHGO SG2042
MIME-Version: 1.0
Message-Id: <20250525-sfg-spifmc-v2-1-a3732b6f5ab4@gmail.com>
References: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
In-Reply-To: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
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
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748185167; l=972;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=ilUYEgJmQyNUKpmFci8Kk389OiK2lk6BxrCD1iEtz9k=;
 b=/S/3KAGCz8dlqvZlnfhD+8hHniV19KAKuwt34rdhKH1UkljaAUHveB9PC4zxaS9vpti1qMKYN
 o7xr0qeiF8WDgiC+YscypYvEUghQVx83m8v2rb1Nf2MCcchHL7XlOLh
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_075939_234580_5AE2DE35 
X-CRM114-Status: UNSURE (   8.60  )
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

Add bindings for the SOPHGO SG2042 SPI-NOR flash controller,
which is compatible with SOPHGO SG2044.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
index 948ff7a096433a8c3c64cba13fc1339d18f6c19d..66e54dedab140a167ad84c43f312f93af2bfa06a 100644
--- a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
@@ -14,7 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: sophgo,sg2044-spifmc-nor
+    oneOf:
+      - const: sophgo,sg2044-spifmc-nor
+      - items:
+          - enum:
+              - sophgo,sg2042-spifmc-nor
+          - const: sophgo,sg2044-spifmc-nor
 
   reg:
     maxItems: 1

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
