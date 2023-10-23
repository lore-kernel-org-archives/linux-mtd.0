Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F218C25B48
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Oct 2023 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=38umt83QjXstZnhYhDm1HJrfcemcwq6eReqkTIPQdpQ=; b=oLpKtxGNpA3wOP
	FFmXCzzosMErotAPAGCP8UDiVb8r2NASRWLNfnqqYg1WuM4A9zdrlmFXxpNO1HLk3JMBrwtJs113u
	iRydOduuiUNe2fralq4L1KfjtfpwioGgBHIKewuZKFsxRqnHLpSwJH2KWYaX4qlaLDgvv6EhAP+cL
	cJoqoNlT8KLBhDj7t6T9/6lJaU3yfDS3Lf4QbJpaIHh7dI/s81Ew0/0R10XILj+QLmVv8PxtrhgW4
	A5Om2J/gbLxrFl4Mp9ohZ28aWYdIBD/tkOXwdsT1r2Kp3AcvVt0OxXo/ZaWIONCliqCdw1pu/Rgeb
	2ldxSLk8Xiq7W+oUBJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyW5-007u8d-0U;
	Mon, 23 Oct 2023 17:15:01 +0000
Received: from lpdvsmtp09.broadcom.com ([192.19.166.228] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyW1-007u6S-0j
	for linux-mtd@lists.infradead.org;
	Mon, 23 Oct 2023 17:14:59 +0000
Received: from bld-lvn-bcawlan-34.lvn.broadcom.net (bld-lvn-bcawlan-34.lvn.broadcom.net [10.75.138.137])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 331A8C004ECC;
	Mon, 23 Oct 2023 10:14:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 331A8C004ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1698081293;
	bh=a3Dt7syR5zhVX9KM9JkJeWq0PAXWyXzBW8y0XTgiNwU=;
	h=From:To:Subject:Date:From;
	b=DPVYds28HnXXIauHOisI/aEi8mllIbZTggVLW3bpsf3ReN6fF7twHLK+Is+jhgyrB
	 n7mc65MfS1MinLEjZ3vHe9T29KM5ru70EXq+1c27gZYZcccW1R55VFMHL8+234GbSv
	 jd+r3bhvzvUIIcnIkqs9WH41jajCiakGJ+0bR/Y8=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.75.138.105])
	by bld-lvn-bcawlan-34.lvn.broadcom.net (Postfix) with ESMTPSA id 2E2B018728D;
	Mon, 23 Oct 2023 10:14:53 -0700 (PDT)
From: dregan@broadcom.com
To: dregan@broadcom.com,
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
Subject: [PATCH v4 1/4] mtd: rawnand: Add destructive operation
Date: Mon, 23 Oct 2023 10:14:41 -0700
Message-Id: <20231023171444.322311-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_101457_667992_1B2C963A 
X-CRM114-Status: GOOD (  12.10  )
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

From: Boris Brezillon <bbrezillon@kernel.org>

Erase and program operations need the write protect (wp) pin to be
de-asserted to take effect. Add the concept of destructive
operation and pass the information to exec_op() so controllers know
when they should de-assert this pin without having to decode
the command opcode.

Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
Signed-off-by: David Regan <dregan@broadcom.com>
---
Changes in v4: none

Changes in v3: updated comments and email address

Changes in v2: gave credit to Boris Brezillon
---
 drivers/mtd/nand/raw/nand_base.c | 6 ++++--
 include/linux/mtd/rawnand.h      | 9 +++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index d4b55155aeae..47cc2c35153b 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -1494,7 +1494,8 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
 			    NAND_COMMON_TIMING_NS(conf, tWB_max)),
 		NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tPROG_max), 0),
 	};
-	struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+	struct nand_operation op = NAND_DESTRUCTIVE_OPERATION(chip->cur_cs,
+							      instrs);
 	int naddrs = nand_fill_column_cycles(chip, addrs, offset_in_page);
 
 	if (naddrs < 0)
@@ -1917,7 +1918,8 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
 			NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tBERS_max),
 					 0),
 		};
-		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+		struct nand_operation op = NAND_DESTRUCTIVE_OPERATION(chip->cur_cs,
+								      instrs);
 
 		if (chip->options & NAND_ROW_ADDR_3)
 			instrs[1].ctx.addr.naddrs++;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 90a141ba2a5a..31aceda8616c 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1008,6 +1008,7 @@ struct nand_op_parser {
  */
 struct nand_operation {
 	unsigned int cs;
+	bool deassert_wp;
 	const struct nand_op_instr *instrs;
 	unsigned int ninstrs;
 };
@@ -1019,6 +1020,14 @@ struct nand_operation {
 		.ninstrs = ARRAY_SIZE(_instrs),			\
 	}
 
+#define NAND_DESTRUCTIVE_OPERATION(_cs, _instrs)		\
+	{							\
+		.cs = _cs,					\
+		.deassert_wp = true,				\
+		.instrs = _instrs,				\
+		.ninstrs = ARRAY_SIZE(_instrs),			\
+	}
+
 int nand_op_parser_exec_op(struct nand_chip *chip,
 			   const struct nand_op_parser *parser,
 			   const struct nand_operation *op, bool check_only);
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
