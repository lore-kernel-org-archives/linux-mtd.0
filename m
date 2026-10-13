Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9F0CC6B1A
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hmh1sIGwQzv5ZvDTZ9RayGQXYSXny09YD2IFev/5KHs=; b=uxnheJ0sh5w+a+
	Ui5MPNJ5GtWkiG5VbFtEFIc0vz9A8AjiS050VU163SW1LYALDJrvzC75H8At3099X2VQ6/nVBZlNg
	ZHGwytFPvgzp5iXiDdY736ZtQa2FeNqpoQJxklHI025QyqXb1pDQg16ckqBKAcgJykCPl6uG8a8eT
	jfHLGwFrrAg+hR0cZJ7NMcWCY++sXy10q0SmZHGdEHo6q8scgGrTNw+cJGZZMsQa8UoI9Z2/uvfQD
	SiSW7V4KVsETUCF8gjpvjhaTM0YAA+G/GmMulmAEfXrZNN1lG3O2gqcXfL1Me1YJXl7J9ilTwQ1/1
	L2cirW7natkvePHBvFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGh9x-0000000DooY-3GuM;
	Tue, 13 Oct 2026 18:23:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGh9v-0000000Donz-1iBN
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 18:23:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48afe75f055so3014447f8f.2
        for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2026 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915809; x=1792520609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ef/GgzaBPwT+7MEbAYGfEkP5fMoOfAQBNaVdanheznU=;
        b=FyKC6SCYAgxkPQwMDQLD5Hfug3kPzW16ZkJiodZwYHdJu9ORDV/OiULvrpVMlaYxOE
         2sA37knz52WHrXbXvDBgfV7WPaxg7OtIwKMSAgyQrnpgmKrGt9sxg9c89BOadUR8SAwz
         uTh2T1uRJUUu83rwUYljgh0oshdGCxXQUKpXEK/NxUIyhK/WyQ8W1f7qjoFMN6/AO8Ls
         JLrKxSo5ZAxWoAl7Fjm/bV7VzMx6S2iTLcRaMRv32lFyOwPtua42fspj60XSrp56hKS8
         dQvO+lciTWd8bVI13p7NzlxqoXC+fYRIK4RjQGwUP4X5r+rJ0ZgS0+Nxeu1q4TVjGoub
         nprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915809; x=1792520609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef/GgzaBPwT+7MEbAYGfEkP5fMoOfAQBNaVdanheznU=;
        b=TfU0LghAhbZaNew5uxeYuf3wIcePgIizuMLz0DqhfHniXC97aLrbQnPkmiao4HnSFQ
         vjBcyYzwsKJKOikprDq1yMETlkNVXLEmXUaCTDCyrlc+5UqCCYVPGxDFgwxt1zZ7ZuE2
         0wxgwagd4sHElSoMnzZu2bnDyMKarjd0KJuILHxzzQq2QALRACkVQxwq+4HXPX6Sg4wr
         mhdP3tFfHyck4RaQvJm/yeuZ3dZnR/nIlkBQQWXfw/w0hKFKKdCsnJ+FcRgtiYqTMw4F
         +SbNvrqVrtM7UB78XwSAGiy/HTTO3SPYsUeRBc9ma2nyr68kmw5QeaV6QHVx5LQuU6Za
         8MJA==
X-Gm-Message-State: AFq9FYJliElwWzomHt4pvY5xWo3VBAA3dyTYcnou6+8NP4FocyYeniyI
	DrwJLTfoDONW5JbsfWOcJ19ChbgsNV9v5oTzp86xT5gY2JTtFi6TnZmAZn2QQw==
X-Gm-Gg: AYBFou1qjt+/hQhKRYpWcXWvN/9XQ6ksGKIb4I5B4K2VwPqu5rCkEWLox3QL8xNUJTI
	4oKF9skavHMRguj0E0gos0rZA1fvDGbT5a9aNsFo3YV6vJ+7HWAthyfPX97j8bFRAK6ZPoogKmU
	umqYLfbSlsK3ZLsoE9HCv7CaXwMYKYyepbeqLTvXxqATxfhSEto2FeyeoEfD29B1ogn2kkQfx/0
	s5j5WPuODvmJ46vn9z6yXu89etuJGZzHl5IrG4D2tTDFmj4L1c8i8zBeZ8l5Ook5anNpanhPn4g
	V0ZIFe4fVMInqOJ4cXnzI/H04jT8M+KwxfZMfYClQaO4Sfdd/zECNLNRMN/e1Xuf6YLxhWYEeBK
	aBLJgWj0gKWl/786abXzv7LYeY/hidd0es6qEQ9qfLlhAIHmLfOxefPWEdslZE3Vut+dcPLi9zS
	CGYYDZ2IVM4Ufhawigh0HtbdutwjoGSf8279C/d4oy9T1ZWZVaQ8LkowiTIwMA5qosw0nsl2bWB
	Tw+5Ii7xbN2BG7JmvZZ0EhvNSm14pnGJ6aU8wGakYflIZOZG+25FqDSNYwrqzHD9RQchMQyCPNQ
	W8qGYDiF8RLiSdiR3T1ntiJ3WBg=
X-Received: by 2002:a05:6000:60b:b0:487:b28:c82a with SMTP id ffacd0b85a97d-48dbace40damr26380297f8f.47.1791915808804;
        Tue, 13 Oct 2026 11:23:28 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm6925590f8f.14.2026.10.13.11.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:23:28 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Tue, 13 Oct 2026 18:23:27 +0000
Message-ID: <20261013182327.549640-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_112331_484889_0F570654 
X-CRM114-Status: GOOD (  15.64  )
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

Commit cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the write-buffer chunk
at 256 bytes on an x8 device") limits a Write to Buffer to 256 bytes
when cfi->device_type is CFI_DEVICETYPE_X8, because do_write_buffer()
sends the word count as a single bus word and an 8-bit data lane
truncates it.

The M29EW that commit was written for is an x16 part strapped to x8.
The probe reports it as

  phys_mapped_flash: Found 1 x16 devices at 0x0 in 8-bit bank.
  Manufacturer ID 0x000089 Chip ID 0x00007e

so its device_type is CFI_DEVICETYPE_X16, the clamp does not apply, and
every full 512-byte chunk still times out:

  MTD do_write_buffer_wait(): software timeout, address:0x002203ff.

What limits the count is the width of each device's data lane, not the
part's type. Test that instead: map_bankwidth(map) / cfi_interleave(cfi)
is 1 for an x8 part, for x8 parts interleaved on a wider bus, and for an
x16 part in an 8-bit bank.

On the board (Octeon CN6335, the same M29EW) writes of 1, 2, 32, 64 and
256 bytes to an erased partition read back correctly and 512, 1024,
2048 and 4096 failed with the timeout above; with this patch every size
up to 64 KiB reads back correctly and the u-boot environment can be
saved from Linux again.

Fixes: cfc5ebc9540e ("mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an x8 device")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v2: rebased onto mtd/next (2f7fa8d90694); no other change. It applies
    cleanly to that tip here, alone and together with the point()
    series, so if it still fails for you please tell me which tree
    you are applying it to.
v1: https://lore.kernel.org/all/20261006052435.319751-1-orgads@gmail.com/

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -286,13 +286,14 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 
 	/*
 	 * The word count of the Write to Buffer command is a single bus
-	 * word per device, so an x8 device can be told to program at most
-	 * 256 bytes however large a buffer it advertises - including when
-	 * several of them are interleaved on a wider bus, where CMD()
-	 * replicates the count into each device's lane and it is truncated
-	 * there.
+	 * word per device, so a device on an 8-bit data lane can be told
+	 * to program at most 256 bytes however large a buffer it
+	 * advertises: an x8 part, x8 parts interleaved on a wider bus
+	 * (CMD() replicates the count into each device's lane and it is
+	 * truncated there), and an x16 part strapped to x8, which the
+	 * probe reports as an x16 device in an 8-bit bank.
 	 */
-	if (cfi->device_type == CFI_DEVICETYPE_X8 &&
+	if (map_bankwidth(map) / cfi_interleave(cfi) == 1 &&
 	    cfi->cfiq->MaxBufWriteSize > 8) {
 		cfi->cfiq->MaxBufWriteSize = 8;
 		mtd->writebufsize = cfi_interleave(cfi) <<
-- 
2.47.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
