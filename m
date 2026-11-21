Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D012C606A681
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B4ydSJE3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DUKyrF9T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+Q8YEg6lVLAercS1m5WmtpEmhJMT4YxdeorDA6VV7LQ=; b=B4ydSJE3SnojuuZYl7aD6uDjvU
	/yNpNuGGFzuMa+rI6lmxG8sJ2p4q7Y+NNMiRO9/Fkt2ooDJqG/5fxWXbUATAYMD1Q/rZOQdOz+ger
	nfxjyuQa+UeYxF22QdGino+qsORCyEmE4b/58ybJEB0o7qcyXe6YpQMxuo6w5bLj+445ZK3UjlRe8
	ZJHddYHGzIdz7C1VWbPBaeGRI11ZmWaShrtupDJHedi45Pa0D4mvbBn7CHYrCJE8rvRbUHczugxqZ
	pdkk1MFQ5G1CKCf+ETlnqpDJn2S20nyCoPtJYio2vuKVff26v/MBaJ2k711zKOzSSnlPBHcKByHQU
	alJm6pGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZeb-0000000GaVc-3QIG;
	Sat, 21 Nov 2026 01:12:34 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdI-0000000GZKX-0zJe
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:19 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-571eb508e44so785263b6e.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223471; x=1795828271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
        b=DUKyrF9TVLf7kcZzBjEuDqWu6n7qfn0xJFSgnGZfbSOmiO2veNv2XanIViJqIoH5Pn
         q1bo7NWTkveiLBVhJUx93/gS1X6Y1tp8eEKRgJP5HjDVMioTEK9L1eGcMunRvBWs+wXj
         0/rgh3N1d1GyRr9SqztBZA5ahOagvl9JEcvaHolTgScjD4Up1ZD3fmQ0hle8ahhFLtT6
         ITsBL3K2iNVXv/KfMRx5FUPG0JB4zgUi6E0QQYQZ4oNKpnFdJlB9Q4JofPrNlnmfAuJG
         mUI7j8Adb05odjZ/cr0LxdJNN7ywAVrj9Z1PTIGp3pu1MuQEgENZoOoQUZteLbk4nUeZ
         j12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223471; x=1795828271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
        b=KgKFSK83a9pAZ0jeiR+zSIeWq5kDAb0wBgt5bjH35PnUICd2wdB6O2oQwNYDW7buAs
         4E3wAg3aEGJXZUUAoq3df4WeLN5zMx37lJlNIOjFTd2sCECFX5wUWkx6ntdzFeneGcLE
         Ok6L2XMZtBnh2iPQC9ksoQPWVRTfnzwB4A4XjsPymof8M2DReghcKKsIXkqWI4W2zfvH
         LN0AyQ9PE0Vihwif81qWepYSP70epEEsitA6DYz41QaXCJMkfYBbBDY5NXMSlHS1EYzO
         WHvD+zB+1P+yI+y4vN/JH/Beeer5RLrI783PANHPZvzLxA+ecswr0JPANxSq8k41vuOO
         BlbQ==
X-Forwarded-Encrypted: i=1; AL+hErHWvV4s0+JjUM0f+iJJGBTjphi/VIe4PJEvlci6TQvQCoit94FrhdesvWpxpoSl0zreVqXjSECVt8w=@lists.infradead.org
X-Gm-Message-State: APuU4Z/QsRZL7PxjlEQZkHreNnjY87Uc0H47G9JEH5oeKTMbUnPpZhJq
	GBkRN/C9Vz1/9/mpYyjI5Gwtwt5rSk3Q4GQjB+htuf/fjsXvulvMGJdi
X-Gm-Gg: AYBFou2WbXscVrn4mqaMVYnyrcxBKgZozd/W2yH4EjIe79GrT6xCz2AflAWMJPKv11E
	YyDBjHTE89U1rKTBCCueVAUQzYi9bWPywJNQXAZ+9z89m8WOGSCQXBfNhFR/0B5tUYD/RHBXy/2
	fTV8ZbzN2lLoGL0OhcpRNRnV7B8pcpU46jWwscbYE30KI41BVUD/r9fVGfp7x7YYBEkC6x53D8M
	NY84lieHtLAAdfmdmWZYmHgyBPyi3xwQmyS+DGturDjK9N0ftwejnO3npSHf9JKVK0f2wj06qKG
	A4JK4ydyLCcQuPZ9NRERGVxJVo9MBzXUwbQPtfFg4iJ11Gnu5INZZFXUMSudz8d9RmzCmoNhcHr
	bjpupOnIhSQeryxUcy1YgIAdzfRt2DUWgMAoNq2kgkvl/MF1EZJNRDzJs22eOBsRWTou/GTUxXg
	TYkbR8yM6t1/M144g3BUNS6Lv+g/EAl1An8dbYzLgv1mUPb8vsJSY7b0FlBepzvALe2bqFueKPF
	uVzxn7F7HtU/61knzHY5GBWRWqexlRa1onNEMCKPXTVm3kChWIvEdgSId+4ugqy1+HEYCnNLhrH
	pevVLByaYXaVCKoV8//BcmdYdKEiFkExMMQkr0cxAOOb6HqPYWcGUru0BoFc3zHyFQmBMQAWg1C
	CgCKx7kEvghU3j+a87QuVCf/1jwI7rWRmgCXfVMWEGCYYgR9IviSm1anMLfj37XDSOGJqX+EA4P
	9Dt3K4JWpVp+2I+KwlOpaaRgZqJCr+aWFuRBAm+gv6dwuI7nkJk68FFwlLe+Y2yXprD8pOy21ar
	g==
X-Received: by 2002:a05:6808:244e:b0:574:6f37:671d with SMTP id 5614622812f47-57a056c81c5mr5959981b6e.5.1795223471048;
        Fri, 20 Nov 2026 17:11:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:34 -0700
Subject: [PATCH v11 11/26] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-11-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171113_051794_CD27EF4D 
X-CRM114-Status: GOOD (  14.70  )
X-Spam-Score: -1.9 (-)
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

With scrambling enabled, a PIO read can report success for a physical
all-zero chunk but return descrambled SRAM data instead of zeros.
Both PIO and DMA can also reload the requested OOB after filling it
with the zero pattern.

The ECC helper fills the buffers for either hardware-detected pattern,
but the caller skips normal buffer retrieval only for an all-ones
chunk, the pattern it treats as erased.

Skip normal buffer retrieval for either pattern when there is no ECC
error. Only an all-ones chunk selects a raw read for trailing OOB; a
later all-zero chunk must not undo that choice. Keep the physical
reread and erased-chunk check for ECC errors.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 43c0796d953a..538ffcc79108 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1226,8 +1226,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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
