Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD444CA5FED
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2026 05:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=966fTMw44b0duVK3fJjUaZx1N4OX2sMiBTRFu1bC+7Q=; b=aeSjlYMt6eFGZa
	SgqE0wo5dRhxwzEqMBqMm7RgHVdo8qczPD5m54atRuMKUgMzMkX6cgi8TECSSiAKKM6UNKj+SVTLq
	1TFNYBcd0Apf93oN3lEYDzkXL3LkW8EPpMGQy2Pu6G4EDyHp3+zXu8OkGsSVX2pyFhKEXXb7D+a4F
	wqycUerkTISGDH+VMtZhOTG0DfuSHq01+4yBW5SR1OMf6k26unguDVP9IJ4nbl784huDoE2LJ4CND
	kvS4hu1DJVhXC0QEuFQa3z6Y2pYNd4n4TphesccwaA2wJIDnkDWfN1w4nWYgk+LVK3frFONwHCzep
	LRAO8AdhDAHNYWVgFwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxfP-000000003uI-09vq;
	Tue, 06 Oct 2026 05:24:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDxfM-000000003tu-3Rdj
	for linux-mtd@lists.infradead.org;
	Tue, 06 Oct 2026 05:24:42 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso3765895e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 05 Oct 2026 22:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791264277; x=1791869077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cfYZkc6ArC987rS4AttSeO7Kv6gfqCbmHLs230dlHBs=;
        b=XzwN/GdfgSCLASO+YngaiT1av7OAFmSx1vxfReaXbiWPsMNb/xr1Z6XHzew18y58vT
         rIpN5Z+MwV//q7M+kAZGjSnvB0iR+UF3Z1egFjNtfb5hOrN1j2ZRUmgF3gB+rf+v4M9w
         LrIY7WmCPSuztmSu7rLjY/iROri1euSE6Pazig8vKvXjBtr+iwLsxS9H2aAx5EpJx7bx
         1aMr7aQnTPwaqAu0o+0DDjCsFN7laASiGMYOagCsl4GE+iSo0d/YeFtvckasNEYEjWyl
         DYQbnChVLRdbV8xJR/e3VNkDGPeWSHolLY3raB0i29akN2K39x1jK113L5LZ/jemrpMZ
         Sl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264277; x=1791869077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cfYZkc6ArC987rS4AttSeO7Kv6gfqCbmHLs230dlHBs=;
        b=ijsJeTHqeWDMXn2SPPT7Idt+jXCbUNBwNL9dmu2Huulqaluv73t5YRTtgFWNAYYw9f
         SeldqHU7LKXxIlacSGbdIoPsyVs8jI3Q+Zat18V6FmeTlAkyPTIRipLGAAEHSaxYUMc3
         7TtE20UbzIOh4v+YZPCapvsDs66H+zMubxdBChPNlRFmjOiWJizAXX2TFNACU2UoicEJ
         5WDALWTRwvb3deMLNX3Bt4jmYEYqzUGJidaXMqwNg18fty3Png/Gt+QXfXfAj5uHz4aG
         GU3nFkFHxvpZQwfySo9u5ycl1mpqNeBh2XTjKieZuYpLeIzUlh8GU5cwy/YKtQayCJOI
         VH1Q==
X-Gm-Message-State: AFuF++nylkw95Zrdj82kh5YHOW4vLhA9LsFD/eWZXcALTycd26AUmM0Q
	gSpWlbBvO2l6WF4vph5WlR+61TrfEO18lPpz4lT0oAAgsrrCdHpN7xXH
X-Gm-Gg: AYBFou2Sol7nhg5Qq1f2xa0j/h9irUEIiSAo3UjY0+p52u9fA5wPpEWyGw2yxU+g1SI
	+RSjbvMW0a7p911ryukOKFw1YmoPh5hSEdTt7GMHtMjFDhdq98XZGjcXx092DbXa2PohP7UDCYG
	bCt3fDzX08dcs/39dcnahbZmxik+2Wqd/jjHvJ1KMWPTTpIEFKV5Wyu8Fp/x/SUcYLqE8wIaQoZ
	WQLlNkp03OsaJiLLk60sLYNfPz4W6MwH9li6w7e5hcODVfGQMNK6zP96cSE6M+TRETkshUDlFrs
	evvwNHmPJyDGv2I5ULU3tyHMVlr9EzHB1qkaen0nkPc7/UY9xYFMfai/oT0bMz8m4YNxZNBNB4M
	e/JKMf0upFTA4TGKxTLhk7zHFwOkwsV+HIYjZJZ8eMw4E5t0Iew9ft/KJbPvDcCNxto1dPb3uJk
	3oosolNeOyCw6TM+gudiQQhyFDptHkIlJzScJr9DIsLwiYMCXbTcAyN63RJ3k5FGRJy4MGFs0KR
	Q/+h5WZqlhTBdHfasuetwpPqYh9bBd84nDBA7iXqVCQtjwdRV+UgNwRADgmh/v+0weON/fyxj1A
	xmW81oSTW5thx2Ok
X-Received: by 2002:a05:600c:4f54:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a17b548f39mr4656065e9.15.1791264276693;
        Mon, 05 Oct 2026 22:24:36 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c40a28sm45104075e9.7.2026.10.05.22.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:24:36 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Tue,  6 Oct 2026 05:24:35 +0000
Message-ID: <20261006052435.319751-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916162731.307959-1-orgads@gmail.com>
References: <20260916162731.307959-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_222440_923462_BF36A658 
X-CRM114-Status: GOOD (  15.57  )
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
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
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
