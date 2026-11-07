Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702C0606A326
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 17:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ft3F0HA6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sGeVxLTZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=udWl4g+xiEAI73zCcOtEYG/AG0u8tudOiG2fhCogm0Y=; b=Ft3F0HA6VmPLFe+C9o9r8zmLaN
	trr3MoOJ7WpqFBnhh8a9E6n+sEuVeEVaaywDPQ0TO1DBnAiQFbEMyMKFFyRhSMX2+pyFmqQBfCmNY
	EqmXlxfsv0JgyB84O0jPrfWkH0Kk3nlOZBVltiF0xH0/i5Ze+fDvvdqsV56QdMrpDSD04c3CdSNR0
	6zhSBM3AdemPa8WYKj+M4C6ukReGr8aOAvp/0AJJnvc3CS7ANthdsuQIM/w6//jhu88fyw3Wdk6g8
	Jqqtbx/2/oU/U4A0y2yRgnWXeYXcK/uks0qw9LfnTAq2Fvujxc6H8fM8FovIZyP7M3gKdGb/gBEic
	r8+KD8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkXy-0000000F8B5-23QP;
	Sat, 07 Nov 2026 17:49:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkXw-0000000F8AW-0wiW
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 17:49:45 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-492f563d1c6so437684f8f.3
        for <linux-mtd@lists.infradead.org>; Sat, 07 Nov 2026 09:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794073782; x=1794678582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7FTZHop0UxdHFyNyA7iFwCVt5lhdjwaOoKxUOdBWl0=;
        b=sGeVxLTZehI8mGeoaL7QVHgT5DwnWG5Wxz56xCOcqmkP5VlfXqGSn0anm1A5ZavJ9f
         HkY4FrPmu8asPcqsMwa6QRK3K0A/WV+fF/0OTdEyhxCs8QNgik6QKZa4/cQ3TwitwKIm
         hjMKQtS5zQUscca3h6cCxP3IJejXFOMjvT8B93U0/lgludIyolE8jD2hgx3JP1u9wTiY
         /QrWXtB5yR1NqO4c0ZvXTb1N5F9v3HSBzse6kul9cZnGqNhtj9rtSJrL9maREmEt+BJx
         u727XaS44026gAfz6ZerCgqyqIex6rC/xZNEQ5ZGsxWn7tFvIJzyv12G8uV3J97Hhx7N
         vIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794073782; x=1794678582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7FTZHop0UxdHFyNyA7iFwCVt5lhdjwaOoKxUOdBWl0=;
        b=BF4SQxMuD4lGLDBwmNXzFMvvofde0i26j7bXYUrSurae3vhRktBF6uQhepND7qPsW4
         iuT4xsKL0CvtzizXjZsxjYZ+3keuCvisSDqqtNSchRmjjvpzBYZpHfcmxi6fQCLDE8E/
         9ejxFUmz8d8sfdwwPGC/9J6AgNLvnVCFc3d/X31wJNEDQHF6QHIcCcwwZmlcasjJ5QGt
         dL+PLYlWOxUYM1KA/AIXU2nVULPslsCmmLkIoM2ANZEhz/02AUf19u/aeZGzL/5+e9Cg
         YTXsU0kipFBonlMvyMXje+HB3j6Zux43yX4JycC/wBBW2p09H1jDUfbAvXLnHAk3q2Gb
         FE+w==
X-Gm-Message-State: APuU4Z/FLpDzQcuzlzyHmLbN1MRZPO+zGO1cRv3V0x7W/h2zpwvaNU3u
	6doEm0YaGVG8JnJwLHyOpv7NHm8pzbl6M1orB+XpA02x2JyRmQUSfnSu
X-Gm-Gg: AYBFou1O7L0V/yRdw/ZX3l3D+rN0G4sqpYKt/NF6EgipmDcxZP5OCoT93hqGaP+jKUe
	w7yvsvbJx7pSlC5jUBs/qDgPe7494ZZ3x2dp4SwH8LE6EnSdX9sd+h1In/NV7ske7oJrIviNgLS
	sx/fPFjPQ3iGfmO3q/YP18xja7kM5dYer3MiUgYMw9GSBshhmYzcWxbBI0RuxOIBGAfYECJnIL1
	QtgUDfDE2g0uz1cS//jLvpZizwxx7FrxYhmoGYwjFwBGbyL1DSXiwwPSvNBSwg+UuxntMEeBlug
	zJQSh3WgFD4SOm86Gm9v09Hs9egStT+41hWLnz4JdMh02qoaR60XiiUmRs2QvUAngi/t3ikWTam
	lxFZ4WBlz+ouRzCWtDWcCWEremVVfSHM1My5H6QNuZTA90wIIWbtCE9fe7/39NwZ1goGdtvxsCz
	Ci2cPSuyt5Y5Kjzpt+19Fy+9sZCYJSW4JR//I9n79j8tuP8xdtFFmv76QtEeiuomwDvpbb1mTE1
	NLJNpT3RwoU4iUjEeG4XQxA9Fiy+fVybg/yjUwnHKIb0FHOECdeeyBx/XkPj13KUcoBTPv8RtjX
	Yg2I/RZuqmT11+Y7TpmID4i9GIgMBvnAUNp479D0nHfX7pMqqErCYRS+BxjR19S065hmaDJbkGE
	bCIJiZzoW78DNSbOgZzAq1NOkN7L1AtwCYmfENjDrNZIWYP5pRYpPIUoCWdZSvvqeasM0
X-Received: by 2002:a05:6000:480b:b0:488:7dc6:4e9 with SMTP id ffacd0b85a97d-49275373a66mr11446578f8f.10.1794073781796;
        Sat, 07 Nov 2026 09:49:41 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d6085asm14961631f8f.3.2026.11.07.09.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:49:41 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Sat,  7 Nov 2026 17:49:39 +0000
Message-ID: <20261107174940.3323868-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_094944_280866_0B3E3C7B 
X-CRM114-Status: GOOD (  14.62  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Cc: stable@vger.kernel.org
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v3: cfc5ebc9540e is now in v7.4-rc1 and queued for the 5.10-7.3 stable
    trees. Without this follow-up the backport still misses the x16
    part strapped to x8 it was written for, so maybe one for
    mtd/fixes? Added Cc: stable, rebased onto v7.4-rc1, dropped the
    Assisted-by tag (an LLM helped write this patch); no code change.
v2 RESEND: https://lore.kernel.org/all/20261019034922.3805782-1-orgads@gmail.com/
v2: https://lore.kernel.org/all/20261013182327.549640-1-orgads@gmail.com/
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
