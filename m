Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D85606A31E
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BXP6jlW2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=D+2HAIPh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cOXfp3geA7Hmhk2W/OnggO1nSGOf+qAghQeCgMFni/I=; b=BXP6jlW2UFP91cEybQGgZARE3l
	xsusYQwmF8ZMurMlROqYMPYzqRoBFc4fGEQU24iPsWnDHSNOG/TemYAoK1GKrZdkmPNGK7sAi8Mdx
	1JH1Kwmb1L4KO2+qzyTRKl/XlJTNLGabbAnsJBrob5d6evnvN0Cs+Z8NE5CQgG0N8/70g5XPhbHI+
	q1wWb8Pwb/s7lc9nVjWWWmYwZzL7nOf4+FajoSm0z84jttr+bCJxuMwfvN6lNcy4WrofrBl2UNeeF
	/gZO74lrHYexjPUbTiXyZ//UhGj3JgyOZSwHS+qP7gxpTudyaGEcAbS11ft4g1SwKz99k8tZJaw6U
	HOSb4qDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYb8-0000000D9bV-2Wnz;
	Thu, 26 Nov 2026 12:29:10 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYb3-0000000D9Yr-2sgd
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 12:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=XT
	XljccdonaNvjC+NUnCfR3TEYSwH8nx+I9ubDsYWNg=; b=D+2HAIPh24W8mULGZU
	tm0TZn3UHizgWw7TPudSyHjEljOLKk01NDdi3HumJlULXSZ5OJdBJLp1VHTsVfJx
	aVCl47c2Nz6iacLR0506cZeflPXKN5t4wZwBNh7wh+xse1jXZ+W9klr+BCa4tKwc
	GBE+A1s2s0uVt4f7p2l27/KJQ=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDn_ywAJghruGlULA--.30936S2;
	Thu, 26 Nov 2026 20:28:49 +0800 (CST)
From: shaos <shawnq1@163.com>
To: dwmw2@infradead.org,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] jffs2: validate summary entry offsets before scanning
Date: Thu, 26 Nov 2026 12:28:48 +0000
Message-Id: <20261126122848.1504727-1-shawnq1@163.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDn_ywAJghruGlULA--.30936S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jry5ArWxCr43GFykurWDXFb_yoWxAw47pF
	9IkrW5tF48JF43Zw4ftr1ku34fuwn7AFWUXry29wnIya97t3W8Za1rtryS9F1Fyr4DCry5
	KFs0ga15uw1UJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2VbkUUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC0AJmdGsIJgITrwAA37
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_042906_177844_92D93C68 
X-CRM114-Status: GOOD (  18.35  )
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

Hello,

A JFFS2 summary with valid CRCs can list the same on-flash node
offset more than once. The second entry is passed to
sum_link_node_ref(), and jffs2_link_node_ref() hits a BUG because
the new reference is not immediately after the preceding reference.
Mounting the crafted image on an MTD device therefore crashes the
kernel.

Validate summary entry sizes, offsets, ordering, and bounds before
adding any references. If validation fails, return to the existing
full eraseblock scan. The scan then uses the raw nodes, which remain
valid in the reproducer.

This is a manually constructed reproducer. It does not require a
sanitizer. Mounting the crafted image requires administrative access
to an MTD device. No unprivileged mount path, information disclosure,
or code execution is demonstrated.

HEAD commit:    8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
git tree:       fe970b05333fb8e41da21e9e289f652abcc7cba7
source version: Linux 7.4.0-rc4-g8d7fe9885c62
compiler:       gcc 11.4.0, GNU ld 2.38

The Gist contains the complete console output, kernel configuration,
PoC, and summary-image builder:
https://gist.githubusercontent.com/shaos26/f9e640d9007f000a2af427056e64df76/raw/ce3f8ac28eccb971bc86f16d47083c43b9b7a6af/console-output.txt
https://gist.githubusercontent.com/shaos26/f9e640d9007f000a2af427056e64df76/raw/ce3f8ac28eccb971bc86f16d47083c43b9b7a6af/kernel-config.txt
https://gist.githubusercontent.com/shaos26/f9e640d9007f000a2af427056e64df76/raw/ce3f8ac28eccb971bc86f16d47083c43b9b7a6af/poc.c
https://gist.githubusercontent.com/shaos26/f9e640d9007f000a2af427056e64df76/raw/ce3f8ac28eccb971bc86f16d47083c43b9b7a6af/mkjffs2.py

To reproduce, build the kernel from the HEAD commit above using
kernel-config.txt. Then download poc.c and mkjffs2.py from the Gist
and run:

    mkdir -p root
    for kind in trigger control nosummary; do
        python3 mkjffs2.py "$kind" "root/$kind.img"
    done
    gcc -O2 -static -Wall -Wextra -o root/init poc.c
    (cd root && find . -print0 | cpio --null -o -H newc |
        gzip -9) > initramfs.cpio.gz

Run the trigger in a disposable QEMU guest. The trigger is expected
to panic the unpatched kernel, so timeout is used to stop QEMU:

    timeout -k 2 15 qemu-system-x86_64 -m 512 -smp 1 \
        -kernel linux/build/arch/x86/boot/bzImage \
        -initrd initramfs.cpio.gz \
        -append 'console=ttyS0 rdinit=/init testcase=trigger oops=panic panic=1' \
        -display none -serial file:trigger.log -monitor none -no-reboot

Repeat with testcase=control and testcase=nosummary; both should
mount successfully. The Gist console output records these controls
and the patched-kernel run.

The unpatched kernel reproduces the BUG at fs/jffs2/nodelist.c:622.
With this patch, the malformed summary is rejected and the full scan
mounts the same image successfully. The valid-summary control also
mounts successfully.

Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time improvement)")
Cc: stable@vger.kernel.org
Signed-off-by: shaos <shawnq1@163.com>
---
 fs/jffs2/summary.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 4521a7723f306..d18bfb71d9fdd 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -381,6 +381,96 @@ static struct jffs2_raw_node_ref *sum_link_node_ref(struct jffs2_sb_info *c,
 	return jffs2_link_node_ref(c, jeb, jeb->offset + ofs, len, ic);
 }
 
+/* Check summary offsets before they are used to build the node-ref list. */
+static int jffs2_sum_check_offsets(struct jffs2_sb_info *c,
+				   struct jffs2_raw_summary *summary,
+				   uint32_t sumsize)
+{
+	void *sp = summary->sum;
+	size_t remaining;
+	u32 prev_end, sum_start;
+	unsigned int i;
+
+	if (sumsize < sizeof(*summary) + sizeof(struct jffs2_sum_marker))
+		return -ENOTRECOVERABLE;
+
+	remaining = sumsize - sizeof(*summary) -
+		    sizeof(struct jffs2_sum_marker);
+	prev_end = PAD(je32_to_cpu(summary->cln_mkr));
+	sum_start = c->sector_size - sumsize;
+
+	for (i = 0; i < je32_to_cpu(summary->sum_num); i++) {
+		u16 nodetype;
+		u32 offset, len;
+		size_t entry_size;
+
+		if (remaining < sizeof(struct jffs2_sum_unknown_flash))
+			return -ENOTRECOVERABLE;
+
+		nodetype = je16_to_cpu(((struct jffs2_sum_unknown_flash *)sp)->nodetype);
+		switch (nodetype) {
+		case JFFS2_NODETYPE_INODE: {
+			struct jffs2_sum_inode_flash *spi = sp;
+
+			entry_size = sizeof(*spi);
+			if (remaining < entry_size)
+				return -ENOTRECOVERABLE;
+			offset = je32_to_cpu(spi->offset);
+			len = je32_to_cpu(spi->totlen);
+			break;
+		}
+		case JFFS2_NODETYPE_DIRENT: {
+			struct jffs2_sum_dirent_flash *spd = sp;
+
+			if (remaining < offsetof(struct jffs2_sum_dirent_flash, name))
+				return -ENOTRECOVERABLE;
+			entry_size = JFFS2_SUMMARY_DIRENT_SIZE(spd->nsize);
+			if (remaining < entry_size)
+				return -ENOTRECOVERABLE;
+			offset = je32_to_cpu(spd->offset);
+			len = je32_to_cpu(spd->totlen);
+			break;
+		}
+#ifdef CONFIG_JFFS2_FS_XATTR
+		case JFFS2_NODETYPE_XATTR: {
+			struct jffs2_sum_xattr_flash *spx = sp;
+
+			entry_size = sizeof(*spx);
+			if (remaining < entry_size)
+				return -ENOTRECOVERABLE;
+			offset = je32_to_cpu(spx->offset);
+			len = je32_to_cpu(spx->totlen);
+			break;
+		}
+		case JFFS2_NODETYPE_XREF: {
+			struct jffs2_sum_xref_flash *spr = sp;
+
+			entry_size = sizeof(*spr);
+			if (remaining < entry_size)
+				return -ENOTRECOVERABLE;
+			offset = je32_to_cpu(spr->offset);
+			len = sizeof(struct jffs2_raw_xref);
+			break;
+		}
+#endif
+		default:
+			/* Unknown types already require a full scan. */
+			return -ENOTRECOVERABLE;
+		}
+
+		if ((offset & 3) || offset < prev_end || offset > sum_start ||
+		    !len || len > sum_start - offset ||
+		    PAD(len) > sum_start - offset)
+			return -ENOTRECOVERABLE;
+
+		prev_end = offset + PAD(len);
+		sp += entry_size;
+		remaining -= entry_size;
+	}
+
+	return 0;
+}
+
 /* Process the stored summary information - helper function for jffs2_sum_scan_sumnode() */
 
 static int jffs2_sum_process_sum_data(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
@@ -613,6 +703,13 @@ int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 		goto crc_err;
 	}
 
+	ret = jffs2_sum_check_offsets(c, summary, sumsize);
+	if (ret) {
+		JFFS2_WARNING("Invalid summary entries in eraseblock at 0x%08x\n",
+			      jeb->offset);
+		return 0;
+	}
+
 	if ( je32_to_cpu(summary->cln_mkr) ) {
 
 		dbg_summary("Summary : CLEANMARKER node \n");
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
