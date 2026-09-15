Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CFEC88E53
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EIiLCAjIhIkfKIMHQkFZWpX8ybkmV4ig7W3EGQX1h5A=; b=rNb4B56XnmbQnD
	mSRigEoQ5OOhlWVIt7aGHgmnYn9Gxkagksz3860AKi9g/wFtmwfz+XuMmsqbyzSWyraBFQx7lGviQ
	CqwF3UytdZnhsA6SFHqSbjF9nI0foGOin8G+38PTc07TAeVTzKg+Y/gO/6Xmhp1cXvYoln3O8Smtc
	VoLrcm9TINLLoAeJQSs4hcztPZ/Ubt6eyAryUKezxdPbvSpvjdBYdYfSxVKm0RbceafcItJgKtkXn
	gv8KKTDzPvbIVKRuZ6rF719REUMm9sU0SrWkJV4KtwZLGir58lDKVVXSBDdav7abDpG4DNFIwEYma
	NPlN3vpoAqDspgKC3pPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NMR-00000005QyA-1Gz8;
	Tue, 15 Sep 2026 07:13:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NMP-00000005QxQ-08M5
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 07:13:46 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49e6bad7b79so26303895e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2026 00:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789456422; x=1790061222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7qaufosLZLxweL4OTJOiBy2CZI8aGJ/EJYf86wkdYM=;
        b=MCYcEE7t3EchBaGMxvTZgtK3K1hknQZ5zKjNa0mRSWBqKWS5NH8z1t4wNAOl85cHSo
         bmoeJr1UfnYiRGUws0XpfFh9hTl8tmqvtdcrmlnbjIYaGznX+YMwhYc642UP8JIwkk6w
         paV4p6eSdcWLErWrgz2jQeH1vvIvtfh8LgSBrvCk17FPnlBDPal2x8SX7IpN0my6MyH/
         +F8J0vjZc+n4SPz5m8uaQEAPT2a5ZKZZ684EyGSSUuAFjlm3xnRW+Wj8lb/NhXe5H3JP
         NZBxbzCQv3Wtj+Q9F80wY66t3uE30k6mBK2fncup+6dWi+OZ9RORvqpJ5vsWMAsoFtjT
         NjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456422; x=1790061222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7qaufosLZLxweL4OTJOiBy2CZI8aGJ/EJYf86wkdYM=;
        b=kP4MeHgDDX26FtSpnJJ4mQVF7ydi1dOm5lR0+GCc6YYY/HxXWFrgkdAXBMi6Vdwc3Z
         FqCLWB6AJUcd7Z1u/o+mocSJAHBs9nYWF4jMF7rG3uqGqRlpjio8LmFc4MU3oZYJjX4m
         i8xYYTCUPlfo8yEH2JpJNl/GqFr8Cj9tn/prMJhRUghTBeVKWopoypCl1twCVLNomPX0
         f06H89yf5I+5DiPIz9ABydfPDtAqMGlEb4zEZalc6X+l8Z2pDmxMRo78uVTXY2dzkgQf
         gtCd2Zvo0UImfANP5udS2UcuV1uNqMyLB3Nn3jMt7U86sRRxn5S5P86KUAD09ByFKuzP
         ZUaw==
X-Gm-Message-State: AFuF++k+8QzpD1S0YcOLhkdgFLRNFtrot9kIe/tD+ftZFIiTFiz2Mfan
	PGOO+JWz/68bhSezsVdK76SoczLxoSRdD6Kn3L3w122iSr8P1zecqJrm
X-Gm-Gg: AYBFou0dXJRM3IKbv8+nfx4Hjo2zzNk4koiHY4suEbHM2r9MB5c9KVcvsiUOfYlpc8d
	5ePVmk2oZrLAyxUNtuZv2t5w9BcxiXtmQIprADB1sGnqo3JzR2CWH7Y6iPKW9Ik+cHBzmdcZTFW
	UUxK1+PM4mWjCqtrV0ADlu6MyxmFmkkH4knPbEA4Rit+VsWAwpcGyPXkTo4MHlCRyiE41MYQJt7
	iPx1Gv2JLftxHTTWfqMqWTWx+/IJnQW5tSBHCAVi5v6Gslacfu5m+pXw9r1mMvsCF0ctYL2dPqM
	W+ZzZ2KfMub+iE60kyX8a0Z5bGiQz4rPoiR44p1zf7/B9+jDuTkPejfHDvWdPSecUMEUHQdkK6w
	p79LEGEPCONfIGWwr2Gh/j4IiVu1iRYwWEn97m6DlHkbhdpvEmTPx8F1gaLr6sGE69xqSfeKBsw
	ijKiJHhZZNtx2rX/SK5rOe+QPr033gUzIRyjiZmAnnkUNtzXqMfJG6ryHlxwqq5ft6Hc4Rew2+f
	+vgWttagU+XYDEjqw6Mk5eW1HTHgc83sBSzEy4c0hO7HSLVNb+pmYfpxhNPfpisFEa+08K/eYBf
	JxJgiVGRCe7Q5qaH
X-Received: by 2002:a05:600c:37c4:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-49e7a656db2mr84113715e9.14.1789456421649;
        Tue, 15 Sep 2026 00:13:41 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d1f85desm38601675e9.0.2026.09.15.00.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:13:41 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an 8-bit bus
Date: Tue, 15 Sep 2026 07:13:37 +0000
Message-ID: <20260915071339.15172-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_001345_088951_906FFC44 
X-CRM114-Status: GOOD (  13.88  )
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

The word count of the Write to Buffer command is a single bus word, so
on an 8-bit bus a chunk can hold at most 256 bytes regardless of the
buffer size the chip advertises.

A Micron M29EW (an x16 part wired in x8 mode) advertises a 512-byte
write buffer. cfi_amdstd_write_buffers() used the full 512, CMD(511)
truncated the count to 0xff on the way out, and the chip aborted the
program on the 257th data byte. Every full-size chunk failed while the
partial ones at the start of a write went through:

  MTD do_write_buffer_wait(): software timeout, address:0x03278bff.
  jffs2: Write of 4164 bytes at 0x02c789b4 failed. returned -5, retlen 68
  jffs2: No space for garbage collection. Aborting GC thread

Clamp MaxBufWriteSize in the write-buffer fixup when the bank is one
byte wide, and keep mtd->writebufsize (computed before the fixups run)
consistent with it.

The bug predates the git history, so there is no Fixes: tag.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -283,6 +283,17 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 		pr_debug("Using buffer write method\n");
 		mtd->_write = cfi_amdstd_write_buffers;
 	}
+
+	/*
+	 * The word count of the Write to Buffer command is a single bus
+	 * word, so on an 8-bit bus a chunk holds at most 256 bytes no
+	 * matter how large a buffer the chip advertises.
+	 */
+	if (map_bankwidth_is_1(map) && cfi->cfiq->MaxBufWriteSize > 8) {
+		cfi->cfiq->MaxBufWriteSize = 8;
+		mtd->writebufsize = cfi_interleave(cfi) <<
+				    cfi->cfiq->MaxBufWriteSize;
+	}
 }
 #endif /* !FORCE_WORD_WRITE */
 
-- 
2.47.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
