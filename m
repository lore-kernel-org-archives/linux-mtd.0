Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973B4C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XaYUYR5m5Iri29XOGRq+wz6Vf2vsoULzlI8NeHaZXaY=; b=PIqt9whb9IrxH3
	z3t+zN/wvoQPzW0IgWQrhP2pexM2alHlaaU+jBY294vu9k4SHHwpWWlLOuxsqQXxPMBYoqp4S/deD
	AiOPbkOYWdmFH7jVpugEaSZpEDdpMKQKQUe5l1G5MX5N3xt4Aq8dmWa985pHvAA3qQM85TZ8PIVAj
	ByNBRU+t/May51gbHIdWO4Van4w5TXVN0ldtOsWlZa8XevCBlS0npyWYhQy99VO7aGDr0z9kUfIxJ
	qqgic8Cc/UzJiueujpzDY2k+5YZ1D5uimsftycrC40kJ6etBIRs1hMsObGDsYT1hZh/4sluF5EC+w
	lFB2+Gys5ywG624eGprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0dqA-001iO5-Tt; Mon, 13 Jun 2022 06:46:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0dq6-001iJs-Hl
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2022 06:46:21 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LM27d1vMhzRj0j;
	Mon, 13 Jun 2022 14:42:53 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 14:46:00 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 13 Jun
 2022 14:45:59 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<vigneshr@ti.com>, <Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2] ubi: ubi_wl_put_peb: Fix infinite loop when wear-leveling work failed
Date: Mon, 13 Jun 2022 14:59:04 +0800
Message-ID: <20220613065904.326567-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_234619_355422_A5724F4C 
X-CRM114-Status: GOOD (  11.15  )
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

Following process will trigger an infinite loop in ubi_wl_put_peb():

	ubifs_bgt		ubi_bgt
ubifs_leb_unmap
  ubi_leb_unmap
    ubi_eba_unmap_leb
      ubi_wl_put_peb	wear_leveling_worker
                          e1 = rb_entry(rb_first(&ubi->used)
			  e2 = get_peb_for_wl(ubi)
			  ubi_io_read_vid_hdr  // return err (flash fault)
			  out_error:
			    ubi->move_from = ubi->move_to = NULL
			    wl_entry_destroy(ubi, e1)
			      ubi->lookuptbl[e->pnum] = NULL
      retry:
        e = ubi->lookuptbl[pnum];	// return NULL
	if (e == ubi->move_from) {	// NULL == NULL gets true
	  goto retry;			// infinite loop !!!

$ top
  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     COMMAND
  7676 root     20   0       0      0      0 R 100.0  0.0  ubifs_bgt0_0

Fix it by:
 1) Letting ubi_wl_put_peb() returns directly if wearl leveling entry has
    been removed from 'ubi->lookuptbl'.
 2) Using 'ubi->wl_lock' protecting wl entry deletion to preventing an
    use-after-free problem for wl entry in ubi_wl_put_peb().

Fetch a reproducer in [Link].

Fixes: 43f9b25a9cdd7b1 ("UBI: bugfix: protect from volume removal")
Fixes: ee59ba8b064f692 ("UBI: Fix stale pointers in ubi->lookuptbl")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216111
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 v1->v2: Don't split wl_entry_destroy(), since kmem_cache_free() can be
         executed wrapped a spinlock, eg dtl_disable().
 drivers/mtd/ubi/wl.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 55bae06cf408..ee0100740869 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -973,11 +973,11 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	spin_lock(&ubi->wl_lock);
 	ubi->move_from = ubi->move_to = NULL;
 	ubi->move_to_put = ubi->wl_scheduled = 0;
+	wl_entry_destroy(ubi, e1);
+	wl_entry_destroy(ubi, e2);
 	spin_unlock(&ubi->wl_lock);
 
 	ubi_free_vid_buf(vidb);
-	wl_entry_destroy(ubi, e1);
-	wl_entry_destroy(ubi, e2);
 
 out_ro:
 	ubi_ro_mode(ubi);
@@ -1253,6 +1253,18 @@ int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
 retry:
 	spin_lock(&ubi->wl_lock);
 	e = ubi->lookuptbl[pnum];
+	if (!e) {
+		/*
+		 * This wl entry has been removed for some errors by other
+		 * process (eg. wear leveling worker), corresponding process
+		 * (except __erase_worker, which cannot concurrent with
+		 * ubi_wl_put_peb) will set ubi ro_mode at the same time,
+		 * just ignore this wl entry.
+		 */
+		spin_unlock(&ubi->wl_lock);
+		up_read(&ubi->fm_protect);
+		return 0;
+	}
 	if (e == ubi->move_from) {
 		/*
 		 * User is putting the physical eraseblock which was selected to
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
