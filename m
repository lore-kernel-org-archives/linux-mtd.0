Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD097606D823
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VknLVeD5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6HieFhB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FsWNdHaGFWEj6Gk5tUwGuHSQtq07bPWseicCT6cgYWM=; b=VknLVeD5ZKOM5DiThBYBf4IhBE
	+zowCdtF9ZW5kaXXAYsWi4yJJB/+QCV4cntm/5q1EU7Kk811UZCubS7HkmD8Ml93JjhSVdOezZGdO
	kWxqI/vieX+rgNC62eDfAr7xbALbryIIjrQJg3Mbe3G1Ou0Esa++XT+iLTBXkh7wPGOqwK13mACcU
	o72rnz+JqTbskAHntplgUYTnstYMiizvoFAur3qy6luJsljy79K/dMarCE3WbWDInlFXZVq8D9nhm
	95FDUvNyf7eOhWI/YZXwwpSn2g2U8tjvGIWvY6QAldcevA3m24CXvo710cEwg9sRbLikhoaDZlUxV
	OrQKySxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGuk-0000000BrU2-0LLg;
	Fri, 06 Nov 2026 10:11:18 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGug-0000000BrRk-0HFA
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 10:11:16 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so230199a91.1
        for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2026 02:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793959873; x=1794564673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8gjNRWAbARHANMWwPBkUdQHILY3xbkqW7VhewL5SJQ=;
        b=R6HieFhBEKQFVcvghYg9KbU1Gaq7HyMP4J7y/N4+UTsd4jfzAc2MTsCwSvL1J4Lr+L
         Uh0x4CJYXdW+QmFWIOqW7i1m3i4gxBtbU5QiBih7xjCMbZoaZm87s56ufFMpSxjWfdOJ
         R3YgH40PQ4KlFuIm8IcdtkQELacsNMFChoguV4ZqcMhWVeoC4LYt8KtQLzyvEvSYw9Mc
         tecFWi4vobCRLjteaB1fAiAOH2pCu1xN8nDmew2WzFvrE4/bSLKwSeubl7uHEkzvz4pu
         DnsSekrRU+pa4OaMHLLrmx5s4jK+YjMcJ8MfeYbmpFMoBGEl2E/2pwMmQjIHMzQZtww1
         Jv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793959873; x=1794564673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8gjNRWAbARHANMWwPBkUdQHILY3xbkqW7VhewL5SJQ=;
        b=Ql4DFFZHLkCWRfBYG7xyzOTaW7ZzgfFOKxhqucZVar5/llqsaU7GZoRz7w7to94ZrF
         ZQetrpYro88nNCzItpmZ5jt6JzWr9iW1IQr0CfsFQ+HMtsnbjcDnSxCFhvbKp3sTB+0Q
         q47A1CtFhU3eWvcBEqngZWeJqSGK9+c9Q3plQbAx3+qzYayoE4VuTm2d6TiJRquGxJqq
         x3CCWJ1WVgfuYeZnKVZg0AoyyIeukvPNRyF8HRLEyhkowoIu7prlUm74RM2+d3TqjhUw
         OWfZPUMIZRr8gEeeSV2NJMDPUhUn3XJ4jLweE+y26HQYuwibymW++5M9vyebn+PBBHun
         hm3g==
X-Gm-Message-State: APuU4Z/Wyutz8Y6fetJimuaiRyJeDMbj2nB1zJlB4RrkdReWW0+vyc0p
	jit+VGE30Tiq4mdHeWtA2GCgxEsrBD/vjzP0eQQwTa67fbbzU1Xfj0jb
X-Gm-Gg: AYBFou0bJM6rAOyHHVb9YoW1TJOa4EuhItUW1XSP4w1Pij4pGuprqLqq3e1CxH29EON
	4irWkydmWUBzQotjSqmk2nEyAtsLMk3s5gHZ1WFKO/fbCveNZfnTQMnqHaWFEB1LUI/3Hndke5Z
	ZSw75iuQKBBbSvQb5dKIztGojpnoW9+3pXjwIHEMezzSclN02hJovBzKw+IFw45pbtOXc9zlHeg
	CJImQ/Z2Fm8XmIe6SDZzx+n26796jwobJ86wnGvyrrgO64xTK9rrMTTIYQvf2vLKxrqmCu15zwJ
	wfhvmPXUwX7QNtNApAkQrdlSHxwqvjKaBtC1/UTWNdvjJkgXhE9mzQII1DRwnx0BxiMwF3fnFm3
	HMweyzuxSavTK8aAz+1JL/Sho1RWy9sJ1phxu2ZOfsXEnPAmYMbDTvxAJX8Ft775SSWBp//j2nS
	YeFRIfj1e5OMHHpQjN4pkIdvwZIfcdWhmsQjoPabLrtt4ky+1wLSpS/OG3g3xmYncPMGBJXUHdj
	dT3fejC5k5O1+dOq6bSqYtK9Jk34GiD3me7vdj1byyTT1gMn/5kOBThpz6zPxbgZR/ZlYIGzvPN
	RqJLE1PXJZyG1bldCrh53ewaWdO2w2keV6O/259Ne13cxZbI
X-Received: by 2002:a17:90a:fc4b:b0:3b0:bc3c:3e7 with SMTP id 98e67ed59e1d1-3b0db6c9b44mr2066990a91.10.1793959873054;
        Fri, 06 Nov 2026 02:11:13 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c66881sm2736443a91.8.2026.11.06.02.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:11:12 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] jffs2: validate summary length before scanning the summary node
Date: Fri,  6 Nov 2026 19:11:00 +0900
Message-ID: <20261106101100.2421360-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106095108.2405364-1-hj351016@gmail.com>
References: <20261106095108.2405364-1-hj351016@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021114_110875_135F0AB3 
X-CRM114-Status: GOOD (  19.64  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hyunjung Ko <hj351016@gmail.com>

jffs2_scan_eraseblock() locates the summary node at the end of an
eraseblock and derives its length from an on-flash offset in the
summary marker:

	sumptr = buf + je32_to_cpu(sm->offset);
	sumlen = c->sector_size - je32_to_cpu(sm->offset);

On a crafted image the summary marker bytes at the end of the last
eraseblock are attacker-controlled, and two malformed values slip
through:

  - sm->offset > sector_size makes sumlen underflow to a huge value.
    The non-XIP branch rejects this with "sumlen > c->sector_size", but
    the XIP branch (whole device mtd_point()ed, e.g. an mtdram-backed
    MTD) has no such check.

  - sm->offset within the last few bytes of the eraseblock makes sumlen
    small (0 .. sizeof(struct jffs2_raw_summary) - 1); this passes the
    upper-bound check in both branches.

jffs2_sum_scan_sumnode() then dereferences the pointer as a
struct jffs2_raw_summary to read its fixed header and computes

	crc32(0, summary->sum, sumsize - sizeof(struct jffs2_raw_summary));

Without a lower bound the header read runs past the buffer (or past the
mtd_point() mapping in the XIP case), and for a too-small sumsize the
crc32 length underflows to ~4 GiB -> an out-of-bounds read of
attacker-controlled length (KASAN: vmalloc-out-of-bounds, or a general
protection fault on a real flash mapping). The summary header CRCs are
computed over the attacker-controlled flash and can be satisfied, so
they do not prevent the over-read.

jffs2_sum_scan_sumnode() is the sole consumer of this length (it is
only called from jffs2_scan_eraseblock()), so bound it there once -
covering both the XIP and non-XIP paths and both the underflow and the
too-small cases: reject a sumsize that cannot hold the fixed header or
that exceeds the eraseblock, and fall back to a full scan.

Reproduced under KASAN on 7.4-rc1 by mounting a crafted mtdram-backed
image whose summary marker sets sm->offset > sector_size (the XIP
path): KASAN reports a vmalloc-out-of-bounds read in the summary-node
crc32. The small-sumsize case is the same over-read and length
underflow in the same function.

Fixes: 9641b784ff82 ("[JFFS2] Optimise reading of eraseblock summary nodes")
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2:
 - Move the check into jffs2_sum_scan_sumnode() instead of only the XIP
   branch of jffs2_scan_eraseblock(), so both the XIP and non-XIP paths
   are covered in one place (per Sashiko AI review).
 - Also reject sumsize < sizeof(struct jffs2_raw_summary): a summary
   offset within the last few bytes of the eraseblock yields a small
   sumlen that passed the previous upper-bound-only check but still
   over-reads the header and underflows the crc32 length (per review).
 - Add Fixes: tag.

 fs/jffs2/summary.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -577,6 +577,19 @@ int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 	int ret, ofs;
 	uint32_t crc;

+	/*
+	 * sumsize comes from an on-flash offset in the summary marker and
+	 * is attacker-controlled on a crafted image.  It must be large
+	 * enough to hold the fixed summary header and must not exceed the
+	 * eraseblock; otherwise the header accesses below read past the
+	 * buffer (or the mtd_point() mapping in the XIP case) and the
+	 * "sumsize - sizeof(struct jffs2_raw_summary)" crc32 length
+	 * underflows.  Fall back to a full scan in that case.
+	 */
+	if (sumsize < sizeof(struct jffs2_raw_summary) ||
+	    sumsize > c->sector_size)
+		return 0;
+
 	ofs = c->sector_size - sumsize;

 	dbg_summary("summary found for 0x%08x at 0x%08x (0x%x bytes)\n",

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
