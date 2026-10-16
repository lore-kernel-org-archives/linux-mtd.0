Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54053CCA46C
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJsE/jGlzWzZ+Vfl0A3bePTp5MlUwN8JJx0ya7NaHk8=; b=CAev8K/v0tgrUz
	bfeAosdAMbgMLLgx41N6E//a1tiiLA4mw9lIDtvTotE5a7zRhrmhEX0MxjsGdH0wSvrE3/17pJVRU
	7FkRy0f45ej8LtwCKDpMo6x8ICBd5/+2whA1IO/PREk9rLZs6iqXilK5lNyX9mTGgYfQyRhmmZ+/V
	ZPNr7du/ff795Qmax2W9RdjUfmgLjlhvQ4boOfOvQxgCpW5y2qEdFINht6anZZzms2qMprmcLFxep
	53kmKgvJw99xMxJh3DfmaUc72JAR5sldoQpuFlufXDMwaOKRAGzpT+ZMgCKdidab+MhFFAkLmXHIY
	Lvec8Ju2mCWHTgbirFkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtJ-00000001slK-2Hc7;
	Fri, 16 Oct 2026 03:45:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYt8-00000001sTK-2HXl
	for linux-mtd@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=b+uyWszwAFvFc8JbK1nSE8GaRzk3E1Kb/gXy0IKu03o=; b=N7wlUwv5r+aDFzQelKzrZ2Rmmc
	ohQQ6huiLBFAhMr5BTbjSBIrwScIThA632bD9TlVodBgtRYzITLF/7ch2ANYTzt66sJahLHKQqP6P
	EL3Q1hAkCKgAjNdGQcscpBDiaRCE8JmGe4E0rIpzolqE+pzfPbsUyXoUSVSYfq5V2L2cI4YyMMa8K
	OPBWRB1cxvpFyQ+cX8bHgq8j1jgrbpa5TmNzeOkvWw/7pV+aKhz4bXYTwRjSNzeWyVYtRsAaB4/LA
	6X6R+I3evla3CWQJ4PXEcwXgzFNYqZ+/5Mkcmacg+EzgHCkIC6/bLItUTb3E1HEKnsSbMHzjOJIFI
	gifeWlDQ==;
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYt2-00000001432-3Ds6
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:45 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-8241a56cd70so3923484a34.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122339; x=1792727139; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+uyWszwAFvFc8JbK1nSE8GaRzk3E1Kb/gXy0IKu03o=;
        b=MnK9LRE5y8N4dTzMo9MJYsm6csQNEtASvvj8xFy0meuS0T2JTfLSUWvA3Jqi1DXJkg
         BPC8vecSKGKv2ubvTsFcgIJgzj5/xxCchlASC0jt1FEXXaxQXA2isd3MGpkb4Yc3PQvw
         Es7ETGGdDhB468LI3VWAvziD75Mn2F4CLgM3cbM3m5LaXHhqbY6i5MxiYvqKRIIs9aek
         BYm3zPugabGwibsj2G7vcznnuwhUCpYEqTMT/Zp2Y5bZgVfkxJA+2t63USrSpukbS0sU
         7y0SaaUghDgIft7QrKE/ZiIA6LfZS6s9hr7zzjt6x24sJU2TcxSsGsnDW/GNED5qygrT
         rCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122339; x=1792727139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+uyWszwAFvFc8JbK1nSE8GaRzk3E1Kb/gXy0IKu03o=;
        b=lNKTbPFctS0m+brbXIfQEVHXSnM5QFSNANtBqqM5YRsRKFd7Mq8oPwWdJEXOa5QUB9
         8iKZO/RpwAPmDCAj9mgX8a7C9rvJJZrQJrpTx8IIjsK6DAbR4AZwjQmBfOTAc4es3FTb
         spE6lVLiMaIisxqQutxZ4uyO8gW8ELZZdskHdY3uPFQMkAAbv77QGqsWzNaEeMmdKuWP
         YXmGP80CxD2c8Of1sB9cMcPnr4ZHbFnHsjuMZIZ6egzHUszIZt86HKGneRe1hIPRyOtD
         5gNEGUp8w/9gVHgnaJ7wuZRFtJi7blN/ja6y+Gl44clg0hQpomPrWxuxUsT4DoN5Bxc0
         eW3w==
X-Forwarded-Encrypted: i=1; AKwUvByYoKpgraE10oUIAGMopPhvOI50B9gxYfjKswsYqaNXOfQPuv+qTURYsY+W5xUgPyJ88ftpIMbNV6s=@lists.infradead.org
X-Gm-Message-State: AFq9FYJka4XGHe47sboc4fTJZ/RuB4Lu9f+Mo5wnTkrw1qDyk6qwotN5
	hr+97QiQ8uVxQ6y6AvtcvKtcFuD6apOeNOsrTGpSU3oAoYmd+gPoQsk8
X-Gm-Gg: AYBFou0yhjWp3f3hR/8WuwOtyPqkPCmAkIjeBzPUjK7BbGnrdEwjH2idmViHwID1F8Z
	FnPZZv47Qj4zGgFCwFZUoRegnVRa8cFvbAW7WF1P73W16DnUWqKpM/yPRJuHrUrbPASv0uA2qdJ
	97SFdycebHF83iIprylGbqlb9Z1Tu5k6E3nPdLGLqHTgv0p4UHVpnidkn+oCDG57EZDI4SNDW/X
	ON4/C7v0v2gufneyYr2aUQeU2nO1gt6KTnMj4pPmyC0kCpHAhX4b0PDgoBQMgu88G+jeoZp++fx
	6EyKRXyYnXkbw9RxDxsESsWSeO6XCjWrP3AS9UbXGqQwfq6HhP92gOHut+/W+H7/ZfAIdPjVLYJ
	s0kqBoTl1rM6oc+PJqMbCAP5usdJtHlOGOUVW3Uj5qKkkHjSM9V7JbijJZ/Nar66NbVChTzu3e1
	Y884Nco44mY/RxNvNzRb8C4V8mRSq+NGTv2gBd6TAm0vM4hQzUau6pjPzFXTTHTMTUVcZsZrHx3
	UTdGH++NhPTSyy0BLnCh1g+KarsPecyRa7w9JmwyzkHMIFuU7Syk/mH6RBPBDdOrQVpY5kwN/aF
	bmoqhv/kW/E898ZpsrnHDqSATakF5VBEsdYazzcng0yTPW7hhyu9b2lE2kz6W2DvZQG1x/4lmpz
	6D4RzyTexxGX0n7RrggpLgu3nA8bplvWvTw==
X-Received: by 2002:a05:6830:82b9:b0:822:27d6:c281 with SMTP id 46e09a7af769-83094f728ebmr20703536a34.8.1792122338629;
        Thu, 15 Oct 2026 20:45:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:22 -0600
Subject: [PATCH v8 07/17] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-7-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261016_044541_016774_9B9E2176 
X-CRM114-Status: GOOD (  14.60  )
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
index 661ced4e07de..a244d2158d76 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1219,8 +1219,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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
