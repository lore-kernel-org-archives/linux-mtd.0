Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B0A606D81A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4YW4Ns0S;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CZHta+VN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RdTC679jvGdqH2EQrNrh2oSC3OpTyxP+mRpN140G0Mo=; b=4YW4Ns0S8PiYI32Bia7+7J8/5R
	fUqUJ3FmUN4Yt1Cd8+8adSLlyqCr1BPTHd6/oo2c5zTXo2W8VjctCeNIPUHw4EHaRl9LJo7RyQoot
	EkZGUe55srrL382oRXc5k0xEUVO9GiLtEQItRjM26jH8suvBJSgy/VTuizA/OUrIs19Bh+YBYJRuP
	JETVS/3Epjwyyw7RPzHRSlygaiBACmkgUK9ZWYtEZMTkPZLwJeCndBYXbFi1Fsh/QCIZ2fKoqjjMO
	OagTsNt4ew0e+b170mhi9rLXAkAlHIOuTLkQoZiIevwMT7AThebvYrUvW40IYgmK2IeQlTIGkyH/5
	ZtP1kg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2gQ-0000000AFk2-06yE;
	Thu, 05 Nov 2026 18:59:34 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2cn-0000000ADKt-3qWW
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:07 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6df5e315bd1so1891497eaf.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904949; x=1794509749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
        b=CZHta+VNyKrp5mp+BxRIABLYr7fS/yQz+ERvjTRhJntxn1kxdpNP98ZSOadE55nKEh
         3vSdXt9sAk3WYfO6KzhOr07z4GnmUJHx6q1JfaWhFOKa5vDtGRFISl3POGRWzt0ZafiD
         HYFHHC4ROHYaZaGDQrkvUFLBjALes+OEp6xQua16zTMaeA9enL8244UNGI8lldn6b8+X
         IJWNec3qt3wsaajkBBiL6RIkQEItkW0yQDBu54/IqTkWdAu6mlO6yV18brqt6Vt81WBF
         6pxKRWqqD0mzI9u+51yXDOsBMBDtXVsVsaxtWyEAGj8Rz4KCzahVM1EOMYcYKU0mUKuF
         W4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904949; x=1794509749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
        b=GFANpXJaE1AzXwJjg7dyDR7AcKll2FqX1dPZfdPpQuHN53G/69/qD4Z50ZB+SSa5yn
         +AisyH/hYWQw9dtoiPV2wjheqBX21d7+KADIRXDksF9BD2yRiDE1lYPAmOvxfRQ0yFea
         esrg3GMZCxQTI+bdAPWkuoaK1YQyHNqNSyj4Xav1jV+WO7Dhlp5xO/U8TyrC3FjkLqLX
         NU7OkVbhw7Cch/lb02WXhRWGwwaRGtfX3knmQjeD/ICrZiweK0I8/E42BdwzABi5zjTP
         U8/Nf8GnwPUK2rSR5KgDKqA1CFExRm2QnaLjBXGnKqzaYfju75IjEQkfU0Bq9KHYYlNq
         5/qA==
X-Forwarded-Encrypted: i=1; AKwUvBwUKqZ1OKlROmh6eXHrDK1GYCHl3amn/0iRe1tAVdfK+KwYu20vpLTWNGv48uUxtMB836UpSFTZZ2Y=@lists.infradead.org
X-Gm-Message-State: APuU4Z859A9LCeiOwygCtDPGFDKBEmp7wvxJYHyy0Hd/rvrtRLFxNJz7
	m+LzgAVJlseQn3wWzkxqbhp33iN4F6Kkd3l88NLDm15WDkkpT1LuIF8X
X-Gm-Gg: AYBFou3myPBrkBDVO6vTxtJV4U+RKZ/fx211PdU7FSUC3tUbeECN1wsOWQqveEunirp
	1/0YzidU4nbW2iGK5is86zj5Zjp1TFk4kRPlKDtOBNXDH7zMuGzyR0SNtnZlTTOFkxFsWCDtWt4
	XVl7hS7XXr7OSg4a/eEUND6vSBB5gRsSxHzD1rc3qeZmgqxcS9rWWAj2HG17y0KZtiRs1AfBCIm
	JwVekcD7RAcse3HCqcTLlRidvmx1sAF66Te/MvcHtYbRuilcimVwXc3/JapPr/d+CyIi5OoorxU
	haZM64OBKdLRw1ZT865Y5Y6oUd0eqc5BJT8Cwqd0Km9pmST3x3Q3ekorXC0VnCTNmpSlPYZhMs4
	Of/rd4mKY4tbt6BElDHMzoPo3ODm1pVB8+4X33dA4qabAGjVyH/XiqAKg8nFcFMlEiaSMYoAMna
	McuFU6HqOOOFlYepHZi16oLtmNzTZ1a+1ml8SrS6UE9Bva6nQ10gANQS6VXhlAoFxSqDYPmlpWV
	udIQC2UvaghMK/hVMgIo/f/SZt8mF0rG/MWcsuCRxDu7qeTZ88kJrMGVcv83boCsia1J8IbugHU
	L9amV6/zDdTgqUccNTsuhAlg4q8XK6aSEPLkZHmgxF47oieYKhvH9i57TXtmtCuHLq6GWNJAyBg
	rrD+mvnb2NrQQ5S+UpNbtjqJuIdJH/W/r2Wdaamyv00i6faHpLNbGXkKbAd5x1pPNsMt2Hs01DV
	AiTjdgs5kSLVSc2guXWAcgHs0fDnYDHDGCDbYcR6k2s6sTdvdaiuP6
X-Received: by 2002:a05:6820:824:b0:6e0:fb60:d5c1 with SMTP id 006d021491bc7-716e744f8bfmr419274eaf.11.1793904948781;
        Thu, 05 Nov 2026 10:55:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:26 -0700
Subject: [PATCH v10 10/26] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-10-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105550_024363_2CAB96AF 
X-CRM114-Status: GOOD (  14.23  )
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
index e952d7f6abef..e79fe46926d8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1236,8 +1236,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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
