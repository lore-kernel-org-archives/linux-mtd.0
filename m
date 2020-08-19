Return-Path: <SRS0=Mr3t=B5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD2EC433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2020 12:41:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C27A5206B5
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2020 12:41:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="23A5bTDp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C27A5206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mb6l5R58D7jtV1qDjybOUIpdiHUNOF1S498M597g8Ic=; b=23A5bTDpP1LWQwDBnT8Z8m9VSF
	VdB/MnnaUB+80iUTNsXOJiPE0lYSHNg4dTMRQHwNJ+2BFNtc4MqY9c7S370A0fc1lA61bKU9SCrDK
	Rlj734nVdrhVpBmJoiRYQTUXhpaK9EYY+aFm4hxuWniK9BMw0CWsT0Ney8jxZj+iQ7c6SDs8zG8Gm
	8CWWaFpXEMH4lOPsKKtE0TZnC0IICX3+PNE06fkgvqZ56wptUpVK+QoArnORFuGvch47iaoA6Lim9
	TRNdYbFoU+D3eYxpHKwM+gszI7XtxJXHqg9Eb5g6HtVsO2r99Q50F9yK4Dh9zl0bsKHZNhqBe4pBp
	B1Dv+lxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8NO1-0001HB-8n; Wed, 19 Aug 2020 12:40:13 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8NNy-0001Ff-0c
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2020 12:40:10 +0000
Received: from ramsan ([84.195.186.194]) by michel.telenet-ops.be with bizsmtp
 id HQg52300i4C55Sk06Qg5Wn; Wed, 19 Aug 2020 14:40:06 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1k8NNt-0002M7-Md; Wed, 19 Aug 2020 14:40:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1k8NNt-00058v-L8; Wed, 19 Aug 2020 14:40:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: mtd: spi-nor: Sort list of support chip names
Date: Wed, 19 Aug 2020 14:40:04 +0200
Message-Id: <20200819124004.19728-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_084010_223127_FB26B27D 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sort the list of supported chip names, using "sort -V", to take into
account both names and numbers.

This makes it easier to read and maintain the list.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/mtd/jedec,spi-nor.txt | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
index f03be904d3c228d8..654d4a2d2ba26630 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
@@ -13,12 +13,18 @@ Required properties:
                  at25df321a
                  at25df641
                  at26df081a
-                 mr25h128
-                 mr25h256
+                 m25p16
+                 m25p32
+                 m25p40
+                 m25p64
+                 m25p80
+                 m25p128
                  mr25h10
                  mr25h40
-                 mx25l4005a
+                 mr25h128
+                 mr25h256
                  mx25l1606e
+                 mx25l4005a
                  mx25l6405d
                  mx25l12805d
                  mx25l25635e
@@ -26,38 +32,32 @@ Required properties:
                  n25q128a11
                  n25q128a13
                  n25q512a
+                 s25fl008k
+                 s25fl064k
                  s25fl256s1
                  s25fl512s
                  s25sl12801
-                 s25fl008k
-                 s25fl064k
                  sst25vf040b
-                 m25p40
-                 m25p80
-                 m25p16
-                 m25p32
-                 m25p64
-                 m25p128
-                 w25x80
-                 w25x32
                  w25q32
-                 w25q64
                  w25q32dw
+                 w25q64
                  w25q80bl
                  w25q128
                  w25q256
+                 w25x32
+                 w25x80
 
                The following chip names have been used historically to
                designate quirky versions of flash chips that do not support the
                JEDEC READ ID opcode (0x9F):
                  m25p05-nonjedec
                  m25p10-nonjedec
-                 m25p20-nonjedec
-                 m25p40-nonjedec
-                 m25p80-nonjedec
                  m25p16-nonjedec
+                 m25p20-nonjedec
                  m25p32-nonjedec
+                 m25p40-nonjedec
                  m25p64-nonjedec
+                 m25p80-nonjedec
                  m25p128-nonjedec
 
 - reg : Chip-Select number
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
