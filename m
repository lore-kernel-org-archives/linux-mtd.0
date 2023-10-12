Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351E7CDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 00:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2vLsA+wH9bTaynC4R15kTua70cbRiLcFPKqEoo965OU=; b=Gtu
	kSJkI1WcxT9oBHcGcL/4fUOitduCxDt73YRyFbi/APpTt0Zofkyrewo/UihufQ/j2YOqnlDdGTdmz
	kTqCfSe0+fWuBfa8aslt8XYt8nvYIct3Uzij36dbcGynDjOGme8gsRWG5rZqa91DVb1qpAbo3vOoQ
	UN+cRQ9JX6pKsOjWvsjk43P5cjmfANCeinhW81vPcU+uizPDnFRmSIo4j5iAoUMJBWYDJy8AbHsj1
	JmhXkwvsQSU7LpEglgmwr1Ma25nxqCXshFoqgFQCRxMKrhnW64qO+HoU5roJGbK17gMXDMM06pXlM
	c9R176oIzm02Z85gqBtKxGQRVhE/dNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjlf-00H4OW-0j;
	Thu, 12 Oct 2023 00:41:35 +0000
Received: from mout.gmx.com ([74.208.4.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjlc-00H4My-1h
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 00:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1697071270; x=1697676070; i=dregan@mail.com;
 bh=0Y/3hPNbjKKk3wk13uYG2R+4pnG8R5RcLVXqXLtiHnU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=cai3cUM6x90FbQwntoaqLbDNUorGjHIkVyOmYDXiQR+RhpO9jTiM6qofFalW5jf7uM8x70C7JPd
 FwsQna/N42KL4EUTIkdKprFUv5J0B93F1uHJrhAUktnnDDKWS4KEaQ8RD9Us/sZ3czEKg4MVT7rMq
 DD1F7VzEXwyzfoBBAYnpF5JXWccQ9/U1w+lTJoxLBLZ2T/Rk03MWEhpPXMoOLZSKcuPRvYUN6A2oN
 Losu+5afRq+jwCAzB4yxg+LdLn0HjnNrgV0sA+EaX55TjTTOPsMB2CeDFarh7SsaFOnw1Px/EAAyX
 6lNSCDr7bk4BeRDWo7TpvxVXxdRlXMUHRELg==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [184.189.122.102] ([184.189.122.102]) by web-mail.mail.com
 (3c-app-mailcom-lxa05.server.lan [10.76.45.6]) (via HTTP); Thu, 12 Oct 2023
 02:41:10 +0200
MIME-Version: 1.0
Message-ID: <trinity-85483437-5787-42fc-8cf6-157a3f7324dc-1697071270308@3c-app-mailcom-lxa05>
From: dregan@mail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, dregan@mail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: [PATCH v2 2/4] mtd: rawnand: NAND controller write protect
Date: Thu, 12 Oct 2023 02:41:10 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:GYOz8EQUz4AEJCVqUTCvaMp7xsXttcqysPPPaXS+3aF3QM/aJyeqometxNwZupnZ6NG3T
 lQA1+MO2L9lmxDT1IKTeJueEBD+CCgZ1T6F6Z545YdHOvrD1BIDEepqDhnSJjBDsNHK0W1UMPqO/
 iC28ihApJ+qQyUDFW4cDEzU9jKgqhBk/bteJ2w7iX56QI3KgQDV+do2liRpc4dm7TbzlBET9cBeL
 nzxwZjecNWpDUxVMI522aNgx/Woi85Tm2CQG+Wh25gfD8cohaU/7T8ubzEi1occT7bLWRb2KKliP
 KA=
UI-OutboundReport: notjunk:1;M01:P0:6zQ+OOr44g4=;Lare1TkfFFPS9lEq6hpJpK/EPwu
 hWG+WHXJVgBhkWJKzxH43IuBv/zmTmkOr5s6QY0+yrNP28NBKGn823rP5+3aKic1M8GMY+A0k
 JvIlcaW1sT1YpANT+tFb/sOyXSW5jGn0pJo0dXhyCGUNTT5qf2nSWZmSyZgZmzsm7KJzB7J4V
 iKzgxRX3O4GtG7yWZQvExuhlKlMp0gnvJphCBjgmQarcxb5QF2pyxQSDksLmHOlKWtdt1SWVZ
 6u9ODmeP8yFYhJm+Q31x0tPiUqf3TDrA5phZsxZMw1kOJUV3t2nqRbisebUgpKnCR3D+qX6HC
 jzB10ucv/TnOVzUaw71luHlGNYnEhqlOKc77tF2eYHmtbDnaxZR5+xrlyoEg+a+8b3ofntWi3
 IRRhPmKNydD5Myjr/EBSLEAVJPab58uz3EF3JNt23OQHHqTnR+3NvjpE9p7Q3JsP7INEUEk4r
 6AhrU55e24e1IgCpHhRFZ+rx1WRCfidZ27YV7p2Tw4fTVRgV8UK/nI7E5rkGtQU02DLXo1xzp
 OhrIxQNmH1ZSk3cEYiZJSdPdp+nEbNWX5g8UnzgZwLr+APonmu+qEu+vAyy6Q6SeHDaU1GPrU
 P0eDFqy/RrXTvtOBQSlaWqyTGMq2pFOivoS3yvGDtrnYH7dgZc1VWPk6Z8m8zHbB8kISfkHrR
 EXtnApsbuEKIf6uKLnqKM17LgpRrWFBJzeILGV7oOGMGUBRmMqjQL5bISKjTNVf6M7K8nR1Sx
 iwQvjxMKFipYMs8M7RtvzFcR/FEtwWmgE3O8wmY8ATDBSzhC8bzhH4uVecRWdxoiRpOz4B+RR
 I7o2lceXQFbqbgtGZPI/4ABQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_174132_634921_702CDDB1 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

Allow NAND controller to be responsible for write protect pin
handling during fast path and exec_op destructive operation
when controller_wp flag is set.

Signed-off-by: David Regan <dregan@mail.com>

---

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
index 31aceda8616c..f03b9d7f48b8 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1111,6 +1111,7 @@ struct nand_controller_ops {
  *			the bus without restarting an entire read operation nor
  *			changing the column.
  * @supported_op.cont_read: The controller supports sequential cache reads.
+ * @controller_wp:	controller responsible for NAND write protect.
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
