Return-Path: <SRS0=WHT+=SC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40015C43381
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 18:43:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F6DB2085A
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 18:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q9q+i1ez";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="Y/+PgGHa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F6DB2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:MIME-Version:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kb4O/qCVJKNAAM+Ec1joHYoMlTBTG5BuFPXsYqq9OWw=; b=Q9q+i1ezSMHlXS
	adLqBgPvNyqqyRHUbJnESpvvDmq3PHCeHIBT4mCgcfMzz3zVvB+oeWu2Y/P/SXlbm6NImYQEOmNcl
	A7TYlX/9mDPeJ4AwbH+F4dpIQSYKImdTlVn3Bh3GHB5uh86AGMbGjfW/1T+O3B1IyefQnBoBzJ2jQ
	SpneTpstEYy53QZ9/Wx9VWe+x1BnChDEGxSmzGhzkjw1TastWWeRjamhs9K5KtUpF6JNJY+YrUMPp
	y3AC3z1ylEwZpxWZfkltM9nOJhM2HGP1nxXAiRtX1lZEfJroiXQBfkttjkCYULyQFECsySszu3GAi
	nnPRFB1Mjwmc5k61Mbaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAfPx-0002A3-JR; Sun, 31 Mar 2019 18:42:53 +0000
Received: from forward500j.mail.yandex.net ([5.45.198.250])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAfPu-00029L-PP; Sun, 31 Mar 2019 18:42:52 +0000
Received: from mxback17j.mail.yandex.net (mxback17j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::93])
 by forward500j.mail.yandex.net (Yandex) with ESMTP id 1E51F11C1464;
 Sun, 31 Mar 2019 21:42:44 +0300 (MSK)
Received: from unknown (unknown [::1])
 by mxback17j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id KwCsOCYHiD-gcoGq6VZ;
 Sun, 31 Mar 2019 21:42:43 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1554057763; bh=JFksomYSy0T0gwELzRc9nqikWaLsJ8m/UtkxfBRMQW0=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=Y/+PgGHaGltCG8QCNUfPCHfLgcdHiSyn5IfCPW90+dc2hrsZ21s7ZrJtPV6+F7VYJ
 WtxhiCxQ2FcFSSI6BB/zyIG6Z0Ja0xPkafDmMuqHHkEs0h+rhTnRZGQrBz8Su+b2uR
 lUGdLn1sFK5nszEf6grW723IeHDrpjlPQ5iYGlto=
Authentication-Results: mxback17j.mail.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by myt6-2fee75662a4f.qloud-c.yandex.net with HTTP;
 Sun, 31 Mar 2019 21:42:38 +0300
From: Andrey Abramov <st5pub@yandex.ru>
To: vgupta <vgupta@synopsys.com>, benh <benh@kernel.crashing.org>,
 paulus <paulus@samba.org>, mpe <mpe@ellerman.id.au>,
 tglx <tglx@linutronix.de>, mingo <mingo@redhat.com>, bp <bp@alien8.de>,
 hpa <hpa@zytor.com>, x86 <x86@kernel.org>, mark <mark@fasheh.com>,
 jlbec <jlbec@evilplan.org>, richard <richard@nod.at>,
 dedekind1 <dedekind1@gmail.com>, adrian.hunter <adrian.hunter@intel.com>,
 gregkh <gregkh@linuxfoundation.org>,
 naveen.n.rao <naveen.n.rao@linux.vnet.ibm.com>,
 jpoimboe <jpoimboe@redhat.com>, Dave Chinner <dchinner@redhat.com>,
 darrick.wong <darrick.wong@oracle.com>,
 ard.biesheuvel <ard.biesheuvel@linaro.org>, George Spelvin <lkml@sdf.org>,
 linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 ocfs2-devel <ocfs2-devel@oss.oracle.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, sfr <sfr@canb.auug.org.au>,
 Morton Andrew <akpm@linux-foundation.org>
In-Reply-To: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
Subject: [PATCH v2 3/5] ocfs2: dir, refcounttree,
 xattr: replace swap functions with built-in one
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sun, 31 Mar 2019 21:42:38 +0300
Message-Id: <20793681554057758@myt6-2fee75662a4f.qloud-c.yandex.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_114251_224717_6106A601 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
Cc: amir73il <amir73il@gmail.com>, yuehaibing <yuehaibing@huawei.com>,
 "ge.changwei" <ge.changwei@h3c.com>,
 "ashish.samant" <ashish.samant@oracle.com>, piaojun <piaojun@huawei.com>,
 jiangyiwen <jiangyiwen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace dx_leaf_sort_swap, swap_refcount_rec and swap_xe functions
with built-in one, because they do only a simple byte to byte swap.

Since Spectre mitigations have made indirect function calls more
expensive, and the default simple byte copies swap is implemented
without them, an "optimized" custom swap function is now
a waste of time as well as code.

Signed-off-by: Andrey Abramov <st5pub@yandex.ru>
Reviewed by: George Spelvin <lkml@sdf.org>
---
 fs/ocfs2/dir.c          | 13 +------------
 fs/ocfs2/refcounttree.c | 13 +++----------
 fs/ocfs2/xattr.c        | 15 +++------------
 3 files changed, 7 insertions(+), 34 deletions(-)

diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
index c121abbdfc7d..4b86b181df0a 100644
--- a/fs/ocfs2/dir.c
+++ b/fs/ocfs2/dir.c
@@ -3529,16 +3529,6 @@ static int dx_leaf_sort_cmp(const void *a, const void *b)
 	return 0;
 }
 
-static void dx_leaf_sort_swap(void *a, void *b, int size)
-{
-	struct ocfs2_dx_entry *entry1 = a;
-	struct ocfs2_dx_entry *entry2 = b;
-
-	BUG_ON(size != sizeof(*entry1));
-
-	swap(*entry1, *entry2);
-}
-
 static int ocfs2_dx_leaf_same_major(struct ocfs2_dx_leaf *dx_leaf)
 {
 	struct ocfs2_dx_entry_list *dl_list = &dx_leaf->dl_list;
@@ -3799,8 +3789,7 @@ static int ocfs2_dx_dir_rebalance(struct ocfs2_super *osb, struct inode *dir,
 	 * This block is changing anyway, so we can sort it in place.
 	 */
 	sort(dx_leaf->dl_list.de_entries, num_used,
-	     sizeof(struct ocfs2_dx_entry), dx_leaf_sort_cmp,
-	     dx_leaf_sort_swap);
+	     sizeof(struct ocfs2_dx_entry), dx_leaf_sort_cmp, NULL);
 
 	ocfs2_journal_dirty(handle, dx_leaf_bh);
 
diff --git a/fs/ocfs2/refcounttree.c b/fs/ocfs2/refcounttree.c
index 1dc9a08e8bdc..7bbc94d23a0c 100644
--- a/fs/ocfs2/refcounttree.c
+++ b/fs/ocfs2/refcounttree.c
@@ -1400,13 +1400,6 @@ static int cmp_refcount_rec_by_cpos(const void *a, const void *b)
 	return 0;
 }
 
-static void swap_refcount_rec(void *a, void *b, int size)
-{
-	struct ocfs2_refcount_rec *l = a, *r = b;
-
-	swap(*l, *r);
-}
-
 /*
  * The refcount cpos are ordered by their 64bit cpos,
  * But we will use the low 32 bit to be the e_cpos in the b-tree.
@@ -1482,7 +1475,7 @@ static int ocfs2_divide_leaf_refcount_block(struct buffer_head *ref_leaf_bh,
 	 */
 	sort(&rl->rl_recs, le16_to_cpu(rl->rl_used),
 	     sizeof(struct ocfs2_refcount_rec),
-	     cmp_refcount_rec_by_low_cpos, swap_refcount_rec);
+	     cmp_refcount_rec_by_low_cpos, NULL);
 
 	ret = ocfs2_find_refcount_split_pos(rl, &cpos, &split_index);
 	if (ret) {
@@ -1507,11 +1500,11 @@ static int ocfs2_divide_leaf_refcount_block(struct buffer_head *ref_leaf_bh,
 
 	sort(&rl->rl_recs, le16_to_cpu(rl->rl_used),
 	     sizeof(struct ocfs2_refcount_rec),
-	     cmp_refcount_rec_by_cpos, swap_refcount_rec);
+	     cmp_refcount_rec_by_cpos, NULL);
 
 	sort(&new_rl->rl_recs, le16_to_cpu(new_rl->rl_used),
 	     sizeof(struct ocfs2_refcount_rec),
-	     cmp_refcount_rec_by_cpos, swap_refcount_rec);
+	     cmp_refcount_rec_by_cpos, NULL);
 
 	*split_cpos = cpos;
 	return 0;
diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index 3a24ce3deb01..b3e6f42baf78 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -4175,15 +4175,6 @@ static int cmp_xe(const void *a, const void *b)
 	return 0;
 }
 
-static void swap_xe(void *a, void *b, int size)
-{
-	struct ocfs2_xattr_entry *l = a, *r = b, tmp;
-
-	tmp = *l;
-	memcpy(l, r, sizeof(struct ocfs2_xattr_entry));
-	memcpy(r, &tmp, sizeof(struct ocfs2_xattr_entry));
-}
-
 /*
  * When the ocfs2_xattr_block is filled up, new bucket will be created
  * and all the xattr entries will be moved to the new bucket.
@@ -4249,7 +4240,7 @@ static void ocfs2_cp_xattr_block_to_bucket(struct inode *inode,
 	trace_ocfs2_cp_xattr_block_to_bucket_end(offset, size, off_change);
 
 	sort(target + offset, count, sizeof(struct ocfs2_xattr_entry),
-	     cmp_xe, swap_xe);
+	     cmp_xe, NULL);
 }
 
 /*
@@ -4444,7 +4435,7 @@ static int ocfs2_defrag_xattr_bucket(struct inode *inode,
 	 */
 	sort(entries, le16_to_cpu(xh->xh_count),
 	     sizeof(struct ocfs2_xattr_entry),
-	     cmp_xe_offset, swap_xe);
+	     cmp_xe_offset, NULL);
 
 	/* Move all name/values to the end of the bucket. */
 	xe = xh->xh_entries;
@@ -4486,7 +4477,7 @@ static int ocfs2_defrag_xattr_bucket(struct inode *inode,
 	/* sort the entries by their name_hash. */
 	sort(entries, le16_to_cpu(xh->xh_count),
 	     sizeof(struct ocfs2_xattr_entry),
-	     cmp_xe, swap_xe);
+	     cmp_xe, NULL);
 
 	buf = bucket_buf;
 	for (i = 0; i < bucket->bu_blocks; i++, buf += blocksize)
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
