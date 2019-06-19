Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267CAC31E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:52:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1CA721537
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:52:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iVqSUbRH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY0Zb6Yh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1CA721537
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sb9pzEUUvxG92rztu5kp/YJnJueG14QtokmTuoFRSbE=; b=iVqSUbRHTzHd82TesUo62TtGlO
	GkibVVJUjA1JTVDdBPjzHRWreMTRE4AlAL/9tRy5w7Nvh0z/4ZmKfR08nM7rL1ThsUSZY3Mjt17kK
	NwAoxyeUaZJ0XREo0A6LW+hbm3vnil2TmC0ZDnWW/73uB/Qggj4K/XuL8B6rxEuFl0pYwOjama5wo
	E6Xpdhwny7WmRf2bo1tvPX0zFPqxOQauSs8mMykAPuNKg5XFxhkKsv3G+o7xwHrmHEXRmbSlVLoi4
	CvVgMbHFg7aCDGqAzhZSDmUURRL5kiF16C98ZrIIQX9w60NAYOgU8r6URpFznTj7hqJKoy40xInEz
	phYG7EkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hddpM-0002eN-Ie; Wed, 19 Jun 2019 16:52:52 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddnA-0000TQ-2P
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 16:50:37 +0000
Received: by mail-pf1-x442.google.com with SMTP id q10so10093630pff.9
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2019 09:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hZOIy8Y45zpFnShl0u2Pd3wFiF81lj1UTfRNgfxJD3w=;
 b=lY0Zb6YhPdd0sWOLT/9DJXe+zi+V+1r6gQ5dMAH3/a8GJKBQvpx5nxFxqxyM0bT91k
 YxxdG//fBLy6ufjhlBe30+F+uYDn/Dfari1cBjzDSaLHgsrBNfFH4GD+C7IwcAfRVmCo
 UyyNleqHCNb1rkk06Mf5xJzkjklZnYZXeG6iBi72kclTSxUmncVhG1kafSJToaRMRDK7
 oQqV0dO8rqMtbi4G2fbyveI3884E0hdP1gwYgSiQGXDQHTKAn3TSXI41GUM4ZxFEd48v
 9Y6oS8rRJGKKV08xYpHByz9EZgHuUK7ZMEZEGLLfkeSkB2OvcR4p59JuB2KQI3e56q/i
 pohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hZOIy8Y45zpFnShl0u2Pd3wFiF81lj1UTfRNgfxJD3w=;
 b=YhohGbYbqe+4uxLCb4LPT5rBUtk9T3B3HwpBcgoOiFaKqIwd4+RRCu4++zdd+yKIoC
 gREvTsT39N9Y+m3ouZODh+5XpWfSALXz718VY7HkM9ZBkWKZKKSc1d5rF3aLX7WGsF+c
 /Nf69F8xynG/drnB8J0vHN2/jx1+bfFIGfijiESOgXiZRMR2mfEl+TePRJrBAiudlULn
 MQym3cDLINHrGF9vsAHZc/I/5EC/E8EFr7iEY37OJsG4et5o0XehjAKVfHmaX7FO1hls
 FOpOwrNUrFe8aQS8w3sW9r5uxd1MGKdrb6KaQwgtgJle6gQBRDj+q5BfIg68VI9ZTe14
 FHpQ==
X-Gm-Message-State: APjAAAV9zSvHkb5gFjm8aNxY4jBFQh0kXKbBMWPPr0ndEfK3iB5XNTiT
 P83hs7YrMxZHvTxlDT5MQ10=
X-Google-Smtp-Source: APXvYqzrKh82UT2AuK2jmEItZU1Gn8mb9kY/CG2kBW92yvP8wWgEHmYxlXQQoTq35tMBWsRO+5YWOw==
X-Received: by 2002:a17:90a:9b08:: with SMTP id
 f8mr12263942pjp.103.1560963035252; 
 Wed, 19 Jun 2019 09:50:35 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id j1sm21344894pfe.101.2019.06.19.09.50.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 09:50:34 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v7 9/9] mtd: cfi_cmdset_0002: Disable write buffer functions
 if FORCE_WORD_WRITE is 1
Date: Thu, 20 Jun 2019 01:50:01 +0900
Message-Id: <20190619165001.28410-10-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190619165001.28410-1-ikegami.t@gmail.com>
References: <20190619165001.28410-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_095036_150995_74B622F3 
X-CRM114-Status: GOOD (  13.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some write buffer functions are not used when FORCE_WORD_WRITE is set to 1.
So the compile warning messages are output if FORCE_WORD_WRITE is 1. To
resolve this disable the write buffer functions if FORCE_WORD_WRITE is 1.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v6:
- Removed the tag of Koen Vandeputte as same with the v7 1/9 patch.
- Address the ./scripts/checkpatch.pl issue.

Changes since v5:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a742e718d244..f9ce22716bdd 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -51,7 +51,9 @@
 
 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
+#if !FORCE_WORD_WRITE
 static int cfi_amdstd_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
+#endif
 static int cfi_amdstd_erase_chip(struct mtd_info *, struct erase_info *);
 static int cfi_amdstd_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_amdstd_sync (struct mtd_info *);
@@ -202,6 +204,7 @@ static void fixup_amd_bootblock(struct mtd_info *mtd)
 }
 #endif
 
+#if !FORCE_WORD_WRITE
 static void fixup_use_write_buffers(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
@@ -211,6 +214,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 		mtd->_write = cfi_amdstd_write_buffers;
 	}
 }
+#endif /* !FORCE_WORD_WRITE */
 
 /* Atmel chips don't use the same PRI format as AMD chips */
 static void fixup_convert_atmel_pri(struct mtd_info *mtd)
@@ -1838,6 +1842,7 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+#if !FORCE_WORD_WRITE
 static int __xipram do_write_buffer_wait(struct map_info *map,
 					 struct flchip *chip, unsigned long adr,
 					 map_word datum)
@@ -2066,6 +2071,7 @@ static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, size_t len,
 
 	return 0;
 }
+#endif /* !FORCE_WORD_WRITE */
 
 /*
  * Wait for the flash chip to become ready to write data
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
