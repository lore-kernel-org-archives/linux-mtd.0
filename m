Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCDFC7618B
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 07:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1426217D4
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 07:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GdLxQJgq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1426217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Oh1AJ+DVZON+6yEJ7eA4rAQtvXaGxhFywdOgyxQt1T0=; b=GdLxQJgqh3Qudz
	GJAgOaPzbCLk5TuhpColv89SoUZlMtyvsp46w+L/OsG5xqhBXukANaJ3YtKebJxREEMmbY2mRUR3N
	6brdUnZ7kyYb/A25S8qAsatc+PgqFUSXhrefxpdkDn+jz9lHIV6PMnvSmYE48FavE2/+q66h7abUq
	itcricLly0syCacm0+01urGeM35DTyp+QgfrF+JhzTlmBLFU1gP5XDnQI4HVTYx0JHGMYsUvPZ21g
	iOMwh66/BCLF6Omk/1Ag2v2NI6MJHc514W+b5IV3cSk9FsZC0o2Pdlhs2LtvOrCgqkitTbcUDnW7L
	ydWtBUs7U4E0NmIdLhVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hquuI-000776-Dp; Fri, 26 Jul 2019 07:44:50 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hquuF-00076f-FG
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 07:44:48 +0000
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.lab.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1hquuA-0007C9-Jg; Fri, 26 Jul 2019 09:44:42 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1hquuA-0005e1-6u; Fri, 26 Jul 2019 09:44:42 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: boris.brezillon@bootlin.com,
	miquel.raynal@bootlin.com
Subject: [PATCH] mtd: rawnand: micron: handle "ecc off" devices correctly
Date: Fri, 26 Jul 2019 09:44:34 +0200
Message-Id: <20190726074434.21627-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_004447_506817_CE0CB45C 
X-CRM114-Status: GOOD (  14.56  )
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
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some devices don't support ecc "official". By "official" I mean that the
feature can be set trough the "SET FEATURE (EFh)" command but isn't
reported to the "READ ID Parameter Tables". Because the "ECC Field"
still says that it is disabled. This is applicable at least
for the MT29F2G08ABAGA and MT29F2G08ABBGA devices. Even worse the
datasheet describes the ECC feature in chapter "ECC Protection".

Currently the driver checks the "READ ID Parameter" field directly after
we enabled the feature. If the check fails we return immediately but
leave the ECC on. Now all future read/program cycles goes trough the ecc
and the host nfc gets confused and reports ECC errors.

To address this in a common way we need to turn off the ECC directly
after reading the "READ ID Parameter" and before checking the
"ECC status".

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/mtd/nand/raw/nand_micron.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 1622d3145587..fb199ad2f1a6 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -390,6 +390,14 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	    (chip->id.data[4] & MICRON_ID_INTERNAL_ECC_MASK) != 0x2)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
+	/*
+	 * It seems that there are devices which do not support ECC official.
+	 * At least the MT29F2G08ABAGA / MT29F2G08ABBGA devices supports
+	 * enabling the ECC feature but don't reflect that to the READ_ID table.
+	 * So we have to guarantee that we disable the ECC feature directly
+	 * after we did the READ_ID table command. Later we can evaluate the
+	 * ECC_ENABLE support.
+	 */
 	ret = micron_nand_on_die_ecc_setup(chip, true);
 	if (ret)
 		return MICRON_ON_DIE_UNSUPPORTED;
@@ -398,13 +406,13 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
 	if (ret)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
-	if (!(id[4] & MICRON_ID_ECC_ENABLED))
-		return MICRON_ON_DIE_UNSUPPORTED;
-
 	ret = micron_nand_on_die_ecc_setup(chip, false);
 	if (ret)
 		return MICRON_ON_DIE_UNSUPPORTED;
 
+	if (!(id[4] & MICRON_ID_ECC_ENABLED))
+		return MICRON_ON_DIE_UNSUPPORTED;
+
 	ret = nand_readid_op(chip, 0, id, sizeof(id));
 	if (ret)
 		return MICRON_ON_DIE_UNSUPPORTED;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
