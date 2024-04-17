Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C8AC001CC
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mABijhyFMlMgiP8umEpyDrWNwxFGOsihzJn6Oj+DWrs=; b=2vJrtIcOjIKPA1
	eGWGb7CMCJpWjDkEpefAF1phtaF7f/5ZVzqSV5GtnI5WONyqfAqCXtulsUiRUT0VU/PW62VATm8gT
	WMGxy1tLwNUAYIDYKaVcDsFb1entGgRZyOUBvjxP0hda35J7THdFRAKsPNX5XWwTSquySX0FcA2Q2
	jBmZufOFEFVPaxMXUDGaB8OryxWUJHtFA7kcwPRLOXBxoanfu59PS/kvXvLQ9h8H4MOPcEXLdi/0R
	UnZGjqIpLYEKesXjWtJlvEnLO5VM2frP4XEgsjagfeU7Mzhuv1DZrdbjVBHQLdQQvrXAzLRny0o9K
	VKn2Po98U4F4mVu1JmKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzUK-0000000EzLB-0jLe;
	Wed, 17 Apr 2024 07:13:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzUG-0000000EzHk-0kNU
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 07:13:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rwzUB-0003W6-EK; Wed, 17 Apr 2024 09:13:39 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rwzUA-00Ckap-BH; Wed, 17 Apr 2024 09:13:38 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1rwzUA-004DbZ-0h;
	Wed, 17 Apr 2024 09:13:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 17 Apr 2024 09:13:30 +0200
Subject: [PATCH 3/4] mtd: nand: mxc_nand: support software ECC
MIME-Version: 1.0
Message-Id: <20240417-mtd-nand-mxc-nand-exec-op-v1-3-d12564fe54e9@pengutronix.de>
References: <20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de>
In-Reply-To: <20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713338018; l=1720;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=82DWYcTra6labpUAf+RVk7PAgFqopENzHlzOJ60NyRo=;
 b=RhBSq9gE5i2OhwGVMjEfvV7a2S+BukuzKU9yBwRGjLdUlS8/4EXboS+I15HGJHSgTdBkiv7p5
 ZHUz+GCIQMTC+M/pAeX1zKLHPX1xb0/5pz12twibkoj/eQxC5tQvdVt
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_001344_254901_24CAA310 
X-CRM114-Status: GOOD (  13.16  )
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

To support software ECC we still need the driver provided read_oob,
read_page_raw and write_page_raw ops, so set them unconditionally
no matter which engine_type we use. The OOB layout on the other hand
represents the layout the i.MX ECC hardware uses, so set this only
when NAND_ECC_ENGINE_TYPE_ON_HOST is in use.

With these changes the driver can be used with software BCH ECC which
is useful for NAND chips that require a stronger ECC than the i.MX
hardware supports.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/mxc_nand.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index fc70c65dea268..f44c130dca18d 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1394,15 +1394,16 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
 	chip->ecc.bytes = host->devtype_data->eccbytes;
 	host->eccsize = host->devtype_data->eccsize;
 	chip->ecc.size = 512;
-	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
+
+	chip->ecc.read_oob = mxc_nand_read_oob;
+	chip->ecc.read_page_raw = mxc_nand_read_page_raw;
+	chip->ecc.write_page_raw = mxc_nand_write_page_raw;
 
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
+		mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
 		chip->ecc.read_page = mxc_nand_read_page;
-		chip->ecc.read_page_raw = mxc_nand_read_page_raw;
-		chip->ecc.read_oob = mxc_nand_read_oob;
 		chip->ecc.write_page = mxc_nand_write_page_ecc;
-		chip->ecc.write_page_raw = mxc_nand_write_page_raw;
 		chip->ecc.write_oob = mxc_nand_write_oob;
 		break;
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
