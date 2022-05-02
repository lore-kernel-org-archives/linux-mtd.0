Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A29C4332F
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 05:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1WpDgRhrXZ9tu68D0cEYOz/dfH3pAvCp/9VQhMtJVA=; b=GDcLWF5nok1Lr6
	vuF5kjVW6Fz94n1s5v8ZQAgmRUGbBxhLd7p0jRlveYZ2ElVl3ZxvUW93+CCyZpne93AGLs3/veTkS
	0YEiQtBh91EFKcXj9osMhYWyZE5yowa10TSHo/xZez9D276c1QeD3reCnRf0rpUiZyd4YKuFqmKzW
	CUNY2aE+QSPfyl1uWVKziIqpECmx7OnDG+/+6rZF9DV3pHUIPIt/9386ojWwuQUMT9PnCJ9K293S3
	6jxmM8YFD1Wz3puPdKTIWIl///ttfk3VXBiM2YwWcA+6OucCOqB3v1aBZW3X0Fkw0LVMeqmvzUyVj
	nHf0Mr6/1BWLozHF/v2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlOp1-00Hais-IX; Mon, 02 May 2022 05:42:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlOoy-00HaiN-Bc
 for linux-mtd@bombadil.infradead.org; Mon, 02 May 2022 05:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Tqa27ZTkwRUChUFFhePcdT99JAqNU7Wtt1R4QbW6KOM=; b=EH6Lr/nkI8efcRDg36iw5nLsCC
 Mx0+fz7ITr/sUBxXRX/dl+k3LvtWo+yjOHEjks/7NE5eIKHT5x4i2Y0AU4W4p8Y2inntRuvtn1jwi
 ZZzLbGh4/rauE727HbfFMPCiGgqzMxIFhV2hCPgnOC4+Mu1d4ezgXuhlARXGesJzqVRIG0423e/X1
 U5Lm3Srx4aJZ9P1O+GptWCBraszICk6TlVhfbIzoFoZg6254Xq85a5QScBOULZiq2+G4nUJHiXq3K
 VRpqp1XJ5SdstxvIpv/8KzO2EYD1d5HVbWcOA4ec5M+0dO8pzkrPdul9HOhLuCQXOGWHBLOVyQplY
 +ch9yCzw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nlOot-00EZ01-QF; Mon, 02 May 2022 05:42:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org
Subject: [PATCH 1/3] jffs2: Pass the file pointer to jffs2_do_readpage_unlock()
Date: Mon,  2 May 2022 06:41:57 +0100
Message-Id: <20220502054159.3471078-2-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220502054159.3471078-1-willy@infradead.org>
References: <20220502054159.3471078-1-willy@infradead.org>
MIME-Version: 1.0
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

In preparation for unifying the read_cache_page() and read_folio()
implementations, make jffs2_do_readpage_unlock() get the inode
from the page instead of passing it in from read_cache_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/jffs2/file.c | 4 ++--
 fs/jffs2/gc.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index f8616683fbee..492fb2da0403 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -112,7 +112,7 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 
 int jffs2_do_readpage_unlock(void *data, struct page *pg)
 {
-	int ret = jffs2_do_readpage_nolock(data, pg);
+	int ret = jffs2_do_readpage_nolock(pg->mapping->host, pg);
 	unlock_page(pg);
 	return ret;
 }
@@ -124,7 +124,7 @@ static int jffs2_read_folio(struct file *file, struct folio *folio)
 	int ret;
 
 	mutex_lock(&f->sem);
-	ret = jffs2_do_readpage_unlock(folio->mapping->host, &folio->page);
+	ret = jffs2_do_readpage_unlock(file, &folio->page);
 	mutex_unlock(&f->sem);
 	return ret;
 }
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 373b3b7c9f44..a53bac7569b6 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -1327,7 +1327,7 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 	 * trying to write out, read_cache_page() will not deadlock. */
 	mutex_unlock(&f->sem);
 	page = read_cache_page(inode->i_mapping, start >> PAGE_SHIFT,
-			       jffs2_do_readpage_unlock, inode);
+			       jffs2_do_readpage_unlock, NULL);
 	if (IS_ERR(page)) {
 		pr_warn("read_cache_page() returned error: %ld\n",
 			PTR_ERR(page));
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
