Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04092C678D5
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Mar 2023 05:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1cNnRmoGHRgVnY+tER8SduOLoATkUUnm/Ue98ebkeAY=; b=lweqUpNPEl4ygM
	f2VZT+RLxTS8ZKKgBVFddtOcGX/Ob/yWAF30v+Gka9oD2mBPWJUHZ8k4mHAn9KE6pqKj0zhORgPAv
	BFAWDW5sx2GoYQo2e9LwlTMyjz13GV1H4+T3YkZOuiUknpo/mhOTEXllR6vQWZiCDH4O5UVvj2f62
	3E9OaJ9PZcGyJVEuXV/0xTs8iqUpkbWyGIKsH7yYxoVwrHJlLQjrTxMjMNRENgVRq0EpSsVXuWKtm
	8mnENCC0kdPpsbabvPLcwAwUhEelYyfT+leXHEAL+0I45M5VvHe+KShUh2XD557Xv2OWFlZNLdoEc
	/3lfwQeLKq7MUd/UDgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYK8D-008Khi-Mx; Sat, 04 Mar 2023 05:08:29 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYK8A-008Kg7-2H
	for linux-mtd@lists.infradead.org; Sat, 04 Mar 2023 05:08:28 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PTCTZ1rDLz16P79;
	Sat,  4 Mar 2023 13:05:38 +0800 (CST)
Received: from huawei.com (10.175.127.227) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Sat, 4 Mar
 2023 13:07:43 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <miquel.raynal@bootlin.com>, <s.hauer@pengutronix.de>,
	<george.kennedy@oracle.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH] ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size
Date: Sat, 4 Mar 2023 13:30:56 +0800
Message-ID: <20230304053056.403325-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_210826_312536_FF158F85 
X-CRM114-Status: GOOD (  10.93  )
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

Following process will make ubi attaching failed since commit
1b42b1a36fc946 ("ubi: ensure that VID header offset ... size"):

ID="0xec,0xa1,0x00,0x15" # 128M 128KB 2KB
modprobe nandsim id_bytes=$ID
flash_eraseall /dev/mtd0
modprobe ubi mtd="0,2048"  # set vid_hdr offset as 2048 (one page)
(dmesg):
  ubi0 error: ubi_attach_mtd_dev [ubi]: VID header offset 2048 too large.
  UBI error: cannot attach mtd0
  UBI error: cannot initialize UBI, error -22

Rework original solution, the key point is making sure
'vid_hdr_shift + UBI_VID_HDR_SIZE < ubi->vid_hdr_alsize',
so we should check vid_hdr_shift rather not vid_hdr_offset.
Then, ubi still support (sub)page aligined VID header offset.

Fixes: 1b42b1a36fc946 ("ubi: ensure that VID header offset ... size")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 drivers/mtd/ubi/build.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 0904eb40c95f..677e809526d2 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -666,12 +666,6 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 	ubi->ec_hdr_alsize = ALIGN(UBI_EC_HDR_SIZE, ubi->hdrs_min_io_size);
 	ubi->vid_hdr_alsize = ALIGN(UBI_VID_HDR_SIZE, ubi->hdrs_min_io_size);
 
-	if (ubi->vid_hdr_offset && ((ubi->vid_hdr_offset + UBI_VID_HDR_SIZE) >
-	    ubi->vid_hdr_alsize)) {
-		ubi_err(ubi, "VID header offset %d too large.", ubi->vid_hdr_offset);
-		return -EINVAL;
-	}
-
 	dbg_gen("min_io_size      %d", ubi->min_io_size);
 	dbg_gen("max_write_size   %d", ubi->max_write_size);
 	dbg_gen("hdrs_min_io_size %d", ubi->hdrs_min_io_size);
@@ -689,6 +683,21 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 						ubi->vid_hdr_aloffset;
 	}
 
+	/*
+	 * Memory allocation for VID header is ubi->vid_hdr_alsize
+	 * which is described in comments in io.c.
+	 * Make sure VID header shift + UBI_VID_HDR_SIZE not exceeds
+	 * ubi->vid_hdr_alsize, so that all vid header operations
+	 * won't access memory out of bounds.
+	 */
+	if ((ubi->vid_hdr_shift + UBI_VID_HDR_SIZE) > ubi->vid_hdr_alsize) {
+		ubi_err(ubi, "Invalid VID header offset %d, VID header shift(%d)"
+			" + VID header size(%lu) > VID header aligned size(%d).",
+			ubi->vid_hdr_offset, ubi->vid_hdr_shift,
+			UBI_VID_HDR_SIZE, ubi->vid_hdr_alsize);
+		return -EINVAL;
+	}
+
 	/* Similar for the data offset */
 	ubi->leb_start = ubi->vid_hdr_offset + UBI_VID_HDR_SIZE;
 	ubi->leb_start = ALIGN(ubi->leb_start, ubi->min_io_size);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
