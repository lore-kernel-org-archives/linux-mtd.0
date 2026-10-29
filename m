Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96561606A31A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2026 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JuG75+4Q;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=PGgBTEDI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3mKqH4sq7ckY92hNTXwyP1yBTpHyBpqhlRz1uOxn50c=; b=JuG75+4QeB4kndjksqdCxX8EWi
	ewWEIMq+rFDCwRwa6rgmjpMBb9Djtx5Tjcum572m0s/WrWr1DUzTXvnxQWypibTyiFWVOW2Av8y7I
	uQRIHcJ0fmBJZdidkEC1Qb7mJ2hapCujXLWzo0YEPHPVcw8d39H2wL0MW4Ivhw/zXydIekwwZLqhc
	jYb0kmkUaIH+GIdBzg6/78LoEblYbn9WJe+WH8gz4whMkFYLhqiZB7+wwVGUdy9eKNn6FMlIrdYER
	iJEbjK6HdTiMmX4SrHi6nMEznfoHEIm91cXeAZ32pngSZlZxsTc2MZC4mS8ralxViWwEs7K9H5d9l
	kYMvCX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMYo-00000008s0r-1adE;
	Thu, 29 Oct 2026 09:36:38 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMYj-00000008rzb-3mfL
	for linux-mtd@lists.infradead.org;
	Thu, 29 Oct 2026 09:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793266584; bh=QbA0yKmP1tqlBqk0XBzSCkNF2nGhAJ8D22bj1XP53Cw=;
	h=From:To:Cc:Subject:Date;
	b=PGgBTEDIDNOZ/VFluDkAckBsho8ULubxskIr6n3Els+o0aHyGGh9T81DhK+ca6Ci8
	 lPHzDpB+wYKGBF3DRZiboceNVAE/CmW3rEHDYaFiJgHRZGUAdboAhAAn86YzenoDBb
	 oQ/y3QCcLRA4NT81bswJ9RsB+iE15Nv8eu8X8h/o=
Received: from shuai-VMware-Virtual-Platform.. ([171.8.225.58])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 91620CBE; Thu, 29 Oct 2026 17:36:22 +0800
X-QQ-mid: xmsmtpt1793266582tlfqundro
Message-ID: <tencent_B7C43D503A8965459EB1690D174EEC604205@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5boKhaSNR/rZUOKK1Y7onsMxuQ/UyWk3DK8LolyXwmRPNEPA01c
	 ag5fh9X19epMPLFmR5ffz7KDTvDVrfN+M74wPSF51KSIOHgnxwFrFZqHkghEBuGJXK4ddHH5BzJY
	 JREsbDwupMmSgx7atnGQUyh/ii0Z63Zq+qvaWkQGOTaXCOSBHxrw5+kn0adRA8c8tz8b5nPeKiZT
	 XUWxd83gZkUmmhpwnGhp4qn3QoHZp/hJ34inParppM33zDw7QXQyoUquB9B1Zfc0Tf8PloCtW41U
	 q0+lp4NxK93sRiRxBsJ7ghfvWWHz/DTS4q24JU3yhoZGONm2qPOfrQBqMxNS/7xTXk+yv9G1Iuz7
	 fwJp1HXuK2+DAcaLNyzeKx6D/X7DctVF7nxPFAiNC43yRg/Q7HQyLQyQPQVJ9CKlggzKzm8O9RyF
	 Xs0dtNk6fQxVsuLq7ubI2eg/jYsi1A7Z321KYL5bwOLs8bYE9/dQxn4CUX7nYnQ3q03znMfz/Kg6
	 h4w3Kh+SPmERsj3oHpsB51rbm5wN5SZPwPdyT11LdrgmdhH6r9klg1mGQRXZ6IG/qZaGdYcqN0L3
	 ClK3UlUF8ojcosddKfYY1Mnzm1OLsjn0EzQuBjF8pGYvNCDhKb9ejhjLksdExhdcy69ECyp59IFd
	 oGrRPcS5NsJH9rLXy37MyGYwujDVLvhoKjIdXCvRmKBh3UxwrgJu+Hh5OqoGajuVh+SGT2eou0k1
	 zQw3pzM8fTEwjXzXbXzKyD2XjM3mgE3Be2952e3QzssuX9+ad8sd0JNTtnuRUt8PL6gqwsVoSxFf
	 hZURfnoYwFlgsapOcxhqf7BgSHSnKDIP+CwdRux5+HBH5tQ3kXABeQouUWmoWof/R5SBoMegjbAh
	 5db0uZShXi8V05rnQsWZmkSDfQnvXfvUgNwvvIf4+50uDNX42kHniQ5OlYSmBrUKkJWJztje6yMK
	 ofjITAhQwD2z0q4rAIRggV6e6Z4cefEC2DOp2ac3B2BLQEty/MxFL8ebXXwl6Q9Avp2Xn+skklsr
	 MnNHztaglmax0wvCS14qIPUvZ064ioN7uWH42mr9iGkGnR4xzE2BenLrJwL5a/FV+1K2Zj7OVs7p
	 Ksd0L3T+Cm2IqLEh4=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org,
	richard@nod.at,
	chengzhihao1@huawei.com,
	syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] jffs2: prevent xattr_sem -> fs_reclaim deadlock
Date: Thu, 29 Oct 2026 17:36:22 +0800
X-OQ-MSGID: <20261029093622.3152309-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_023634_485153_93D45201 
X-CRM114-Status: GOOD (  14.85  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

do_jffs2_setxattr() and several other xattr paths allocate memory
(e.g. jffs2_alloc_xattr_datum() via kmem_cache_alloc() inside
create_xattr_datum()) and write to flash while holding
c->xattr_sem, using GFP_KERNEL.  Such allocations may enter direct
reclaim and take fs_reclaim, establishing the
xattr_sem -> fs_reclaim dependency.

kswapd, on the other hand, holds fs_reclaim while shrinking
dcaches and inodes: shrink_slab() -> prune_dcache_sb() ->
dentry_kill() -> evict() -> jffs2_do_clear_inode() ->
jffs2_xattr_delete_inode() takes down_write(&c->xattr_sem),
giving the reverse fs_reclaim -> xattr_sem dependency.  The
resulting lock cycle can deadlock:

    CPU0                    CPU1
    ----                    ----
    lock(xattr_sem)         lock(fs_reclaim)
    lock(fs_reclaim)        lock(xattr_sem)

syzbot reports exactly this circular dependency with lockdep [1]:
kswapd0 acquiring xattr_sem in jffs2_xattr_delete_inode() while
holding fs_reclaim, with the recorded chain showing
do_jffs2_setxattr() allocating (jffs2_alloc_xattr_datum() ->
kmem_cache_alloc() -> fs_reclaim_acquire) while holding
xattr_sem.

Fix it by wrapping every critical section that holds c->xattr_sem
and can allocate memory or write flash with
memalloc_nofs_save()/memalloc_nofs_restore(), so allocations made
under xattr_sem never enter direct reclaim.  This cuts the
xattr_sem -> fs_reclaim edge; reclaim contexts taking xattr_sem
remain harmless.  The covered paths are:

  - jffs2_xattr_delete_inode(): delete_xattr_ref() writes flash
  - check_xattr_ref_inode(): load_xattr_datum() allocates,
    delete_xattr_ref() writes flash
  - the write-lock upgrade sections of jffs2_listxattr() and
    do_jffs2_getxattr(): load_xattr_datum() allocates
  - do_jffs2_setxattr(): create_xattr_datum() allocates,
    save_xattr_ref() writes flash (both lock sections)
  - jffs2_garbage_collect_xattr_datum() /
    jffs2_garbage_collect_xattr_ref(): jffs2_reserve_space_gc()
    may trigger GC, save_xattr_datum()/save_xattr_ref() write
    flash
  - jffs2_verify_xattr(): do_verify_xattr_datum() reads flash

jffs2_xattr_free_inode() is deliberately left alone: it only
frees memory and cannot allocate.

A related but distinct cycle between fs_reclaim and &f->sem
(jffs2_do_read_inode() allocates while holding f->sem during
iget) also exists; it is a separate issue not addressed here.

Verified with the syzbot reproducer under QEMU (mtdram + JFFS2 +
OverlayFS, CONFIG_PROVE_LOCKING=y): without this patch lockdep
reports the xattr_sem <-> fs_reclaim cycle reproduced above;
with this patch that warning no longer appears.

[1] https://syzkaller.appspot.com/bug?id=eefefd759ef3b48ddad4da086ff8f4b9194576f9

Reported-by: syzbot+fdfd8fdf716c90baef0f@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fdfd8fdf716c90baef0f
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 fs/jffs2/xattr.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 6b4f68593c29..7b873fe2e08d 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -15,6 +15,7 @@
 
 #include <linux/kernel.h>
 #include <linux/slab.h>
+#include <linux/sched/mm.h>
 #include <linux/fs.h>
 #include <linux/time.h>
 #include <linux/pagemap.h>
@@ -598,10 +599,20 @@ void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache
 	/* It's called from jffs2_evict_inode() on inode removing.
 	   When an inode with XATTR is removed, those XATTRs must be removed. */
 	struct jffs2_xattr_ref *ref, *_ref;
+	unsigned int nofs;
 
 	if (!ic || ic->pino_nlink > 0)
 		return;
 
+	/*
+	 * delete_xattr_ref() below writes flash nodes.  This function runs
+	 * from inode eviction, i.e. memory reclaim may be waiting for this
+	 * lock.  Keep allocations under xattr_sem out of direct reclaim so
+	 * that holders of xattr_sem never wait on fs_reclaim -- otherwise
+	 * reclaim contexts taking xattr_sem while holding fs_reclaim can
+	 * deadlock with the setxattr() paths doing the reverse.
+	 */
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
 	for (ref = ic->xref; ref; ref = _ref) {
 		_ref = ref->next;
@@ -609,6 +620,7 @@ void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache
 	}
 	ic->xref = NULL;
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 }
 
 void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
@@ -638,10 +650,12 @@ static int check_xattr_ref_inode(struct jffs2_sb_info *c, struct jffs2_inode_cac
 	 * one will be removed.
 	 */
 	struct jffs2_xattr_ref *ref, *cmp, **pref, **pcmp;
+	unsigned int nofs;
 	int rc = 0;
 
 	if (likely(ic->flags & INO_FLAGS_XATTR_CHECKED))
 		return 0;
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
  retry:
 	rc = 0;
@@ -683,6 +697,7 @@ static int check_xattr_ref_inode(struct jffs2_sb_info *c, struct jffs2_inode_cac
 	ic->flags |= INO_FLAGS_XATTR_CHECKED;
  out:
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 
 	return rc;
 }
@@ -973,6 +988,7 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	const char *prefix;
 	ssize_t prefix_len, len, rc;
 	int retry = 0;
+	unsigned int nofs = 0;
 
 	rc = check_xattr_ref_inode(c, ic);
 	if (unlikely(rc))
@@ -990,6 +1006,7 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 				retry = 1;
 				up_read(&c->xattr_sem);
 				down_write(&c->xattr_sem);
+				nofs = memalloc_nofs_save();
 				goto retry;
 			} else {
 				rc = load_xattr_datum(c, xd);
@@ -1027,6 +1044,7 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 		up_read(&c->xattr_sem);
 	} else {
 		up_write(&c->xattr_sem);
+		memalloc_nofs_restore(nofs);
 	}
 	return rc;
 }
@@ -1040,6 +1058,7 @@ int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
 	struct jffs2_xattr_datum *xd;
 	struct jffs2_xattr_ref *ref, **pref;
 	int rc, retry = 0;
+	unsigned int nofs = 0;
 
 	rc = check_xattr_ref_inode(c, ic);
 	if (unlikely(rc))
@@ -1059,6 +1078,7 @@ int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
 				retry = 1;
 				up_read(&c->xattr_sem);
 				down_write(&c->xattr_sem);
+				nofs = memalloc_nofs_save();
 				goto retry;
 			} else {
 				rc = load_xattr_datum(c, xd);
@@ -1089,6 +1109,7 @@ int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
 		up_read(&c->xattr_sem);
 	} else {
 		up_write(&c->xattr_sem);
+		memalloc_nofs_restore(nofs);
 	}
 	return rc;
 }
@@ -1102,6 +1123,7 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 	struct jffs2_xattr_datum *xd;
 	struct jffs2_xattr_ref *ref, *newref, **pref;
 	uint32_t length, request;
+	unsigned int nofs;
 	int rc;
 
 	rc = check_xattr_ref_inode(c, ic);
@@ -1120,6 +1142,7 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 	}
 
 	/* Find existing xattr */
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
  retry:
 	for (ref=ic->xref, pref=&ic->xref; ref; pref=&ref->next, ref=ref->next) {
@@ -1189,6 +1212,7 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 		JFFS2_WARNING("jffs2_reserve_space()=%d, request=%u\n", rc, request);
 		unrefer_xattr_datum(c, xd);
 		up_write(&c->xattr_sem);
+		memalloc_nofs_restore(nofs);
 		return rc;
 	}
 	if (ref)
@@ -1206,6 +1230,7 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 	}
  out:
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 	jffs2_complete_reservation(c);
 	return rc;
 }
@@ -1226,8 +1251,10 @@ int jffs2_garbage_collect_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xatt
 				      struct jffs2_raw_node_ref *raw)
 {
 	uint32_t totlen, length, old_ofs;
+	unsigned int nofs;
 	int rc = 0;
 
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
 	if (xd->node != raw)
 		goto out;
@@ -1255,6 +1282,7 @@ int jffs2_garbage_collect_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xatt
 	if (!rc)
 		jffs2_mark_node_obsolete(c, raw);
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 	return rc;
 }
 
@@ -1262,8 +1290,10 @@ int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_
 				    struct jffs2_raw_node_ref *raw)
 {
 	uint32_t totlen, length, old_ofs;
+	unsigned int nofs;
 	int rc = 0;
 
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
 	BUG_ON(!ref->node);
 
@@ -1289,6 +1319,7 @@ int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_
 	if (!rc)
 		jffs2_mark_node_obsolete(c, raw);
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 	return rc;
 }
 
@@ -1298,8 +1329,10 @@ int jffs2_verify_xattr(struct jffs2_sb_info *c)
 	struct jffs2_eraseblock *jeb;
 	struct jffs2_raw_node_ref *raw;
 	uint32_t totlen;
+	unsigned int nofs;
 	int rc;
 
+	nofs = memalloc_nofs_save();
 	down_write(&c->xattr_sem);
 	list_for_each_entry_safe(xd, _xd, &c->xattr_unchecked, xindex) {
 		rc = do_verify_xattr_datum(c, xd);
@@ -1322,6 +1355,7 @@ int jffs2_verify_xattr(struct jffs2_sb_info *c)
 		spin_unlock(&c->erase_completion_lock);
 	}
 	up_write(&c->xattr_sem);
+	memalloc_nofs_restore(nofs);
 	return list_empty(&c->xattr_unchecked) ? 1 : 0;
 }
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
