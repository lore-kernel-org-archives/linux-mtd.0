Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1B1C624D9
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2026 13:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAtkWmDpbX+o6RS2l5tCFZgFHKbQlG7RXWqDZ0kEvcY=; b=XstkFQUWy8Q/DT
	zCnUZyBDkxOviMC/cuOTxwQwP8WCbPXGi+aCUpfjTb06YLOKE2enkzh6AXK4p+7jUlYEAhirkpaTc
	OD4/mVq+RijXhBGRrcgMfoy7cHemWzHXfrunk3h3YhusKesd4n42E6gqGOKq5bscfcm/HxylEliHw
	ivkAyJTDIZ5RjefdpbU92+gY2QRRYUw0m5CaV3f1e5+cGbKlNEjbE+zriObw+bLPmo4Dd2AQvI1c3
	HpM7T8hjm9vdpgaNup5eOkFVpKowpFQCXB3MQQAxIAAKpdJfWDEsWWwIIzRIK6I5nCI3uW/Cfova9
	Dh9kHOQ/Ss3zoFpDbMMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OIZ-0000000CAe5-0qhx;
	Tue, 01 Sep 2026 13:13:11 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1OIR-0000000CATz-3VO0;
	Tue, 01 Sep 2026 13:13:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ej8iF7xfPiEfPTnmPieqHemFhNoLZwi/7BQqcltv+jE=;
	b=RJmnf4s+dPHuguplmT7bWvDjoxvpH03+nzp6N/xE6ESgtpZreEhp8PHAG+KQ0CLfHf0V1rMHa
	H5LH2FpSZqjG/UjeoaBZilyVQbcjpZfC67nb2RtE81J9n5ANqwBlvsXQIMcb71kWoIFjzDFT7W4
	70k60Ji/5qVZ92dLYSamBpM=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hZ5bQ4C6rz12LF7;
	Tue,  1 Sep 2026 21:01:38 +0800 (CST)
Received: from dggpemr100018.china.huawei.com (unknown [7.185.36.64])
	by mail.maildlp.com (Postfix) with ESMTPS id 6458940538;
	Tue,  1 Sep 2026 21:12:55 +0800 (CST)
Received: from huawei.com (10.50.85.155) by dggpemr100018.china.huawei.com
 (7.185.36.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 1 Sep
 2026 21:12:54 +0800
From: zhouminqiang <zhouminqiang2@huawei.com>
To: <linux@armlinux.org.uk>, <vz@mleia.com>, <piotr.wojtaszczyk@timesys.com>,
	<maddy@linux.ibm.com>, <dwmw2@infradead.org>, <richard@nod.at>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-mtd@lists.infradead.org>,
	<chengzhihao1@huawei.com>, <yangerkun@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v3 4/8] jffs2: write verify: add byte-by-byte comparison on mismatch
Date: Tue, 1 Sep 2026 21:05:45 +0800
Message-ID: <20260901130549.1761342-5-zhouminqiang2@huawei.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260901130549.1761342-1-zhouminqiang2@huawei.com>
References: <20260901130549.1761342-1-zhouminqiang2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.50.85.155]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemr100018.china.huawei.com (7.185.36.64)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_061304_229017_37896F4C 
X-CRM114-Status: GOOD (  15.02  )
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

jffs2_verify_write() uses memcmp() to compare the write buffer
against data read back from flash. On mismatch, the current code
dumps the entire source and read-back data, which will become
impractical once the verify path is extended to NOR flash where
a single write can span PAGE_SIZE.

Add a byte-by-byte comparison after the memcmp() mismatch path
to locate the exact mismatch offset, reporting the first
differing offset and dumping up to 128 bytes of both the source
and read-back data. memcmp() remains on the hotpath for
successful writes, and the byte-by-byte loop only runs when an
error is actually detected.

Signed-off-by: zhouminqiang <zhouminqiang2@huawei.com>
---
 fs/jffs2/wbuf.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index 31fef7466d04..a4cf1915b2bd 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -231,7 +231,7 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 			      uint32_t ofs)
 {
 	int ret;
-	size_t retlen;
+	size_t retlen, i;
 	char *eccstr;
 	void *verify_buf;
 
@@ -246,10 +246,10 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 
 	if (ret && ret != -EUCLEAN && ret != -EBADMSG) {
 		pr_warn("%s(): Read back of page at %08x failed: %d\n",
-			__func__, c->wbuf_ofs, ret);
+			__func__, ofs, ret);
 		goto out_free;
 	} else if (retlen != c->wbuf_pagesize) {
-		pr_warn("%s(): Read back of page at %08x gave short read: %zd not %d\n",
+		pr_warn("%s(): Read back of page at %08x gave short read: %zu not %d\n",
 			__func__, ofs, retlen, c->wbuf_pagesize);
 		ret = -EIO;
 		goto out_free;
@@ -259,24 +259,34 @@ static int jffs2_verify_write(struct jffs2_sb_info *c, unsigned char *buf,
 		goto out_free;
 	}
 
-	if (ret == -EUCLEAN)
-		eccstr = "corrected";
-	else if (ret == -EBADMSG)
-		eccstr = "correction failed";
-	else
-		eccstr = "OK or unused";
+	for (i = 0; i < c->wbuf_pagesize; i++) {
+		uint8_t c1 = ((uint8_t *)buf)[i];
+		uint8_t c2 = ((uint8_t *)verify_buf)[i];
+		int dump_len;
 
-	pr_warn("Write verify error (ECC %s) at %08x. Wrote:\n",
-		eccstr, c->wbuf_ofs);
-	print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
-		       c->wbuf, c->wbuf_pagesize, 0);
+		if (c1 == c2)
+			continue;
 
-	pr_warn("Read back:\n");
-	print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
-		       verify_buf, c->wbuf_pagesize, 0);
+		if (ret == -EUCLEAN)
+			eccstr = "corrected";
+		else if (ret == -EBADMSG)
+			eccstr = "correction failed";
+		else
+			eccstr = "OK or unused";
 
-	kfree(verify_buf);
-	return -EIO;
+		dump_len = min_t(int, 128, c->wbuf_pagesize - i);
+		pr_warn("Write verify error (ECC %s) at %08x (+%zu/%d). Wrote:\n",
+			eccstr, ofs, i, c->wbuf_pagesize);
+		print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
+			       buf + i, dump_len, 0);
+
+		pr_warn("Read back:\n");
+		print_hex_dump(KERN_WARNING, "", DUMP_PREFIX_OFFSET, 16, 1,
+			       verify_buf + i, dump_len, 0);
+
+		ret = -EIO;
+		goto out_free;
+	}
 
 out_free:
 	kfree(verify_buf);
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
