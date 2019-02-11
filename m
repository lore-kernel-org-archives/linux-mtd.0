Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A291C282CE
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:37:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AE45218A4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KWtFQFJZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZDweeHhR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AE45218A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6js7+FE90geCaYp1kfpahOnXF77GW7BKBJVnwA0WC7s=; b=KWtFQFJZAuiLqn
	nV+kB1qq7Kfv88G98wTEc2sAxLLqxfl0Br+TL8iVDnedTT2Ln7UMs4F34XshCYqpiS8c+xB8IzR1Q
	ouFShToY12PHMciXg6m+TY3Bic3kpetfnr+sCzggyL7W+pqa6XZf9+g2fifBtGOKmLwco4fdsMrVK
	ZxfIw6tbXuUpYtGKpWMMkWubLCZkUYvkzpqfg32XatIrCehwdRsOGFJAkHC6erSDPZiq8IHcNdA1A
	RE1IpRyBWkGe1R5bI5Hv8fe/mdDehDzYfWmgDMakrb6ezQCXNG0tOqL954OAbYJmxj5Ou9bw9VzsU
	zEyg3a+XoARGq+TNxZYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtFVo-0000DU-Gx; Mon, 11 Feb 2019 17:36:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtFOn-0007Iq-Hb
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 17:29:47 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C152222AB;
 Mon, 11 Feb 2019 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549906180;
 bh=d65XGeWZznXP7UUkU7ZMl8LRen0al2wftOsekyrM8RU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZDweeHhRr4HXrhtfxogG/2Pzop/eQ0dSAiyfCB6af+Mhb1dQl3jukBz7D3cnu3Hdd
 /Yq3UU2iPqcjYIYcdz5feE1pTaL8avFgpPnRaoEZ293uY84S8Ki6S1ZSSsryoWDMzj
 nxgs/i+aaOaVoklRgvbxBcs6Gpim2TEj3LVTkIDI=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH v2 09/20] fs/inode.c: rename and export dispose_list()
Date: Mon, 11 Feb 2019 09:27:27 -0800
Message-Id: <20190211172738.4633-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211172738.4633-1-ebiggers@kernel.org>
References: <20190211172738.4633-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_092941_949877_75739E88 
X-CRM114-Status: GOOD (  14.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

When a filesystem encryption key is removed, we need all files which had
been "unlocked" (had ->i_crypt_info set up) with it to appear "locked"
again.  This is most easily done by evicting the inodes.  This can
currently be done using 'echo 2 > /proc/sys/vm/drop_caches'; however,
that is overkill and not usable by non-root users.  In preparation for
allowing fs/crypto/ to evict just the needed inodes, make dispose_list()
non-static.  For clarity also rename it to evict_inode_list().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/inode.c         | 18 +++++++++---------
 include/linux/fs.h |  1 +
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 037df483c9af..10147197c1de 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -574,13 +574,13 @@ static void evict(struct inode *inode)
 }
 
 /*
- * dispose_list - dispose of the contents of a local list
- * @head: the head of the list to free
+ * evict_inode_list - evict each inode in a local list of inodes
+ * @head: the head of the list
  *
- * Dispose-list gets a local list with local inodes in it, so it doesn't
+ * This gets a local list with local inodes in it, so it doesn't
  * need to worry about list corruption and SMP locks.
  */
-static void dispose_list(struct list_head *head)
+void evict_inode_list(struct list_head *head)
 {
 	while (!list_empty(head)) {
 		struct inode *inode;
@@ -632,13 +632,13 @@ void evict_inodes(struct super_block *sb)
 		if (need_resched()) {
 			spin_unlock(&sb->s_inode_list_lock);
 			cond_resched();
-			dispose_list(&dispose);
+			evict_inode_list(&dispose);
 			goto again;
 		}
 	}
 	spin_unlock(&sb->s_inode_list_lock);
 
-	dispose_list(&dispose);
+	evict_inode_list(&dispose);
 }
 EXPORT_SYMBOL_GPL(evict_inodes);
 
@@ -683,7 +683,7 @@ int invalidate_inodes(struct super_block *sb, bool kill_dirty)
 	}
 	spin_unlock(&sb->s_inode_list_lock);
 
-	dispose_list(&dispose);
+	evict_inode_list(&dispose);
 
 	return busy;
 }
@@ -770,7 +770,7 @@ static enum lru_status inode_lru_isolate(struct list_head *item,
  * Walk the superblock inode LRU for freeable inodes and attempt to free them.
  * This is called from the superblock shrinker function with a number of inodes
  * to trim from the LRU. Inodes to be freed are moved to a temporary list and
- * then are freed outside inode_lock by dispose_list().
+ * then are freed outside inode_lock by evict_inode_list().
  */
 long prune_icache_sb(struct super_block *sb, struct shrink_control *sc)
 {
@@ -779,7 +779,7 @@ long prune_icache_sb(struct super_block *sb, struct shrink_control *sc)
 
 	freed = list_lru_shrink_walk(&sb->s_inode_lru, sc,
 				     inode_lru_isolate, &freeable);
-	dispose_list(&freeable);
+	evict_inode_list(&freeable);
 	return freed;
 }
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 326cbb044596..ce18ece60da4 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2987,6 +2987,7 @@ extern void discard_new_inode(struct inode *);
 extern unsigned int get_next_ino(void);
 extern void evict_inodes(struct super_block *sb);
 extern void inode_lru_list_del(struct inode *inode);
+extern void evict_inode_list(struct list_head *head);
 
 extern void __iget(struct inode * inode);
 extern void iget_failed(struct inode *);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
