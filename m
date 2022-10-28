Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7935C38A02
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Oct 2022 00:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74Eb6Vr/2or+o7WoSrJJqz3IcbSQN8Kmz6hVYkqWCnc=; b=TUry72lS3Qky7z
	qVQ9K3Y1RNCZJx/1MqjchW1i1jQxpBbtlTtIhHAHUHRRknrBh6+60jwE1Eh0GP5Y3mn7WBqbOHHza
	cqKSqNjiUBoFkpRhAL+DUiWHnnKiDZ1vVLhxMBAZKuKy7RVqCveue+5uXrRrH7f3PdRdldaLbbFtx
	I0XPJjd3JrfzW0Ecg2HygfkVl9lEAWa99hgs+WGztkhJXtG4+CkzvBKvXeilEzoYqriZF0mLX9rjE
	9ST5QD4v40ZXy6KWS+iGdAPE9p7V5fgU3VQFlPE5ZjsO1GcP2Yg5J0Y/E/B0R67igvukGw+OUXx7l
	o/SfIhphmbR5evxmsM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZIF-003KX1-DX; Sat, 29 Oct 2022 00:01:43 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGM-003Jhj-Pm; Fri, 28 Oct 2022 23:59:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D53CEFF808;
	Fri, 28 Oct 2022 23:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IAWWxBs//Vo6EQ31GIr59Xp+/osOxAxt+YgW4D8O4Rc=;
	b=aBtHHnEHCLYhI3pW0oBmNFQpqd6mU0z0PHYQjazGC0+Omq0+hM5pUl4nmBdHR3AzZd1tgj
	CHJeDuJXExGkDrAlZsl0njf7NXHPCeWFX+qXKPSLI4acB6zM0jHDN8yiNfHqW4vyWkyzsq
	+aLkN9m9YWoKJpa5jVNcCxedk8U8yBAapIOyONX2RnTU83qNuWqzz5FkaHcKDj2Tzk0bMm
	pWn1IdJXWJ9AtXafn2B5ynbwv/LdwmVA0KUFoq/5v+ZgQFIZ80InIXiJ7fo8xZvDD3CpI5
	rHTFIL6wci8AJy1tyvRatG8ezVKhnNY/DUfiZHWJkDHbVttHpNnikN9TiAyJiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 03/12] dt-bindings: mtd: Remove useless file about partitions
Date: Sat, 29 Oct 2022 01:59:24 +0200
Message-Id: <20221028235933.934850-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_165947_178521_627AE722 
X-CRM114-Status: GOOD (  14.97  )
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

There is already a real partitions.yaml file, nothing in this text file
is actually needed so drop it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/partition.txt     | 33 -------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/partition.txt

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
deleted file mode 100644
index ead90e8274d6..000000000000
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Flash partitions in device tree
-===============================
-
-Flash devices can be partitioned into one or more functional ranges (e.g. "boot
-code", "nvram", "kernel").
-
-Different devices may be partitioned in a different ways. Some may use a fixed
-flash layout set at production time. Some may use on-flash table that describes
-the geometry and naming/purpose of each functional region. It is also possible
-to see these methods mixed.
-
-To assist system software in locating partitions, we allow describing which
-method is used for a given flash device. To describe the method there should be
-a subnode of the flash device that is named 'partitions'. It must have a
-'compatible' property, which is used to identify the method to use.
-
-When a single partition is represented with a DT node (it depends on a used
-format) it may also be described using above rules ('compatible' and optionally
-some extra properties / subnodes). It allows describing more complex,
-hierarchical (multi-level) layouts and should be used if there is some
-significant relation between partitions or some partition internally uses
-another partitioning method.
-
-Available bindings are listed in the "partitions" subdirectory.
-
-
-Deprecated: partitions defined in flash node
-============================================
-
-For backwards compatibility partitions as direct subnodes of the flash device are
-supported. This use is discouraged.
-NOTE: also for backwards compatibility, direct subnodes that have a compatible
-string are not considered partitions, as they may be used for other bindings.
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
