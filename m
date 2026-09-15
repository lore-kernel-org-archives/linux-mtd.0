Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA7FC88E73
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 07:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CX8WRYwfgJej8l8fDrCsCulFdM5fdcjWnoJYY6EYdwI=; b=1rBwOtsfptgqv4
	FPsOZV0241BBeSfo1zb1YauzghKdW/1Bb3jMxGbCel6w7oWoJNlUuyF5IytABRbkflkLtTuv0OgAx
	QJKvpRegl8QaMYXP9hkPpNy1FjU+yGkEZOcf6zHiLi33NPJXtf0yyVyWJHC5yL1jJ91qjTcIZlAL/
	fxt1bVvn4VmGZLl4marr4ACNSro5MQhrJkTBu7ZKQ8yrvbhmFIajFVBU1RYSIMUA/3yGVICPSF6d3
	ksPO5pXC72VGYnvAtwEA2I7fvryZa3G/nDbiMkZ08WHAtcFo7M1VliTAtg985BOkyXnmKvC10q73M
	KFajI3i5i3WmzcNLIXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nw8-00000005Xi4-1yCF;
	Tue, 15 Sep 2026 07:50:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Nw5-00000005Xhr-3rsw
	for linux-mtd@bombadil.infradead.org;
	Tue, 15 Sep 2026 07:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VSuOuej5g477D9OeKfutLbsPFz58l20HxXCWVB4U9S4=; b=ODXMjz6MLUltDLK0wsiuytPen6
	3Mb49H+1dXoAj51h1VsmsYBI09JbkOioSpam2dlfpLIgElaYzz3fORUTKd0nwtAWr2io3d5svrxdj
	4C2dTga9/y5y3TKFsDZBSuYoEFfNLipJNwsFEHSvQ2002jHvYOwRwYxDue7X9EHogKh8DoemsDhx/
	udUyK4SAJ6H/OSAy/vWImvRfjE+vb5rN+7WFc2xJGosolXtFixjV9r1LE7PrjEtfCOnrFv6NouaT+
	NTiLTeiE1Q18gW935HQXc/sh9csIqtcCKWrpBpsXMJxxnCroA6L6MzOFBiB305ATKpZdvBiNVbo+s
	1VMl4F7w==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Nw1-00000006OiA-1jab
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 07:50:36 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e66390995so15361655e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2026 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789458631; x=1790063431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSuOuej5g477D9OeKfutLbsPFz58l20HxXCWVB4U9S4=;
        b=qykEaqRgpQ0gxoC4KRq6btIQJRJTr+Z1QTugTON8cZdjwva/Pc4Nz0iNA6ui8yz+wR
         XT6BfT9C+mWsduvM993llH5mzAPe0TcMZF0e2GeaH15nAvWRg2rSPU9SDg3CO3/8DmDs
         zbrAPt72bymu1rOp6xLFq4XfzQZm2AlyFvL7pbLKcqmZ9Sq+YZp4imNCPFQM2+kq4XF1
         ifvZ871ASptlKr4Ale82Cfxa38moMSj+kHXEOC8tdGoIM2JkUfKx5urUKKCCspadSC/C
         QGb2p1/lOtLSF3YBGZKa4Yj+EwsMWrH4hPBRxCfSJ0ss61mjt3iDER//ssFEvWfb4sXU
         W43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458631; x=1790063431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSuOuej5g477D9OeKfutLbsPFz58l20HxXCWVB4U9S4=;
        b=2N9wQMFNYAWQjbAqnDqvzQnlg02L9TcB2ibGnvHArCq6sSv1P5Y29k0vQvuwfF4iA+
         aSLJFxEKWc8IulffLApBMz1ZZM5tvDD3lNGRrF/G7uelMkxHfhqi58McE2KVYgYAxynp
         a38aRGpnVVyNTa+CamoJ2EmD1enxaT0rbZCxTFffkdXxQD1EjvDjxGTy+ZDs9N/K7TUJ
         nZ32Xp/IU9gOZZkRF6YoOyt6L/qkrbxGZ0M+21wMUMS9nzVXuoErJK4291RwcAaBEyYV
         htydnrMCuNs1wVp8WYFPpPXdCMBVs+QryTS8i39QJXneWLRcVOH9PdCIsk7Xs5YwwTR7
         J/Pw==
X-Gm-Message-State: AFuF++nxJy8MCi1sj7sJ7VZLPJ/JD40iWNiFTOgUANxjFLQjQM369CYJ
	s/IE37RU/o7Aptiylte+eATEGcecinP1JPdGT0mApw6/iISZxV+5co3Z
X-Gm-Gg: AYBFou0iVldcaqfWAtja7L78aG83YWlnhs83LG9R0l+WOItxi5lfWsrKcDvH4Iz1c3x
	kfNHE/rZz6upyZWW211frmG2xX/s9ZFMEOKcugilMkny8wBPEvD1YzTiR1iAzzs9W6GgNuCjOhB
	AC5zGKp8l75Kc9aIyBB699CWeK8NhB7GLZv4oEVdjBxjfT/BY8h4S/EIJyBFyWNXUKq9BNG43N7
	IXHl4JNFDct8V8R+ErX2rWcCPDKI06uITxpIyWgmrJiadE880sAva8pKKfJIs4N/hPDOwTPD5Dc
	D9FDqxuW4sz46SAPfIJwORPWcgtjCY1xADcQYcLUhJv3CGv1cQG3+K0gAU1TpgkCXd543M+yYJ8
	1DSElb4uIOJ8NMLUPcPjR7c+khX6Lj9GesN6SOMMSK8Q3gqixT11qIYPztXtY0tb2WyM+GVLKp1
	PLpd3+8bhiLx3rFxE0+hvUYyfxE+MC4fm+v4lk44YOZp5ZHfUj07kYklHx/meiUkdC+S4OSGIMT
	vZ7PocqsOCvsOr9Ir1C6W6YXt3BI9mxDadsRpZw7tbrNR5+jvejj/yowrFrsONeMeE3iE/ZOqzF
	1HCKM+yDuEqRb6yu
X-Received: by 2002:a05:600d:8649:10b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-49e8191e921mr3226255e9.5.1789458630987;
        Tue, 15 Sep 2026 00:50:30 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef74a5dsm39657655e9.7.2026.09.15.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:50:30 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: cfi_cmdset_0002: cap the write-buffer chunk at 256 bytes on an x8 device
Date: Tue, 15 Sep 2026 07:50:03 +0000
Message-ID: <20260915075028.21658-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915071339.15172-1-orgads@gmail.com>
References: <20260915071339.15172-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_085035_263033_F278829C 
X-CRM114-Status: GOOD (  16.93  )
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

The word count of the Write to Buffer command is a single bus word per
device, so an x8 device can be told to program at most 256 bytes
regardless of the buffer size it advertises.

A Micron M29EW (an x16 part wired in x8 mode) advertises a 512-byte
write buffer. cfi_amdstd_write_buffers() used the full 512, CMD(511)
truncated the count to 0xff on the way out, and the chip aborted the
program on the 257th data byte. Every full-size chunk failed while the
partial ones at the start of a write went through:

  MTD do_write_buffer_wait(): software timeout, address:0x03278bff.
  jffs2: Write of 4164 bytes at 0x02c789b4 failed. returned -5, retlen 68
  jffs2: No space for garbage collection. Aborting GC thread

Clamp MaxBufWriteSize in the write-buffer fixup for x8 devices, and keep
mtd->writebufsize (computed before the fixups run) consistent with it.

The bug predates the git history, so there is no Fixes: tag.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

v2: test the device width (cfi->device_type) instead of the aggregate bus
    width. map_bankwidth_is_1() is false for x8 devices interleaved on a
    wider bus, which have the same 256-byte ceiling: do_write_buffer()
    sends CMD(words - 1), and CMD() replicates that count into each
    device's lane, where it is truncated to 8 bits - so two x8 chips with
    a 512-byte buffer are told 255 words and are still sent 512 bytes
    each. device_type is also immune to map_bankwidth_is_1() compiling to
    a constant 0 when CONFIG_MTD_MAP_BANK_WIDTH_1 is off. Caught by the
    Sashiko review bot.

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -283,6 +283,21 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 		pr_debug("Using buffer write method\n");
 		mtd->_write = cfi_amdstd_write_buffers;
 	}
+
+	/*
+	 * The word count of the Write to Buffer command is a single bus
+	 * word per device, so an x8 device can be told to program at most
+	 * 256 bytes however large a buffer it advertises - including when
+	 * several of them are interleaved on a wider bus, where CMD()
+	 * replicates the count into each device's lane and it is truncated
+	 * there.
+	 */
+	if (cfi->device_type == CFI_DEVICETYPE_X8 &&
+	    cfi->cfiq->MaxBufWriteSize > 8) {
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
