Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A56606A31B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xjlxjR7l;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TFmuIIv0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a74ULVti
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7g6C9WNerood2Nnzek2Nd5cu5fNJHrjlYGyVMhNyJGE=; b=xjlxjR7l2q6BKcRcBhBKYmFfy/
	0Kbq+j0eyG1nbYFlzBBLA+5l2suGitEsHCughPBhJgmhvyXqGDl8YfRmi3Tt1xAWgX8163lV/Y5Fx
	oRX+oD5nqjoVHJFUjqPjPmSsHGqKvMdzBKnv6jeoBTbIcVNmtWHwXyNNARihlMEGjfbr+tTixhK9z
	KqkCVSveQoZD7IKiIWqol3QBVvhCCcXc9IECobW5yktkAxTaSzFlbDpZXOv0b+gCZBa3IddO8t+Jc
	FBMgFeHf5srytc+o0GFvzXCGnGRCHGttave5rOX54WVNpCohhCcZHFZ8hAiuXCT34wcO9tsBLtGjw
	FKPC0lYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2fb-0000000AF6T-44up;
	Thu, 05 Nov 2026 18:58:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d1-0000000ADUS-0dvP
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=r8+AfGGSzvw+hGNMBk3uLeKXHLvj2EOr91SQHPXuh2g=; b=TFmuIIv0OD6Xsn/6QAYZe2fX4G
	dCPJPJwOow5s4nzWGnbUzkuzfLtEU1loRjklJrxGZegdNKlx+aYxyJDviKLjY4A5/w9YyS6qaqaym
	8a+iMCtu87dK+7WcFTInnMtSnbrmiDjundiZ294Dy1nQHPSwJxlAvTVxNT64Ho/hYy8r01ABRTWqJ
	3OF+axyRm6u2zm417Qkyck8/sucsU1ZsbHmg/mzvIAGARQIk1wpCcjQrbe1TrQ1yANjw5bTXxGylT
	AcuBOCF/X/gj0lRKgS9L1WeasZ2NJKGblcU9RPUNJ3d0kxdRwpT9MZ4W2OJgMOVBrTx4B3LT7Sd/U
	IqLED5nQ==;
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cy-00000003R35-2lls
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:02 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-705cb6cedd5so593379eaf.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904959; x=1794509759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8+AfGGSzvw+hGNMBk3uLeKXHLvj2EOr91SQHPXuh2g=;
        b=a74ULVti1ntIYRhDytTFSYybYWLTl0V0wMtZurvC+TTzzlKB1sk0gCpMFT8eFTl61s
         yTIn7bxuRbGWqks1pLcymN80dugW/f5PvyxSUKyKY6ORhqdQP0V1fjNIDtI8dLVMI6PP
         u1hfT+/yhCiWpx4fJflcHKXkPo/0MEdu2ktn02ieFUiw+0jxXMyqzvSnPXuiRxx+HcyZ
         RB1/uhS1kNDKlE5V5Omx2vjVwD2l33Q2V61XJgx5lodlWZ70HixrPgA25HjFTA2nzt/+
         2e4Z5vhIohV0n553lTZl504Ad27yvnKJqk2U/9jnleNMpPkwpbblSWOTBIB1gOVHzu66
         ifMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904959; x=1794509759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8+AfGGSzvw+hGNMBk3uLeKXHLvj2EOr91SQHPXuh2g=;
        b=XY0APbD+/gjAfuD+/2jCVZVpZ/l2pz+zEhkiEPRvSLuh02U1jrGv8VqHqV2O1bhjuy
         d2nxbvleBsAhDLniXXtanZCoCCLimukVPwz1WQJSpV1LiIylJPR1+KJCu3BPqstq42WU
         NvljKT6ehFLExmcljH0CbPEEoc4iZBUmj1ZjBRP7yQbBjdHkLfucm1lMBgEVTXegx2L6
         NDj1gFuIBvJKmb07RvmjSjCeJhkjzQ+GRW8xWeHUve5Nvi+FiuWHXVb5wW/+Lkdk6ghe
         ALb6NTUEOVYqT7IE6lAZ27CrTjbp4pJxwbdzZB7b6cGiAllnSM+xTs0SMAmuvz46A3TY
         JNOg==
X-Forwarded-Encrypted: i=1; AKwUvBxG/PR3kCHfg7CcBImfUT8LS0S+si3mi3+zc2pdTiATZHwOGw7RprZFd+enhyax7tzdOFBKZAF2ZQg=@lists.infradead.org
X-Gm-Message-State: APuU4Z8wiMsFhzQmsuMgsRoKtuFnLd0yoNxpklHdftVzb+RUg05wAazz
	5AU5JN+jN02nuFM66wccFVr47gZslLcDpIXdgpRt9B0aMU7w6v+AwF1t
X-Gm-Gg: AYBFou1ZpOEDP/XXKV9Y/fpDk1rWTtNMV6mmd4wlWWsD+eA0q7JlT+zmj6SBtFVJftR
	z93ejCgzBfY6Ego4iq6P8NjWwGRsAXgXedz5enF+3x80PI4oCicp7vZwl5qC2r+kiTGj/8yyiAj
	IGfvwXQx5bmoITqtxwuNM2vIspm5GYKbWGuY7cn3XC+1PWPk40qZ/UjWvIoSfc3VDstuUWlmTqy
	lPRyXaN0FYktuzHPyPX31zO0DPfDoAYxH6OXxNEIaSTemc/4C/8kaEYh2Hth4vtlOUznX09QJJb
	TieFGNtdq3L0c36o2VgZXoOx1w//Tfj5nog5CoEShPf2kilq6rVtX4u5UjSx/jUlFd8OOhsQauW
	h7PwkG8NuQAKovaa+CF4zwMm39E7QUwsywIfbh4ejy7XCDriFFA4B2RfN5mWfPZ7wYPOwtQy+pA
	RxWnb3kS3a+673PLEFTY28TYq5y1+nshYYzeFKl0APIgZqC1Wyg8dwTNztQi5t98c5h2cGxi76u
	ggOAvDrwLWYpHoAYbiIXTlNWygToA67fQ4KpHQLnhHJBawn1C47nIdSGf+vjqKhszYv4pnI3hE6
	jhNOQ3/S7znsQmay2w420my1NMwVCdH7H1Cc0pSbI0PKP93RYR1AFZbsZ/Dp7MQ5LzH289c7GRd
	m71aLyR5Z6fViDEQcB0e+4DJYrqwm+zlAA9js7ahP+Rc2rLPPZS5d0xr6S5Im7naUp/mlUquZV6
	v6l6bOIcaa9dbRHU6YNpCwMxP1rtCbWXKmcDdhfZKglJuvF9uDVsmp
X-Received: by 2002:a05:6820:609:b0:70d:53f5:e5fb with SMTP id 006d021491bc7-716e7374b3cmr330726eaf.2.1793904958904;
        Thu, 05 Nov 2026 10:55:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:33 -0700
Subject: [PATCH v10 17/26] mtd: rawnand: sunxi: limit buffer transfers to
 the command byte count
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-17-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_185600_650128_14766CAA 
X-CRM114-Status: GOOD (  15.42  )
X-Spam-Score: 0.1 (/)
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

The H616 capabilities advertise an 8 KiB SRAM size, but the normal-command
byte counter still holds only ten bits, with zero encoding 1024 bytes.
sunxi_nfc_read_buf() and sunxi_nfc_write_buf() use the SRAM size as their
chunk limit and advance the buffer offset by the requested count. A count
above 1024 therefore transfers fewer bytes than the helpers account for.

The operation parser already splits data transfers at 1024 bytes, but the
extra-OOB helpers call the buffer helpers directly. A sufficiently large
unprotected OOB tail can thus be read or written incompletely while the
page operation returns success.

Limit each buffer transfer to both the SRAM size and the command byte
count. Share that limit with the operation parser. Existing 1 KiB SRAM
controllers retain their chunking, and larger buffers are transferred
using successive commands.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7c80f52c517d..636a04f49418 100644
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
@@ -690,7 +693,7 @@ static int sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
 
 static int sunxi_nfc_buf_chunk_size(struct sunxi_nfc *nfc, int len)
 {
-	return min(len, nfc->caps->sram_size);
+	return min3(len, nfc->caps->sram_size, NFC_MAX_BYTE_COUNT);
 }
 
 static int sunxi_nfc_read_buf(struct nand_chip *nand, u8 *buf, int len)
@@ -2606,11 +2609,11 @@ static const struct nand_op_parser sunxi_nfc_op_parser = NAND_OP_PARSER(
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
@@ -2620,11 +2623,11 @@ static const struct nand_op_parser sunxi_nfc_norb_op_parser = NAND_OP_PARSER(
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
