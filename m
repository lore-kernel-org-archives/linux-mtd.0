Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A5EC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 20:26:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E96B2082E
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 20:26:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mt5XJ7fi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLsC90CW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E96B2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+CbV/e2WYs3gjqn5KBt72CekEbpWK3Lp47KxOOea8g=; b=mt5XJ7fihL2WV9
	JAXPbue3QzkEAYoukD5ZA39GPFe37nKn1KQvMxxGq2mifYkS2h0nqfx71gGx4kkZSIJUEmHU4nEIc
	Ub9orrbkzJx0OqKVdQsk2x4S8zpNLoTEYuAJe0HSugDHrCZ9EJF56UAbvvBr/kYNY+zuAzTsEiUDp
	X7hpVMTCwSCY+4qJ0J70wX9FWt0qMqd5e3MyBLtLEerUxh/C7I5BPEGZzlpyKYz8gopsb4zAEdHM+
	MBcCjVlm1Iq+iU5EtJRSz0/6XNE/DQyLCKLXNmK8kCgP8atuJirQM2TOU5OXVaj8Lg4amiC/gXNMd
	ImKZu4p3a+PP8MCs06kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEJnX-0000HC-Gb; Wed, 10 Apr 2019 20:26:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEJnN-0008VZ-8S
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 20:26:10 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C26A420850;
 Wed, 10 Apr 2019 20:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554927969;
 bh=WV51qsVI19+rWykitwrkiRjpaVEoV6Twv7Glfb8itQM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TLsC90CWn6BBuZQXN6eNs6BNi0rHwyBrgSkYQwEg2mGZRkGIHnmImjSkYrJASyr23
 0pjoO75x7cLXu9538m1MMXV+1XJ0vOXefRT+psfazoQHIMUdCxhwQXgFQjLXqjMWsb
 yZBuC//8QyuZqXnjWEKTjcpclltl3/16bbrfXDXk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: [PATCH v2 1/2] vfs: use READ_ONCE() to access ->i_link
Date: Wed, 10 Apr 2019 13:21:14 -0700
Message-Id: <20190410202115.64501-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.392.gf8f6787159e-goog
In-Reply-To: <20190410202115.64501-1-ebiggers@kernel.org>
References: <20190410202115.64501-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_132609_315931_2B4AE053 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Use 'READ_ONCE(inode->i_link)' to explicitly support filesystems caching
the symlink target in ->i_link later if it was unavailable at iget()
time, or wasn't easily available.  I'll be doing this in fscrypt, to
improve the performance of encrypted symlinks on ext4, f2fs, and ubifs.

->i_link will start NULL and may later be set to a non-NULL value by a
smp_store_release() or cmpxchg_release().  READ_ONCE() is needed on the
read side.  smp_load_acquire() is unnecessary because only a data
dependency barrier is required.  (Thanks to Al for pointing this out.)

Cc: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/namei.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/namei.c b/fs/namei.c
index dede0147b3f6e..2855de004c1a9 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1066,7 +1066,7 @@ const char *get_link(struct nameidata *nd)
 		return ERR_PTR(error);
 
 	nd->last_type = LAST_BIND;
-	res = inode->i_link;
+	res = READ_ONCE(inode->i_link);
 	if (!res) {
 		const char * (*get)(struct dentry *, struct inode *,
 				struct delayed_call *);
@@ -4729,7 +4729,7 @@ int vfs_readlink(struct dentry *dentry, char __user *buffer, int buflen)
 		spin_unlock(&inode->i_lock);
 	}
 
-	link = inode->i_link;
+	link = READ_ONCE(inode->i_link);
 	if (!link) {
 		link = inode->i_op->get_link(dentry, inode, &done);
 		if (IS_ERR(link))
-- 
2.21.0.392.gf8f6787159e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
