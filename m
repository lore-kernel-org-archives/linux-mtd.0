Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F63B606A31A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3gRtKBhQ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=aliyun.com header.i=@aliyun.com header.a=rsa-sha256 header.s=s1024 header.b=ISVRH3RM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RElweVmgZifhSsS1k5GB265mEuP3Xz+QTPdKpuzFw9I=; b=3gRtKBhQoWRqGp4CjHUnKjMDgz
	CAfuEvw3mC2cPxkuwjHPHQsptjdzp5hbIYbOecNYxLrAovB4OzCxcrMzpSpJ1FugWGBNjhdkfnC5Q
	VjqG/6yr5RGzLaVhwP3YzTfArHG3yqidEjx2vq0LeqjOxXaMbDLA/d0bIRO8MSL9OohlIT90H1xYT
	2a5ecwlL41yNCHvW/8fHH1QdhlCP7rL0DJaya0Eij3bNzmP7I86MUWyDGIXIqbHjHM5cxH75K70Z3
	RhO6975/fi/8q1SmeIfes8m0fslhxBF2vBS+QPpWBxbihdxsMvd36d+P4rFtC177hP3zD5yxN5239
	D2uBfqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLyjb-00000006W39-3xFm;
	Wed, 28 Oct 2026 08:10:11 +0000
Received: from out30-72.freemail.mail.aliyun.com ([115.124.30.72])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLyjZ-00000006W2g-1zh0
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 08:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aliyun.com; s=s1024;
	t=1793175001; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=7Wrm5PeUcFMThrBa2sMYsth3j2Dv4nZ2meAKqS7dCpg=;
	b=ISVRH3RMjXG6Np4cxjgB45aThavk7lVtCqPgG+2ppV6DaO/ro3gc60ZFA9U9Z2kIw7WAidB6UN8tsM14GuzVcr+DVG2gSxmKvyd95v0Isk8l3OTTYZOC/3CGxK3xwRl32sfO5SpbVp+bfJwgqjnsj1z+pxlLdWWYEATZres288I=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07830165|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0857968-0.000773195-0.91343;FP=4050552545492954866|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=wdhh6@aliyun.com;NM=1;PH=DS;RN=7;RT=7;SR=0;TI=SMTPD_---0XDg8MZN_1793174997;
Received: from localhost.localdomain(mailfrom:wdhh6@aliyun.com fp:SMTPD_---0XDg8MZN_1793174997 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 28 Oct 2026 16:09:59 +0800
From: Chaohai Chen <wdhh6@aliyun.com>
To: syzbot+49c659b5564b2a44083c@syzkaller.appspotmail.com
Cc: dwmw2@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at,
	syzkaller-bugs@googlegroups.com,
	wdhh6@aliyun.com
Subject: [PATCH] jffs2: don't start the GC thread on a read-only superblock
Date: Wed, 28 Oct 2026 16:09:55 +0800
Message-ID: <20261028080955.290774-1-wdhh6@aliyun.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <6adfffa9.6200f071.51519.0f0e.GAE@google.com>
References: <6adfffa9.6200f071.51519.0f0e.GAE@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_011009_720931_E9D8D4F7 
X-CRM114-Status: GOOD (  13.49  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jffs2_do_remount_fs() derives the read-write state from fc->sb_flags,
but fc->sb_flags is only meaningful for the bits selected by
fc->sb_flags_mask.

fspick() builds its fs_context with sb_flags=0 and sb_flags_mask=0,
which means "leave every superblock flag alone"; JFFS2 misreads that
as "the filesystem is becoming read-write" and starts jffs2_gcd_mtdX
although the superblock stays read-only, and reconfigure_super()
then leaves sb->s_flags untouched.

The thread then outlives its superblock: jffs2_kill_sb() stops the
garbage collect thread only when !sb_rdonly(sb), so kfree(c) runs
while the thread is still alive and the next GC pass dereferences
freed memory.

Compute the resulting read-only state from fc->sb_flags only when
SB_RDONLY is part of fc->sb_flags_mask, falling back to the current
state otherwise, and stop any running thread unconditionally before
deciding whether to restart it.

Fixes: ec10a24f10c8 ("vfs: Convert jffs2 to use the new mount API")
Reported-by: syzbot+49c659b5564b2a44083c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=49c659b5564b2a44083c
Signed-off-by: Chaohai Chen <wdhh6@aliyun.com>
---
 fs/jffs2/fs.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 05cf860307c7..6d04dfa7b910 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -396,6 +396,15 @@ void jffs2_dirty_inode(struct inode *inode, int flags)
 int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+	/*
+	 * fc->sb_flags is only meaningful for the bits selected by
+	 * fc->sb_flags_mask.  fspick() passes a mask of 0, which leaves the
+	 * read-only state untouched - that must not be read as "becoming
+	 * read-write", or we would spawn a GC thread on a superblock that
+	 * stays read-only (and which jffs2_kill_sb() would then not stop).
+	 */
+	bool will_be_ro = (fc->sb_flags_mask & SB_RDONLY) ?
+		!!(fc->sb_flags & SB_RDONLY) : sb_rdonly(sb);
 
 	if (c->flags & JFFS2_SB_FLAG_RO && !sb_rdonly(sb))
 		return -EROFS;
@@ -404,14 +413,14 @@ int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 	   This also catches the case where it was stopped and this
 	   is just a remount to restart it.
 	   Flush the writebuffer, if necessary, else we loose it */
+	jffs2_stop_garbage_collect_thread(c);
 	if (!sb_rdonly(sb)) {
-		jffs2_stop_garbage_collect_thread(c);
 		mutex_lock(&c->alloc_sem);
 		jffs2_flush_wbuf_pad(c);
 		mutex_unlock(&c->alloc_sem);
 	}
 
-	if (!(fc->sb_flags & SB_RDONLY))
+	if (!will_be_ro)
 		jffs2_start_garbage_collect_thread(c);
 
 	fc->sb_flags |= SB_NOATIME;
-- 
2.43.7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
