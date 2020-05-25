Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9C2C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 17:44:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FA842078B
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 17:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t+DWE0Wn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FA842078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGCJiuFQo995S+6q10HTvtqyh8RQjFH1q3/aEKhrAco=; b=t+DWE0WnzA6c6L
	YXsy6MuO+eI+/XgWUh769CIex3PUi2aOt57mzRsY4TDGv4bi6w8yU6i5nVM6JxG++ZR0K4o8f9e3A
	n+jDexJUwuSg0qZ4uXre0YERgafwYcJiCMwct9doVHlrkQRrjwQWa8bnpxqz52RNZ1vxgtoogKqQI
	lyor2Nh4uhiRFxa1H3pmwbOLM+hmvNjWbqfcC34HtxURogoZ7yEuquMGlN+oqGZs1fC5l0nJCM9Sr
	HBN6Ziir8kTsDyEJlzr1MTsfkgxdIIY/Sm3P4mR12DOROjEMTMZ5dM0i5ViyA2w/IUQNj0Fo35fYT
	faUE3/+gOWBLG8WPmVYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdH9O-0004Yd-H1; Mon, 25 May 2020 17:44:34 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdH7m-00039v-JB
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 17:42:56 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 615E8240004;
 Mon, 25 May 2020 17:42:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 06/19] mtd: rawnand: Reorganize the nand_chip structure
Date: Mon, 25 May 2020 19:42:26 +0200
Message-Id: <20200525174239.11349-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525174239.11349-1-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_104254_982897_DBB4EF5C 
X-CRM114-Status: GOOD (  19.70  )
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
Cc: Rickard Andersson <rickaran@axis.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Reorder fields in this structure and pack entries by theme:
* The main descriptive structures
* The data interface details
* Bad block information
* The device layout
* Extra buffers matching the device layout
* Internal values
* External objects like the ECC controller, the ECC engine and a
  private data pointer.

While at it, adapt the documentation style.

I changed on purpose the description of @oob_poi which was weird.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/rawnand.h | 166 +++++++++++++++++-------------------
 1 file changed, 76 insertions(+), 90 deletions(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 2a9b5d5b315b..622da6527a36 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1055,120 +1055,106 @@ struct nand_manufacturer {
 
 /**
  * struct nand_chip - NAND Private Flash Chip Data
- * @base:		Inherit from the generic NAND device
- * @ops:		NAND chip operations
- * @manufacturer:	Manufacturer information
- * @legacy:		All legacy fields/hooks. If you develop a new driver,
- *			don't even try to use any of these fields/hooks, and if
- *			you're modifying an existing driver that is using those
- *			fields/hooks, you should consider reworking the driver
- *			avoid using them.
- * @ecc:		[BOARDSPECIFIC] ECC control structure
- * @buf_align:		minimum buffer alignment required by a platform
- * @oob_poi:		"poison value buffer," used for laying out OOB data
- *			before writing
- * @page_shift:		[INTERN] number of address bits in a page (column
- *			address bits).
- * @phys_erase_shift:	[INTERN] number of address bits in a physical eraseblock
- * @bbt_erase_shift:	[INTERN] number of address bits in a bbt entry
- * @chip_shift:		[INTERN] number of address bits in one chip
- * @options:		[BOARDSPECIFIC] various chip options. They can partly
- *			be set to inform nand_scan about special functionality.
- *			See the defines for further explanation.
- * @bbt_options:	[INTERN] bad block specific options. All options used
- *			here must come from bbm.h. By default, these options
- *			will be copied to the appropriate nand_bbt_descr's.
- * @badblockpos:	[INTERN] position of the bad block marker in the oob
- *			area.
- * @badblockbits:	[INTERN] minimum number of set bits in a good block's
- *			bad block marker position; i.e., BBM == 11110111b is
- *			not bad when badblockbits == 7
- * @onfi_timing_mode_default: [INTERN] default ONFI timing mode. This field is
- *			      set to the actually used ONFI mode if the chip is
- *			      ONFI compliant or deduced from the datasheet if
- *			      the NAND chip is not ONFI compliant.
- * @pagemask:		[INTERN] page number mask = number of (pages / chip) - 1
- * @data_buf:		[INTERN] buffer for data, size is (page size + oobsize).
- * @pagecache:		Structure containing page cache related fields
- * @pagecache.bitflips:	Number of bitflips of the cached page
- * @pagecache.page:	Page number currently in the cache. -1 means no page is
- *			currently cached
- * @subpagesize:	[INTERN] holds the subpagesize
- * @id:			[INTERN] holds NAND ID
- * @parameters:		[INTERN] holds generic parameters under an easily
- *			readable form.
- * @data_interface:	[INTERN] NAND interface timing information
- * @cur_cs:		currently selected target. -1 means no target selected,
- *			otherwise we should always have cur_cs >= 0 &&
- *			cur_cs < nanddev_ntargets(). NAND Controller drivers
- *			should not modify this value, but they're allowed to
- *			read it.
- * @read_retries:	[INTERN] the number of read retry modes supported
- * @lock:		lock protecting the suspended field. Also used to
- *			serialize accesses to the NAND device.
- * @suspended:		set to 1 when the device is suspended, 0 when it's not.
- * @bbt:		[INTERN] bad block table pointer
- * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
- *			lookup.
- * @bbt_md:		[REPLACEABLE] bad block table mirror descriptor
- * @badblock_pattern:	[REPLACEABLE] bad block scan pattern used for initial
- *			bad block scan.
- * @controller:		[REPLACEABLE] a pointer to a hardware controller
- *			structure which is shared among multiple independent
- *			devices.
- * @priv:		[OPTIONAL] pointer to private chip data
+ * @base: Inherit from the generic NAND device
+ * @id: Holds NAND ID
+ * @parameters: Holds generic parameters under an easily readable form
+ * @manufacturer: Manufacturer information
+ * @ops: NAND chip operations
+ * @legacy: All legacy fields/hooks. If you develop a new driver, don't even try
+ *          to use any of these fields/hooks, and if you're modifying an
+ *          existing driver that is using those fields/hooks, you should
+ *          consider reworking the driver and avoid using them.
+ * @options: Various chip options. They can partly be set to inform nand_scan
+ *           about special functionality. See the defines for further
+ *           explanation.
+ * @onfi_timing_mode_default: Default ONFI timing mode. This field is set to the
+ *			      actually used ONFI mode if the chip is ONFI
+ *			      compliant or deduced from the datasheet otherwise
+ * @data_interface: NAND interface timing information
+ * @bbt_erase_shift: Number of address bits in a bbt entry
+ * @bbt_options: Bad block table specific options. All options used here must
+ *               come from bbm.h. By default, these options will be copied to
+ *               the appropriate nand_bbt_descr's.
+ * @badblockpos: Bad block marker position in the oob area
+ * @badblockbits: Minimum number of set bits in a good block's bad block marker
+ *                position; i.e., BBM = 11110111b is good when badblockbits = 7
+ * @bbt_td: Bad block table descriptor for flash lookup
+ * @bbt_md: Bad block table mirror descriptor
+ * @badblock_pattern: Bad block scan pattern used for initial bad block scan
+ * @bbt: Bad block table pointer
+ * @page_shift: Number of address bits in a page (column address bits)
+ * @phys_erase_shift: Number of address bits in a physical eraseblock
+ * @chip_shift: Number of address bits in one chip
+ * @pagemask: Page number mask = number of (pages / chip) - 1
+ * @subpagesize: Holds the subpagesize
+ * @data_buf: Buffer for data, size is (page size + oobsize)
+ * @oob_poi: pointer on the OOB area covered by data_buf
+ * @pagecache: Structure containing page cache related fields
+ * @pagecache.bitflips: Number of bitflips of the cached page
+ * @pagecache.page: Page number currently in the cache. -1 means no page is
+ *                  currently cached
+ * @buf_align: Minimum buffer alignment required by a platform
+ * @lock: Lock protecting the suspended field. Also used to serialize accesses
+ *        to the NAND device
+ * @suspended: Set to 1 when the device is suspended, 0 when it's not
+ * @cur_cs: Currently selected target. -1 means no target selected, otherwise we
+ *          should always have cur_cs >= 0 && cur_cs < nanddev_ntargets().
+ *          NAND Controller drivers should not modify this value, but they're
+ *          allowed to read it.
+ * @read_retries: The number of read retry modes supported
+ * @controller: The hardware controller	structure which is shared among multiple
+ *              independent devices
+ * @ecc: The ECC controller structure
+ * @priv: Chip private data
  */
-
 struct nand_chip {
 	struct nand_device base;
+	struct nand_id id;
+	struct nand_parameters parameters;
 	struct nand_manufacturer manufacturer;
 	struct nand_chip_ops ops;
 	struct nand_legacy legacy;
-
 	unsigned int options;
+
+	/* Data interface */
+	int onfi_timing_mode_default;
+	struct nand_data_interface data_interface;
+
+	/* Bad block information */
+	unsigned int bbt_erase_shift;
 	unsigned int bbt_options;
+	unsigned int badblockpos;
+	unsigned int badblockbits;
+	struct nand_bbt_descr *bbt_td;
+	struct nand_bbt_descr *bbt_md;
+	struct nand_bbt_descr *badblock_pattern;
+	u8 *bbt;
 
+	/* Device internal layout */
 	unsigned int page_shift;
 	unsigned int phys_erase_shift;
-	unsigned int bbt_erase_shift;
 	unsigned int chip_shift;
 	unsigned int pagemask;
+	unsigned int subpagesize;
+
+	/* Buffers */
 	u8 *data_buf;
-
+	u8 *oob_poi;
 	struct {
 		unsigned int bitflips;
 		int page;
 	} pagecache;
+	unsigned long buf_align;
 
-	unsigned int subpagesize;
-	int onfi_timing_mode_default;
-	unsigned int badblockpos;
-	unsigned int badblockbits;
-
-	struct nand_id id;
-	struct nand_parameters parameters;
-
-	struct nand_data_interface data_interface;
-
+	/* Internals */
+	struct mutex lock;
+	unsigned int suspended : 1;
 	int cur_cs;
-
 	int read_retries;
 
-	struct mutex lock;
-	unsigned int suspended : 1;
-
-	u8 *oob_poi;
+	/* Externals */
 	struct nand_controller *controller;
-
 	struct nand_ecc_ctrl ecc;
-	unsigned long buf_align;
-
-	u8 *bbt;
-	struct nand_bbt_descr *bbt_td;
-	struct nand_bbt_descr *bbt_md;
-
-	struct nand_bbt_descr *badblock_pattern;
-
 	void *priv;
 };
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
