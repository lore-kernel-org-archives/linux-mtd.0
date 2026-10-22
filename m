Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98A8606A322
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qGvF+PjY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=gHv2AEIL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=o0vM1+laZ/pM56KCufxVmbYvlz5cOjf5kIud9HQko+U=; b=qGvF+PjYtwRa51gD2PS2uvJ753
	DO/0pTTXGg1r9VRcg4rmEDAB0z8dbteXbkOxMY7Es/MqJ6pgj/ogVZ3ws+DUvs9nfNki8qdVWqVfQ
	D3qHYiYYXZI2u0OA5FXaTWQC5bL/ToyZ+ja4lDzFQnDooWLLOO0Uxx/gIWC3MY/l4zViNTJcKIgkY
	w1y3AEgOglfCAUaKBmjQRIlNsvhCGmJnyVB7KeE4anaC0fPp+7a4+OmTAB6JWTVAgq776e19fPxUO
	UW6mpYg8TTrcPslYC6uQnTH4G1ymATpqJ3PbVhdJ2l2ubhHB3U/mROVMKOOPc/e7uGzv/VxKoSzvB
	15y6LPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxNt-0000000EhC9-1SX0;
	Thu, 22 Oct 2026 18:19:25 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxNq-0000000EhBk-2KA2
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 18:19:24 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6df5e315bd1so62143eaf.2
        for <linux-mtd@lists.infradead.org>; Thu, 22 Oct 2026 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=artiphishell.com; s=google; t=1792693161; x=1793297961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zgrpe7JsmaN5TXdCk9XO8/nBWq60c5XZRX2ESQ08pm0=;
        b=gHv2AEIL/mAXGYdnGIY1Rlj8opt8vN+ZZlT8yolD3PXN+1O6bn8NM30QNBfHo+SESG
         Sq9zRrqRxtJ4JbyiKKari/hyntRRXL4QMZpTjhzP5O/sR6sKWi73RSbZOaHqS8uTBT3X
         TUlGWBVwdL+g9Upr/Ufdgy9PDP7q7IYYbsjhvyLvbANoXesd+obYq5Lgwfl4N7EloEXI
         +88nHCWX5yRXdG/CqTwipORLxkT4bVpoxDF7AxgvAxqdmUN0Hp335zsFNwRP5oe7KZf1
         sGz0fSCQMEYMiXzYkYMh+W6HcgR1MVMbHCgqNciQX938KljcxXXqtJh4GXsWLj2urUMx
         rjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693161; x=1793297961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zgrpe7JsmaN5TXdCk9XO8/nBWq60c5XZRX2ESQ08pm0=;
        b=RsQaZBBUQ5CuPZxwbZ0Ufvxy5G5JQkaiDe9qu5JFL9pyVs6T1zPz7lC4+o2xwEHCGO
         d7+v8QTPDi/31FuBv5Hb5dwyv9DzYgviTJL/NAWBv/+dnPCoZDf+aOMpekrUlc+pNz+U
         QPkKn9Hr39BrDmAwDXqOzcekyH7LkImGwR4Zk2Q08A0ULADnYyLeq2e0abKFnAYX51XP
         JGclRhkpDjJFU3DbfS4mmExGxZqh3duSxmQ7G352bMbG3xb+9fn5Wd2f8RIVQHXkWLTo
         R0MMazw1NHIFlu/xvh1ySSJfnHaucU9RsM9lFaT2eA0+7uimTj8/gKZgeYzfMxdsUkyB
         Ry6w==
X-Gm-Message-State: AFq9FYLn+GG1sJGBMc6ydQhLZ2Kaa9zD+rJkf9KOG6j362PlXhCLjd3V
	2vST80cbBaBDRjFZf2BW2bhRy0T2M7YF9R8r324G/lYXsSDfdnrZ80veLwvHlYwjbow51qwfj/X
	iXPazStUK
X-Gm-Gg: AYBFou3EtNJKG6GMgyFzgBo2iT9OJc1s2lnK3FP87fD8cj9m8NmOrVLortdG/3v2OOJ
	jDsdxfgXrqDLJ1JVWifJxe+blwGSGE3Wn3DOYrHzIzW86AT0zLEVPELWU3gl7hudnakpjJoV8eH
	f//I+kdnd216KZWSN9bTf6aJwrTI8oA+3qvMUwHpnUrPp44stR4+fQFgEP7mWRB2Y7VE0yfl53M
	3pPmPtm8bd6kkZDwVdRb4L4LH4D6ICmszJjlvPekP9bjqL3uTa4hFtfHxO5O+r3TJ5qEUSXPys8
	i9lkYkRRvHGgXQD5Vc4AVNwAzy9H5Lk0nSZfZ0AE3XU4XH/ewho+ePSy2eZkhgUFKjFU7aXzzkW
	MJLU4uohuhyhmnR11w2sE3GB0g9XJ9dMEIxCGYdJfMDR27ziNzlbnVjTJY+DX5GV9DFKA5zDaG+
	Pe3EpdEDhsseOIHB/jsrXNzU1p+MXpNTZx2opaho1SIDLUlfuntFV/BfxizHOQoAGUPb1S5bveA
	9lK4UDXgLdftZ4dd5Tn0mtDtNYWRaSBbSu3tkxqVM4Ynr6TsA1us176P9QcmzMS/FdIyiUP
X-Received: by 2002:a05:6820:704f:b0:6cd:3fdb:fa6f with SMTP id 006d021491bc7-70b88bab6e4mr113554eaf.90.1792693160492;
        Thu, 22 Oct 2026 11:19:20 -0700 (PDT)
Received: from nixos ([2601:280:4a87:2c8d:3b7b:2fa6:c84c:64a7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f786ef383sm409818a34.23.2026.10.22.11.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:19:18 -0700 (PDT)
From: Jay Vadayath <jay@artiphishell.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jay Vadayath <jay@artiphishell.com>
Subject: [PATCH] jffs2: reject undersized input in jffs2_dynrubin_decompress
Date: Thu, 22 Oct 2026 11:19:05 -0700
Message-ID: <20261022181905.35588-1-jay@artiphishell.com>
X-Mailer: git-send-email 2.51.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_111922_621228_1EC22C40 
X-CRM114-Status: GOOD (  17.25  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jffs2_dynrubin_decompress() reads an 8-byte probability prefix
(data_in[0..7]) out of a compressed data node and then passes
sourcelen - 8 (csize - 8) as the input length to rubin_do_decompress().
The compressed buffer is a kmalloc(csize) slab filled from the on-disk
node, but nothing checks that csize is at least 8 before the prefix is
read or before the subtraction. When a node declares csize < 8 the read
of data_in[0..7] already runs past the end of the slab, and sourcelen - 8
underflows to roughly 4 GiB, which defeats the pullbit() bound and lets
rubin_do_decompress() keep reading unbounded.

A hostile jffs2 image that carries a data node with
compr == JFFS2_COMPR_DYNRUBIN (on-disk id 0x03 routes to this
decompressor) and a tiny csize therefore causes an out-of-bounds read of
the compressed-input slab. Reachable from any user who can cause the file
to be read on a mounted attacker-supplied jffs2 image (e.g. cat on the
file; the image dd'd to /dev/mtdblock0 via CONFIG_MTD_MTDRAM). The
decompressor stays registered even when compression is disabled, so the
code path is always live.

  BUG: KASAN: slab-out-of-bounds in jffs2_dynrubin_decompress+0x170/0x1c0
  Read of size 1 at addr ffff888006b45a64 by task poc/125
  Call Trace:
   dump_stack_lvl+0x64/0x80
   print_report+0xd0/0x630
   kasan_report+0xe5/0x120
   jffs2_dynrubin_decompress+0x170/0x1c0
   jffs2_decompress
   jffs2_read_dnode
   ...

Reject any node whose compressed size is smaller than the 8-byte prefix
(if (sourcelen < 8) return -1;), and additionally bound pullbit() so that
a stream claiming more output than the input provides is treated as a run
of zero bits instead of walking off the kmalloc(csize) buffer.

This bug was discovered by Artiphishell, which
generated a from-scratch jffs2 image (cleanmarker + dirent + inode node
with CRCs computed via crc32_le) and a mount+cat reproducer that reliably
triggers the KASAN report on an unpatched kernel (csize=4 -> kmalloc(4)
-> reads data_in[0..7]). The fix below was drafted with the Claude coding
assistant; a userspace reproducer is available on request.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Jay Vadayath <jay@artiphishell.com>
---
 fs/jffs2/compr_rubin.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/jffs2/compr_rubin.c b/fs/jffs2/compr_rubin.c
index 9854253d0108..98bbab157c62 100644
--- a/fs/jffs2/compr_rubin.c
+++ b/fs/jffs2/compr_rubin.c
@@ -78,6 +78,12 @@ static inline int pullbit(struct pushpull *pp)
 {
 	int bit;
 
+	/* On decompress buflen bounds the input; treat an overrun as zero bits. */
+	if ((pp->ofs >> 3) >= pp->buflen) {
+		pp->ofs++;
+		return 0;
+	}
+
 	bit = (pp->buf[pp->ofs >> 3] >> (7-(pp->ofs & 7))) & 1;
 
 	pp->ofs++;
@@ -392,6 +398,10 @@ static int jffs2_dynrubin_decompress(unsigned char *data_in,
 	int bits[8];
 	int c;
 
+	/* Need the 8-byte prefix; also avoids the sourcelen-8 underflow. */
+	if (sourcelen < 8)
+		return -1;
+
 	for (c=0; c<8; c++)
 		bits[c] = data_in[c];
 
-- 
2.51.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
