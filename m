Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBE8C0219E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 14:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSrN6cEaxkDacOxADEDAOvWC5A+LgJizl1gXLG1S51U=; b=3KqVSAcEMdSgHa
	2gBRA54TUSMt0cydgTD81E4K5yayIy6mQePhkFAlmMR4fqUqNALHjcOR9m9z8WNG51cWhPZPsmboX
	3kXRM2CxIbscihUu1wqoNutPRAl84/ln6hat9T5PJdDMXRo4v5EYTipcn4QYgODqEbcFvOP24Oc9Q
	i86bN3Ppms+Faz0s0fY96Vv850oN2pHpzoLslgQsLlW0cwJhI2ldNl3ul9Pvl6pufHmB7D0LAaWwn
	XsR3vBTsD3mjUr4rss9yNxX/7wOe3to59aCtR4TMCq+Bs76xJw8CuRmhnxpUdQLIkSqHVQ8jd/MB3
	A0e6Mnn/KqXpBO4zExmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUs6-000000008sy-0aEe;
	Mon, 10 Feb 2025 14:34:50 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUs2-000000008p2-1WND
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 14:34:48 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 77F99100003;
	Mon, 10 Feb 2025 17:34:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 77F99100003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1739198080;
	bh=/sohbn88DHkwRFO91ZS/sTBdlLM4IMqqcULc8mWWTkE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ZkbaqtfO050ESTqYto8qGfejqEPBSDyXrKZ2Uc3AdYz+bnehAOkySdJWitzLBYK7v
	 0T3J5LZXDN6y/w2XjPHYa88Fm1h0e1KlCyYNOggVVflRFWncrDYFfMIjqHp6VvkEM9
	 /X5Ukg3kfCiQSZmF2AOCWBRNAuSIGKomPVjNoC/r69KHirFNO+9yhtXd6h7a9wrt7O
	 0eENWUKR2gy+MzzUUXX8AgphYSe7n4RQOa4chuqy9kYZ3ok0KFZk0j+GLZWIj5sEAH
	 +hmSImt5PF7PVXD12+4j3DxFyLX35izS1bmA3b8Uq5LTVoYjaJ9vFGB2fsAJW8F74t
	 d5ImPrR39RHCw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 10 Feb 2025 17:34:40 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Pratyush Yadav <pratyush@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v5 1/6] mtd: spinand: make spinand_{read,write}_page global
Date: Mon, 10 Feb 2025 17:34:13 +0300
Message-ID: <20250210143429.286803-2-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
References: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.130.205]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190904 [Feb 10 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/02/10 08:53:00 #27153032
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_063447_058362_7FAF42CA 
X-CRM114-Status: GOOD (  12.98  )
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

Change these functions from static to global so that to use them later
in OTP operations. Since reading OTP pages is no different from reading
pages from the main area.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/core.c | 24 ++++++++++++++++++++----
 include/linux/mtd/spinand.h |  6 ++++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index da4713692674..2b6ffd6fc90d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -604,8 +604,16 @@ static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
 	return spinand_write_reg_op(spinand, REG_BLOCK_LOCK, lock);
 }
 
-static int spinand_read_page(struct spinand_device *spinand,
-			     const struct nand_page_io_req *req)
+/**
+ * spinand_read_page() - Read a page
+ * @spinand: the spinand device
+ * @req: the I/O request
+ *
+ * Return: 0 or a positive number of bitflips corrected on success.
+ * A negative error code otherwise.
+ */
+int spinand_read_page(struct spinand_device *spinand,
+		      const struct nand_page_io_req *req)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 status;
@@ -635,8 +643,16 @@ static int spinand_read_page(struct spinand_device *spinand,
 	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);
 }
 
-static int spinand_write_page(struct spinand_device *spinand,
-			      const struct nand_page_io_req *req)
+/**
+ * spinand_write_page() - Write a page
+ * @spinand: the spinand device
+ * @req: the I/O request
+ *
+ * Return: 0 or a positive number of bitflips corrected on success.
+ * A negative error code otherwise.
+ */
+int spinand_write_page(struct spinand_device *spinand,
+		       const struct nand_page_io_req *req)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 status;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 0da8a1c7740e..34ddd2441fc9 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -588,4 +588,10 @@ int spinand_upd_cfg(struct spinand_device *spinand, u8 mask, u8 val);
 int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
 
+int spinand_read_page(struct spinand_device *spinand,
+		      const struct nand_page_io_req *req);
+
+int spinand_write_page(struct spinand_device *spinand,
+		       const struct nand_page_io_req *req);
+
 #endif /* __LINUX_MTD_SPINAND_H */
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
