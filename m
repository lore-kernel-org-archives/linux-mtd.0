Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55F8C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 02:04:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89144610A0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 02:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89144610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9UGYR9EsIS6SRxakId7rGIQlavUc0lT99v45p+7QBQ8=; b=08dpIWjKuSq31k
	11Uk/cJk+Aj09emn6AnjcJIF/GCJBMkZ1dMKzBNM6/orgcdCQMeEg78wJzHlcoiw/bA+1tO+ne+YO
	rWp+xQEguO0KWI77W/6swlODoRBLld5SMp/KcdAj+gb6jVpc1bNHhM9/8LRDf8h0vfdLEnsA6sxDP
	3MVcrwbO6eq0mD/YpF5f9eXNMIGTk6ZYvcNOBroNrd3Y3IBuTB1dcTVM4NMTywF+9ySlZGXk4NJz+
	hNA7LpUfI0Or3H1bRtbGKmsHJRTT4f5ksxsvnIxu8nJNe+Jtz6fqQ2oK6uTRRPEXQkZAZnKudEWFJ
	lgc9mHdEuzd1RcpAyWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfYIV-003Xrs-24; Wed, 27 Oct 2021 02:04:11 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfYIS-003Xql-0y
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 02:04:09 +0000
Received: by mail-qt1-x82b.google.com with SMTP id f1so1106231qto.9
 for <linux-mtd@lists.infradead.org>; Tue, 26 Oct 2021 19:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhK2ULnAWsX7Fx7Vd3h0Eahl3TagF58JKrFXTfBQV8s=;
 b=NQqmQIVNDYONphrskpLth8VCqiBDZmC4UF6AXeWoj5W45Xa6aCU4opYu2xKVAMFPtv
 bDQW2TFj8h6kfjxwKmjageW8GpspCSPaG1PqpncVjTtGkXfgl+uNBnsZ7y/IuRIWI9Uu
 dRarVOac/Q2ozMCEJgG76vjwdXr9BnKDn4PdRD2SswwuBtlv50LaVcqW6Zoo5LoupxVG
 xcgyH1iODoZHoFyP5Ol6+l7hZ8gi600dSzNRipld2dUD0DF2MpO1yHcGBLy6ha7zuqG4
 psenbhXRkJwQBQ010mNsBuzC2EfYBOB5PYgj0MvrezzxehBPan2VLKObWyCt7xlIgupH
 Ixdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhK2ULnAWsX7Fx7Vd3h0Eahl3TagF58JKrFXTfBQV8s=;
 b=4ppa+YaCXjudDRv28GBmuxitCZN5kFstc++EDB3uVW3tQyZtoMW0sC8DiqWHhiIRrQ
 eSbYsmf1NeQj81X0If71SDb1bENg2ge4WtV8ZDtuJThWl2rqgMhy6XGwxNOV7HwhvbuJ
 VX7VJgr3EDxx5IsNyleC1zxuc4ADmsv8WCDtgr8+NVNX0f6cn/hHxBcPaEf/6miH773B
 E87+68XSg2v5c+YKGDANSVU7I2By4M6SX7ird0tFlzIzILTRTNe1nFL0/5aJEZKP4IJ0
 vLKOyyMCBvA3XWUwP4KxMZZVLQc+CP3Dh66xqUcc7XtoOQr0/5byOrqUoreTalv+7TIV
 jkqQ==
X-Gm-Message-State: AOAM530+EI+l/WyzMOCLQvoMJ2r+AMnZWeWj0qngpBBeluKIPgyl/6iW
 oiAtsaVnih691vOrLUJAoXk=
X-Google-Smtp-Source: ABdhPJwMdiTqq+SY7B1faruagcfttHyyDBhH429hTPMkwrglt0EhH36spXmQOhBSnfEOjXaOV9mw9Q==
X-Received: by 2002:ac8:7fcf:: with SMTP id b15mr28249426qtk.363.1635300245777; 
 Tue, 26 Oct 2021 19:04:05 -0700 (PDT)
Received: from atari.nover ([189.6.36.155])
 by smtp.gmail.com with ESMTPSA id m17sm12145838qtx.62.2021.10.26.19.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 19:04:05 -0700 (PDT)
From: Wagner Popov dos Santos <wpopov@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: wpopov@gmail.com
Subject: [PATCH 1/2] jffs2: solving deadlock between GC and new inodes
Date: Tue, 26 Oct 2021 23:03:38 -0300
Message-Id: <20211027020339.65303-1-wpopov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_190408_109251_4E63A7A4 
X-CRM114-Status: GOOD (  22.40  )
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

Correct AB-BA deadlock between the GC kthread and a process
that is creating a new file, symlink, and etc.

Create a new JFFS2 inode state to signalizing that the inode
can't be acquired by the GC because is being created. When this
state happens, the GC releases the alloc_sem, sleep, and then
tries again.

To create a new file, the JFSS2 request a new locked inode
to the Linux's FS layer and then insert inside of some JFFS2's
Erase Block. To finish the creation, the process needs to
acquire the alloc_sem semaphore. Just at the end that the
inode is released by the JFFS2. If the GC starts to process an
Erase Block that contains an inode that is being created, can
occur an AB-BA deadlock if the GC acquires the alloc_sem before
the end of the inode's creation because the CG needs to acquire
all inodes inside the EB to finish the iteration.

This deadlock can occur more frequently with partition mounted
with sync flag (not usual).

Signed-off-by: Wagner Popov dos Santos <wpopov@gmail.com>
---
 fs/jffs2/dir.c       |  4 ++++
 fs/jffs2/gc.c        | 10 ++++++++++
 fs/jffs2/nodelist.h  |  1 +
 fs/jffs2/readinode.c |  1 +
 fs/jffs2/wbuf.c      |  3 ++-
 fs/jffs2/write.c     |  6 +++++-
 6 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index f20cff1194bb..57299cd8a0d7 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -210,6 +210,7 @@ static int jffs2_create(struct inode *dir_i, struct dentry *dentry,
 		  f->inocache->pino_nlink, inode->i_mapping->nrpages);
 
 	d_instantiate_new(dentry, inode);
+	jffs2_set_inocache_state(c, f->inocache, INO_STATE_PRESENT);
 	return 0;
 
  fail:
@@ -430,6 +431,7 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
 	jffs2_complete_reservation(c);
 
 	d_instantiate_new(dentry, inode);
+	jffs2_set_inocache_state(c, f->inocache, INO_STATE_PRESENT);
 	return 0;
 
  fail:
@@ -574,6 +576,7 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	jffs2_complete_reservation(c);
 
 	d_instantiate_new(dentry, inode);
+	jffs2_set_inocache_state(c, f->inocache, INO_STATE_PRESENT);
 	return 0;
 
  fail:
@@ -745,6 +748,7 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	jffs2_complete_reservation(c);
 
 	d_instantiate_new(dentry, inode);
+	jffs2_set_inocache_state(c, f->inocache, INO_STATE_PRESENT);
 	return 0;
 
  fail:
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 9ed0f26cf023..72090843fa19 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -208,6 +208,8 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 			spin_unlock(&c->inocache_lock);
 			BUG();
 
+			/* fall through */
+		case INO_STATE_CREATING:
 		case INO_STATE_READING:
 			/* We need to wait for it to finish, lest we move on
 			   and trigger the BUG() above while we haven't yet
@@ -394,6 +396,14 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
 		spin_unlock(&c->inocache_lock);
 		BUG();
 
+		/* fall through */
+	case INO_STATE_CREATING:
+		/* We can't process this inode while it is being created
+		 * to avoid a deadlock condition the inode is locked.
+		 * However, to finish the creation we need to unlock the
+		 * alloc_sem() and because we dropped the alloc_sem we must
+		 * return to start again from the beginning.
+		 */
 	case INO_STATE_READING:
 		/* Someone's currently trying to read it. We must wait for
 		   them to finish and then go through the full iget() route
diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 0637271f3770..0033eeee27e4 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -192,6 +192,7 @@ struct jffs2_inode_cache {
 #define INO_STATE_GC		4	/* GCing a 'pristine' node */
 #define INO_STATE_READING	5	/* In read_inode() */
 #define INO_STATE_CLEARING	6	/* In clear_inode() */
+#define INO_STATE_CREATING	7	/* Inode locked! GC can't touch */
 
 #define INO_FLAGS_XATTR_CHECKED	0x01	/* has no duplicate xattr_ref */
 #define INO_FLAGS_IS_DIR	0x02	/* is a directory */
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 389ea53ea487..3a841645bc86 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1336,6 +1336,7 @@ int jffs2_do_read_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 			goto retry_inocache;
 
 		case INO_STATE_READING:
+		case INO_STATE_CREATING:
 		case INO_STATE_PRESENT:
 			/* Eep. This should never happen. It can
 			happen if Linux calls read_inode() again
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index c6821a509481..860fe878c324 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -518,7 +518,8 @@ static void jffs2_wbuf_recover(struct jffs2_sb_info *c)
 								      (void *)(buf?:c->wbuf) + (ref_offset(raw) - start));
 			} else if (unlikely(ic->state != INO_STATE_PRESENT &&
 					    ic->state != INO_STATE_CHECKEDABSENT &&
-					    ic->state != INO_STATE_GC)) {
+					    ic->state != INO_STATE_GC &&
+					    ic->state != INO_STATE_CREATING)) {
 				JFFS2_ERROR("Inode #%u is in strange state %d!\n", ic->ino, ic->state);
 				BUG();
 			}
diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
index cda9a361368e..ec48947ac916 100644
--- a/fs/jffs2/write.c
+++ b/fs/jffs2/write.c
@@ -35,7 +35,11 @@ int jffs2_do_new_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 	f->inocache = ic;
 	f->inocache->pino_nlink = 1; /* Will be overwritten shortly for directories */
 	f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
-	f->inocache->state = INO_STATE_PRESENT;
+	f->inocache->state = INO_STATE_CREATING;
+	/* The initial state can't be INO_STATE_PRESENT to avoid a deadlock in
+	 * GC because the new inode is still locked and the GC needs to lock
+	 * the inode to get it.
+	 */
 
 	jffs2_add_ino_cache(c, f->inocache);
 	jffs2_dbg(1, "%s(): Assigned ino# %d\n", __func__, f->inocache->ino);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
