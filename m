Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA9FCCF2D1
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLPzyI2nfQYcgE2rVJ9Pgi0FcHwaM519SkoIjDZRXgQ=; b=2lDpg5TRZ90f1L
	gWCpq1HhcLs82o77D6MvN9oMEtvKkdRRzMB8tDytY1aYaTaJKQ6zrY0ReGh2f9JdfJ/39a79w7SZD
	QjPb14Ff4272+P6c1tWNKQy4dGp8wp28bBjdJyWktTfF60Ad9pplAuMfvc8ZZIE/9FGNtx3TpAi0I
	ftDf7q15iuKR0orTdof5sVb/mt2l850/ziMyLKvoo36a/N3Wm2OXU40Iw2ph8YEAvMEPGuitBpzAv
	U4ZTukYIB6zrVDAWI+31RpXhchdMB3mhllrDYfeGAYquW9PpwqpXEWeZ0nt9QQ8r2HyHvZiHVdNgc
	zBGpRwJpJrNnrV9dBg8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMW-000000059CX-2OuR;
	Sat, 17 Oct 2026 19:46:36 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMK-000000058xD-3CZ2
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:26 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-8470d7d430fso123122a34.3
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266384; x=1792871184; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iygLDIgOD8rajawodvAmwVYRk5k/3RMou3i6AByPjMc=;
        b=LyGST5xEH3LEnZE6ZuiizASwiL9cbM12I5mF/khnduO5flbJeW16p4KGRalcOIhQGG
         s+q9RJJRvqxeNca2Vk4WYh/Lo9t1UWKws8L3oNo6VTru4zxGNso6BX0OW7C6wZbQE1WS
         LFU3qiP/Ci9cmnkSeluesD/0frDMjQgMqo3Xf01zqo5kxRIQN9hSUaB1DwVx0Tkg+1Tt
         MzA7kqtDN61vEVzH6iJCxAgFAfLUid0JK+OO59hUMsvZ9ooxyhoOyDRMvnMZP+cbn2MT
         ugk1/RAAPqD1kMryRdISM4rTaagU6scmXhXpvJli/yDEGbTOeK1iKL5cr24pcHAepix6
         vDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266384; x=1792871184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iygLDIgOD8rajawodvAmwVYRk5k/3RMou3i6AByPjMc=;
        b=eICYgrBSppj6utuSn/7vUIeGvOXBbGIXmFnSEX6IUalSH376Izpw3Z5zjgXPk9+UAB
         jiBYwH+XEILcCBovIGsBLIhwVJIr5CuDlu5mr88MSzYfgBcX0lZ9I1sW50p4L/QlX6x+
         p+u0c56aaj7FOt2tHmsCyvUvPraoXCQud4Ol/mraP+atF7/+WJNGS71eCuxUElkRGjSE
         KA4bHIe7pnurGnrq9dll/tvoLNB5njODTv1ngqjyABh98VYkbwm4eHhC6W9rhHR5GGF/
         u5FuC4h3E14aQiKOm8FWOLLCuz1THP79xQRX/7+PRUfF/wCSOAu4COB96pSOhj033Oxb
         LkOw==
X-Forwarded-Encrypted: i=1; AKwUvBwyHl0qyeH69k+uKEsG1WLpXi+xhw5tLtbkowizOAI7H8ukpnuVMUyUTAjG3HEFduoVFy22hDiy/60=@lists.infradead.org
X-Gm-Message-State: AFq9FYJCRzh47eaSUEmzN5pG2yGTJ7LLrSZiv7/BM7NZtaW1xnVS/ipI
	nsHQSFcD0cqIJ5VciAvHjiytBbcRcd1Scom/Eyibm5oMoXQdkQGWZc8Z
X-Gm-Gg: AYBFou3haiwcaMzNIUS7iiMvwlah9nZ2P5m/ef/t1XTRdU6NuAjp/CrlLthsaSPswXu
	SnAmb2SiViIvnB3Kh3rtgvec6pdyGmdoNUTrMe5WtBvaMwPWDdLrfyhRPbiFtPFINMnNXANj++y
	5hQeuUzFSm54sSTI21k9SCCDPnN3ow89wU/M5oT3J7GM1zpojME/+FlHE0wPJObhj0kS34AJQat
	ErggzoGuTDNiVMOCQhaN26piUsJaCodm1IV5bpknd5BtcWaN/iKspCpPkIo9XYofS5yL2o26biP
	k8/+3hPlq0e7kZPmO0UYJu0BvmvSfENNMQD3Sbur0/ex8LN2w/GpsM42rIP6lYAEIG1RKFOIxHo
	8VHja9mBpIFxL/Q+3Rvb+q83T6jAjP6yNYh6lHE7HZnxEKxZ9OuiByGBsxe46Q7xHpiYcwuAGZ9
	JcJJqhOTFGHYRmPLxYZn6g12fs2UX+wIuq7fojKkdwS5XVKKr1BLif70s7lZwIm0NaaM0aPY45W
	YZueJGXCmh2ClhASsxjaZvIcF5bJ1xnPRMvdDPqxuXDkWzQBXq8v3vZmdr/YO4wOwTTHY0gwLtY
	gikQfGQx7TQOK+cfguthj1MxmWXsbyrYACGHIVFgWX3M/2hYh2mjcbZDPLvzupQRz9VpmJpPM9U
	xLCyz+QXBJLIDeAD9vwdug5RKPqiYDHM=
X-Received: by 2002:a05:6808:ec2:b0:503:aaf8:ef12 with SMTP id 5614622812f47-53ccfbb22ecmr2554952b6e.34.1792266383632;
        Sat, 17 Oct 2026 12:46:23 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:02 -0600
Subject: [PATCH v9 07/18] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
MIME-Version: 1.0
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-7-b624c09e3ee5@gmail.com>
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
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_124624_886852_8834B442 
X-CRM114-Status: GOOD (  14.19  )
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

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1db6ee18594a..22cc8998d49c 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1120,7 +1120,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
