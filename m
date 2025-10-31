Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23388CCF9EB
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 05:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eXXPw8gXq+e4YcFzDCQeTsNDfZvhHiDBwVFwsvtfEIw=; b=Tm41L8QpySVNMM
	SzX8nlcmmaZFTXJUUWKgvjRMoW7BgJXtbhYU75oyGgM424UFSQDOU8+u5FPn2b+GZ8n6XVD1G1TME
	w+Ilg+cpixL+DKb4oUDap4Qgklfa0kzqm4GXUnAENkDj7d4u12NLoiypSqhLgwLq2D6/M2C7qbti5
	tOhkOzB6WcHH7fsQJClPq0eu/yzEIcju4StqPi7l9ij1U3Fxgt/46jWwDhuHnrSTBveTsIbjFtyzp
	PrIx7fIuzCCLAbK2GDzArs3mNmu3XLK+pjdfvc8ID+2qUV/JqCGzwxniR5x14DdhxQZmoI7mZs7GZ
	P22uSxh/E030gI/phhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEht3-00000005Q9B-3i3o;
	Fri, 31 Oct 2025 05:41:22 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEht1-00000005Q8w-1Cmn;
	Fri, 31 Oct 2025 05:41:19 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spear_smi: fix kernel-doc warnings <linux/mtd/spear_smi.h>
Date: Thu, 30 Oct 2025 22:41:18 -0700
Message-ID: <20251031054118.1402280-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
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

Correct most kernel-doc warnings in include/linux/mtd/spear_smi.h
by adding a leading '@' to the description of struct members.
Add a new description for the missing @np member.

Warning: spear_smi.h:48 struct member 'name' not described
 in 'spear_smi_flash_info'
Warning: spear_smi.h:48 struct member 'mem_base' not described
 in 'spear_smi_flash_info'
Warning: spear_smi.h:48 struct member 'size' not described
 in 'spear_smi_flash_info'
Warning: spear_smi.h:48 struct member 'partitions' not described
 in 'spear_smi_flash_info'
Warning: spear_smi.h:48 struct member 'nr_partitions' not described
 in 'spear_smi_flash_info'
Warning: spear_smi.h:48 struct member 'fast_mode' not described
 in 'spear_smi_flash_info'
Warning: spear_smi.h:62 struct member 'clk_rate' not described
 in 'spear_smi_plat_data'
Warning: spear_smi.h:62 struct member 'num_flashes' not described
 in 'spear_smi_plat_data'
Warning: spear_smi.h:62 struct member 'board_flash_info' not described
 in 'spear_smi_plat_data'
Warning: spear_smi.h:62 struct member 'np' not described
 in 'spear_smi_plat_data'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 include/linux/mtd/spear_smi.h |   19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

--- linux-next-20251029.orig/include/linux/mtd/spear_smi.h
+++ linux-next-20251029/include/linux/mtd/spear_smi.h
@@ -31,12 +31,12 @@
  * struct spear_smi_flash_info - platform structure for passing flash
  * information
  *
- * name: name of the serial nor flash for identification
- * mem_base: the memory base on which the flash is mapped
- * size: size of the flash in bytes
- * partitions: parition details
- * nr_partitions: number of partitions
- * fast_mode: whether flash supports fast mode
+ * @name: name of the serial nor flash for identification
+ * @mem_base: the memory base on which the flash is mapped
+ * @size: size of the flash in bytes
+ * @partitions: parition details
+ * @nr_partitions: number of partitions
+ * @fast_mode: whether flash supports fast mode
  */
 
 struct spear_smi_flash_info {
@@ -51,9 +51,10 @@ struct spear_smi_flash_info {
 /**
  * struct spear_smi_plat_data - platform structure for configuring smi
  *
- * clk_rate: clk rate at which SMI must operate
- * num_flashes: number of flashes present on board
- * board_flash_info: specific details of each flash present on board
+ * @clk_rate: clk rate at which SMI must operate
+ * @num_flashes: number of flashes present on board
+ * @board_flash_info: specific details of each flash present on board
+ * @np: array of DT node pointers for all possible flash chip devices
  */
 struct spear_smi_plat_data {
 	unsigned long clk_rate;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
