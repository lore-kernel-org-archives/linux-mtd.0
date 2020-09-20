Return-Path: <SRS0=3Hr+=C5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA11C43466
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:59:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B76F920866
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:59:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yhngrX2w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+WGbfqw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B76F920866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OocQAtEJsxvWGTC6kd85Cr1Gk6j8sF2EUstj+DSYEC4=; b=yhngrX2wLruzBTlVZNzu6O5b4
	263E9rIluBNA3pdwiGeCdFKDU1Yg/3IhHzLjMXFI5qpmfr4D6aat6nqhqQL3oYT/MTnxzv77r+cHz
	d6hTchRyX4O1ChgbP41myKu+0dDjESeoU91zb88VUt8rgw9700jckW5r5+UHKrdlV0V5JXi+9Qd5P
	V1nDex9UZVglxFdhT2YaW9TLPI3wcPYuW/Ee/M+H1JMKwIsh3VYFcE/rhKswwiaZbOHq1uPxKqzs+
	no0oN2gwVpqkOcI2Z4e3QpK8xofGyeurUmkAQNTRn9kHfkzlxzc25Lae9Np6ESjwEaEIjxiNqkTOP
	hstHJym4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJw6T-0006p6-1x; Sun, 20 Sep 2020 09:57:53 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJw6Q-0006oR-DH
 for linux-mtd@lists.infradead.org; Sun, 20 Sep 2020 09:57:51 +0000
Received: by mail-qv1-xf41.google.com with SMTP id h1so5763134qvo.9
 for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2020 02:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64xYu3WDX6vWiceRdxZMl2E+VlBih2IULY9GL5lmn0U=;
 b=p+WGbfqwHH1OXV5tEzCASV8LZW0RECh7wC89nEJa+Jgn3lNUwPM42+c6NpDjnvUJko
 dzcxyFmqFi9GPNCuazz0U77Hw21k14/X2EtZbyjbdifztLrlQwEyG9YUAFya6uJaxv6G
 Lz7sHNHBujFbHP08PRzbi9Uru/TwB6DsS4feb9FdukmPSc5kR/d8jAzQZo+8p606icDv
 aZldmNlaaV2zhlAqqbD/mKeyUS4BEGnq4REiXhFsuFE0ekVv+4hUL3KKml9tdnHuXPqv
 SW7MdT268hCNfXw5ff/y9GOVVzKHW/pGLJ5SdXdCwCYeGHGbDhk9RCCIRAjOzwrcVn7F
 eK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64xYu3WDX6vWiceRdxZMl2E+VlBih2IULY9GL5lmn0U=;
 b=qgyIm1pbP+iNMJ/vh4SPk05ebUKenqfR22Xa+Lh0td1Na+5NRVXRywWTY9qoa9y894
 YiH0TfKvfQuwIBr9x7SPl/f2iSxvmSZhYX+YY1tVV9sapd2ZXuJAjU/j1FROmvHUMIhf
 EXC/QPNv/B0Y1nLFz6tGbXDO+DZtJ8IOBLUbsTIE2qq9+Dz2wCI9aHZDF86o14x1rE/4
 a865SxowDp7EZ8Afxqexxeq3kJJT1ESDieQgmeEf2cDdtkIkSPBLR34YRc2rNMFaL1My
 E81/uDKtfcrb8yBRoA/NbjpYKUoyjeQWqtJZuoJdHp7rSth3h6coij1qyLU073pXAGVT
 1AMg==
X-Gm-Message-State: AOAM531dAFz3OjxI9ROKgkZGumDesgFbQBr2eWQrTmEWy2kMNUMwPzsN
 EFDHYBKCX8APTOCRiAbVhPk=
X-Google-Smtp-Source: ABdhPJyTALYmylKCiYZL9A6ya14pzjFRwQqsR7A+AhI03Pvj4NRRfyaxkMbpqweW9bRVphtRSAU7PA==
X-Received: by 2002:ad4:52e3:: with SMTP id p3mr24148392qvu.42.1600595868538; 
 Sun, 20 Sep 2020 02:57:48 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id w6sm6968323qti.63.2020.09.20.02.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 02:57:47 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 2/4] dt-bindings: mtd: partition: Document use of
 nvmem-provider
Date: Sun, 20 Sep 2020 11:57:20 +0200
Message-Id: <20200920095724.8251-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200920095724.8251-1-ansuelsmth@gmail.com>
References: <20200920095724.8251-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_055750_463481_14994A73 
X-CRM114-Status: GOOD (  16.07  )
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
