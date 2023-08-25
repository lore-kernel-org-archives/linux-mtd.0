Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91907C3DA66
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vD+2saW2/VDEWPaBSqi4yjfm2nfV7J4vSqMSNAjREtw=; b=lgDovuVDYfLBQF
	JVX/NGjG/UJ65MIwF4pt9vWXdmsOk7tCpPQwLmTK8Sm+mjDyh3oS2CtaO0lj9GMzah/GlYyNM/lhN
	8n4PC6YUNxK0373Bd1ob3yFD6XDZdzHPA4o9WUeZSmv6JMzmhW/BUovvbCUja/hvNZj0kggks4p32
	QXfyoyzy3kHU0bcfXx1IadnufcLV0ns5c5LGwR/XOHghDWgQX6OIhxA0tnCld5YymcwuMjt50lLXa
	MB6Yd8RbwdJa9ByLo8/Yar4sPuRWHk3XhZ1tr+aBkm4bvvc3G6Mmf0LGe9HHejjMl0Rrqs6GkkzRd
	H49ftoq5fO/WbdQ6+z8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXHY-005Uy4-1v;
	Fri, 25 Aug 2023 13:55:24 +0000
Received: from out-252.mta1.migadu.com ([95.215.58.252])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXHV-005UxI-2H
	for linux-mtd@lists.infradead.org;
	Fri, 25 Aug 2023 13:55:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1692971717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7eywqhb1fMAXTeyjh6BJsPONBLehGvo8wJ7nQSmBJs=;
	b=sf0c3BaV5zKRH4Bb8TUwfPopplZAFyQJxSB3uPd/Bru862GHE/6uLEqra/FCbrZoDX4RQi
	CIrt1XneKgBJ/A8gWA/etx0kgRlpMUcGJTfa14yTcf5Kv3L0Wt8Br8rgcIz1PY9X6AeQ+Q
	Vrx6zJaXOEDBrQhrS+G7Zr51TGkx4FM=
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Cc: Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>,
	Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-mm@kvack.org,
	linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org,
	linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org,
	linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: [PATCH 01/29] fs: split off vfs_getdents function of getdents64 syscall
Date: Fri, 25 Aug 2023 21:54:03 +0800
Message-Id: <20230825135431.1317785-2-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_065521_893014_9FC43B4D 
X-CRM114-Status: GOOD (  12.49  )
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

From: Dominique Martinet <asmadeus@codewreck.org>

This splits off the vfs_getdents function from the getdents64 system
call.
This will allow io_uring to call the vfs_getdents function.

Co-developed-by: Stefan Roesch <shr@fb.com>
Signed-off-by: Stefan Roesch <shr@fb.com>
Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/internal.h |  8 ++++++++
 fs/readdir.c  | 34 ++++++++++++++++++++++++++--------
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index f7a3dc111026..b1f66e52d61b 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -304,3 +304,11 @@ ssize_t __kernel_write_iter(struct file *file, struct iov_iter *from, loff_t *po
 struct mnt_idmap *alloc_mnt_idmap(struct user_namespace *mnt_userns);
 struct mnt_idmap *mnt_idmap_get(struct mnt_idmap *idmap);
 void mnt_idmap_put(struct mnt_idmap *idmap);
+
+/*
+ * fs/readdir.c
+ */
+struct linux_dirent64;
+
+int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
+		 unsigned int count);
diff --git a/fs/readdir.c b/fs/readdir.c
index b264ce60114d..9592259b7e7f 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -21,6 +21,7 @@
 #include <linux/unistd.h>
 #include <linux/compat.h>
 #include <linux/uaccess.h>
+#include "internal.h"
 
 #include <asm/unaligned.h>
 
@@ -351,10 +352,16 @@ static bool filldir64(struct dir_context *ctx, const char *name, int namlen,
 	return false;
 }
 
-SYSCALL_DEFINE3(getdents64, unsigned int, fd,
-		struct linux_dirent64 __user *, dirent, unsigned int, count)
+
+/**
+ * vfs_getdents - getdents without fdget
+ * @file    : pointer to file struct of directory
+ * @dirent  : pointer to user directory structure
+ * @count   : size of buffer
+ */
+int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
+		 unsigned int count)
 {
-	struct fd f;
 	struct getdents_callback64 buf = {
 		.ctx.actor = filldir64,
 		.count = count,
@@ -362,11 +369,7 @@ SYSCALL_DEFINE3(getdents64, unsigned int, fd,
 	};
 	int error;
 
-	f = fdget_pos(fd);
-	if (!f.file)
-		return -EBADF;
-
-	error = iterate_dir(f.file, &buf.ctx);
+	error = iterate_dir(file, &buf.ctx);
 	if (error >= 0)
 		error = buf.error;
 	if (buf.prev_reclen) {
@@ -379,6 +382,21 @@ SYSCALL_DEFINE3(getdents64, unsigned int, fd,
 		else
 			error = count - buf.count;
 	}
+	return error;
+}
+
+SYSCALL_DEFINE3(getdents64, unsigned int, fd,
+		struct linux_dirent64 __user *, dirent, unsigned int, count)
+{
+	struct fd f;
+	int error;
+
+	f = fdget_pos(fd);
+	if (!f.file)
+		return -EBADF;
+
+	error = vfs_getdents(f.file, dirent, count);
+
 	fdput_pos(f);
 	return error;
 }
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
