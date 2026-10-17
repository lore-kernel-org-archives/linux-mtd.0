Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF07CCF2C9
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXh+4iqZT4ULltxLV0vclpWr+/BylmbcL0VoX/6cPDE=; b=D7gT/PN6wsjxRB
	W7BH5LwPjtN96/FBQPnDow4CEGjjncGD87wxV8YlfSItUKYVFQWn2TY57l4wPgND87yyKetckes1t
	kGjmu2zl7oipq+Uax6o/UYer+51T5glYMCtkRleM/cr4kByCdoAysZp3gd45qLhKhesZbzeyEyiPb
	U4LBetOesC7bNP622RsdZaVaZKKpv6zMMjSpKd6mfyAAi0LFKO6PJ7k0mCNsIukO1crZXXzQ3fJZI
	Tub2fM5g24ngW1PG+Hm5Jtnma5NHL1wVx3KX+GS83puk/3IZrPsINKxUC+txqcxV0paphsIXMQGyF
	XWR4FF4v5IYWvopE9stg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMr-000000059eI-2jvo;
	Sat, 17 Oct 2026 19:46:57 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMM-0000000591m-3Zv9
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:34 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-504ae5941faso471623b6e.3
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266386; x=1792871186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=;
        b=b+t2DqXiN1mE4VyTXApsDxUTTuL8wTcCZJS2YWxEvFmnQwruon4giVroKPOGF/QM2a
         TAzNxM6WCsW7hAX9ImfdCO9p9n7tVD8WRn/1Nh//auY9RVhgNNDQvRWQFRrankLNCWVb
         +kLbWSR6SL8kKIt/2557z2/iewiBHws3KA+2eHeaos6ww7S+J5T5pSkJQ/ZtWRPrRYlV
         Ep269obGlw7ReuU/1GDuGH0O1CDea4FdYjy/sXm4O0r787u2luom6LWdFum9ZRjJC8U5
         VjtHwdo/enaFMMOQE7P/I8qkBp6986y+lo4Ak8YeF+ggAQ4LK7VKfm2iNgTW5Hq4ijkk
         CYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266386; x=1792871186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZdHG1tGz+KtQsx+1wa5xHbH5Q5lOoI44lGCgj2AqxM=;
        b=xCvIHwPoqbGXvMOQUPXZKQ+dTmY3//5GQLcMIjpVbFsb5fcDVgFj/K8tUCMYf9Z+ig
         /HJWvl5nHvD9HKM9X1MgvQS2q/uv9cykc0aIdwPM/eSGMWWP3uZcMtlI38JLYv1q7MgF
         GR5RZzls3AObFyQYLUZs/EY39hWvnViMlIrBFoXjhlfADCxdwNC/xbDiKiZ7/NuGYwdr
         HrKKMjhYPYNnpJOfu0sVDvSYnLsedOjzHa1OgcEDMEmRghy6MNPAnYh23HWzdLavX9L2
         0q6N4L6wpvq/k1RNWMjS7QDvKRbLRJu6VwxwD7QS5oa2tnNBMQLoxK7FYYf7M8XUAcX4
         Z7RA==
X-Forwarded-Encrypted: i=1; AKwUvBwIT9BHJWjCCrp+ojksuijjtJLMpI/B7E4L7j4FsMOytUcX0I6NhulAxfuoXAa/ubt+/I4LlQHxh4E=@lists.infradead.org
X-Gm-Message-State: AFq9FYIAAD0Eiog1ZZ7/pxwcYBIjIpdu/ZTk4KdwugbFoIs5Ye/DXdj0
	SbpIucuzfPF+32GvQHIll9aWFXdXpsdSjzpMiYS/CxwYkN/53646k+Qz
X-Gm-Gg: AYBFou3cQ+7Tlk9xDPzITlBK/i/1oqBKTR81IQGyFVWbEhhTVInMXtYGN2Na59CBhwN
	lykrUVBXCu7Yj5REWfUAXmb/cU6HtoKtu47NtPU012PhsrpDBXA7CbQFaXFTqg8c17OGIbYJZKJ
	VeAxoZFy/+RBJ79R/8MdkZgUwyeSuIKhF0kcoLVnoZhvRODkhzYhi6pzChY+dvetaDs9IksiaQT
	xu/fnX1RtfHCJZ3hDP+6xakT9ZoZf5eRVpbPjpY8EIgnDW6v7zNgkm9/xYd/PtytUsT/bJQS7tG
	b8zihrB/ma9V0L+7W3Wtv1CBZ7XAvBntk6TH3rG9r31OurQH021Pu9qU+dL1a/vVFmXFKODGkxZ
	7SGkGZlUXQcFhMRrjzYCNC+ruPk4sv+nb0S/s9SlCdW/F8MnPByAvUrCfad3Mpr55oNA0gPAQJq
	BIbdTk0nH/QLdk1hVYb8WN1NvSR+LzkGST4w5k5RMquCMP6TsR9IJpy9YQrXSTyxkP7wn2oZJFc
	x9RxEA/cFLhzwm8I0YDAOW9sqvoAUkaa0sjLDCsgGhxrXmcUKEbf44w3tlKS+PRhZs9Wi4KfwYx
	PnSvGHMAD65S1PjWMFeFHuFlX6n6j5VfsQ8oUN1a0xZAZpneXPfr+W79DV7PxR0Is1VjSfdfWDy
	FaGg3QEkPG0EZkL/nVDpYhWjIc0tLYwtM
X-Received: by 2002:a05:6808:5392:b0:4c0:12f3:6007 with SMTP id 5614622812f47-53cc22e2b13mr2397740b6e.4.1792266385605;
        Sat, 17 Oct 2026 12:46:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:03 -0600
Subject: [PATCH v9 08/18] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
MIME-Version: 1.0
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-8-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_124631_998112_F7DB2186 
X-CRM114-Status: GOOD (  13.73  )
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

ECC exception mode recognizes physical all-zero and all-ones chunks.
sunxi_nfc_hw_ecc_correct() fills their data and requested OOB buffers with
the detected pattern, but sets its erased flag only for all-ones chunks.

The caller skips normal buffer retrieval only when that flag is set. For
an all-zero chunk, PIO therefore overwrites the synthesized zeros with
SRAM contents. With scrambling enabled, those contents are descrambled
data rather than the physical zero pattern, yet the read reports success.
Requested OOB is also reloaded after synthesis, in both PIO and DMA.

After checking for ECC errors, skip buffer retrieval for either detected
pattern. Keep the erased flag separate: only all-ones chunks may set the
page's has_erased_chunk state, which controls randomization when reading
the trailing OOB. Preserve that state if an earlier chunk was erased.
ECC-error steps still take the existing raw reread and erased-page check.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 22cc8998d49c..82af3ccad885 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1231,8 +1231,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		if (erased) {
-			read->has_erased_chunk = true;
+		/* Both patterns are already filled; only all-ones is erased. */
+		if (pattern_found & BIT(i)) {
+			read->has_erased_chunk |= erased;
 			continue;
 		}
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
