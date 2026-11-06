Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7050D606A33E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cSH8zIVz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3i8dHbR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1f/Bk9wlpwkZ4VSiGxryRSgWb4lsMLgy9ospLLb4MAc=; b=cSH8zIVzXqR4pXCN+SEuuwv2mu
	/OGq69zOUE6iUJVmsO6DSs5RvFUzZL24i51YvOyz57qbfy1X7MpkUyLa9vXprPPlUtek1wGVsOveU
	Z/38EemjKnn5gMZ5X/9DiMha9WA5XtC2aJIAgtLf9SogdZdBenuLIORe2gm2W0Jlrmmusylq1hKfJ
	gNzQFcfGhag3dTIYEnqRF9woHpDqf2RFMFAUQzRrnoBm3XUh3RAHcdG07QZCFiAB+Lkzf8GewTENG
	eIQ0V5sPWkd7zu9DqcEZXxQa0IyGX0vrxHtxzpNoNYyCV6wd/pMXyZnJdThHmy7JhGLCxCOnUGevt
	ghNmhTgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGbX-0000000Bocv-1fns;
	Fri, 06 Nov 2026 09:51:27 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGbT-0000000Bobz-3HeZ
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 09:51:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e9eb579c0eso2481075ad.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2026 01:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958682; x=1794563482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKuqEEIUloaDKks8AnObg5jLkIg+139qL0t5VZAu9ww=;
        b=v3i8dHbR1qDk/r00h6MGPrbbGMcS8XKXtewdtO4fI2FTsk6tKDhKtY1EmBwZam+2zr
         19Rlq/yDQn5bWR+wjT5ppZjRhKZJbk22v7q7GZEZ2puzn3URSLLVR6kiCdbBHNYpHhnu
         3wGtNNWPGqEXUN1z/xnpDgAwadXVr/E2wCs4NHul7zj+bqUdu55aR9PTIsBWZdklXxPJ
         LqfbIYj74YoMKyAk2paQjj4M23uxAA1ISQPSdx+N2QlEj3pY5c5ubD9PTek9m6O2s1aP
         PwROE3rHSueD0hxLCys2nW2w+QX0/wFrDg5WstNMUNmoarkrncvVmMRFywqLnXu/POOS
         2WDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958682; x=1794563482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKuqEEIUloaDKks8AnObg5jLkIg+139qL0t5VZAu9ww=;
        b=vuOBm+oS9cc2oMBRcYMLWgs8tMSri4Hp4thWaH8JByNXevf7+1Z3VJ5hBjBlSTVTcr
         Vcg0yhs4V5HFea72SgwVCfoY0dsqcmOKTXD+GUSuVbrOhxq50eRdzJU2XTt0ChAKDQkn
         IwizoBuPZHljnqWOZKF4bP5CHx0uFbEMUgprgblOFJskpvzeBEiSyp8UNDQYw/dXwDNH
         SalguwPcNf5UvNqa9pcPn35jfmbd38LPKt/1IsXk9oKUTgaCPQ3iSJMHFUIg5R4zC5in
         ckFmr/pDis/gq+zVKPNAIpI+qpUOc286T/toW5ElU7lSnembqzjJX6qwjvysFEvGbV7d
         kOOQ==
X-Gm-Message-State: APuU4Z9TaZsf+sQfEwRnBqGvRaEpg4D5hhqqYDyZ70xiCq4LOHD8lT78
	4LyAvPYjsRSDZQ13zzInQwvnTPtxnjxVOHIS/KpSs1WK135DLEM0rLHj
X-Gm-Gg: AYBFou2zvyp4pbJOQUNJzEjPbc8gbsEa2fAfJVf/wUbfpsQYy5CAkexlzS57jVMCwb8
	YnRIuP043GdxIcprlgp5BHGo7Bm4whEKGdhoC28awL7jjXwq7NVKCktemZBuHJb0Nt+9Y3vDhX4
	ZU3QoRRxpuU92pR+AQMoEI27YY0UMFbefJNS/yYHpqjl7K2QgnS2ITKgclgWuVhiv5Xi2JxgcHt
	kj72Ra+ivZiZssr7LcUaEExJBzdtkrt6EUsSG4Iv2oEhbnHfgPrHI3Chm8FFma882xrBdacRTFi
	9tTs/8xAfujhNc4Y+Aw8DJDasNpI45fnYc7gJ/1RhS7EMOojPu/qwYVXI3ejdSrlieHd8W8W94D
	Ce0YQLPkKJXL4wfaTYKwQ1f9B81TW0eDsoodKNHTAV/tPNBxsiZk2cArjK4in19CkZ0pubmtj5k
	HvU9BrdVa6uDIW4ItBomxUOVdJUDJxYLMVz45HlcTlQoxJO+m7OUxsSDwsSXEJSxXRMqEIShh5K
	1Ykn3vHRVlRi7Fu0dTuTgSqf7UkK379rLnxHAl33b0J/O9Z6EiGgJZnf/E0HSlbdL0HwOeP6Bkk
	4l9mXpqb8UrB4g3W8jgndY3BuaoBiIi562sLCR+fpPII9W8U
X-Received: by 2002:a17:903:191:b0:2ed:188d:3016 with SMTP id d9443c01a7336-2ed40e228dbmr21444695ad.73.1793958682380;
        Fri, 06 Nov 2026 01:51:22 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da40absm3636085ad.75.2026.11.06.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:51:21 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] jffs2: validate summary offset in the XIP scan path
Date: Fri,  6 Nov 2026 18:51:07 +0900
Message-ID: <20261106095108.2405364-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_015123_825339_464B35CA 
X-CRM114-Status: GOOD (  16.43  )
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
eraseblock and derives both a pointer and a length from the on-flash
summary marker:

	sumptr = buf + je32_to_cpu(sm->offset);
	sumlen = c->sector_size - je32_to_cpu(sm->offset);

In the non-XIP branch this is followed by

	if (sumlen > c->sector_size)
		goto full_scan;

so a bogus sm->offset (for which sector_size - offset underflows to a
large value) is rejected.  The XIP branch (taken when the whole device
was successfully mtd_point()ed, e.g. an mtdram-backed MTD) is missing
that check.

On a crafted image an attacker controls the bytes of the summary marker
at the end of the last eraseblock.  Setting sm->magic == JFFS2_SUM_MAGIC
and sm->offset > sector_size makes sumlen wrap to ~4 GiB while sumptr
still points inside the mapped flash.  jffs2_sum_scan_sumnode() then runs

	crc = crc32(0, summary->sum,
		    sumsize - sizeof(struct jffs2_raw_summary));

with the attacker-controlled sumsize, reading far past the end of the
mtd_point() mapping -- an out-of-bounds read (KASAN: vmalloc OOB /
general protection fault) of controlled length.  The preceding header
CRC checks are computed over data read from the attacker-controlled
flash and can be satisfied, so they do not prevent the over-read.

Mirror the non-XIP guard in the XIP branch.

Reproduced under KASAN on 7.4-rc1 by mounting a crafted mtdram-backed
image (the XIP mtd_point() branch): KASAN reports a vmalloc-out-of-bounds
read in the summary-node crc32 over the mapped flash.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 fs/jffs2/scan.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -495,6 +495,10 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 			if (je32_to_cpu(sm->magic) == JFFS2_SUM_MAGIC) {
 				sumptr = buf + je32_to_cpu(sm->offset);
 				sumlen = c->sector_size - je32_to_cpu(sm->offset);
+
+				/* sm->offset may be garbage even if MAGIC matched */
+				if (sumlen > c->sector_size)
+					goto full_scan;
 			}
 		} else {
 			/* If NAND flash, read a whole page of it. Else just the end */

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
