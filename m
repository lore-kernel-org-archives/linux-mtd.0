Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFDAC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jun 2022 02:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wHP1yTA8YUVHdMuMp+xoDVJSgZe1L8jJapsY1/rtlu0=; b=p2c+50nLXqGP7K
	FZkIVNwZJpdYGn4cRb19dUY6LP+sDMtuATi8A6rYUwB2i3nt/YPajcKKBuGDCPVQtc2LxheWDfKLx
	ooIUIJMzfxAGGzlVMCs0K0B+HrV1QnlqB30UOfUqstaC4VkqmXeYgeekvtRVaS11ByLhqIjdiS6r7
	DipfDUSwZ2sWg73VAx/V1BiJx+TnfoE/JMlWuARruDj65DxZbg9TRiwX2bQNI/xhOPJjRk/AMmY+A
	dGgeVYrID4udQNtD9S6LToqmrMZqRS4XgaPPVriXnr2tLqonADliBPNMiODJsNU6Ow4M6RjciVwMm
	3yDExG8nwYcfCXEMK0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzqdu-00AyGk-Kg; Sat, 11 Jun 2022 02:14:26 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzqdp-00AyCd-PB
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2022 02:14:24 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LKhDp3H44zjXX8;
	Sat, 11 Jun 2022 10:12:42 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 11 Jun 2022 10:14:00 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 11 Jun
 2022 10:13:59 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<vigneshr@ti.com>, <Artem.Bityutskiy@nokia.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH] ubi: ubi_wl_put_peb: Fix infinite loop when wear-leveling work failed
Date: Sat, 11 Jun 2022 10:27:06 +0800
Message-ID: <20220611022706.926980-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_191422_198228_A3E94C90 
X-CRM114-Status: GOOD (  10.52  )
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
 drivers/mtd/ubi/wl.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 55bae06cf408..c95bfbdfa475 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -973,11 +973,13 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 	spin_lock(&ubi->wl_lock);
 	ubi->move_from = ubi->move_to = NULL;
 	ubi->move_to_put = ubi->wl_scheduled = 0;
+	ubi->lookuptbl[e1->pnum] = NULL;
+	ubi->lookuptbl[e2->pnum] = NULL;
 	spin_unlock(&ubi->wl_lock);
 
 	ubi_free_vid_buf(vidb);
-	wl_entry_destroy(ubi, e1);
-	wl_entry_destroy(ubi, e2);
+	kmem_cache_free(ubi_wl_entry_slab, e1);
+	kmem_cache_free(ubi_wl_entry_slab, e2);
 
 out_ro:
 	ubi_ro_mode(ubi);
@@ -1253,6 +1255,18 @@ int ubi_wl_put_peb(struct ubi_device *ubi, int vol_id, int lnum,
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
