Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E534DC83F12
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 06:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GnMHAewG23xkRC1J3ugjVh06IWotdW71CT8neJPIek=; b=nk0WqEkThh5znC
	h4mt5nhhtWWA76Kaifm+Aip1lkZca6298vF1xX8KsV+bVrZPxQqUbZaxaRpu5Q7vV+tlq4NUjUQdY
	E5YDQDIdk9ZS8gqZiwRkYGrAbrCPmWypxzLwzUeju9s17V9vBQQvLND35/hfSCYpzRHs0BpstZIrD
	CJC3c2Jxv0KvaM8bSffMXgcCPGIwnbd1eagTDLP0pwGWYuJ51pLEb6q12iZJSh123TLsuKPc/VH+Y
	wNVoG1XPkflcbIAfoDCbOs4pAoNQyKEXKdYYfFOaKi8DANTLs/kPxefKUY2/SgvEMcg2OhBeWO5AF
	va4rrTBKCbI6XwrXODsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVyh-008ybo-1i;
	Mon, 28 Aug 2023 06:43:59 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaVy7-008yBt-1d;
	Mon, 28 Aug 2023 06:43:26 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RZ1Df2Ntgz1L9G5;
	Mon, 28 Aug 2023 14:41:38 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 28 Aug
 2023 14:43:13 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-mtd@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <bagasdotme@gmail.com>
Subject: [PATCH v2 03/12] ubi: fastmap: Allocate memory with GFP_NOFS in ubi_update_fastmap
Date: Mon, 28 Aug 2023 14:38:36 +0800
Message-ID: <20230828063845.3142561-4-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828063845.3142561-1-chengzhihao1@huawei.com>
References: <20230828063845.3142561-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_234323_748323_CD452225 
X-CRM114-Status: UNSURE (   9.68  )
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

Function ubi_update_fastmap could be called in IO context, for example:
 ubifs_writepage
  do_writepage
   ubifs_jnl_write_data
    write_head
     ubifs_wbuf_write_nolock
      ubifs_leb_write
       ubi_leb_write
        ubi_eba_write_leb
	 try_write_vid_and_data
	  ubi_wl_get_peb
	   ubi_update_fastmap
	    erase_block

So it's better to allocate memory with GFP_NOFS mode, in case waiting
page writeback(dead loop).

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 05ecdc049343..d64bfb986d40 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -20,7 +20,7 @@ static inline unsigned long *init_seen(struct ubi_device *ubi)
 	if (!ubi_dbg_chk_fastmap(ubi))
 		return NULL;
 
-	ret = bitmap_zalloc(ubi->peb_count, GFP_KERNEL);
+	ret = bitmap_zalloc(ubi->peb_count, GFP_NOFS);
 	if (!ret)
 		return ERR_PTR(-ENOMEM);
 
@@ -105,7 +105,7 @@ static struct ubi_vid_io_buf *new_fm_vbuf(struct ubi_device *ubi, int vol_id)
 	struct ubi_vid_io_buf *new;
 	struct ubi_vid_hdr *vh;
 
-	new = ubi_alloc_vid_buf(ubi, GFP_KERNEL);
+	new = ubi_alloc_vid_buf(ubi, GFP_NOFS);
 	if (!new)
 		goto out;
 
@@ -1403,7 +1403,7 @@ static int erase_block(struct ubi_device *ubi, struct ubi_wl_entry *e)
 	struct ubi_ec_hdr *ec_hdr;
 	long long ec = e->ec;
 
-	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
+	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
 	if (!ec_hdr)
 		return -ENOMEM;
 
@@ -1459,7 +1459,7 @@ static int invalidate_fastmap(struct ubi_device *ubi)
 	ubi->fm = NULL;
 
 	ret = -ENOMEM;
-	fm = kzalloc(sizeof(*fm), GFP_KERNEL);
+	fm = kzalloc(sizeof(*fm), GFP_NOFS);
 	if (!fm)
 		goto out;
 
@@ -1548,7 +1548,7 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		return 0;
 	}
 
-	new_fm = kzalloc(sizeof(*new_fm), GFP_KERNEL);
+	new_fm = kzalloc(sizeof(*new_fm), GFP_NOFS);
 	if (!new_fm) {
 		up_write(&ubi->fm_eba_sem);
 		up_write(&ubi->work_sem);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
