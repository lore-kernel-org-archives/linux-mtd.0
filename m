Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D45606D827
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 19:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HnqTbn51;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=J36I7YTo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLlHgMQI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w9NeB/urmI4W6iozYZr3Nzp/l7jpDd+YSHWL7PLYZhA=; b=HnqTbn51HT6S9cFs7J3MLSkUgl
	u5uoXJInxV1GdhxkuxuY5HXXv2d4PhDZEDRvluHkZOx0wQ15wtQzpmE9tGz+iYUSEgZLFXW6iD3CL
	e9BnhU4+sejcimVgMXHzFlX5eSgMnsmaVQGi70aAZHpObr3AVr4AaLLw5bEYoLRu5jNcl5USuwBqM
	XDPb5ENoD9WpvOgQHBka6/KLo80+AT8VcctKPyk80uGm8DKXlGSB3kypiFjch/YU9OlFrpvIeV8uJ
	dLtEux5Fp6I5DRl9FTSYnRm/EXfhc+CMbKvXLKkyX4eFYvkEhCuSj/e+FyKd8OXIkcy1LBjtCDUKn
	LSn8jFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2hF-0000000AGGv-1uVg;
	Thu, 05 Nov 2026 19:00:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d8-0000000ADcn-1JJq
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=; b=J36I7YTo6IilosTho420al4qUP
	U7NNRSGu9qCY13WVnkqvN45okwPvZcCX49kcOfO+vSFYUYsa3LDsNV0YnOL5rZX6Gvy+kUQz4UGyA
	y8tzkoNBBdUpWQiRSs7rZd0yG2KwmXa6gbmFsxb3BZu3uJepaLLJ2LhdC3XwqNjtZYsho5e1cy+No
	bWG0wSZV+oqDwNLmgHABsLHuP5SbDLx9bfakrxy/jT8U3QbTBC8gcVikBK+3ODkpEklXPYxyIOSYG
	stWx3iPKnTnuXkc0Hg9GMqz/wwyLjGBiqx3Wsf7rcDkiX9jblP+XmeCPS59nDumwpHAtxnqLF81Jw
	3OHlTlLw==;
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d5-00000003R6m-3Hfk
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:09 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6df0b02fe91so632121eaf.0
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904966; x=1794509766; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
        b=nLlHgMQIgRDylwYaRS0DuxRUrL/BI/pqPWpCRe1jzy4yPfKv+AnRhofS/2mxRCQYCv
         P9eD5D5w064Vb7BkxhWKm6/YkOui8UaX7XgdhvBiaa8EvKMBfll38C0w0fhUUl5YxkF4
         dk46Z48PRazf70SOJLW+R2zteiTtetSKAbKujalvpvpBLpb5Gp2VLBIF7166qG5rwtky
         1bocsioBJ3cQGlTWUKBLIUxiTgXcgezDcbnlz9/w/U5mOB3/cUEsadH9SIrlo5hJYjLi
         cSyQPw0/yaxbg78kG3U8ibHEHEjqY9uwL2YNlGRcfsF2W851LwwKXguWc9dErB7R5LZT
         BBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904966; x=1794509766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8PJ7Wj/MurY/COKSMskXdHgUwbyiv0TEDO/uX+R0bU=;
        b=f8hUNVu6Ta8K3M1RCTPiz7tnDqdKu7D9Q2n2AzIjcw/LA0qbiVjXyNt8OIpExZxPwy
         fPKq1Jv05SusBPKLooUpN75b9W13opzdD+Uw3HANzey3f76GGx3SdCVGL6ToOhVC+de7
         U3bl4P2VMO5mirb1MWg5Wu65FmZoDVjk5c8KMM3kGyJoE5kwgo4WCHcj0/22Y8HCsX+w
         yHv+hCTDzfE+UvhAawb8XQY2Wa/cDni2kgKb/KfacPeuf2I7c4Sq/prWXGPLOgowhW3i
         PcKDxoBB0PqLmHrbBvHL1AVK0Go24owuQSTgdXcCGQVDRCNX68B5QskVycEwYCIjxBfA
         ISHw==
X-Forwarded-Encrypted: i=1; AKwUvBw2o8Lg/POOaNQQb8pfcn0QLoVfnWEETu1SYt5hlIzA0Lo2eBL9+xRe8fw1M89Wfzd4KvpFa0ChMDU=@lists.infradead.org
X-Gm-Message-State: APuU4Z8eiCuHSHUSdR9vn1u7gdq1bFEQS9R1zb4Mr6hM1dUKIJVvG/N5
	WTAyGUA9oKrfFpNg7p3rwS2lXSl03R6XhtnWzmy0ZWV6Vkwerw/R6vx2
X-Gm-Gg: AYBFou3hMd7f/8uU+BetcZgJTBS8hKRW4GdfUuTfu18emHcJiHEEbvmg32i0beVXc16
	iT4rDA//rMNEC6sDIxwaxFHkFFNpqeJqrEJivWjYMvPzj2YtWrXhQDfI9JGNcYOGasafLVNWw2j
	A9CZ7J2y8MhWPvMWwWS5WY0HX5Xts+lmq5uJWMhmJILK+n+kLvXiTWqq8GCyqE6E/Z1cRUiaWIN
	g2sWmwGBdqs6+j/a+RkJ9RxATwFjKVTTNrccWnHOdhhKHeAtyvZWbp5RT1YjbRp9klx4bPsQ9XJ
	mu+I1XQyhBAFOBoQJHDoggDdJ9hgfwhg01JkMS65ZQgca3CRkWNplFUjFwGo2E1+3A81L5Vl9Q0
	ns4vD9GbTDu+MsNRerLra7VGP1IfTa4cbHzY3U3AGt+ylUmqLVpuFtkiBapqbJgh9gTYho2J4HS
	MOkMgRu/jPncoGeynfzaR9DL80zKUh7NLne9kkB321OCCa0I8nAeJForJ14pvKn1CljDwv1Wj8m
	RzMMdZuF7B9qFuFiFfMXOao80i6l8hJK8K0c18WrMjoGAZ6paKnRAlpH8rqYJiPdTVByWyca5b/
	z5iwzRFO2hG939QePXGpqU+H0ACtPUY8vlfZpuugGPzeY7CK07KgNqxtHsYgU5TbZVenbzTfPlf
	tqCvuLApg32Vf7rfL7yHAaA5GoMlxVEFOJ5imZoIysWExWMbiVWThS8H3jX9P81G2x202ODLjza
	JCvlzK4lASH5Yn/8XIRzkBJOxPtHNQgf3QOJnCk6/4X/kx8jrBK6jGGyotdC3mz/wvdbD5kavn3
	w==
X-Received: by 2002:a05:6820:151b:b0:716:e9e0:543f with SMTP id 006d021491bc7-716e9e05899mr67251eaf.11.1793904965992;
        Thu, 05 Nov 2026 10:56:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:39 -0700
Subject: [PATCH v10 23/26] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-23-dca1f6ed29a8@gmail.com>
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
X-CRM114-CacheID: sfid-20261105_185607_770129_8A375336 
X-CRM114-Status: GOOD (  16.04  )
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 11fdc10c7f14..c9135c8abf54 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1718,7 +1718,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
