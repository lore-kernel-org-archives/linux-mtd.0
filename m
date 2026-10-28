Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AAC60A3825
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JTcjSVtN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ajDwMJI48W2Tnzi5g1vRmRlkrOkRaRets9bwoCl0C/E=; b=JTcjSVtNzExICM5MU1Sn45pGYK
	tfzKG51UCCHo+bU3oB2lBO+Mpi4uRUMx3fTLl7E0VyYHxysEeTZfjUjWS+SRm8A5KsnGuwW5SlzKC
	geP8RLIc+JJbcSOcO/OJMhN7NiGYnfLZ+IFR7lS9yz5Ln/1VvUuKc0OpA2W4egUWciO1I6NC4CFyx
	VpyL8KpOapFMYVx4VPUyQ1GHmmpLIiJ/+6MoKTLAXr86XahIcOw8yBNbC1Rdd/BfXHB/48bMuX66A
	UTWnyLkNCPWok+kHzkros5BauYA99YZ3lBdShdFwe54buSbpFMO1o7zYtXaRFggvpKSA5nnLSASy7
	dZ7hJj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzzR-00000006fcO-1gUh;
	Wed, 28 Oct 2026 09:30:37 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLzzM-00000006fbz-3roL
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 09:30:35 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jF2CL5V15z4yjjX;
	Wed, 28 Oct 2026 17:30:22 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 69S9U8U0063881;
	Wed, 28 Oct 2026 17:30:08 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 28 Oct 2026 17:30:11 +0800 (CST)
X-Zmail-TransId: 2afb6ae1c0a3191-f6b36
X-Mailer: Zmail v1.0
Message-ID: <2026102817301132485IE4Ia6aXSqUo5KZUvgW@zte.com.cn>
Date: Wed, 28 Oct 2026 17:30:11 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <richard@nod.at>, <linux-mtd@lists.infradead.org>
Cc: <chengzhihao1@huawei.com>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSB1YmlmczogeGF0dHI6IGZpeCBvdXQtb2YtYm91bmRzIHdyaXRlIGluIHViaWZzX2xpc3R4YXR0cigp?=
X-MAIL: mse-fl1.zte.com.cn 69S9U8U0063881
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 28 Oct 2026 17:30:22 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE1C0AE.001/4jF2CL5V15z4yjjX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_023033_279953_684C5236 
X-CRM114-Status: GOOD (  19.38  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shao Mingyin <shao.mingyin@zte.com.cn>

ubifs_listxattr() derives the size of the name list from
ui->xattr_names + ui->xattr_cnt and uses it to reject a call whose
buffer is too small.  It then copies every visible xattr name returned
by ubifs_tnc_next_ent() without checking @size again.

Both counters are read from the on-flash inode node and are only
accounting values.  A modified image can make them under-report the
number of xattr entries while the TNC still contains more entries: the
node CRC only protects against accidental corruption, it is recomputed
for a crafted image.

The usual caller first invokes listxattr(path, NULL, 0), which returns
the too small size computed from those counters, then allocates a
buffer of that size and invokes listxattr() again.  In the second
system call fs/xattr.c:listxattr() allocates the kernel buffer with
kvmalloc(size) and passes it to ubifs_listxattr(), which copies the
names past its end.  The copied bytes are the xattr names from the
image, so part of the overflow content is attacker controlled.

Bound each copy by @size and return -ERANGE when the list does not fit.
With a corrupt image the reported size may now be too small, but the
following call fails cleanly instead of overflowing.  Note that nlen
itself is already bounded by ubifs_validate_entry(), which every node
returned by ubifs_tnc_next_ent() has passed; the missing check is only
against the caller's buffer.

While here, validate the two counters individually.  Their sum is
computed in 32 bits, so the existing check is bypassed when it wraps
around; rejecting the oversized values at mount time keeps the O(1)
size query in listxattr() from returning a wrapped (possibly negative)
length.

Mounting UBIFS requires CAP_SYS_ADMIN in the initial user namespace, so
this is only reachable with a crafted image.  Compile tested with W=1
and checkpatch --strict.  Runtime reproduction needs a modified UBI
image: change xattr_cnt/xattr_names in an inode node and recompute its
CRC; a KASAN kernel then reports the overflow on the second
listxattr() call.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Cc: stable@vger.kernel.org
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 38972786817e..fe24e1949bb3 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -82,7 +82,15 @@ static int validate_inode(struct ubifs_info *c, const struct inode *inode)
 		return 2;
 	}

-	if (ui->xattr_names + ui->xattr_cnt > XATTR_LIST_MAX)
+	/*
+	 * Both counters are read from the on-flash inode node.  Check them
+	 * individually first: the addition is performed in 32 bits and can
+	 * wrap around, which would make the check below pass for absurd
+	 * values.
+	 */
+	if (ui->xattr_cnt > XATTR_LIST_MAX ||
+	    ui->xattr_names > XATTR_LIST_MAX ||
+	    ui->xattr_names + ui->xattr_cnt > XATTR_LIST_MAX)
 		return 3;

 	if (ui->data_len < 0 || ui->data_len > UBIFS_MAX_INO_DATA)
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 3b0e8a270f59..8efe2c545bf4 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -421,8 +421,25 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 		fname_len(&nm) = le16_to_cpu(xent->nlen);

 		if (xattr_visible(xent->name)) {
-			memcpy(buffer + written, fname_name(&nm), fname_len(&nm) + 1);
-			written += fname_len(&nm) + 1;
+			int nlen = fname_len(&nm);
+
+			/*
+			 * nlen is bounded by ubifs_validate_entry(): the
+			 * node length is nlen + UBIFS_DENT_NODE_SZ + 1 and
+			 * is itself bounded by UBIFS_MAX_DENT_NODE_SZ, so
+			 * the name cannot run past the node.
+			 *
+			 * The missing bound is the caller's buffer: the
+			 * on-flash xattr counters are not authoritative and
+			 * a crafted image can under-report them.
+			 */
+			if (written + nlen + 1 > size) {
+				kfree(xent);
+				err = -ERANGE;
+				break;
+			}
+			memcpy(buffer + written, fname_name(&nm), nlen + 1);
+			written += nlen + 1;
 		}

 		kfree(pxent);
@@ -432,6 +449,9 @@ ssize_t ubifs_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	kfree(pxent);
 	up_read(&host_ui->xattr_sem);

+	if (err == -ERANGE)
+		return err;
+
 	if (err != -ENOENT) {
 		ubifs_err(c, "cannot find next direntry, error %d", err);
 		return err;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
