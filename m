Received: from mail-qa0-f42.google.com ([209.85.216.42])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLT5D-0007Hj-AU
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 06:14:25 +0000
Received: by mail-qa0-f42.google.com with SMTP id t11so2870660qaa.15
 for <linux-mtd@lists.infradead.org>; Mon, 08 Oct 2012 23:14:21 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 9 Oct 2012 14:14:21 +0800
Message-ID: <CAPgLHd_AHHe7=H18K54LvbiS0M7_w1vTMOxwwxgVdRaiXNN-OA@mail.gmail.com>
Subject: [PATCH] ubi: use list_move_tail instead of list_del/list_add_tail
From: Wei Yongjun <weiyj.lk@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Using list_move_tail() instead of list_del() + list_add_tail().

dpatch engine is used to auto generate this patch.
(https://github.com/weiyj/dpatch)

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/ubi/fastmap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 1a5f53c..5f540c5 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -815,8 +815,7 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 		ai->max_sqnum = max_sqnum;
 
 	list_for_each_entry_safe(tmp_aeb, _tmp_aeb, &free, u.list) {
-		list_del(&tmp_aeb->u.list);
-		list_add_tail(&tmp_aeb->u.list, &ai->free);
+		list_move_tail(&tmp_aeb->u.list, &ai->free);
 	}
 
 	/*
