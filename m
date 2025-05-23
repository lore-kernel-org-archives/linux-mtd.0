Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4693CC54F2E
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 12:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhopTjQ1h2m6DsH0RtPVGp9n0dJotEcViUEdgLxtj1M=; b=cPMxYCA/roku3B
	OxCdhhkCkGopmvJFUbI6AB3bDosIBG+EJqVg952sT63zXzmJrsVZ5BDjBbnmtKB7KYgTuUKWSKBFU
	Pry7Vf1rWGJzZB65FbUPRzSf6FK0pGmIB/Xefq0ROfItW/O9QWkr97yO6tHVEdWbGDvgHSs2tecE2
	vhq0OAUs1kvc2jJ7rOCbf56n635EfHQAgYDn+qCYKbOxdgiHtfHa0b4VYT4RiGdICZC/vy1628aAg
	GPcveLcOOrzZPr7maErDA6CIy4p63m6TcH6IwYevU9+LGf3woq89kuDC531Q6WlNqYwNLuJttwUcP
	IDKBqMW2n7dK7TVI128A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRCJ-00000003m65-35tB;
	Fri, 23 May 2025 12:08:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ3M-00000003eKY-3bz0;
	Fri, 23 May 2025 10:55:05 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-74019695377so6539299b3a.3;
        Fri, 23 May 2025 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747997704; x=1748602504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn/O3K1DYv29m3uWPUXSAZ2bq2VSrL80s8QgFG0aSI0=;
        b=WClqrCDuWyyuJyllzl+ajAV41tMtoHjizy1LI6IOe7a/D340q8MGLOEHarE1B0yZ72
         oQwucR2QJNESnj6N3JLo0z2gYAAjRSI7lM456Ep9YPlgD4GeITfryL9v9Xr9Ws+bw9JQ
         lyJA0G2IP0QKb2OZZ0CeFY6XwgB7+bC+trPkzP2nUqXwLhiY5CZSXImUgInQxLBsQj7Z
         5jS5wWdJWGXFmTzVPMEaAxBUNg61PYq4hq+VrC6ptrEszjqgLk5Un83PHx87iW6Q76Wp
         JMMWK8yFJZLZMKALsSl+5yWXYX4uqnb0AHXGJkBT4DAhhf01mBBKFEczk4rtc9djy1mE
         eXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997704; x=1748602504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jn/O3K1DYv29m3uWPUXSAZ2bq2VSrL80s8QgFG0aSI0=;
        b=GlxUukseIUPq3u0ieyzZDNHV8Tg42wYj+ukYIOumU71lcNftaupEYKtQr1w3NTJa04
         RxsigTtYJdjFHnoFMEtCDzYR9n0trfnyKvd5bxxDYyoRN+nE4s0XbI4q/D+q1HhPGbGK
         oxZSlPfycbJsap4aeW5wMvu9iuWQcvpHykYPILdDaddRoDLhJIVcXz9mYBGxgLd+sxCw
         dTbj3gqoesFSPDgbqX9ugjh7EEJKZMxU0mROOZBStFu/6EEL+5WmpERPQi7npLI/7fi/
         FIGhfMxw2gUYKvrsstU0UqoB89hnISuOmEFnvOAlwb17sSVcMoPX0OMeIpTZtUsppcQE
         EPxw==
X-Forwarded-Encrypted: i=1; AJvYcCVTktHv2NNnMmzIrdptoV6mw+cQmd9733NoKQI9KjcQGCEufbWDN9cK5jSJk/GvdZDIZ8y4gJ0iDW2icQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSyLfmTXmz/pxyZzZIRuxkrFaEXxrm3FPkuKxmgzuOE5grN2Xd
	DA4AdxW+ZYa325lgG3GdUvftSgoEFqfSDitqgJgBWEFeKUT25imKsWQQ
X-Gm-Gg: ASbGncvxMbjkKtdpZbJsCAwkdMRZdAWjQKCbCdOV4CVsQukdBFwsE/+lpqHKBW1okda
	GiX4PhatEZf0VHGJ1oWQGguOR3Cha3afPgPQ7X9dRTF2tXqUmkFLo43nxLQji4RxZRgrxUE/6+X
	Jm7DPlewTHZurtnnQfbNsEEiYv/J8MDLiatPQESC0vpDrl4jxCwlXr01KSaux55vlUyTIp+uAf6
	amLq4F6nuHQuafmZb/AyEeO0Y+LYToVQK5CWBbEBvt1IN8dubU29nOCl35CDf4t8VFYe3/AlnL0
	iuy0eeA1PtloQRjcH2CyErWmEqjkmM4/XTXImZXRX90=
X-Google-Smtp-Source: AGHT+IGb/whdK5OVcrGLs3cyAdkZSpq6Qu930wT4pSb23mGATkPV/R5AcFIK2e65lJrScVQ63J616A==
X-Received: by 2002:a05:6a00:4648:b0:742:a0cf:7753 with SMTP id d2e1a72fcca58-745ed842a10mr3899729b3a.3.1747997703789;
        Fri, 23 May 2025 03:55:03 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9739cdesm12623687b3a.82.2025.05.23.03.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:55:03 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 23 May 2025 18:54:49 +0800
Subject: [PATCH 1/3] dt-bindings: spi: Add bindings for SOPHGO SG2042
MIME-Version: 1.0
Message-Id: <20250523-sfg-spifmc-v1-1-4cf16cf3fd2a@gmail.com>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
In-Reply-To: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
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
 dlan@gentoo.org, ziyao@disroot.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747997691; l=966;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=B1L+ns3J9BEA46JOnVmHJRQ+0e4FHF2prsHtqzS74ao=;
 b=5V4GegDuuILrVGuFqa9Oq5IP1YPnTcqKDhaZEcKM4DPE7MLjCwzBI7L8guAOu8jPUW7VeG0A6
 DYYBa4K4hzZBp+BBJVsdr7nXYCILxF0QkTqDrfu3c77sijBT/HVcNQp
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_035504_916094_0C614F7F 
X-CRM114-Status: UNSURE (   8.87  )
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
 Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
index 948ff7a096433a8c3c64cba13fc1339d18f6c19d..e083362e8f76f7a7582fd7b98c0b7a36f61577cc 100644
--- a/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sg2044-nor.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: sophgo,sg2044-spifmc-nor
+    description: Compatible strings for SOPHGO SPI NOR controller
+    items:
+      - enum:
+        - sophgo,sg2042-spifmc-nor
+      - const: sophgo,sg2044-spifmc-nor
 
   reg:
     maxItems: 1

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
