Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D385C35FFF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btMdkT0P5yREimza8kECHerJCzPbzVW2KzsrZZHB2jk=; b=uJ8WufyoykvLeK
	WyYOiExF7G9UNFsrEpxNd3oyLy1cZ9c79aJyaOxN757Zcu4mGOL9SIcNDF4UfjfkJ0mzr1OZ9tY86
	BO+OYSeDvxM/tJXw8b1AVcjiA3y6YKPk+87y8nxEtZ/Q+CTritAKMHt1hGetdlGA4K4Gko9eeCRMy
	QwZFBXoIZyeTCl7+Lxpi1hFgnPug2M6y3u+X6EFQ1aEuEr2eqBpGa8UWa/06jFpyMj3Wl4IBGq8/B
	bWWEzdbZuOHapmEAPYst8I5a9r3h5Qbr60V0NThYvsxBBWW+pLbSS6gEHhnNfdCtAKMXUAuaYCxLQ
	/nf0Axsl/MasmWUehSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqBA-00000008aqP-1uCs;
	Wed, 19 Mar 2025 09:57:40 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuq1s-00000008YkK-2KAQ
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 09:48:05 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-300f92661fcso7018010a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 19 Mar 2025 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742377684; x=1742982484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jO5WZTMo+C5iTCX7S7g0gim47PztvreZd6gINV7Mu5Y=;
        b=JI3zrsKw0CSBWDCwjWfxuixd1YeHTCjv6k250PKnzad0f/Ona5F+G60Vknn8WkO8gg
         SF20mdFWQxNpdGiHn8QElxyk2u96a2iW7fFcquxoe1QICb1lRIb6y0XmJPdIwEk3CvAr
         cqhAJ1XZgWMVeo9aww4OxgH1iEZQvCOg4JQFkr243QMtJWuxLzB+EwcdrMFRsFM7//1S
         HUIxff06XSq3hiiLUo/31imv8YGPsrLuroRJE5VLRDPDHzi2/jXIIz0I4Dv+0439hKzV
         0xKKcgPwBo5PUPdkJdXmvngKANk1uMCJRrQARk4bGj0z6kR73WEj1fzolLNUqp63ofhZ
         0kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742377684; x=1742982484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jO5WZTMo+C5iTCX7S7g0gim47PztvreZd6gINV7Mu5Y=;
        b=oDqc2YWIrQd/Nxfbul80wgqPhwCdQLvEYBzVDwYPUMhxbldHrsZXLv0gN1JB3+x2JZ
         D1AzX2UOpVIWjQfyfGazMq0bLrjY0lZedBOAB2oWFJ2NB9659pnIH+PULw8OfSsBGOEA
         GB7bfwnEkWzna70+pYAbq6vxfoVXp4gvUeAiJ13LFSe4RGfBZeum0cM7ZPm5kJTHzb3S
         HJkD3eaHuUciOoW6Kk+xVQH7VSyH49lJ0AyEP9tFwojXps6XMCX+ZZlN4wRtsxZj8ZEx
         z7RLI+LR7JPjd3ovUjrTlSgLw/QxE3wigumIcYS4c78/kEn9EWybm6SpgUxBN0zDadki
         Pz6w==
X-Gm-Message-State: AOJu0YzkYud35XsH32Z/bg0OBfgN9EEzlGybhG4LtdJbiryf7MZFeOp+
	bfnI1QUSCdTvjIAj/lhH+YuN6qFVxN0IKeHEjBpOSitSHKiCs5FW
X-Gm-Gg: ASbGncvlifPNKx3/MI/y587j6QVZa6TksvmqCy2RbfG56OQIZkPCEeV+ik89oZyu8QB
	+RAdvdt+WDW0gBX66IrNe/Sn8oNHd/0fszFtR8fShe232ahc7O9Y1TZiLk5vpxCweIISo6YIQe+
	kE/b7KkVm2qq6LJiBN4LPGWqOkqMlhail/R4HDecDhfrwj7GCOYrTzGlx6BOtJs5cEYXs8/eQQK
	T/xi7RQypQ1HX12mE36OLnXyPN1lYSguQKrbgxyfJB+Y4AaYYpG1YYoO/KWw4+a2eL5bLjJF0su
	tRiItde8SueCkecmCB2afafxr0nQuGKQJ6HDnBh23tV+SdSlmTQMRjEktuCQn4oEluQ7Clz5Se1
	AZziZzKo+p+1G3JJoWvUURz7zmfM6eW+8kAx0uw==
X-Google-Smtp-Source: AGHT+IHGVpw5pZ4oUibijuz5f/+swAD6+UTqPpA7k0Fjh56CPVAS60cjsY1TImQyPXPs20LFApE6UQ==
X-Received: by 2002:a17:90b:38c9:b0:2ff:6e72:b8e9 with SMTP id 98e67ed59e1d1-301be204e98mr3374142a91.25.1742377683407;
        Wed, 19 Mar 2025 02:48:03 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf589bccsm1103483a91.11.2025.03.19.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:48:03 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Date: Wed, 19 Mar 2025 18:47:43 +0900
Subject: [PATCH 1/3] dt-bindings: mtd: jedec,spi-nor: add optional
 rdid-dummy-ncycles
MIME-Version: 1.0
Message-Id: <20250319-snor-rdid-dummy-ncycles-v1-1-fbf64e4c226a@infineon.com>
References: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
In-Reply-To: <20250319-snor-rdid-dummy-ncycles-v1-0-fbf64e4c226a@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bacem Daassi <Bacem.Daassi@infineon.com>, 
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742377674; l=1447;
 i=Takahiro.Kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=VktMu45HLVO/NWd1qA6YTia9Y5dgNUfWig8y5ndhO9I=;
 b=XvOo13JqixpDnCoEo8S6z9Y/baIU7177u9z0q4G4EUIT19h8F+RPtZzhwjNCtX37ffHAB1tia
 ObbMUd7FtVbCzagGduowO0iBzKpwbZJSykZW053bB/uxCJ7f8I7fCHN
X-Developer-Key: i=Takahiro.Kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_024804_594817_81796A7F 
X-CRM114-Status: GOOD (  10.55  )
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

There are infineon flashes [1] that require 8 dummy cycles for the
1-1-1 Read ID command. Since the command is not covered by JESD216
or any other standard, introduce an optional "rdid-dummy-ncycles"
DT property to allow flashes to be correctly identified.

Link: https://www.infineon.com/dgdl/Infineon-CYRS17B512_512_MB_64_MB_SERIAL_NOR_FLASH_SPI_QSPI_3-DataSheet-v07_00-EN.pdf?fileId=8ac78c8c8fc2dd9c01900eee733d45f3 [1]
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 335f8204aa1ebce3d2b4686b2a06d0ea3791667c..25abbe4f5d17f66215fa1af097d14de4a6ef776f 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -63,6 +63,12 @@ properties:
       it can not be detected at runtime. Refer to your chips' datasheet to check
       if this is supported by your chip.
 
+  rdid-dummy-ncycles:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of dummy cycles for the 1-1-1 Read ID command, if not zero.
+      The Read ID command is not covered by JESD216 or any other standard.
+
   broken-flash-reset:
     type: boolean
     description:

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
