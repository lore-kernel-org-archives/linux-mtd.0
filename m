Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4746A606A31A
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Oct 2026 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hF/ubykR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=hqvobs24;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IcforvgU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PXuB/4fAYussGZqB0PKToMgc8nPj/0jMC2E/Te8c9Lw=; b=hF/ubykR7qIJTTwW03xwjikmM2
	uvwZbgnVW+tMU2bV0WoFg7UNMOtwsQA2MkEgFnhtiu3gW3V1DQAhsPhU1stPl+7jL6qIfMcl/VUds
	dSgC+nHJt8duwPfzyaG8LRK/q9M2GERGZ4s9TvNRLuNlG29Xe1oOkS6EWHF07UoqCFObu/b8siDTg
	PyTJjvQYQxcYJS608i8fnm+GdEyBVKr143ReGBCe/fvMoXQ/t7s40lZdDa+u30ycvhS5yg7wbct+n
	oz4n9MLokJhsm8VPGCEDLWNFVtNbBlb/Zs5OhRENr+VdvjzESg37p5wnUL+Yshnt1qmaGkeuYwwIF
	kcVk8vSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKato-00000000BHu-0Fwd;
	Sat, 24 Oct 2026 12:31:00 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKati-00000000BGv-02AH
	for linux-mtd@lists.infradead.org;
	Sat, 24 Oct 2026 12:30:56 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id C271B1300FA1
	for <linux-mtd@lists.infradead.org>; Sat, 24 Oct 2026 08:30:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 08:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1792845049; x=
	1792848649; bh=BX3h784nlZkKHs1VaapVIBduZWJ0fvF929JAJjAxBps=; b=h
	qvobs24uO3iyDRoiO2Z6efnraD8aloU0NKQtwRvhiXSWlJtVjnZB0f1FNNmNGGkz
	Jqj6vKAYT6daHW3gei/vedOg+YoMjwR31AXUJwg+O2Mgazwb0Vjx62e3Q9wWK34+
	W15S4UZdXjUDomf7niTABNp0v88jIfP8QoCuizRHciYrSQdj3xpAgTg7jFdRjKvv
	loItxuVizpH9rX+I3AvePVoo1AC+xMZsI3flbJbQRbpC+nkm5UQWV1fEQvjobAq+
	DZqRVYgtI66+hwnRm+Cftq2FdJdb2s6gv8Y5LCQRd2iQXOPSBT9XW2l7MjiGiLDU
	oevesaV4q8g10J2SYf4Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792845049; x=1792848649; bh=BX3h784nlZkKHs1VaapVIBduZWJ0
	fvF929JAJjAxBps=; b=IcforvgUVVWRynpVTdKsDSbW3i8lC3qJfWLPASz/7LMq
	vTCKCR/w9QnjVli6KNiDMmPj2nFKX1ZXsL6QAneQjOBRQW52K5CsIYd+vHvA3Jof
	OtChDz+oYg+0cbo3BlAtEU6w53mPqQPZrCYDjbWhE9ukewdsMirdhn2fCXsMDxtB
	yZ9KgLs3cf2xJ368pVP2f7JDFzgichHCUtaT6x+mPqc93Y04iUl3X62aFg/VyXla
	uYQEcVifTyCHBzr5gY3KhwqH4hPmyxZA7GoFD3bcicAshauQdL1OAhMc/2VugPJt
	9RZOwLkyysbEo8ykIQrmsgSS38fbxdHFYCW7HKhS/w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792845049; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPg==;
	s=fm1:rsa-sha256:dICfmbQ+03pIcvLVv8SbTLkM64vwtyRbBNy7ELcMvU2/Zt9
	70ru5zjk7FxB2Xi/N1X4AAT9SIiuvS2NsUjREvIAee1TTi+J3oLIgI4pcPQZkrUs
	YL52qieS0hU9197pNbPK6JI5E8WUaY3PRYZOsQZA2UpxCDYv1JC9ODiOA6e0lZIs
	FjUqUt729aZuAhIImnbfUyYNU9OrdYglroKJDo370SNYQQoPrBpBTwhVSjACSRZA
	g6wm0OqLyzKPInY5slhskoXvr0Ie0m69xHkUnQX+w0FZSXvmjWJ2AQCJfDECXKDy
	quUGyEFRW/50V6es3yMK58OGIvt+eEFP5Ov7qxQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:JJVHwqiG2o/5SOEde/EvMV/8qaikxQTbXPnsZdW0M+c=:X4ij2PMFNMvkaGRSojAN61Pyua1WINB8JZzqqoI/IOs=;
X-ME-Sender: <xms:-KTcapE0_UhGBthy9Lqkwbh6pT_pSLUAzKSy2n0P-t7KI2QvwZ-jmA>
    <xme:-KTcapJ7RKDmRwBUCL7nvgr4H57PUTyy0RZMl8V3LcK6SN9x52FvQcAx5_Zfy2P1X
    HwT4ypghNPHQ78TPSs693qCIG-GCEZxo9z3N6w8LvU1Z3NfOX7sHlUB>
X-ME-Proxy-Cause: dmFkZTFcNf/WwB4t+u7TH6ItGsJLBDHJLERUFO7AXn82czZYhKxTF1w5cdpp8KbgcTzKyC
    LeWWHg6SZN6idvVfOy5JA+DlPD99+/8FgEIu3lE9IpdPrsx3NT5wN2dpe/6hJEt79l8opH
    kXYRAvZ+jAj7ZtceJoTSJVSsvbLVG7yj7BiLWUJKUiojC4Fk0rBBIhfD1KThZ6fQGx2iql
    GGowOWPZ4MY3Trw6qG+xfS5Kd6YF2ybZAGaiHjVWB7YtVZs4XjdOKNFLhZBRFYq02vXVkm
    k6UvYBBFhYdCQ/anBmz4lDK2Lwd4kuGKkHVyGvp+LOoP3dggoaokoRD7bT/9+dY2slAKa4
    JDmd2A7UTxuleEKwBZqbaS8PFNTgsr5RlK5xLE1iY/y7FUP9BUMcaq+eU6z5qRRB3EiaVo
    v41ZaJ6JyWJk9KMCsbKEH113z8ljwd2oqm/pj8AKU3i+Xj4An2mJrbJL7ele3oPIklDdS1
    s4dWIopewnmA/v8MZnKlQmA6KjOCMDiqrtiCAEzPgZx2f3GpIyEyA9oL3ALJ6pvGLk/gYo
    nr+vlKLJu5UmDCotA9CcbgGAWMI5KGQ08mxWvs53X7xtYPMskf7buKK8j6cUyzA2e9uORu
    4CZt/ETUPZiNdX2OmljMP9YIFm2SOjaomjlxDwyW2Zu2+RDxHXTv8kCOkytA
X-ME-Proxy: <xmx:-KTcagOfTE36BmkJ7KztekqtJJlqGX4NhP8K5mVIuwHNHRe12vL7vA>
    <xmx:-KTcaia01j8ELf_Ir-WoT9HajdkaGe8A1Z6qUkVRgr0kGRP2wLJ9Yw>
    <xmx:-KTcaqzrN6PqvrZLRsecL-OVdyjBqkcXPXm_qhp9jXbf-nMft-ENxw>
    <xmx:-KTcatLGSEK26ps_z5sAlaPx2kv23FoyI5GGawIatDNk9ALZlyXLlg>
    <xmx:-aTcair2QvaYQWLGL22MB1pJw1uPvYOZ7W48QLqHmdZSt8qRF_rroFWk>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C819E700069; Sat, 24 Oct 2026 08:30:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 08:30:48 -0400
From: "Alejandro Pacheco" <ale@alepacheco.dev>
To: "Richard Weinberger" <richard@nod.at>
Cc: "Zhihao Cheng" <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <82903e1b-56b0-4947-b0ed-5c24a536491a@alepacheco.dev>
Subject: [PATCH] ubifs: check the length of index branches before reading them
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_053054_577263_F3376204 
X-CRM114-Status: GOOD (  18.86  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alejandro Pacheco <ale@alepacheco.dev>

read_znode() validates each branch of the index node it reads: the LEB
number and offset of every branch and, in a level 0 znode, the length of
the leaf node the branch points to, against c->ranges[]. In a znode above
level 0, where each branch points to another index node, the length is
not checked:

	if (znode->level)
		continue;

When such a child is loaded, ubifs_load_znode() calls read_znode() for
it, which allocates c->max_idx_node_sz bytes and has ubifs_read_node()
read zbr->len bytes into them. Before the read, that length is bounded
by the space left in the LEB but not by the size of the buffer; the
length in the node header is compared with it and with c->ranges[] only
after the read. So an image with a branch length larger than
c->max_idx_node_sz, but within the LEB, can cause a heap buffer overflow.

dbg_check_old_index(), which walks the old index on the media when the
chk_index debugging check is enabled, reads each child index node by its
branch length the same way, into a buffer sized for an index node of
c->fanout branches, without checking the length.

validate_master() already checks the root index node's length,
c->zroot.len, against c->ranges[UBIFS_IDX_NODE]. Give every other index
branch the same check before it is used for a read: in read_znode(), by
running the length check level 0 branches get with type UBIFS_IDX_NODE,
and in dbg_check_old_index(). Images written by UBIFS or mkfs.ubifs are
not affected: an index node is ubifs_idx_node_sz() of its 1 to fanout
branches long, which is the range in c->ranges[UBIFS_IDX_NODE], and
ubifs_read_node() already rejects a length outside it, though only after
the read.

This needs a crafted image (the CRC of the index node holding the branch
catches random corruption), and mounting UBIFS needs CAP_SYS_ADMIN in
the initial user namespace.

It was tested on a KASAN UML kernel built from this tree, with UBI on a
64 MiB mtdram device and the chk_index debugging check enabled. A tree of
1,830 files in 30 directories was copied to a freshly formatted volume,
read back after a remount, partly deleted and copied again, and read
back after another remount; the same tree was read back from a second
volume written by mkfs.ubifs. Across the remounts, read_znode() read 909
index nodes above level 0, and dbg_check_old_index() walked the old
index at 20 commits, the whole index of each volume as it was on the
media among them, with no KASAN report, warning or UBIFS error. This only
runs the new checks on valid index nodes: no image with a bad branch
length was made. It builds with no new warnings (W=1, x86_64 defconfig
with UBIFS and KASAN), and checkpatch.pl --strict reports nothing.

An LLM coding assistant was used to find this bug and to write this
patch and its changelog.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Cc: stable@vger.kernel.org
Signed-off-by: Alejandro Pacheco <ale@alepacheco.dev>
---
 fs/ubifs/commit.c   | 5 +++++
 fs/ubifs/tnc_misc.c | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 5b3a840098b..0e50b584248 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -696,6 +696,11 @@ int dbg_check_old_index(struct ubifs_info *c, struct ubifs_zbranch *zroot)
 		lnum = le32_to_cpu(br->lnum);
 		offs = le32_to_cpu(br->offs);
 		len = le32_to_cpu(br->len);
+		if (len < c->ranges[UBIFS_IDX_NODE].min_len ||
+		    len > c->ranges[UBIFS_IDX_NODE].max_len) {
+			err = 8;
+			goto out_dump;
+		}
 		key_read(c, &br->key, &lower_key);
 		if (iip + 1 < le16_to_cpu(idx->child_cnt)) {
 			br = ubifs_idx_branch(c, idx, iip + 1);
diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index 10b222dc6a5..e3ae17977c9 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -357,9 +357,9 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 		}
 
 		if (znode->level)
-			continue;
-
-		type = key_type(c, &zbr->key);
+			type = UBIFS_IDX_NODE;
+		else
+			type = key_type(c, &zbr->key);
 		if (c->ranges[type].max_len == 0) {
 			if (zbr->len != c->ranges[type].len) {
 				ubifs_err(c, "bad target node (type %d) length (%d)",

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
