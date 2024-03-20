Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2223C54E67
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 22:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BSRAiMENSpb/fb3AIG/9zRPDHeOxdOep1HjsIi9Je84=; b=hNPBgwKhItuGnQ
	2uWzLYQ+DuEWsvM9sT/LgYuZhL40bOertgGdxwEmWBpQqS2tpkcIQy6lrwEsgn1u83/nvjgrWilYd
	SeAvPxJRkEx32LZy2CDRMXijEGJ7Na9HdYvHqwKA0wmG2OxFDBdPGd9rzd7AfQ2oQOhyGNM9aNyY0
	ZmJMb+NRJjXLepDX0DVJDeTo9mxR/woX51tz5AE3Irtt6W8VkGNRx4SuXpEzQLluB8M+pZ0d6LX5H
	Ztg3Qm4JlrnsVnYTHMzSJfqL4dWXiDyBLQA3/1Q0PIpKNPGSp6hdOprJzaLTX3pexnomVMwiNbr1/
	/sUuaCv8CeQuvuDgccZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn4P1-000000017fT-1tfb;
	Wed, 20 Mar 2024 22:27:19 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn4Oy-000000017ef-2jsu
	for linux-mtd@lists.infradead.org;
	Wed, 20 Mar 2024 22:27:17 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2C1A3C0000F1;
	Wed, 20 Mar 2024 15:27:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2C1A3C0000F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1710973631;
	bh=FrDJYOWwf0Ic6PWmCehY4eGVyxmoLrR6fV2hXhRI9/Q=;
	h=From:To:Cc:Subject:Date:From;
	b=ER8oSDVyI4SJemYdbsgNDwpfuVSQeWV7O2fsjUkexdgoUpfAYVJF0CsaG8zXRVHWv
	 yCJ9ZAjuaYfFtblXku6S7QQS0lDWMKy7VFlC7wGmYO/ldblsPv0kekiCYfXob+yNZG
	 qAAgxKj9kMvY0ep7wc4FbfKjEOwcJQ/l3QM3wXQc=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 6420918041CAC4;
	Wed, 20 Mar 2024 15:27:09 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	joel.peshkin@broadcom.com,
	f.fainelli@gmail.com,
	miquel.raynal@bootlin.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	kursad.oney@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	David Regan <dregan@broadcom.com>
Subject: [PATCH] mtd: rawnand: brcmnand: Fix data access violation for STB chip
Date: Wed, 20 Mar 2024 15:26:22 -0700
Message-Id: <20240320222623.35604-1-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_152716_882397_0B94C0E6 
X-CRM114-Status: GOOD (  16.95  )
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

Florian reported the following kernel NULL pointer dereference issue on
a BCM7250 board:
[    2.829744] Unable to handle kernel NULL pointer dereference at virtual address 0000000c when read
[    2.838740] [0000000c] *pgd=80000000004003, *pmd=00000000
[    2.844178] Internal error: Oops: 206 [#1] SMP ARM
[    2.848990] Modules linked in:
[    2.852061] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.8.0-next-20240305-gd95fcdf4961d #66
[    2.860436] Hardware name: Broadcom STB (Flattened Device Tree)
[    2.866371] PC is at brcmnand_read_by_pio+0x180/0x278
[    2.871449] LR is at __wait_for_common+0x9c/0x1b0
[    2.876178] pc : [<c094b6cc>]    lr : [<c0e66310>]    psr: 60000053
[    2.882460] sp : f0811a80  ip : 00000012  fp : 00000000
[    2.887699] r10: 00000000  r9 : 00000000  r8 : c3790000
[    2.892936] r7 : 00000000  r6 : 00000000  r5 : c35db440  r4 : ffe00000
[    2.899479] r3 : f15cb814  r2 : 00000000  r1 : 00000000  r0 : 00000000

The issue only happens when dma mode is disabled or not supported on STB
chip. The pio mode transfer calls brcmnand_read_data_bus function which
dereferences ctrl->soc->read_data_bus. But the soc member in STB chip is
NULL hence triggers the access violation. The function needs to check
the soc pointer first.

Fixes: 546e42599120 ("mtd: rawnand: brcmnand: Add BCMBCA read data bus interface")

Reported-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: William Zhang <william.zhang@broadcom.com>

---

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index a8d12c71f987..1b2ec0fec60c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -857,7 +857,7 @@ static inline void brcmnand_read_data_bus(struct brcmnand_controller *ctrl,
 	struct brcmnand_soc *soc = ctrl->soc;
 	int i;
 
-	if (soc->read_data_bus) {
+	if (soc && soc->read_data_bus) {
 		soc->read_data_bus(soc, flash_cache, buffer, fc_words);
 	} else {
 		for (i = 0; i < fc_words; i++)
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
