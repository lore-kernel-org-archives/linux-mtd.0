Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18A1C5B559
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Jun 2025 03:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TTs/49MMCaWzdwcQACt2ngYjVudq+eY5drD7DcDd+MM=; b=YTvHYM2pVUbjls
	8mNSFtWi+1aP14J2Q6gPDlBjtdVFFr7dDw537sMTdNM9nK+wX5Ov3f/XGQeI5m57AZv7b6v/44RGT
	VNm5MaoVbMTE7+LTzvZ0pkocgYTXOMT5EbxvLV2iX+zAXcKnspqgUqZyn+yRiQlWH214ONQuOKLxh
	VUeV4BnMBD+1S5QF/oIGTsfpF4cMqU7oBwcoXHrDAHlk0FbXbq/xk8olQaXK4KXnwnBrUgQo2wHde
	MPkGOQWtPVHJmS6rU0d4S9hs+7xQiAp3o9KMsQsZ5d6PZ8Y378hGmnMSsqIDccX3SV7NbkWQQ5qfr
	/jej6GPV51fWiRhPc84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfHT-0000000CUVJ-2CNA;
	Wed, 04 Jun 2025 03:59:11 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMdkl-0000000CI4Q-3Bsa
	for linux-mtd@lists.infradead.org;
	Wed, 04 Jun 2025 02:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=FF
	qNQjcFki8obBxN9fY+OrSpvsGVKXgp2HXnGZswtco=; b=cmscDv+Z5gV1sDEhuO
	huMpR0YRko3w1NVI2SDAlUsSYgScWfh2zXpneJkxn9RUiK+defpGHQxqXUGmXdLs
	sYx0uiSCmfm3kt1L05TBJjRniXjXz4kmC0QdCSlG1+VtLjzf3y+aWML2j2YDMGbk
	1u0E5nb/DZkIN9Fe/WxQYZ+cI=
Received: from liubaolin-VMware-Virtual-Platform.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAXjquMrT9oYdpRGA--.494S2;
	Wed, 04 Jun 2025 10:21:03 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: liubaolin@kylinos.cn,
	liubaolin12138@163.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] jffs2: fix comment typo and adjust formatting
Date: Wed,  4 Jun 2025 10:20:56 +0800
Message-Id: <20250604022056.111032-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: _____wAXjquMrT9oYdpRGA--.494S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry7XrWfJF47tF4kJFWkZwb_yoWDtrcE93
	yUA3ykAFs8tF4UJ3srA3yYvr9Ygw4j9r1Yqr4fJF98ZayDAws8Wr4kJrnay3WUuF4qqrWk
	Xr95Cr9ayr4IgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtJPE7UUUUU==
X-Originating-IP: [223.70.160.239]
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/1tbiUgliymg-qOnzPgAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_192120_136078_6BF6ABE0 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Baolin Liu <liubaolin@kylinos.cn>

This commit makes two documentation improvements:
1. Fixes spelling of "coresponding" to "corresponding"
2. Adjusts comment formatting to meet kernel style guidelines by:
   - Breaking long lines to fit 80-column limit
   - Aligning asterisks in multi-line comments
   - Improving readability while preserving original meaning

No functional changes.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/jffs2/build.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
index 6ae9d6fefb86..1e651d3dcef3 100644
--- a/fs/jffs2/build.c
+++ b/fs/jffs2/build.c
@@ -185,8 +185,10 @@ static int jffs2_build_filesystem(struct jffs2_sb_info *c)
 			 * one. */
 			if (fd->type == DT_DIR) {
 				if (!fd->ic) {
-					/* We'll have complained about it and marked the coresponding
-					   raw node obsolete already. Just skip it. */
+					/* We'll have complained about it
+					 * and marked the corresponding raw node obsolete already.
+					 * Just skip it.
+					 */
 					continue;
 				}
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
