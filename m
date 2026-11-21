Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0022606A6A5
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nq7FV8vA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNQy0iXS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rVQ0tNf4xzNpG/d+GJy/ziY1kLCGTqSgEbNiNy6wVcU=; b=nq7FV8vAwAcg/NbLF2WBM5yHLy
	C7cFowPVKTcV83oj398Rj6qjK6K6ZCBIxmo9g9UbBeLDRFPle68L2tXDlkqPGhdsuVEFSkhp/HDKh
	fRYlt25UG7DfxdHQO2NpzBXS99L1+KJdZnXYx79GKpHpIby3KodLK9SeoBOCo8ayGHEgQaW7qO94n
	RBhnM5eXAWo4Y1X/3+ggnipq2FIG9hfdErlVn9FRNsBUHTbaE7NS7idZwS1UhlICaIHSQRn85UEZU
	nTd0IuBv0z7BqxCdYHB8qZoic+b0KAKCuetTtbS8J/7+nSHpkGZUymbnzl0wBZJ4mFxGK49aL5zmm
	1nCGUzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZfw-0000000GbWh-2b17;
	Sat, 21 Nov 2026 01:13:56 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdU-0000000GZXm-2t9V
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:32 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so1029050b6e.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223484; x=1795828284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
        b=YNQy0iXSAxejI7Pz/mC4+eXrQ5dv1asTBOSlzhXYcaz7ObR+7Uz0gXtM7JKS86YR3b
         oW1Jj9597FLUvk2VJ5eHqqdSHsre4ANMgvYcEj613AsIZR+9Vg5c8MRm/b92vN+E3ZLH
         CWJT/LOEbzYvuHEvsngg/q8E1/cGVqeN87O34trRZQ5t8YSgHYQUx05XX2fG9aTW1U49
         6wF0TfYEy6Pj+s8+sI3tder1NdbGvJY2Boue7LXclG4J1ioISmOaWRAEAd7E57IuTSfk
         7HWNWIYlrBuwIqUaadyTJiBFdh9a1iZ+bDKoeftKwD13ZTh9d3vr18FUlqhGn3zraToN
         eD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223484; x=1795828284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dWkb9R9dFJf53WgY0/fb7qetN7PVplL4lJbH2mVBctQ=;
        b=lJ9Vc/zEjVQmJ5I6yULuDE1ghZF2uD9ZNSOZRjcRpmGLqJ0VnTVlQptZ6xNVIakYVQ
         piuIUufY0DUUuc5bdDrM+z0KDK/vkLh2T4q2ELC11i5pT/oh7gyTHj9OPVuHtiOAd4kC
         XZoMnygwxkcKwOohhaJicwCbbliy5Ls2YRvwbpYk2vyvHbXB6vEPBdMMmMpZQMKPUb5f
         DfkmJVLcYB0bj7eGTApa5ApMSGagP4hj7yHalyN3y7Ad6i33+saYEH8JvD+wWu9sfpRZ
         zfPxaSmg2X/315WRB9Bip8mocwuWnBUx73LOLwPwgRb6FyY6Vc+LXtLCX9g8y7ZuCh8G
         jVOQ==
X-Forwarded-Encrypted: i=1; AL+hErGGAtZbiXPqIa3GRAV9UqDk+nup3Jqp5ihZvH6xjwl9L8i8cBAdBA9cOfZ4GNEagodYIcCPXMTovCs=@lists.infradead.org
X-Gm-Message-State: APuU4Z+g9d3ZdfyJsP/hFtdTTcyUuFo93qIlMe6aW6UMjKv0iQ9tzat7
	SGv6y1D21ZGjbkzoV2hd2lK9Oo35stCGa2ZOoa0OuHT9ezLNit75AeHJ
X-Gm-Gg: AYBFou1VQfZhyFn+rkqcn6RjIIR7rq/xD52bkgu4nrzsskMXngQpLIFe0VPVHhRSPXD
	O8sy3iAUlAWohgodKamFh2HOnJPge/aP6VieWwZD8IZRWrq99oeQJaB7wwWgO95hQG3fYEgJ9nT
	XcGTj1HvYOjR3djsbv4ojnGQByrX87DV/Hm3PlkB3GBmuBTa1dSCxm+CdBLkqZc0OGSQywdyWFs
	5/pxJHit9U0yQUYLT8m9YdkBqFpvJg++QJxNUHXi6YEQBhkWWQCVxShK3J5vt46g7mRN353mEni
	W6zBDR2TSSFMNAEIae85h2Dd6Ukgo9qE5wCzfrfHKBo+tdKl4L0b2eSLhXDW1G572p/GW8iGQEw
	07Sq/UXhtdAwDk6opcgEstXFnG0sJYG2M190vZl3d2bOCfLViBFqMcjP6j1JlV2wHlLgIsC8tfk
	O/ul/PjLz7tQ6iVX2dNjHYbrWXVg1ULtnkxDe/je1cdzvq0xLcoU2Jt4D8JZ4rVWzMk/1634wfK
	NsJFtn+BmulTWEzm5CzKYB5dMYMgfzSjcicDwsSNsD9YJzLDbvhUqKGJcmMp4XrpbFDARSQ00pg
	bjiHAnz1xHKjEyGpBpf15wjUiUTfoBzsGLMJDOsbhxB+SwPEfqOza6GRvzY2fQiL22vktoQ3o8p
	mCXFxbhqiiHHkSM22myJEFyntpEXSZTboMxWPMwr7mwHpGSo7XZ/97fUVjf1U8jCndBEW60kig3
	oPGCiPUsO/JVCc8s5dQ6FnLoPP0EIyXCiVPBBjL8gFXy3151u8slNp
X-Received: by 2002:a05:6808:4fdf:b0:571:b166:3d77 with SMTP id 5614622812f47-57a0af33b0amr6477590b6e.27.1795223483689;
        Fri, 20 Nov 2026 17:11:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:43 -0700
Subject: [PATCH v11 20/26] mtd: rawnand: sunxi: limit buffer transfers to
 the command byte count
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-20-9721b1905ef4@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171126_285052_8D64F38B 
X-CRM114-Status: GOOD (  13.83  )
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

On H616 a page operation can report success after reading or writing
only part of a large unprotected OOB tail. The controller has 8 KiB of
SRAM, but its normal-command byte count has only ten bits, with zero
encoding 1024 bytes. The buffer helpers use the SRAM size as their
limit and advance by the requested length, even when the controller
transfers fewer bytes.

The operation parser already splits data transfers at 1024 bytes, but
the extra-OOB helpers call the buffer helpers directly. Share the
parser's byte-count limit with the buffer helpers and keep each chunk
within the controller's SRAM. Larger buffers are transferred in
successive commands; controllers with 1 KiB of SRAM keep their
existing chunk size.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 37cc023db74e..4478189bf920 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -89,6 +89,9 @@
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
 
+/* Maximum byte count for a normal data-transfer command. */
+#define NFC_MAX_BYTE_COUNT	1024
+
 /* define bit use in NFC_CTL */
 #define NFC_EN			BIT(0)
 #define NFC_RESET		BIT(1)
@@ -667,7 +670,7 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 {
-	return min(len, nfc->caps->sram_size);
+	return min3(len, nfc->caps->sram_size, NFC_MAX_BYTE_COUNT);
 }
 
 static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
@@ -2498,11 +2501,11 @@ static const struct nand_op_parser sunxi_nfc_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
 );
@@ -2512,11 +2515,11 @@ static const struct nand_op_parser sunxi_nfc_norb_op_parser = NAND_OP_PARSER(
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
-			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 1024)),
+			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, NFC_MAX_BYTE_COUNT)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_exec_subop,
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 8),
-			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, 1024),
+			       NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, NFC_MAX_BYTE_COUNT),
 			       NAND_OP_PARSER_PAT_CMD_ELEM(true)),
 	NAND_OP_PARSER_PATTERN(sunxi_nfc_soft_waitrdy,
 			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
