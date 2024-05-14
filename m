Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F537C04FFE
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 13:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=btVyY4N+khOHDV4LTKEFhWSgzGunDNCRuMp/qg7MzrU=; b=YMY5zklgxkp/Xw
	nt2gZD+lI5qHV0TbB+SLbcLJOLLt2JcPjMJf3XVYXJ98y+nRT15M3e5SNsFcjN7GoaYkLg0AsJYOk
	veva6HONqziGK9NAWEzBgSrMFXmwJj4cNr17YpilXyjfq0810qvhkE8SHIDkmoMmpSCDptaz/Gjbc
	dCGvALggzxMwSp4XdlVgmBwF5Umy+y9+cybtVa4uaQI2a3rtR+2pYZNlTtu0lMoSxRSo1Oda9DDj6
	AwOX0UeaCMG/7eA6q4rWOfBf6nCD6gb+RCmhXhu2hIl5UjneHA+P1O8+GyOZPAEP5I1bFcbQvRduh
	vmclF75NdmvMhN9HmPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sPc-0000000G4ky-0hAC;
	Tue, 14 May 2024 13:41:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sPZ-0000000G4kB-2ct5
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 13:41:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6sPX-0002ov-DC; Tue, 14 May 2024 15:41:43 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6sPW-001MiW-1J; Tue, 14 May 2024 15:41:42 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6sPV-004PBy-2w;
	Tue, 14 May 2024 15:41:41 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] mtd: rawnand: onfi: read parameter pages in one go
Date: Tue, 14 May 2024 15:41:40 +0200
Message-Id: <20240514134140.1050141-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_064145_692455_43B53AF4 
X-CRM114-Status: GOOD (  15.87  )
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

nand_read_data_op() is not supported by all NAND controllers.
nand_change_read_column_op() is not supported or at least is hard to
support by NAND controllers that use a different page layout than
expected by the NAND core. Instead of relying on these functions
just read the three parameter pages in one go.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/nand_onfi.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 861975e44b552..df1750692404d 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -148,7 +148,6 @@ int nand_onfi_detect(struct nand_chip *chip)
 	struct nand_memory_organization *memorg;
 	struct nand_onfi_params *p = NULL, *pbuf;
 	struct onfi_params *onfi;
-	bool use_datain = false;
 	int onfi_version = 0;
 	char id[4];
 	int i, ret, val;
@@ -166,25 +165,11 @@ int nand_onfi_detect(struct nand_chip *chip)
 	if (!pbuf)
 		return -ENOMEM;
 
-	if (!nand_has_exec_op(chip) || chip->controller->supported_op.data_only_read)
-		use_datain = true;
+	ret = nand_read_param_page_op(chip, 0, pbuf, sizeof(*pbuf) * ONFI_PARAM_PAGES);
+	if (ret)
+		return ret;
 
 	for (i = 0; i < ONFI_PARAM_PAGES; i++) {
-		if (!i)
-			ret = nand_read_param_page_op(chip, 0, &pbuf[i],
-						      sizeof(*pbuf));
-		else if (use_datain)
-			ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf),
-						true, false);
-		else
-			ret = nand_change_read_column_op(chip, sizeof(*pbuf) * i,
-							 &pbuf[i], sizeof(*pbuf),
-							 true);
-		if (ret) {
-			ret = 0;
-			goto free_onfi_param_page;
-		}
-
 		crc = onfi_crc16(ONFI_CRC_BASE, (u8 *)&pbuf[i], 254);
 		if (crc == le16_to_cpu(pbuf[i].crc)) {
 			p = &pbuf[i];
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
