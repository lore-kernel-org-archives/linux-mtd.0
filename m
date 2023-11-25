Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40AAC61DF4
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Nov 2023 01:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpqR89t5U5uELMT6VXijN+6UUGPbq38tHVUT8eiBmiQ=; b=nHN2M1+tH7Naba
	d6fnXsJpV3EIJaeiCxTvAg4mIpG4yew/OBdz8/aYAEXKx1f67rVNzQznP8dRsyyGWnYsB3arVIJ/B
	jZ7DaeBhDkw07BxknDpbVGlg5ZF8+ueEJpiaVVhOZ7SsbKDOtBlMfxapLzS9mnyPpyZbY6ezs5GJW
	ORhW8mgFSWmCI65Xtboflaln2jWmK+WzV4mBz1LdpgCfadJnC5WiJV7ewSNpe5l2afWaqGmxYTqmX
	TUJqV07xNpBQ9UswcLzvu+Vd3V4x0FvBig5keYzVOi0oNuKbLsTy5ALzj0lq59kZFYIVXCq3LoBhV
	OtNPv0tFobPoWGHWMIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6hQ0-008LAX-3D;
	Sat, 25 Nov 2023 01:25:12 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6hPy-008L9Z-0s
	for linux-mtd@lists.infradead.org;
	Sat, 25 Nov 2023 01:25:11 +0000
Received: from bld-lvn-bcawlan-34.lvn.broadcom.net (bld-lvn-bcawlan-34.lvn.broadcom.net [10.75.138.137])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D881EC0000E3;
	Fri, 24 Nov 2023 17:25:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D881EC0000E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1700875506;
	bh=t0jIslGuygI39duh2X6/Zyxs22iol4D9s5tcwU8c4G8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kqxgm/DOE5n4ZIsOdwq6yBevk9A8gfsyTHsAKV+lva+I6dXQgomAhvNFYNwLXfsPX
	 N2Eq/hsGWcWippIUsARapcI2QN1Kj2Wrt53Jz7n7S4A1Uhqn4+L98qPAAJK5NJD8AD
	 UiniffjoUR2x8aNHlFssFyHCPgkGrOFJ5990pJFw=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.75.138.105])
	by bld-lvn-bcawlan-34.lvn.broadcom.net (Postfix) with ESMTPSA id 90E6118728D;
	Fri, 24 Nov 2023 17:25:06 -0800 (PST)
From: dregan@broadcom.com
To: dregan@broadcom.com,
	miquel.raynal@bootlin.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-mtd@lists.infradead.org,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	frieder.schrempf@kontron.de,
	linux-kernel@vger.kernel.org,
	vigneshr@ti.com,
	richard@nod.at,
	bbrezillon@kernel.org,
	kdasu.kdev@gmail.com,
	JaimeLiao <jaimeliao.tw@gmail.com>,
	Adam Borowski <kilobyte@angband.pl>
Subject: [PATCH v5 2/4] mtd: rawnand: NAND controller write protect
Date: Fri, 24 Nov 2023 17:24:36 -0800
Message-Id: <20231125012438.15191-2-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231125012438.15191-1-dregan@broadcom.com>
References: <20231125012438.15191-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_172510_376204_24E091A6 
X-CRM114-Status: GOOD (  11.62  )
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

From: David Regan <dregan@broadcom.com>

Allow NAND controller to be responsible for write protect pin
handling during fast path and exec_op destructive operation
when controller_wp flag is set.

Signed-off-by: David Regan <dregan@broadcom.com>
---
Changes in v5: none

Changes in v4: none

Changes in v3: update comments

Changes in v2: none
---
 drivers/mtd/nand/raw/nand_base.c | 4 ++++
 include/linux/mtd/rawnand.h      | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 47cc2c35153b..38ed0ced5b8e 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -367,6 +367,10 @@ static int nand_check_wp(struct nand_chip *chip)
 	if (chip->options & NAND_BROKEN_XD)
 		return 0;
 
+	/* controller responsible for NAND write protect */
+	if (chip->controller->controller_wp)
+		return 0;
+
 	/* Check the WP bit */
 	ret = nand_status_op(chip, &status);
 	if (ret)
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 31aceda8616c..fcad94aa0515 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1111,6 +1111,7 @@ struct nand_controller_ops {
  *			the bus without restarting an entire read operation nor
  *			changing the column.
  * @supported_op.cont_read: The controller supports sequential cache reads.
+ * @controller_wp:	the controller is in charge of handling the WP pin.
  */
 struct nand_controller {
 	struct mutex lock;
@@ -1119,6 +1120,7 @@ struct nand_controller {
 		unsigned int data_only_read: 1;
 		unsigned int cont_read: 1;
 	} supported_op;
+	bool controller_wp;
 };
 
 static inline void nand_controller_init(struct nand_controller *nfc)
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
