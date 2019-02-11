Return-Path: <SRS0=7Ms1=QS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A76C169C4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:31:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96FC62229E
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Feb 2019 17:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="buiO3wlP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="I55BPff+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96FC62229E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9llTLgwoYeZPIxtohqhrZ6qlqBeOre7OJCEfOFEsvrY=; b=buiO3wlPWVo61F
	Yu9kSDfPQCE8L00iN29W8SzEExQ24wcWWvGXkg+e2pGou0kqCfBOYOMYNKouJX5pM3BlyZC8UVRKT
	fwDpDFLDVeYGUfU7icl8k6hMEbIxoEkINMDrnNwoCc1PPrf91lTQvkCjxrJo05zVHYCRss05MtoLi
	n1x8yhTG5zs2vBCbVNNtKpW0FjLhW4fia4vuXDiPFr6yqm8++2ykqC32siuaOkOAFKnXSbKcS2ur2
	bTx7jTAAhb2F+CjEc22t7B9wdW2zIA4XxYxBXtYhff4uFniS1axiqNSuzW4FPuAxCJL5yQfnTOaUu
	nerqUcW1Ex6+b4L3wvfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtFQK-0001h6-R9; Mon, 11 Feb 2019 17:31:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtFOm-0007IB-S6
 for linux-mtd@lists.infradead.org; Mon, 11 Feb 2019 17:29:44 +0000
Received: from sol.localdomain (c-107-3-167-184.hsd1.ca.comcast.net
 [107.3.167.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28F89222AA;
 Mon, 11 Feb 2019 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549906180;
 bh=O1s9QR+U5uXIM+tBQ7kbiZnh0426uIGCqpIneePqUCo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I55BPff+g6eSJjOYbO353oLgLkIqcf4lnaA0HwRjIdMMqK+IX3fG6fmGcC6r0TtOm
 E/lCqaFyqv90JMrLrphTyLR60l+OuxcfGeWDVGwBnUPy5tb/KQRkQak1mnBrwYeE3+
 OylpZcBvu8kovIa6/4QuiLSxBF0qKW45wEcGAYeY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [RFC PATCH v2 08/20] fs/inode.c: export inode_lru_list_del()
Date: Mon, 11 Feb 2019 09:27:26 -0800
Message-Id: <20190211172738.4633-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211172738.4633-1-ebiggers@kernel.org>
References: <20190211172738.4633-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_092940_987373_C58977C7 
X-CRM114-Status: GOOD (  10.31  )
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
that is overkill and not usable by non-root users.

In preparation for allowing fs/crypto/ to evict just the needed inodes,
make inode_lru_list_del() non-static.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/inode.c         | 4 +---
 include/linux/fs.h | 1 +
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 0cd47fe0dbe5..037df483c9af 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -426,10 +426,8 @@ void inode_add_lru(struct inode *inode)
 		inode_lru_list_add(inode);
 }
 
-
-static void inode_lru_list_del(struct inode *inode)
+void inode_lru_list_del(struct inode *inode)
 {
-
 	if (list_lru_del(&inode->i_sb->s_inode_lru, &inode->i_lru))
 		this_cpu_dec(nr_unused);
 }
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 70d929ac89f9..326cbb044596 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2986,6 +2986,7 @@ extern void unlock_new_inode(struct inode *);
 extern void discard_new_inode(struct inode *);
 extern unsigned int get_next_ino(void);
 extern void evict_inodes(struct super_block *sb);
+extern void inode_lru_list_del(struct inode *inode);
 
 extern void __iget(struct inode * inode);
 extern void iget_failed(struct inode *);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
