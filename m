Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5ABC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 12:10:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AE3060F93
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 12:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AE3060F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYX+WXVBSfumUvoMldyYTNQ7Zi6AMu8POn3OPqby4W4=; b=FnRxIV9UfEbnkV
	IIC1PdHoFFIMfyPfmlSMLlhqmUfGD0Qr2hkdVkpVB4AeG7jeTxZ8kQNgwpLaT5gI+1ceVYElC2SF2
	aFEC98ahSGUsXpRVFH51YpwEn/SdrH7298bC8PyI1DrYlPsH5MResWL04F2lFAiGH4A/nlp1EtlZ/
	S7QZ0Aatl99tItYyxAiJBaJjjN4J0N163h16Gssu1Dc2Sfva4oQA2O4910+3d2tdBH3Hci9ThQ+bg
	d40InzuKzf691nXtSRp4tXcV+/nzQzwDPuK1Y+HrbAHqHNvG5I662sDL/iZb2TXu6zcldsu3w6fHE
	59ZYmyqzV1XmrSd35tJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlVNb-00AEd2-FK; Fri, 12 Nov 2021 12:10:03 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlVJR-00ADFO-GQ
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 12:05:50 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HrHKm2jTFz1DJH8;
 Fri, 12 Nov 2021 20:03:24 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 20:05:40 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 12 Nov
 2021 20:05:40 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <s.hauer@pengutronix.de>, <miquel.raynal@bootlin.com>,
 <vigneshr@ti.com>, <mcoquelin.stm32@gmail.com>,
 <kirill.shutemov@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>
Subject: [PATCH v3 12/12] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
Date: Fri, 12 Nov 2021 20:17:58 +0800
Message-ID: <20211112121758.2208727-13-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112121758.2208727-1-chengzhihao1@huawei.com>
References: <20211112121758.2208727-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_040545_917151_0779EA17 
X-CRM114-Status: UNSURE (   9.50  )
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

Fastmap pebs(pnum >= UBI_FM_MAX_START) won't be added into 'ai->fastmap'
while attaching ubi device if 'fm->used_blocks' is greater than 2, which
may cause warning from 'ubi_assert(ubi->good_peb_count == found_pebs)':

  UBI assert failed in ubi_wl_init at 1878 (pid 2409)
  Call Trace:
    ubi_wl_init.cold+0xae/0x2af [ubi]
    ubi_attach+0x1b0/0x780 [ubi]
    ubi_init+0x23a/0x3ad [ubi]
    load_module+0x22d2/0x2430

Reproduce:
  ID="0x20,0x33,0x00,0x00" # 16M 16KB PEB, 512 page
  modprobe nandsim id_bytes=$ID
  modprobe ubi mtd="0,0" fm_autoconvert  # Fastmap takes 2 pebs
  rmmod ubi
  modprobe ubi mtd="0,0" fm_autoconvert  # Attach by fastmap

Add all used fastmap pebs into list 'ai->fastmap' to make sure they can
be counted into 'found_pebs'.

Fixes: fdf10ed710c0aa ("ubi: Rework Fastmap attach base code")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 35 +++++------------------------------
 1 file changed, 5 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 6b5f1ffd961b..01dcdd94c9d2 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -828,24 +828,6 @@ static int find_fm_anchor(struct ubi_attach_info *ai)
 	return ret;
 }
 
-static struct ubi_ainf_peb *clone_aeb(struct ubi_attach_info *ai,
-				      struct ubi_ainf_peb *old)
-{
-	struct ubi_ainf_peb *new;
-
-	new = ubi_alloc_aeb(ai, old->pnum, old->ec);
-	if (!new)
-		return NULL;
-
-	new->vol_id = old->vol_id;
-	new->sqnum = old->sqnum;
-	new->lnum = old->lnum;
-	new->scrub = old->scrub;
-	new->copy_flag = old->copy_flag;
-
-	return new;
-}
-
 /**
  * ubi_scan_fastmap - scan the fastmap.
  * @ubi: UBI device object
@@ -865,7 +847,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	struct ubi_vid_hdr *vh;
 	struct ubi_ec_hdr *ech;
 	struct ubi_fastmap_layout *fm;
-	struct ubi_ainf_peb *aeb;
 	int i, used_blocks, pnum, fm_anchor, ret = 0;
 	size_t fm_size;
 	__be32 crc, tmp_crc;
@@ -875,17 +856,6 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	if (fm_anchor < 0)
 		return UBI_NO_FASTMAP;
 
-	/* Copy all (possible) fastmap blocks into our new attach structure. */
-	list_for_each_entry(aeb, &scan_ai->fastmap, u.list) {
-		struct ubi_ainf_peb *new;
-
-		new = clone_aeb(ai, aeb);
-		if (!new)
-			return -ENOMEM;
-
-		list_add(&new->u.list, &ai->fastmap);
-	}
-
 	down_write(&ubi->fm_protect);
 	memset(ubi->fm_buf, 0, ubi->fm_size);
 
@@ -1029,6 +999,11 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 				"err: %i)", i, pnum, ret);
 			goto free_hdr;
 		}
+
+		/* Add all fastmap blocks into attach structure. */
+		ret = add_aeb(ai, &ai->fastmap, pnum, be64_to_cpu(ech->ec), 0);
+		if (ret)
+			goto free_hdr;
 	}
 
 	kfree(fmsb);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
