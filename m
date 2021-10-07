Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B7AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:14:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 755556125F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 755556125F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6SNUg4mzvm7YIvbkhD2oZBP4/lTRqnPyEM7UTEBOytM=; b=evtlH6SfcNF36o
	nZNhVc5FrlHqK6E2F+R41tWvNx53nH++qJD5oe4o8cVOs+T7F93U3+00/0Cd4SACY775/U3Y1jdUA
	j19f3RLRZGbDFZWhBb1poLhDiNnAi0a9k1go0989+u15bhbmLG+3IbVip2J6t9NrcGOC3AVdJF9IN
	iAnTp+uQ2Ba3+ihdKxPuF3NZDSUI7osizwel07C0sY0eR6XwWmlHSZeZxM16Yjb42baagboTxsUvr
	rLDzmfnNh4jwB4o4aw8yEJPEEm0YJoVHhhtJx/Gl2F0arQfJ9gF8aKnVi60c2R8OGohYnqKbbYxWq
	hTmAAgLHzMt1gZ+lZMjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYSHK-00HDPS-LS; Thu, 07 Oct 2021 12:13:38 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYSDH-00HC1O-Bh
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 12:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633608567; x=1665144567;
 h=from:to:cc:subject:date:message-id;
 bh=VI9Tcp4Ze00HFFj8ItEOXjKUFSXQBnT6Yos7WuUkTbY=;
 b=H9TdhNo+glNitSVOQgiatDXj5WelBwHtASVFYnowxRMm2MEL1gvLm0qx
 b/CtvvRvz1GegPeLcOxg41Fb7JNyS8PZ1otgXLrii3dFC2cmbz6Yjfw0j
 u7WyjIO27SakMtZiLHl2SMnGVhTp2KR9RU4v3QE/RXbebotlCipy+C757
 wYezQ7riQk3J0/d1AE7vc8kJg6x4opP/ns7X3soGOPqz+S12rCOgeYM9a
 +N1l04BkAP2U6qoOxHcoPUas4ZK17rUBZHA7jYvXLkEAtiz+3X3GNT7X8
 /Ai/4Phppm4YpduX+fCgtZF5BLEnDXeh42JYE5dvx4ML8LIXP9p7BLczj Q==;
X-IronPort-AV: E=Sophos;i="5.85,354,1624312800"; d="scan'208";a="19920236"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 07 Oct 2021 14:09:25 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 07 Oct 2021 14:09:25 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 07 Oct 2021 14:09:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633608565; x=1665144565;
 h=from:to:cc:subject:date:message-id;
 bh=VI9Tcp4Ze00HFFj8ItEOXjKUFSXQBnT6Yos7WuUkTbY=;
 b=CzWoZOWDApOfsKfHLh9Q5UtAUT7nWAE9kcfDv6plMYpsSmPnvBAAZCOZ
 MvVic/DtXpadPDzmLmuRwy1ZDFHdJRbwYoIntHwWJj11e/ti7coDAWLKR
 2Mj46pElk6fysTzKS+0HV7duCN0s2t4lE/T40OLEZt7jRr4aZ8EvcSA6l
 r+D+vzMnyjemMu96sahu4Rrm37zu1RW0lh6AxTr4imspmiqPH4hTbWQ/+
 dkAB1/OnD9Xtda1b43UEddohYYDEv6CI3wEUKCwEoLJYAu7oHFgFaY94b
 u3VNtWhreP8NWhUoJKor0XmDg0Tsaj/u9nFG+2Y4GHiquzrlzqh5SQN3E g==;
X-IronPort-AV: E=Sophos;i="5.85,354,1624312800"; d="scan'208";a="19920235"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 07 Oct 2021 14:09:25 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.121.48.12])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id DABEE280065;
 Thu,  7 Oct 2021 14:09:24 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v2 1/2] mtd: spi-nor: micron-st: make mt25ql02g/mt25qu02g
 match more specific, add 4B opcodes
Date: Thu,  7 Oct 2021 14:08:11 +0200
Message-Id: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_050927_781103_269A9E29 
X-CRM114-Status: GOOD (  13.69  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Change the mt25ql02g/mt25qu02g entries to include SPI_NOR_4B_OPCODES. In
addition, the SPI_NOR_DUAL_READ flag is added to mt25ql02g; this seems
to have been an accidental omission, as mt25ql02g and mt25qu02g should
support the same features.

In addition, the entries are made more specific by matching on the mt25q
extended ID, like it is already done for the smaller n25q derivatives.
It is unclear whether n25q derivatives with 2Gbit exist that do not
support 4B opcodes (like it is the case for sizes up to 512MBit), so we
do not have a match for such variants anymore (as we wouldn't even know
how to name such hypothetical models).

The changes were tested with a mt25qu01g, which should support the same
features as the mt25ql02g/mt25qu02g.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2:
- add extended ID match
- add back NO_CHIP_ERASE

 drivers/mtd/spi-nor/micron-st.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c224e59820a1..a000a0790ecd 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -180,12 +180,14 @@ static const struct flash_info st_parts[] = {
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      NO_CHIP_ERASE) },
-	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
-			      NO_CHIP_ERASE) },
-	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096,
-			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
+	{ "mt25ql02g",   INFO6(0x20ba22, 0x104400, 64 * 1024, 4096,
+			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			       NO_CHIP_ERASE) },
+	{ "mt25qu02g",   INFO6(0x20bb22, 0x104400, 64 * 1024, 4096,
+			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			       NO_CHIP_ERASE) },
 
 	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
 	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
