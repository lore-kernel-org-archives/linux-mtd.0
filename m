Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB46CDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 00:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=AsjjeLQ4A/a71luJMyIpx/HG8pCYv+kMzdeSKQY0Blo=; b=2oD
	MC1RSFe2g9kbvPraAbAGIE1xC/ynosWAKepQjpzsML/96bW5IOw/aGIV0eFS29S9In3fuX18+o7hn
	T4x2czd2LXczfLjmfZEyLtClQ7ES24hBCROXkLx+RuS6KSFyD6nE6i9L/Ju6tVBHCmuWUnB3AUZVv
	NEgmh3gYyvQLGAcPi+s5en0zXiARtERJyFyqNFd50BEQYpTc+ClW7aerS+7PSXttGZsjHMGV3ZIO0
	l+784suxvpd++SMMIcL3ESWr+ec6NGcY1kEhMj6gX7KPC+ZRexXblhvwLbDR2y+Vc7C9h9GT/ugkJ
	hbTgG7XCNuC0HCwUJir3ZWPDUNJmFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjlB-00H4Ke-2l;
	Thu, 12 Oct 2023 00:41:05 +0000
Received: from mout.gmx.com ([74.208.4.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqjl7-00H4K4-2G
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 00:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1697071235; x=1697676035; i=dregan@mail.com;
 bh=tVy/kGtJ/uIqAIVCV58x4wlSGg1K/KAjymzuRbf3d5A=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=g0ojDQiT0S7H/4554xmzjt8S5nO5HbInGNpFVhH2seYVZc/9GFVemITlO7sUPQ5vWAJtgn0pMbO
 LWi8nqdLNMI80LVlYBRyDaRbxGCjslEuNBx4z+2DRiXBtylSrM9e0A+2r7g+ppmAAQYv4xjfnkP0+
 6CyXQSSLOOeuBEjZRC0GGZl2JTtru3hTFq6w3rgwLytS+hDwlNlxyyUz8kvHKbdk9Uyf+1BAf73L3
 +tZtpi0Ngyt68kj9FBikNM0k+bgrsyCFPRb352FSne3o+UbgxYD0ExyNiXiktaarAxyR8nJYm0eT9
 Ja7OwFCp0vmUs8z2EUpsRxmlNaxOFy9F/KUA==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [184.189.122.102] ([184.189.122.102]) by web-mail.mail.com
 (3c-app-mailcom-lxa05.server.lan [10.76.45.6]) (via HTTP); Thu, 12 Oct 2023
 02:40:35 +0200
MIME-Version: 1.0
Message-ID: <trinity-d4b16b4a-e223-4daf-8a3e-4aaa7fc6c9cb-1697071235519@3c-app-mailcom-lxa05>
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
Subject: [PATCH v2 1/4] mtd: rawnand: Add destructive operation
Date: Thu, 12 Oct 2023 02:40:35 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:XdMw7puGtrEAKhoXvMtWkRonwEaxXE3NWJdjKsY2NXdOGJCHqL0qxJ6WnBxKf6S0plDMG
 qNu4+ByJskwQuNF6IEjR2y06Bss+HtTyI760bF++SmFnV4G8x4XponEyTFiLJAghL3QrXEVOfVsY
 AXQ3FbiqsmyGwX/xOBgoonb8LU6S4RPiBtI1nwEJzscP2xtZW1jS6CX46GiKNtLUQzimdQXO/ncA
 UAiYomLdJDbKy1bKnqVduRqAiQ++fWp7hcUTPwyt1CeNU13zHQ483SbwQ+3iZbgbKkRZMG5/YX3I
 iA=
UI-OutboundReport: notjunk:1;M01:P0:h5ri29gsTWM=;BTy3LruK3CpCRbDL80Dq8ec180w
 rp4NFFvM0WVW8zM+N7yiMEm+qEz1u8rQPbo+XE6tbmViEYUq55HB76SdG1vRmulvhTFpnBML/
 wB4CDWfEBEuHGu+KZ8D8bDGOdr5XEjJy9yUM/LRb6aA121GBQlg4IFoIwowvcftv/vBT7jhXw
 KJl4+0blpMtK2KMFZRyEMYuv3hATLTlHcXFUpcCTxWi4oYWswyY3hYfEOmPycl/tlmr2YIkrR
 yV6k/0klo11V55cCa2VHNtZvGFZqkLBM9QxiQALeGpvL+Dmn/wlpdTRKgiFEjBx0ruWW404zd
 lk2k2ADnAy52/CyjmSacUWL+8wQfTZg/BzFT7PDR/F6dsUB01ZC7oKeGNZRB1kp8wpnaJT1ct
 JvMN80Iw5zXO2Xkhn7ZA0Kwle+fLdXuGRaUdLbFj5dkoG0A3QVjHVrSSHjtH8BlGc+bj6a3DP
 WyTaQwJPEYqE4DZu1NU0HHYCpGv/u/y+Yatq53+pq5ugzJ2aVLnLl0oy+yp2bWDTPUj15fDiF
 8DJhwG4Pw/08WXEAMwUlYizU1a4FNOG2HX/a1Aj841yt/D2J2MAGg4lUUirWsEtZ3yq+QAeva
 7iH3UD6bVwHtryvfz5akTU0wgqNS1GADVDtlLPxqr0h+pobBF9nus7HS30rYci669Rt2iylSU
 lBVgXfGe/ClB0GU7MiUw9NJSzeuqpLkU1BM3UXR8SnWQX6JO3mlyiTGCPiHHiBEaKJFZe3X+D
 aHw0qXC+pyWW9lgsm7p28yFCc7tvPKOpkvxO+3mwcWUpbFFv9OKZar8U2i7hv+snIazUZqFaI
 nmWFWAzLOIy4dK81ab2g0Ozw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_174101_831808_2D06AA32 
X-CRM114-Status: UNSURE (   9.62  )
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

Erase and program operations need the write protect (wp) pin to be
de-asserted to take effect. Add the concept of destructive
operation and pass the information to exec_op() so controllers know
when they should de-assert this pin without having to decode
the command opcode. Created by Boris Brezillon.

https://github.com/bbrezillon/linux/commit/e612e1f2c69a33ac5f2c91d13669f0f172d58717

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: David Regan <dregan@mail.com>

---

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
