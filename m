Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7713F419A0
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2026 12:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnrurdAm+dR90HgKZhRyN9PO7MgSs6SIDOUBT6RXW1o=; b=3yd9zj1M380709
	O7Lt0OWD4U1ESZmIBub1XKQu0xCq34MsZty9L+x+ftbIYEWAMz2R65O9PdoFc0MKTQxokOpubf+jx
	GmAltwNqs80V/Fs/kCUTdpOrSbjpjhSl8f4l3Aair57Zw7pVXdV85/19mcfo+ziZKMzvKl6Hth5dw
	3whKD+Cvm3dPdQ0s3sB2lG0wXlCzzcJh/r9UwLjOOhBhIUIiBH0t7JxUFXsfdv2RD5iaa9MGRIAhB
	DEVVQg2ctkPC7xZ6ifckvbKUe9KaFY5PGCUOXRHzWi1Lxy0a4UEanMtxbj9JWobD9zbQruJ/z890j
	0vJpvaczn6evuj/bpJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzfW-0000000195U-2rmp;
	Wed, 15 Apr 2026 12:48:34 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCzfU-0000000194Y-0KKF
	for linux-mtd@lists.infradead.org;
	Wed, 15 Apr 2026 12:48:33 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8d428da4300so736311685a.3
        for <linux-mtd@lists.infradead.org>; Wed, 15 Apr 2026 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257310; x=1776862110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjxJXStMU5U0NlRTJ2IsoioP7S3PUNh6UBqJINw6hTA=;
        b=IiltNHvL2xZVi95OGuqxeqFmtS0zwfNeW8h5B01AvSftKrvN4aiM4j18L64ulNa2GQ
         IgeUz1HqSWnyhDe1plpEiAwU07sF98eBHuUTl50bMhpwpnTweqVWDxbeKPegVbCb6Nzq
         ZYOK6usQDX2aPXpI8zsBvQm95Kr+iel2tdrvDivDPaVRkiIy+y/2pLW1bqrxiltXq8/f
         3Z+foROgTPNCmysE0bu3i+zbFd5XA1MzdvfarzbYCgn5ff1Nl/WQdWmHcklEJ6l2ghIZ
         NiDBJb4ARp9l/vffFxSNGBAYPu9jthrzf/pUTF4WorqeKnCp7YEMBw1SIvXCGNN87BPa
         pMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257310; x=1776862110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjxJXStMU5U0NlRTJ2IsoioP7S3PUNh6UBqJINw6hTA=;
        b=TxGRxLVcLJths8tPdjJCTYJXP8CZpQi+sleuRFEbFFx2gaVtAk+ouP4hZmsKOaFJ97
         Q8EJ91hNKvcrKMc41JEjHLNs4HKq7f8DV+CeDQ8F+CwP9zIc7MmAMPKAmscKAwYyeTuP
         m8srzuU5HTvUYL0AUbL2UqoXBs44mu6WTbGHePtd3ioYcMh8RWWUQCYi1WUvtq0AiHze
         yJrRX1csT5TLqylXITSdxnUnmuoK/WKdXKc3xIGzE0CIerQJSuiWsvV+Tnyfxq7pPKjC
         pMJbiy2VT90Ot0pcC8PfTxSLHoZQy0eLDT2heyvg0zy7e9++aAfFr9YvvwKoecuy5Yr+
         zw+g==
X-Gm-Message-State: AOJu0YwXO9a2pgwlWgEVPukW+XStIzqBRmqlLo/gafxD1jzdfGD97jd2
	9xYiV/lFXtgjujkvco3mLCsD7EP8uPffRBcSOC5xVsKswGryu2J8DcxJXTTWgQ==
X-Gm-Gg: AeBDieuH80lnyjP082OkJ22uVL2qHcEVNGIZDvdl0MEBSsTfL71Mz4hVGOCa6h9inWf
	gklBN0rHNMBu3G9kx9peylvzVJzBXTghnM0ENxBsJi3S5w4UlY3PFL/VxD7tZWGvQli339epuqU
	yLxXuyKO6nfzA+oDOM4wUlMdYM7VeHDs9DEP6mg8dt11inUr5H+IwU4GDh3qBuYtfa8Rk3aazWz
	mgyjGF0srzVm9AnjN9b9Lg1pcDd+k8PUtf8S3ibmmg4njryGAnRKTFXwy9uwnKtexBftQHXP+11
	l5jPQyF1Yls1ycye4njHrnpExa50GGhj91xnp1lJQWJHa4brQ1vvmAsiA5BURErDIo7TGQzn0gr
	Il8aPxtIiK7IXjOESdSYgmuPoyInkVyBG5OljTZqnGAWDzygW49vpprPJ3sJLqAqd3U235KlTeS
	dmUuY5kB9jqUgsbNJP9o1GyHw+b4pMjL+P9/57TaEcJB1s61hiZLrahbMGBDmUmBHFm8Eq1yxmE
	He1YoT387BwHuJp9IKv90CrEkLTlb/S9gCku4YwpgXmf5Sk8y2e6g==
X-Received: by 2002:a05:620a:450b:b0:8cd:b620:f3ed with SMTP id af79cd13be357-8ddcf2bf6e4mr3124006385a.38.1776257310347;
        Wed, 15 Apr 2026 05:48:30 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6ceb891csm10614016d6.48.2026.04.15.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:48:29 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	Artem Sadovnikov <a.sadovnikov@ispras.ru>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] jffs2: bound summary entry walks against the payload
Date: Wed, 15 Apr 2026 08:48:13 -0400
Message-ID: <20260415124813.246588-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415124813.246588-1-michael.bommarito@gmail.com>
References: <20260415124813.246588-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_054832_143797_B75F4A93 
X-CRM114-Status: GOOD (  22.55  )
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

jffs2_sum_process_sum_data() iterates summary->sum_num times, reading
the next entry's nodetype from the current sp and dispatching into
type-specific handlers that advance sp by a fixed or nsize-dependent
amount.  There is no upper bound on sum_num from the writer side, and
on read the scanner trusts the on-flash value unchecked.

A crafted flash image can therefore set sum_num > (actual entries
that fit in the payload).  Once sp runs off the end of the summary
buffer the nodetype read at summary.c:407 lands on adjacent slab
memory.  If those bytes happen to decode as one of the known types
(JFFS2_NODETYPE_INODE / _DIRENT / _XATTR / _XREF) the handler calls
sum_link_node_ref() with offset / totlen pulled from whatever slab
neighbor is next to the scan buffer.

Reproduced on v7.0-rc7 under UML + CONFIG_KASAN=y with a crafted
image carrying one real INODE entry and sum_num=2:

  BUG: KASAN: slab-out-of-bounds in jffs2_sum_scan_sumnode+0x6bd
  Read of size 2 at addr 00000000621fb000 by task mount/31
  Located 0 bytes to the right of allocated 4096-byte region

The matching sum_num=1 image (same bytes, honest sum_num) mounts
without a KASAN report, so the OOB is sum_num-specific.

Pass sumsize into jffs2_sum_process_sum_data() and bound sp against
summary + sumsize - sizeof(struct jffs2_sum_marker) before every
nodetype read and before every type-specific field access.  If the
advance would leave the payload, warn and fall back to a full scan
via -ENOTRECOVERABLE.

Scope note on impact: demonstrated effect is a mount-time OOB read
and a default-case warning path that reclaims the jeb.  The
type-specific handlers run with attacker-influenced offset/totlen
pulled from the OOB bytes and do call sum_link_node_ref(), but
persistent write/state-corruption requires adjacent slab content to
decode as a known nodetype and the mount to complete cleanly;
neither is reliably reproducible without heap-spray primitives.
This patch closes the confirmed OOB-read sites.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 fs/jffs2/summary.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 150a9c83cb05..09677b931010 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -384,21 +384,33 @@ static struct jffs2_raw_node_ref *sum_link_node_ref(struct jffs2_sb_info *c,
 /* Process the stored summary information - helper function for jffs2_sum_scan_sumnode() */
 
 static int jffs2_sum_process_sum_data(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
-				struct jffs2_raw_summary *summary, uint32_t *pseudo_random)
+				struct jffs2_raw_summary *summary, uint32_t sumsize,
+				uint32_t *pseudo_random)
 {
 	struct jffs2_inode_cache *ic;
 	struct jffs2_full_dirent *fd;
-	void *sp;
+	void *sp, *sum_end;
 	int i, ino;
 	int err;
 
 	sp = summary->sum;
+	/* Entries must fit before the trailing jffs2_sum_marker. */
+	sum_end = (char *)summary + sumsize - sizeof(struct jffs2_sum_marker);
 
 	for (i=0; i<je32_to_cpu(summary->sum_num); i++) {
 		dbg_summary("processing summary index %d\n", i);
 
 		cond_resched();
 
+		/* Make sure the nodetype dispatched on is in-bounds; each
+		 * case re-checks the specific entry size before advancing
+		 * sp past the node's fields. */
+		if ((char *)sp + sizeof(struct jffs2_sum_unknown_flash) > (char *)sum_end) {
+			JFFS2_WARNING("Summary entry %d nodetype past payload (sum_num=%u)\n",
+				      i, je32_to_cpu(summary->sum_num));
+			return -ENOTRECOVERABLE;
+		}
+
 		/* Make sure there's a spare ref for dirty space */
 		err = jffs2_prealloc_raw_node_refs(c, jeb, 2);
 		if (err)
@@ -407,6 +419,9 @@ static int jffs2_sum_process_sum_data(struct jffs2_sb_info *c, struct jffs2_eras
 		switch (je16_to_cpu(((struct jffs2_sum_unknown_flash *)sp)->nodetype)) {
 			case JFFS2_NODETYPE_INODE: {
 				struct jffs2_sum_inode_flash *spi;
+
+				if ((char *)sp + JFFS2_SUMMARY_INODE_SIZE > (char *)sum_end)
+					goto ent_past_end;
 				spi = sp;
 
 				ino = je32_to_cpu(spi->inode);
@@ -434,7 +449,12 @@ static int jffs2_sum_process_sum_data(struct jffs2_sb_info *c, struct jffs2_eras
 			case JFFS2_NODETYPE_DIRENT: {
 				struct jffs2_sum_dirent_flash *spd;
 				int checkedlen;
+
+				if ((char *)sp + sizeof(*spd) > (char *)sum_end)
+					goto ent_past_end;
 				spd = sp;
+				if ((char *)sp + JFFS2_SUMMARY_DIRENT_SIZE(spd->nsize) > (char *)sum_end)
+					goto ent_past_end;
 
 				dbg_summary("Dirent at 0x%08x-0x%08x\n",
 					    jeb->offset + je32_to_cpu(spd->offset),
@@ -492,6 +512,8 @@ static int jffs2_sum_process_sum_data(struct jffs2_sb_info *c, struct jffs2_eras
 				struct jffs2_xattr_datum *xd;
 				struct jffs2_sum_xattr_flash *spx;
 
+				if ((char *)sp + JFFS2_SUMMARY_XATTR_SIZE > (char *)sum_end)
+					goto ent_past_end;
 				spx = (struct jffs2_sum_xattr_flash *)sp;
 				dbg_summary("xattr at %#08x-%#08x (xid=%u, version=%u)\n", 
 					    jeb->offset + je32_to_cpu(spx->offset),
@@ -523,6 +545,8 @@ static int jffs2_sum_process_sum_data(struct jffs2_sb_info *c, struct jffs2_eras
 				struct jffs2_xattr_ref *ref;
 				struct jffs2_sum_xref_flash *spr;
 
+				if ((char *)sp + JFFS2_SUMMARY_XREF_SIZE > (char *)sum_end)
+					goto ent_past_end;
 				spr = (struct jffs2_sum_xref_flash *)sp;
 				dbg_summary("xref at %#08x-%#08x\n",
 					    jeb->offset + je32_to_cpu(spr->offset),
@@ -566,6 +590,11 @@ static int jffs2_sum_process_sum_data(struct jffs2_sb_info *c, struct jffs2_eras
 		}
 	}
 	return 0;
+
+ent_past_end:
+	JFFS2_WARNING("Summary entry %d past payload end (sum_num=%u)\n",
+		      i, je32_to_cpu(summary->sum_num));
+	return -ENOTRECOVERABLE;
 }
 
 /* Process the summary node - called from jffs2_scan_eraseblock() */
@@ -646,7 +675,7 @@ int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 		}
 	}
 
-	ret = jffs2_sum_process_sum_data(c, jeb, summary, pseudo_random);
+	ret = jffs2_sum_process_sum_data(c, jeb, summary, sumsize, pseudo_random);
 	/* -ENOTRECOVERABLE isn't a fatal error -- it means we should do a full
 	   scan of this eraseblock. So return zero */
 	if (ret == -ENOTRECOVERABLE)
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
