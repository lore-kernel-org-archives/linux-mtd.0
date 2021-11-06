Return-Path: <SRS0=A6BC=PZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3761BC433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:48:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA50F61056
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Nov 2021 16:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA50F61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/afB99GVolNsyr8EuJsGUr7JowfZLVbXsL8l7gdIVWA=; b=T7Tje+dDDFzWIk
	1w5+T46e0Q+82xo0ycGPNrDtCLqOwp22aoEUG+IQmnDyHY0XgOtOKpUNjreocVqb7/H1W2++oKcFS
	iuQXTyliyQtDlWRwL+/LTlqhciUTqg1sgZaMtYTWRCx8moyS5cnQSGKf+nIb8v+NydRYJAiut05Mb
	ycSAP+F/wZq0q8/kl2zyPw4O2un6ohAnxEXe9w3MHBqxhD0LFBpQ5FNTnwY64jJUqH+TX0R2E982Y
	nHlpNr6eH6pbXOAYgHHX50SXMc0IFY6dSgkIX9zu11dkRDZ0YbvUwWjecSdMYEP6XPqJA/BnnlM6l
	N1O5LlcnuDZX2ISJ1EuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjOqp-00D8d0-FH; Sat, 06 Nov 2021 16:47:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKzW-00CzUC-KM
 for linux-mtd@bombadil.infradead.org; Sat, 06 Nov 2021 12:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=tn9jWheU7aevxvpoRLXUAOsIlMpKPNJFixI+6yDKn4k=; b=WSBNaN831lX/9kW/4xJnJSy45/
 buDIBtdYtvt64VNx5OkRS1Ym0kuU4HdC1xGvTrMB8zr3tlVFmscvHdO+rndrZssUCm6vaEF33vfvh
 +jq0h2FIZqRD2BA7lAwZhMwpzV4lX+qs8UuUJXiCWsOWB/t1OERiRpQWs07AD+M9YzuN30TacQgZt
 /CoVydRWJHmoTYia8GmcPA5PoJmiXuSAzM7si709Y7y58NwEH/uQ1BYxn2pr+ykfD4vQZypbmTEMr
 A/rWazH5H+usSBSD7DG/2T9dI1+K6Kxm4Ks0WSysmNoZeD0t4KiK2fN6+zWJlR0P04eHVdkWtqfR+
 2P8BP1Mw==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjKZR-00EVVk-3L
 for linux-mtd@lists.infradead.org; Sat, 06 Nov 2021 12:13:23 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hmbmw6B3NzZclw;
 Sat,  6 Nov 2021 20:10:40 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (7.193.23.68) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Sat, 6 Nov 2021 20:12:49 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Sat, 6 Nov
 2021 20:12:48 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
 <mcoquelin.stm32@gmail.com>, <kirill.shutemov@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH v2 12/12] ubi: fastmap: Add all fastmap pebs into
 'ai->fastmap' when fm->used_blocks>=2
Date: Sat, 6 Nov 2021 20:25:17 +0800
Message-ID: <20211106122517.3304628-13-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106122517.3304628-1-chengzhihao1@huawei.com>
References: <20211106122517.3304628-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211106_121319_137570_AEA012E6 
X-CRM114-Status: GOOD (  11.57  )
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

Add all fastmap pebs into list 'ai->fastmap' to make sure they can be
counted into 'found_pebs'.

Fixes: fdf10ed710c0aa ("ubi: Rework Fastmap attach base code")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/fastmap.c | 41 ++++++++++++++-------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 6b5f1ffd961b..88fdf8f5709f 100644
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
@@ -875,15 +857,11 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	if (fm_anchor < 0)
 		return UBI_NO_FASTMAP;
 
-	/* Copy all (possible) fastmap blocks into our new attach structure. */
+	/* Add fastmap blocks(pnum < UBI_FM_MAX_START) into attach structure. */
 	list_for_each_entry(aeb, &scan_ai->fastmap, u.list) {
-		struct ubi_ainf_peb *new;
-
-		new = clone_aeb(ai, aeb);
-		if (!new)
-			return -ENOMEM;
-
-		list_add(&new->u.list, &ai->fastmap);
+		ret = add_aeb(ai, &ai->fastmap, aeb->pnum, aeb->ec, 0);
+		if (ret)
+			return ret;
 	}
 
 	down_write(&ubi->fm_protect);
@@ -1029,6 +1007,17 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 				"err: %i)", i, pnum, ret);
 			goto free_hdr;
 		}
+
+		/*
+		 * Add left fastmap blocks (pnum >= UBI_FM_MAX_START) into
+		 * attach structure.
+		 */
+		if (pnum >= UBI_FM_MAX_START) {
+			ret = add_aeb(ai, &ai->fastmap, pnum,
+				      be64_to_cpu(ech->ec), 0);
+			if (ret)
+				goto free_hdr;
+		}
 	}
 
 	kfree(fmsb);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
