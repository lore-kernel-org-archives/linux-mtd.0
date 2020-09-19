Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654B9C43463
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 22:31:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D40320E65
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 22:31:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vzPuTS/B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxRNRXL0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D40320E65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OocQAtEJsxvWGTC6kd85Cr1Gk6j8sF2EUstj+DSYEC4=; b=vzPuTS/Bl3FOqVFOIT09CTvpJ
	N1bb92JcZBcsLmDx5vLRLl2creRMJVIzXVrUQxxfqxqgSdF3IA79nvH1TQ0+4Vd5sht/MaDiclnKI
	0Rc+OtolDqYxw2pUmk02mlF1wbjitViHllbpm7aVvi2TcyGtJKirlg0IU57Wsyua9My6vceGdJsbb
	kMU+Dai/cR0j7ivu44sxULhgbYOU29pZcAYdbYxRGBwud+ctDkAsXfGv9/YO6UR06aWzMc3oVON6b
	IedcrptoGt0GFJ5MfxWGM8NuP7aJgH7tK+pKODwXcnzkQFm0/cVCVZGCOzXJQzOsZRx8+Ej/cNW1C
	YsD1yPdwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJlNl-0004YE-PV; Sat, 19 Sep 2020 22:31:01 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJlNh-0004WB-P6
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 22:30:59 +0000
Received: by mail-qk1-x741.google.com with SMTP id t138so10908277qka.0
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 15:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64xYu3WDX6vWiceRdxZMl2E+VlBih2IULY9GL5lmn0U=;
 b=UxRNRXL0c3gmNCGQcB1OpKvz1kVKOF1b6fhmhznYWuSPaq0zBOPUzR4GXaxYyxhtVh
 KA2XN1xdaeI8D3KOVfSQJzhfxO8/vNWxgGrWKDBTL8O+bM9mBnWQsjtd2cv7TXgg4BhQ
 umUwu8vdEiPwOxkAzZ95wSY8ISXfwyk27YyA4uAlIbSclw0sZXXfiBjKk4heoITRoAYW
 5TpYU9sk6nADmvAXa6UculR0ocf0MA6ow39ut3k+BfdFcrET2/q4MuqRnI6cZwanTByI
 iFznGYxY2HVjGYgygKAEBTYPpjTOxMKMrsCidaD1M7TuEOmaMyLYqsT4fQQmBwXZtkI3
 As4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64xYu3WDX6vWiceRdxZMl2E+VlBih2IULY9GL5lmn0U=;
 b=ozqUP5XVC0yv+WoKS/MqSFsf8p4MOv4uByzBHz/ImxP4yq9H2o14x8XQMjVfKTmpGq
 Z+sf/7d9a0QOzMb3tDX7gi4jYHoKyNTVksOMC4/oDNa0OzYGp4LjBjF77HNmsmXGrvuf
 AEzBETn4aUw3JhCAopsSe+vR3LAb+cSwSmkaEvSWQmN2TW5fXk73+txsMH6SRfcDTKpZ
 hjKGKugn8BERCjiaWjH+U6T5b0jHgahaGjOZjXA9WhFTR7L6K/UA5YSz6965XwIgcxB1
 YTIpX0YT4NnltRRc+adLV0dcwKxvYoe8g22EPX61FdWawYdCST0eDNQBot311z6dQEAU
 Sc0Q==
X-Gm-Message-State: AOAM533lHTqvgcDvkgx6RaUpVgh/E7bdNh51SjfalvyiTvTTpA5B9Wma
 EEYLbmTxZsY9Bnr7hUb58KE=
X-Google-Smtp-Source: ABdhPJyPapxawX3mTmskaO/Mu+FnvoeGud/hPaQVcm1zqD4t4YwDsmGHKQ5y1cB5vQjbXhvvKKdU3g==
X-Received: by 2002:a05:620a:20db:: with SMTP id
 f27mr41427656qka.11.1600554655774; 
 Sat, 19 Sep 2020 15:30:55 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id f24sm2581139qkk.136.2020.09.19.15.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 15:30:55 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 2/4] dt-bindings: mtd: partition: Document use of
 nvmem-provider
Date: Sun, 20 Sep 2020 00:30:21 +0200
Message-Id: <20200919223026.20803-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200919223026.20803-1-ansuelsmth@gmail.com>
References: <20200919223026.20803-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_183057_848628_8892CF11 
X-CRM114-Status: GOOD (  16.63  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Ansuel Smith <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Document the use of this 2 new bindings, nvmem-provider and nvmem-cell,
used to describe the nvmem cell that the subpartition provide to the
nvmem api and the system. Nvmem cell are direct subnode of the
subpartition and are skipped by the 'fixed-partitions' parser if they
contain the 'nvmem-cell' tag. The subpartition must have the
'nvmem-provider' tag or the subpartition will not register the cell to
the nvmem api.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../devicetree/bindings/mtd/partition.txt     | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index 4a39698221a2..66d3a3f0a021 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -64,6 +64,16 @@ Optional properties:
 - slc-mode: This parameter, if present, allows one to emulate SLC mode on a
   partition attached to an MLC NAND thus making this partition immune to
   paired-pages corruptions
+- nvmem-provider : Optionally a subpartition can be set as a nvmem-provider. This can
+  be very useful if some data like the mac-address is stored in a special partition
+  at a specific offset. Subpartition that describe nvmem-cell must have set the
+  'nvmem-cell' of they will be treated as a subpartition and not skipped and registred
+  as nvmem cells. In this specific case '#address-cells' and '#size-cells' must be
+  provided.
+- nvmem-cell : A direct subnode of a subpartition can be described as a nvmem-cell and
+  skipped by the fixed-partition parser and registred as a nvmem-cell of the registred
+  nvmem subpartition IF it does contain the 'nvmem-provider tag. If the subpartition
+  lacks of such tag the subnode will be skipped and the nvmem api won't register them.
 
 Examples:
 
@@ -158,3 +168,52 @@ flash@3 {
 		};
 	};
 };
+
+flash@0 {
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "u-boot";
+			reg = <0x0000000 0x100000>;
+			read-only;
+		};
+
+		art: art@1200000 {
+			label = "art";
+			reg = <0x1200000 0x0140000>;
+			read-only;
+			nvmem-provider;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			macaddr_gmac1: macaddr_gmac1@0 {
+				nvmem-cell;
+				reg = <0x0 0x6>;
+			};
+
+			macaddr_gmac2: macaddr_gmac2@6 {
+				nvmem-cell;
+				reg = <0x6 0x6>;
+			};
+
+			macaddr_wifi: macaddr_wifi@6 {
+				nvmem-cell;
+				reg = <0x6 0x6>;
+			};
+
+			pre_cal_24g: pre_cal_24g@1000 {
+				nvmem-cell;
+				reg = <0x1000 0x2f20>;
+			};
+
+			pre_cal_5g: pre_cal_5g@5000{
+				nvmem-cell;
+				reg = <0x5000 0x2f20>;
+			};
+		};
+	};
+};
\ No newline at end of file
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
