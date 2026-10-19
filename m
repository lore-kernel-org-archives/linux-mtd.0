Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CB7CCF2D4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2026 03:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z20r32h3yPfY89o7zvXYV/jR5uLw9unnrFCh5eIGxXY=; b=U8PE9cvKuTZdgk
	S5379BBgS9lxuJLyUT85uTm7lchOT7rQnW/uV9VnQOtUSCnSd34CDkN7KkMR/P6SmaZmhONCWlyiz
	eN03Tn75OQH15MBUyMQ+hv6wmFnrrTL4APa+MP9TcxNJEhdtSFLvBcR/ZQEY0O1gAsvus+RPlwoRN
	CR1DOyrCJhPyKegs0lJj8UVgZy061d64NSn+DrXaPuaaP2uaX8wJuV4bsH3CXS++EpEDbmLPaCD/+
	yE2Ywaf1UU3V35QWhiSk+7JwFODk9mITXC2p5dVoZeEQhiYul+RHYXVMzqaQXKllHD4lQru2ri2yu
	jN0JVJ/VaTpA8GaB3FjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIeNN-00000006ZO6-07Nc;
	Mon, 19 Oct 2026 03:49:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIeNK-00000006ZNT-1fCX
	for linux-mtd@lists.infradead.org;
	Mon, 19 Oct 2026 03:49:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so8156045e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 18 Oct 2026 20:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792381764; x=1792986564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UqF9Bl8qiczwJSI3x4ppM91PPkTQtiTR6DplOeX8g3I=;
        b=cmFhh2hMlWq8vvMP7Ea9NVgRRCz8g7v8UdYPVAknW/J9PShVra8EkBfxn8q653mlPK
         CYUASjZdi7my0LFvVS8Ng27cK3OndsNdMdbRUMkVUj0XD2dl+6gmkXT/pJpvxFudiuaZ
         v1T454siAWG23m8KY+Bx4nqeynaLn41Y4veognayhheZyBsNs8wh08N4akSWMGJHO+j2
         uW+7rwJTR3N+NTckzKg1LugYdXH9kcxRq4bAZG/hlDN7ZhD6gO3PtCuHhc7iBf4FqBSU
         KivgIFmLhGhdceWG+FBZs9CaLYOj460cpKmyVujPiVMzmnY2GiFI5rGtOWGRfT3q5hsB
         +yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792381764; x=1792986564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqF9Bl8qiczwJSI3x4ppM91PPkTQtiTR6DplOeX8g3I=;
        b=UMnvAn+Yo+N3edmGF0OuFH2A/zSn4x8iFSCJs2mV0q/DMjg/4z/tdKoA8IuaK6uauh
         NquiPGmbpVRQhmiotA7RN5MNdwLobge6I0JF6uZCtDp0p9HI8KjKse28+heHnBs0Npuq
         WUJRczLFcpVBs+brHKTjE4Uh/9WMPZliUGFHKOlM8LGzxOfP4zM6XZJoTwZcXZNo1+RS
         YxAFpeJeGXVwvVpqXW2QZMJ53klTzMuOczFX8F5lbEB9/VPmjM9z4Z9tzsDgo1XMvxHi
         YiaPNSyzVDckJnN2CgD2GIov/uai1BgPz1j3xxMMBRxthsSje3vBjE4iGzX/9Pgc0Rz2
         c1xA==
X-Gm-Message-State: AFq9FYL9dQXOcdbTyuZq1p1CLwOOefxcqBVlkIZjUSV46pBX/i4DL73C
	m5gLKSErMR3HRVL4nlnwyMd8+0/CgLug/YyHirsjcws3wy4Uk8Ga1hFU
X-Gm-Gg: AYBFou2eLqGH0IPDNVzcLb1nnR/SrLUTDMywcaZv04S3vqQqZoyEfjdk1+LyTCkx8nH
	euiL69WVawfOcSO2gI/J4MliaxVj5g1lCSTde+Tjyk6zapyFUjFWV68RIxeHnIPsnhdKdG9f3z+
	UsGFuIiNbsqrhu6VU3J3415UXkJgYNII5DFbXn9X+l9YWm8EmUEcNCW7g2naUYDfb3126jEOBWQ
	jNGRc704f1t4ChTB2FnPuLEL6032fT7DkcHUVHQuBRgUcPCDzkptg0yjxX4YoOcupeuIEv9bRis
	ScOMl6bu2LvOXSNzTGWH6EwAmhPyZ/5TbDlzAPJw3SGaX8ik/6yJMP9/jjO1h561XKINYZKQa+6
	omXEJgT3+OGIljZFi1zmufAK90MSRcUMxgTIyVp/qK7JRxsurwecDj/sZ1Rqxmy1w60+J3YFeRD
	NC0phEAkLfT8As2BhGFuReXzN5QzI27Lr3+oNFmG0KzFvyuW+vLerW7ENZHV8/wjbbBrmSdy1nP
	W4Kg2J7Xb976ZoNB8icwoKG9m7vQWcgRkiiVdxdlisV/3+MI33N4Y9kte8Sv5UGsy+izaR1Sq9Q
	BFI3wHx8kr8tlGfb
X-Received: by 2002:a05:600c:b86:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4a1d7610722mr124043135e9.24.1792381763606;
        Sun, 18 Oct 2026 20:49:23 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf04ffe9sm171762205e9.0.2026.10.18.20.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:49:23 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Mon, 19 Oct 2026 03:49:22 +0000
Message-ID: <20261019034922.3805782-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_204926_450158_6F3F7390 
X-CRM114-Status: GOOD (  15.71  )
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
RESEND: unchanged v2, which got no reply in a week; it still applies
    to mtd/next (cfc5ebc9540e is its parent there).
    v2: https://lore.kernel.org/all/20261013182327.549640-1-orgads@gmail.com/
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
