Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586DDCD6E57
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2026 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVlXSuT1zrJugCZWSZlJ1TLLobSLYgVE9I8hUQ4VtKU=; b=xOiLk9FApNWqed
	9MrKfnkct/zAcZtKB3DJgzwdfkKGwBsM8D00Pqb5OvXVJ57Eo/Jjr2SoPv5q0VI+q6ZPraZBwDEyS
	B1cBAJZPkOAvJCTPpcOpztBEuouk6NPQUMhiSJDL2yv/P7ylh7AhS74+zSIuNWzlvUjSlKgum7qwN
	I2K9qku9MKz6dKfuuTidjlYjA0P6h+dhCr5b4/D5ynLOPSwl2PqqTJLSJn2dy/oG59nQj4TghoM+e
	fTC68epkg4B8lG7VK2JkS/Rtz/KF197/ZnXfvt04Wbv7Dm5kz75MLym2r1TM67jPYh0IpWwPgMyKC
	LR1QGM3uXY5jmeeyiKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoam-0000000FWrI-1mxo;
	Wed, 03 Jun 2026 16:37:20 +0000
Received: from azure-sdnproxy.icoremail.net ([4.193.249.245])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUoaj-0000000FWqu-1Q9R
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jun 2026 16:37:19 +0000
Received: from enjou-Legion-Y7000P-2019 (unknown [172.23.56.36])
	by app1 (Coremail) with SMTP id ygmowAAHKMIyWCBqbNZWAA--.10101S3;
	Thu, 04 Jun 2026 00:37:10 +0800 (CST)
From: Ren Wei <n05ec@lzu.edu.cn>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	yuantan098@gmail.com,
	yifanwucs@gmail.com,
	tomapufckgml@gmail.com,
	bird@lzu.edu.cn,
	rakukuip@gmail.com,
	n05ec@lzu.edu.cn
Subject: [PATCH 1/1] ubifs: fix slab-out-of-bounds in pack_inode via xattr
Date: Thu,  4 Jun 2026 00:37:02 +0800
Message-ID: <28e06b0bb4babfb7138beb31efa2c6bb1400ea36.1780496711.git.rakukuip@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1780496711.git.rakukuip@gmail.com>
References: <cover.1780496711.git.rakukuip@gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: ygmowAAHKMIyWCBqbNZWAA--.10101S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGFW7try7GFWxArW5ur4kWFg_yoW5Wry7pF
	y3K3s8trWkXw13Kr1F9r48u3yY9an7Ka13WwnrCr1Syay5Jr1xtFyrKFyrZryUJFWrCaya
	qF1j9w18Wa1ay37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
	87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcV
	Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
	6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMxkIecxEwVCm
	-wCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48MxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUbSfO7UUUUU==
X-CM-SenderInfo: zqqvvuo6o23hxhgxhubq/1tbiAQEHCWof488IbQAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_093717_755338_5AB8A530 
X-CRM114-Status: GOOD (  10.18  )
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

From: Luxiao Xu <rakukuip@gmail.com>

An issue in fs/ubifs/journal.c was found where a malicious or corrupted
ubifs image could trigger a slab-out-of-bounds write in pack_inode().

When an inode with extended attributes (xattrs) is being evicted or
deleted (i.e., 'last_reference' and 'kill_xattrs' are true),
ubifs_jnl_write_inode() calculates the allocation size 'write_len'
based on 'ui->xattr_cnt' from the disk.

However, if 'ui->xattr_cnt' is maliciously tampered with or corrupted
to be smaller than the actual number of xattr entries stored in the
TNC (Tree Node Cache), kmalloc() will allocate an undersized buffer.
The subsequent 'while (1)' loop continues to iterate through all actual
xattr entries via ubifs_tnc_next_ent(), advancing the 'ino' pointer
and invoking pack_inode() for each entry. This mismatch leads to an
out-of-bounds memory write, corrupting the slab redzone and triggering
a KASAN panic.

Fix this by introducing a strict counter 'xattrs_deleted' within the
deletion loop. The loop is aborted with -EUCLEAN if the number of
processed xattrs exceeds 'ui->xattr_cnt', preventing 'ino' from
overflowing the allocated kmalloc buffer.

The bug is reachable by a non-root user via user and net namespace.

Fixes: 7959cf3a7506 ("ubifs: journal: Handle xattrs like files")
Cc: stable@kernel.org
Reported-by: Yuan Tan <yuantan098@gmail.com>
Reported-by: Yifan Wu <yifanwucs@gmail.com>
Reported-by: Juefei Pu <tomapufckgml@gmail.com>
Reported-by: Xin Liu <bird@lzu.edu.cn>
Signed-off-by: Luxiao Xu <rakukuip@gmail.com>
Signed-off-by: Ren Wei <n05ec@lzu.edu.cn>
---
 fs/ubifs/journal.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index d02509920baf..78fe9d2a3178 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -880,6 +880,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 		struct fscrypt_name nm = {0};
 		struct inode *xino;
 		struct ubifs_dent_node *xent, *pxent = NULL;
+		int xattrs_deleted = 0;
 
 		if (ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
 			err = -EPERM;
@@ -899,6 +900,14 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 				goto out_release;
 			}
 
+			if (xattrs_deleted >= ui->xattr_cnt) {
+				kfree(pxent);
+				kfree(xent);
+				err = -EUCLEAN;
+				ubifs_err(c, "xattr count mismatch for ino %lu", inode->i_ino);
+				goto out_release;
+			}
+
 			fname_name(&nm) = xent->name;
 			fname_len(&nm) = le16_to_cpu(xent->nlen);
 
@@ -917,6 +926,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 			clear_nlink(xino);
 			pack_inode(c, ino, xino, 0);
 			ino = (void *)ino + UBIFS_INO_NODE_SZ;
+			xattrs_deleted++;
 			iput(xino);
 
 			kfree(pxent);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
