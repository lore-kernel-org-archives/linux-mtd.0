Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8B1CCF2D1
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csFVFxPwcjVQ6ULZVjzx9mkZL3dX3XlotjeRYrKXAH8=; b=JcLYycTqdxkHph
	xABpk+U/UxtCKTW1aEbiHItKrnqpzSWFvv2E0fGtHK9Ys9TdrlR/i4dH9koG1hvC+yw28JDnkxVp5
	/e6TXHjbbutwr8XjGTfPwULmvyznxcyeBtVspmKeRLa8uojAYhA151V8yTc6snhYvV3wzaqR63kBO
	qwuLDlfsGG4XD8O0acZBQ8a3DAMLielE3eGQWptnMCwHuAh898odcNGAd+zRlPMXbW1XJ2h0ko/gF
	xg1PUYRMfWzhtkrILhHl+ot+ccr1wa8Vi4vN60yUEbAWYtOFMAAb5dpmAjt0g0XKVhq1EuHLiExMw
	UmuOt5qwXna2tAqUgXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMJ-000000058wR-30wq;
	Sat, 17 Oct 2026 19:46:23 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMA-000000058p1-3oMh
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:16 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-53aa0802881so519745b6e.0
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266374; x=1792871174; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=;
        b=JtGzyQ1Agsxx1bvVp6gogL3FmIi2spRWTxfDH6+2FRPzhf1GmWdzqnilQ8ctXhuk3F
         oI874Aanq6bHI8Kh6yW/HdZ0sugtPqPbicQ7hTtfGOMuYIEDNdveKviNqV8VAwuwgujU
         kz0fuTBSHIjdmFm8PJSqQs7w5J5qlPO95tV47SVttKcsMKTo2LhtLVj3HqkYKzO8F57Z
         EGVhFed4qaF8wmuyxM/GOULP2uwDxIysXdLHOmXrBTwAGqTH9emAqhAIk+iHgwpBaHbN
         aeM5oDLh7tnhNLXAREcs82C4SdLP7wnUS/RECUyeLh/zrZl5HAjuAGTKTedAQY1f6f3u
         ufLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266374; x=1792871174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0p7Kisx6irolstjhcUjO1VMqHlDNV2glsnd/sNiGR4E=;
        b=0S725tUYZdKC6AGsJNrj7PJjgba5a8qLBZG8V4eoFW7ZCwh+RQstT14zRZBX+lyCwG
         EILhAG9iNgbUhgDtUoupYzXfG3OTj+Xue3HIo35sePSHhJ3ZK0TAECsT1+kV/+JREr96
         VLTAebN1iYfgpBa3oSC4Lv7irBPSf/jTQpdBmsRYeq0NADgLNYuYUA3ShB/IX2Y99LQD
         hlcyuPW9ijn3elAjMyL7eA/VuwQZ+8fSLz2PpiZMLl4ieQ7LcUSn+70vlXPLabRBxavB
         9xxYaR6wX+siLnmmQMGpRV5Sq0dQz2Gm97Qm2pP3swHvJdCfk/CliDs5XTIIg2D8Ot6a
         DO9g==
X-Forwarded-Encrypted: i=1; AKwUvBzorl+lxxe38xKEDWUpAvm86hkhgOaShBLU/ukICLJM+NkeeF+i932ZfvUIYqFZw22I1yTIpCpS7f4=@lists.infradead.org
X-Gm-Message-State: AFq9FYJMhSjyQkVJnoBoqtmiSnh8NLWwVQZRO5m0PZcP2QwY27rsodB9
	uXFe9xZWRRz3zEfXrxK7RD0S1dqUDqh6V7djHWnX3rDuM7NJLjKa/N4z
X-Gm-Gg: AYBFou2gp3EacIFg2fDuKsj7HXSDOsEUNQFO+ZBAaPK6g97CyyMlFmGtUsgnHy2+jp+
	rLObRPS3NWV5Wvmlal4d6u7B0S4/DwsShKORO+YHuW7qe4p1J9oAW+EAFP4foMnjHLh09u5AUbl
	ai9JNbWHZAnOTLn6xuI2qIOe1KTtJMFNweJZt8tVOHl4i5Zf2ZHRKUHYp0J2kvXuuNbmAZYMh11
	r3uYJGvM4E9LuVytv5H9XqLh/dU5xy5j0RO6sGFXzsEvc3reMXKIBwdtkVSSLuXJaNVFgWE/2Gd
	JF6ToJAYChQDlNmlHrUL4bytKQpvnKbvIA5bonZkBeYGiuWqzCLH14TK+MOFgtLfhrH5hyOoa5e
	G7XKIFCciopVHyW4K50pdycXGqjBMEGHgTtKVIQePMoLacTbbfZd5cAJdK8uysqZ9Tzd4lkdZot
	n8QRd1C+ZB6vho24j7rTOrdu3cbBcnQgCcBauDVxAV2doZecAlvLNVt8xrDI9d1HIqG3Oj+ZEEJ
	k3vjG2ii4i8L1hYDjDatrVMWzkNAcuR12nTBpoBToIiedtxbV6ycpWaHogLBKTkYVwNZcH9BPAT
	uOCGorhu1RqVcgH+36eWhgiqyx7A7OJMpaiBKcAzt1/h9W/o+C3y8Obt+VycA/2x7HBmvVuC6lQ
	KX06JkCqzI15VEHyfICWF
X-Received: by 2002:a05:6808:30a1:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-53ccaf1dc47mr3423128b6e.18.1792266373854;
        Sat, 17 Oct 2026 12:46:13 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:45:57 -0600
Subject: [PATCH v9 02/18] mtd: rawnand: sunxi: reject pages exceeding the
 ECC step limit
MIME-Version: 1.0
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-2-b624c09e3ee5@gmail.com>
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
X-CRM114-CacheID: sfid-20261017_124615_586122_9A4F9455 
X-CRM114-Status: GOOD (  13.41  )
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

The controller has 16 ECC status slots on A10/A23 and 32 on H6/H616.
Hardware-ECC setup checks the strength and available OOB space, but does
not check that the page fits those slots. NAND identification can supply
a larger page size, and the NAND core does not enforce this
controller-specific limit.

If enough OOB space is available, an unsupported geometry can pass attach
and reach DMA code that indexes status and user-data registers by ECC
step. H6/H616 also represent enabled data blocks with a 32-bit mask. The
number of steps must fit the controller even when their user data fits
the register bank.

Reject excessive step counts before allocating user-data lengths or
installing the hardware-ECC callbacks. Check the final step size, after
strength maximization and the conversion from 512-byte to 1-KiB steps,
so valid geometries retain their existing layout. This also keeps PIO
fallback from accepting a page that the controller cannot handle.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-173724@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 80006d1a33d6..bd2193d7259d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2230,6 +2230,11 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->bytes = ALIGN(ecc->bytes, 2);
 
 	nsectors = mtd->writesize / ecc->size;
+	if (nsectors > nfc->caps->max_ecc_steps) {
+		dev_err(nfc->dev, "unsupported number of ECC steps: %d (max %u)\n",
+			nsectors, nfc->caps->max_ecc_steps);
+		return -EINVAL;
+	}
 
 	ret = sunxi_nand->oob_ops->init_user_data(nand, nsectors);
 	if (ret)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
