Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48976606A31E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Oct 2026 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oxxdW+P0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=ReYNn7wi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lcBA0IZU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dTneohmmHa1e+AmMIdXHqg5IVP/5JTMHDX8d3NVaDkQ=; b=oxxdW+P0MLHhjltNwxqh5JRzei
	LQ9M9t1wpG74t82DXCWNXGg7RKlbbB6TeeWcfyj9RLkXO0zAS7kvUfBWOaeH/GgTuSNIap92VoXcT
	GCl1P+Ny2E9ZHVzaC1uhS0iBROtI1x1PFExqQ5ZHcBzwKJOAOdZRvH+DhtfHgMH/3oQy9LQW52Lv/
	+0vPpyKbhliV//JFncAjyd8ZUULUbxurAPAZqRj+aYO/NngP1lEJEtsSG1PyyWfNOoX9TvJBFdC7X
	QJG7AV7naMWe67bnmOcwNttKPHeRKJZveonolXtDZ/ksFl5xIKJF2PaK4ChMlHx99JFiQARIq2HjY
	KcIukmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKato-00000000BI5-3tfB;
	Sat, 24 Oct 2026 12:31:00 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKati-00000000BGu-02JS
	for linux-mtd@lists.infradead.org;
	Sat, 24 Oct 2026 12:30:57 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id C260C1300E42
	for <linux-mtd@lists.infradead.org>; Sat, 24 Oct 2026 08:30:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 08:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1792845049; x=
	1792848649; bh=fR4nAOVi0FMjueZ87J+ri05TGuedSnnq73ZlTuYSav4=; b=R
	eYNn7wimgCv9LOmFWZPjBmT7kG1RIgMXNlA/MbKAtCSQIpI2G6llaAtxn0cHbiwS
	qok4rW6sBmA+s9QopsZfFXxqlHxyJUBoFFEW1P1Lb91m54REEJGcc1QzJ2cSJQgV
	TSoG5SdtidWXsHzH1z8geXWNs6IcOZqOevK2xjM8z4UlOGxBxsaEzE5sgsRdvOKl
	j/+RhkaJVF8KwHIy4exUZ483KCu84Xa4go7WGlVam+RftQDAhTCj6WkMeMZ+3c1l
	PtDKFi+g9JcbrqzuhLPgBhclR2neznZpNK1BUIPxHJ9JIEjqviLVKl5rv/XVJ+DT
	6ZR0+wEvp6Bvgh2NPO81Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792845049; x=1792848649; bh=fR4nAOVi0FMjueZ87J+ri05TGued
	Snnq73ZlTuYSav4=; b=lcBA0IZUa9c/9+/eBGZ35fEPddROhjcB9ukyAYzPL0zE
	3DowM4mlbDITrUcx/IW29briV2l7w8t7O7Ill43AmfT/OKVmBX9GvmRu+sAjDTFw
	FUhdE+LsqrXOFSmAlBMS2inqRS72SXyNMKDDqPfJawMrmTiHuhl8EB66hZdsm+Hg
	mUAm4H9HnMXjKqkzkbBxM82QHsRepNhV2fAUd+7EpnlGIsqi1A/wKkHk4VP2ZKxE
	dOaCmbGDpPkSf6/TWzcjz6Rbx7PDhGYs2YA/SgUZfLwTJEBb6PPnQqsuzt58injy
	WAIzQc7mNriKNrFUgiI7zRdUkeIZ3Dt+Mt0v7b9ooA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792845049; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPg==;
	s=fm1:rsa-sha256:Kp8iqQAyVa8Kdgybu1+PnGBk2Q/WR58TQGuzDUi3HjpHJGu
	3g5oYfR+oRy2jmSluJokOEI57zSQi76BGnZmvXt1NjIrrLKSe8flJpNLqQxtVRfr
	KsAn2M85XMTTYcHngqJ0olWiB/cndJN90z9aah9t2iNIRpj5mw+aNRA8/e+CIy/V
	XRcOBq7qLqBIFdjq6SP5Bq0WFuRyaurLFOPbqv6xVQvDZzagD7j+eMwZec+fZ/f1
	z+YjfXPKjKr+4/DMs3Lw+zKYAbYb5TrHKqxG3LmW2bQBPuhhx6yXdJrX06wa1tOK
	yiww8t1SD5DmO5CnPVGPtVXvuYE6fSNG05LSPhQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:8ZHblUlvUWCZD7xzTBM+rM1lYx913zC6mbGvlCBmwgQ=:Pm/RYbSWnnyYMA+mYKAcZbPEbXBo+iIS+6y/O2KDiMU=;
X-ME-Sender: <xms:-KTcauVKUBGxxwM1iy1-BEgHk1WiFAirKz2Om6qJRHM6cL0hYo5n7g>
    <xme:-KTcalZ1JP_asia9OsJymtk-PWImwS3pMLOLRBZbyMII7Gbuzxs9jcKph_H-iRBGn
    EvHak7AIEdojaywJDWQv-OkquCEmEspwSjtAFQ1ZxFXQLAlwr3DX9zh>
X-ME-Proxy-Cause: dmFkZTFcNf/WwB4t+u7TH6ItGsJLBDHJLERUFO7AXn82czZYhKxTF1w5cdpp8KbgcTzKyC
    LeWWHg6SZN6idvVfOy5JA+DlPD99+/8FgEIu3lE9IpdPrsx3NT5wN2dpe/6hJEt79l8opH
    kXYRAvZ+jAj7ZtceJoTSJVSsvbLVG7yj7BiLWUJKUiojC4Fk0rBBIhfD1KThZ6fQGx2iql
    GGowOWPZ4MY3Trw6qG+xfS5Kd6YF2ybZAGaiHjVWB7YtVZs4XjdOKNFLhZBRFYq02vXVkm
    k6UvYBBFhYdCQ/anBmz4lDK2Lwd4kuGKkHVyGvp+LOoP3dggoaokoRD7bT/9+dY2slAKqv
    A3quzRyopzD2fKcliuGTev8b1RaazIQEMdSf2aBRZKgg1wMDu0r2TGteJzhdlMAwkB2DXN
    RP5/OKd6S9yFwdPplDvbwk7VNM4jGrDFwTOh+GNJQl5TNQhXSHnwVQuPja0vB6DUZ/cQaX
    UEHzZdbw/cN9PTpZhnj67Y3lQw9Hdg4+pTkmZZa4gMnWSXgvpJeIHzVYxZIl9wM6b3oMs/
    8o+p0amrGzE+w8GnFTKxEI0HWGRgDvFihTxKjaBwBsTeoCIbjziSFrD6E3ktHu5yr8p8Z2
    zaO43i34IVldaXtXotLgbChZMhyjnp+RZz5H/5HvfGKbWYG+oylPu2dAM/9g
X-ME-Proxy: <xmx:-KTcajda8TKHDxKV6HjNT84LR8TCVqzX1PWu_pX_qPBajp-ki2tsxg>
    <xmx:-KTcakohG7PJYU8pwk5Cpihp2svL-mzsuVRHR6Qr9X0CMFJeEM5cGA>
    <xmx:-KTcagC8mAak6zhEfxSsVJd5iu5cN7K-ruAslHhMHsR3aq_CqkVCyg>
    <xmx:-KTcapbyHHPQCkyyxd8IJD0hzWIwXwqFapGYAapJvYq8tVinOFuQpQ>
    <xmx:-aTcapdprMQLoeQSylX2V1x1646nFBkh8FZ15SG8t_EOgZio0arO1b8z>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 473BC700065; Sat, 24 Oct 2026 08:30:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 08:30:48 -0400
From: "Alejandro Pacheco" <ale@alepacheco.dev>
To: "Richard Weinberger" <richard@nod.at>,
 "David Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <e979229f-af42-42c3-987a-c2ed289d8fda@alepacheco.dev>
Subject: [PATCH] jffs2: reject uncompressed nodes whose csize and dsize differ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_053054_577296_CD0EB29A 
X-CRM114-Status: GOOD (  19.53  )
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

jffs2_read_dnode() takes the length of an uncompressed
(JFFS2_COMPR_NONE) node's data from its on-media csize, but sizes and
bounds the copy by its dsize. Nothing checks that the two agree:

 - reading the whole node, it reads csize bytes straight into the
   caller's buffer, which holds dsize bytes, so a csize larger than
   dsize writes past the end of that buffer;
 - reading part of the node, it reads csize bytes into a csize-sized
   buffer and then copies len bytes from offset ofs of it, checking
   only that ofs + len fits in dsize, so a csize smaller than dsize
   lets the copy read past the end of that buffer.

The check that ofs + len lies within dsize is also only built when
debug messages are enabled (D1()).

For an uncompressed node csize and dsize must be equal: every writer
in the kernel, and mkfs.jffs2, writes them so. Check that, and make
the ofs + len range check unconditional, in jffs2_read_dnode(),
returning -EIO with a warning, as it does for a data CRC mismatch.
read_dnode() also drops such a node when it first checks it, as it
does a node whose totlen is wrong, so the node never enters the
inode's fragment tree.

It was tested on a generic KASAN UML kernel built from this tree, with
jffs2 on a 4 MiB mtdram device. Files written uncompressed (compr=none)
and zlib-compressed were partly overwritten, so that later reads take
part of a node, and a device node and a symlink were made, so that
whole metadata nodes are read. All of them read back correctly after
remount, after setattr and remount, and after enough writes that the
garbage collector had to erase and rewrite the device, with no KASAN
report and no warning in the kernel log. This runs the new checks on
valid nodes only: no image with mismatched sizes was made. It builds
with no new warnings (W=1, x86_64 defconfig with JFFS2 and KASAN, with
and without CONFIG_JFFS2_FS_DEBUG), and checkpatch.pl --strict reports
nothing.

An LLM coding assistant was used to find this bug and to write this
patch and its changelog.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Alejandro Pacheco <ale@alepacheco.dev>
---
 fs/jffs2/read.c      | 20 +++++++++++++++-----
 fs/jffs2/readinode.c |  8 ++++++++
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/read.c b/fs/jffs2/read.c
index 0b042b1fc82..0de9e612ed5 100644
--- a/fs/jffs2/read.c
+++ b/fs/jffs2/read.c
@@ -68,13 +68,23 @@ int jffs2_read_dnode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
 		ri->csize = cpu_to_je32(0);
 	}
 
-	D1(if(ofs + len > je32_to_cpu(ri->dsize)) {
-			pr_warn("jffs2_read_dnode() asked for %d bytes at %d from %d-byte node\n",
-				len, ofs, je32_to_cpu(ri->dsize));
-		ret = -EINVAL;
+	if (ofs + len > je32_to_cpu(ri->dsize)) {
+		pr_warn("%s(): asked for %d bytes at %d from %u-byte node at 0x%08x\n",
+			__func__, len, ofs, je32_to_cpu(ri->dsize),
+			ref_offset(fd->raw));
+		ret = -EIO;
 		goto out_ri;
-	});
+	}
 
+	/* Uncompressed data is copied straight out of a csize buffer */
+	if (ri->compr == JFFS2_COMPR_NONE &&
+	    je32_to_cpu(ri->csize) != je32_to_cpu(ri->dsize)) {
+		pr_warn("Uncompressed node at 0x%08x has csize 0x%x != dsize 0x%x\n",
+			ref_offset(fd->raw), je32_to_cpu(ri->csize),
+			je32_to_cpu(ri->dsize));
+		ret = -EIO;
+		goto out_ri;
+	}
 
 	if (ri->compr == JFFS2_COMPR_ZERO) {
 		memset(buf, 0, len);
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 1caabff9dc9..702418abfa7 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -751,6 +751,14 @@ static inline int read_dnode(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 			goto free_out;
 		}
 
+		if (unlikely(rd->compr == JFFS2_COMPR_NONE &&
+			     csize != je32_to_cpu(rd->dsize))) {
+			JFFS2_WARNING("uncompressed node at %#08x has csize %#x != dsize %#x\n",
+				      ref_offset(ref), csize, je32_to_cpu(rd->dsize));
+			jffs2_mark_node_obsolete(c, ref);
+			goto free_out;
+		}
+
 		if (jffs2_is_writebuffered(c) && csize != 0) {
 			/* At this point we are supposed to check the data CRC
 			 * of our unchecked node. But thus far, we do not

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
