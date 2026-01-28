Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF27D3567C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 06:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VPr058eiKkDkmpRSnTvWITJ9JCDMwaeBzBgTcXAR3gQ=; b=1mPkOqUfIyRZW5
	PrxJjO4/fCmOaD8KYfV8lnkcT5AmjsLS2misgw1xYOrQYAeTnpIN6o3wuCIQ8RoAopMuQoVSd51y7
	SCZhB5ZYsUjJJTTDVYLTJtyzda9mw70lcDHumwDufn+ShJ0r72WA5f6YeFMssof7sBjghJEKYglXh
	DeB6Hz4HFyKsI7MOTpCowNKyrvG8SocTRDh8qUFfshbVkEHIR234Uje0oScXcMzJ7ghR7X2zP0Ds7
	AZklg3nylD1JrIfJ9Z3fSVJHZup9dG7TvAV06/jLSwwrzdq0XZlQsN7CWZxW0zulToftU/hDo0Qoo
	PEu8fk/lfqKocZ5YkMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkyyk-0000000FXGr-1PBK;
	Wed, 28 Jan 2026 06:24:38 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkyyh-0000000FXGb-0ldp;
	Wed, 28 Jan 2026 06:24:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] ubi: ubi.h: fix kernel-doc warnings
Date: Tue, 27 Jan 2026 22:24:34 -0800
Message-ID: <20260128062434.400750-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
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

Fix all default warning level kernel-doc warnings in ubi.h:

Warning: drivers/mtd/ubi/ubi.h:176 struct member 'u' not described in 'ubi_wl_entry'
Warning: drivers/mtd/ubi/ubi.h:370 struct member 'is_dead' not described in 'ubi_volume'
Warning: drivers/mtd/ubi/ubi.h:655 struct member 'is_dead' not described in 'ubi_device'
Warning: drivers/mtd/ubi/ubi.h:743 bad line: all existing Fastmap data structures
Warning: drivers/mtd/ubi/ubi.h:783 struct member 'vidb' not described in 'ubi_attach_info'
Warning: drivers/mtd/ubi/ubi.h:1098 expecting prototype for ubi_init_vid_buf().
 Prototype was for ubi_alloc_vid_buf() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org

 drivers/mtd/ubi/ubi.h |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

--- linux-next-20260126.orig/drivers/mtd/ubi/ubi.h
+++ linux-next-20260126/drivers/mtd/ubi/ubi.h
@@ -160,6 +160,7 @@ struct ubi_vid_io_buf {
  * struct ubi_wl_entry - wear-leveling entry.
  * @u.rb: link in the corresponding (free/used) RB-tree
  * @u.list: link in the protection queue
+ * @u: union of rb_node and list_head
  * @ec: erase counter
  * @pnum: physical eraseblock number
  *
@@ -282,6 +283,7 @@ struct ubi_eba_leb_desc {
  * @writers: number of users holding this volume in read-write mode
  * @exclusive: whether somebody holds this volume in exclusive mode
  * @metaonly: whether somebody is altering only meta data of this volume
+ * @is_dead: prevents taking a reference to the volume
  *
  * @reserved_pebs: how many physical eraseblocks are reserved for this volume
  * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
@@ -449,6 +451,7 @@ struct ubi_debug_info {
  *                @vol->eba_tbl.
  * @ref_count: count of references on the UBI device
  * @image_seq: image sequence number recorded on EC headers
+ * @is_dead: prevents taking a reference to the volume
  *
  * @rsvd_pebs: count of reserved physical eraseblocks
  * @avail_pebs: count of available physical eraseblocks
@@ -741,7 +744,7 @@ struct ubi_ainf_volume {
  * @highest_vol_id: highest volume ID
  * @is_empty: flag indicating whether the MTD device is empty or not
  * @force_full_scan: flag indicating whether we need to do a full scan and drop
-		     all existing Fastmap data structures
+ *		     all existing Fastmap data structures
  * @min_ec: lowest erase counter value
  * @max_ec: highest erase counter value
  * @max_sqnum: highest sequence number value
@@ -750,7 +753,7 @@ struct ubi_ainf_volume {
  * @ec_count: a temporary variable used when calculating @mean_ec
  * @aeb_slab_cache: slab cache for &struct ubi_ainf_peb objects
  * @ech: temporary EC header. Only available during scan
- * @vidh: temporary VID buffer. Only available during scan
+ * @vidb: temporary VID buffer. Only available during scan
  *
  * This data structure contains the result of attaching an MTD device and may
  * be used by other UBI sub-systems to build final UBI data structures, further
@@ -1090,7 +1093,7 @@ static inline void ubi_init_vid_buf(cons
 }
 
 /**
- * ubi_init_vid_buf - Allocate a VID buffer
+ * ubi_alloc_vid_buf - Allocate a VID buffer
  * @ubi: the UBI device
  * @gfp_flags: GFP flags to use for the allocation
  */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
