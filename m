Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17589C79FB9
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 13:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B+GgP4gwyAUw4KCktaMFb43tzSa3gl6lqjPTD9xHZVQ=; b=ikVtXougSG8aGv
	5ur47e5uYfIHMOmMGVgRwskI7F36ZELRNhLXzOlN8xNOO0RupBm6rH3Fyj+UPfOU7enJRKmfNOOdC
	d9h6xi1mEMTHIl+K28erUIbQTmXKT84apjYxD+znwFsDuDn04+CZzZ+ssqQYFMnHp1DEQNbY5UVYr
	xyGZOEXCyhDwHkZMMGCCvjinG/gsY5Ul8OszKeQ45eCElFGRuCB2P4p8fdmcfbKjjYUWjxkJMnRBV
	JBuQdVZGZz77+QeWhjlym/7GADKixSkxnQI50b4vQtRkJhKHP6MZyV4uv3LNNGllQBGRmNcUekVnv
	GZsRZm9M3/G4P30d3kDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eyw-0000000EW2g-0bAG;
	Thu, 10 Sep 2026 13:38:26 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eys-0000000EW0z-0oi5
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 13:38:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OAXvvf5bBfGy7Tjd5JmbGY2Dey5h8lYm1afhEjpKROg=;
	b=e0QtZafvVZaDlPFRUy9aIemWklE3yItrmhvC5K45BcvNiwFNmvNPVaIQAIAktYJkPorehkFLC
	yZXtKNyZ+7M3iGTkEaewypXhrFb9MX+TV8ZMGlfITk0O6dZFsf4kIPIAiz/ZwqhJmh2wCYUk1nV
	whEq1TmBrlqexQlzW7N3Hfk=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hgdkg2yf4z1prMy;
	Thu, 10 Sep 2026 21:27:07 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 0441D4057D;
	Thu, 10 Sep 2026 21:38:04 +0800 (CST)
Received: from huawei.com (10.50.85.155) by whupemo200011.china.huawei.com
 (7.152.185.179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 21:38:02 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<dedekind@linutronix.de>, <haver@vnet.ibm.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] ubi: try_recover_peb: Don't torture the new PEB if there is no write operation
Date: Thu, 10 Sep 2026 21:30:27 +0800
Message-ID: <20260910133027.2738498-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063822_739144_9768EFE5 
X-CRM114-Status: GOOD (  12.45  )
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

The new peb is put always with torture flag even there is no write
operation. For example, ubi_io_read_vid_hdr failure can lead a torture
operation during the erasing of new PEB, which brings meaningless and
life-wearing torture verification.

Fix by adding a torture state value to identify whether the write
operation happens on new PEB. BTW, let ubi write failure warnning be
printed only when a write operation fails.

Fixes: 801c135ce73d5d ("UBI: Unsorted Block Images")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/eba.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index f0c549e62c55..509c90304ab8 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -805,7 +805,7 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 {
 	struct ubi_device *ubi = vol->ubi;
 	struct ubi_vid_hdr *vid_hdr;
-	int new_pnum, err, vol_id = vol->vol_id, data_size;
+	int new_pnum, err, vol_id = vol->vol_id, data_size, torture = 0;
 	uint32_t crc;
 
 	*retry = false;
@@ -843,6 +843,7 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 
 	memcpy(ubi->peb_buf + offset, buf, len);
 
+	torture = 1;
 	data_size = offset + len;
 	crc = crc32(UBI_CRC32_INIT, ubi->peb_buf, data_size);
 	vid_hdr->sqnum = cpu_to_be64(ubi_next_sqnum(ubi));
@@ -872,8 +873,9 @@ static int try_recover_peb(struct ubi_volume *vol, int pnum, int lnum,
 		 * Bad luck? This physical eraseblock is bad too? Crud. Let's
 		 * try to get another one.
 		 */
-		ubi_wl_put_peb(ubi, vol_id, lnum, new_pnum, 1);
-		ubi_warn(ubi, "failed to write to PEB %d", new_pnum);
+		ubi_wl_put_peb(ubi, vol_id, lnum, new_pnum, torture);
+		if (torture)
+			ubi_warn(ubi, "failed to write to PEB %d", new_pnum);
 	}
 
 	return err;
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
