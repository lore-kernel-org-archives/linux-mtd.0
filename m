Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5360606A692
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gEavrhMl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wpTbj3Xu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VhdRw6lyDsMD/glCmmwvC+FOhfLe6QW4eAst81P0ICc=; b=gEavrhMlrv91cphpahr9RBtvyP
	fdidcKHIZ+E5KDcZOn5UFuvwbXg2sxiIh8GzP6sar/C7ridxoZGfaMNNBpLV8wNgoOg0qQmJDjLFn
	sH/vdv+uKtoVrvA3Mt9AO2sXuFpFcur+s67tkaKNgWxdwozwCX/1cGLPrs5gvKSTS98yzrjZYNTCI
	h2ACkDHISCSqGGZmsdsN49yRsTCd74YkhG9kqIly2PI5RNAhhcYutczWPl7Ar/hvzOafnUQ0c0tf7
	d2PHmOkIlcS3uJK+PPhgJUtMCm2dY9X+9EcgckXodBHKibWKCFj9SJrOGm8ocz4ExQC6nY4mkX5PB
	nd0s6tVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdZ-0000000GZeP-1Pnf;
	Sat, 21 Nov 2026 01:11:29 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZd9-0000000GZFT-3ElH
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:05 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-8631e07b756so608748a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223462; x=1795828262; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
        b=wpTbj3Xu2D3YdSrydQLinb7Hr/EMNRUt1uz2DEOSqsbKLXvhE2ggOVBF5cqjytHnz0
         F5+yVJgea8M2YXAPP0KL7H+8KeExQIZXu1f2szzJIWJ/6EeRu65FWywfUZNC45zumja0
         wQYL8qF2WA1KkPR4qwn/p+8z8Ne67k61JM5Sw2UersgWoesHyeUze0Ux+h5TUN7E7BGg
         7J6ozB6iQLnrPMkxJnhryBYbAGOqo5Kh5HyqHATXcNq0sR7sr7ytqc/DM6/k1yJO2G93
         oiw1ZK/ol1zqUnipFTRz4W2uZbeBrrVimt7Ft7CGJrX2XY4OByrQ2P7JJwKuHSJqs7lB
         Js5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223462; x=1795828262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRrftGPwx46kokq6Qlnqorb+rnqytcdDxCR8IL9gaTA=;
        b=FVrpjDdH+3p2I09QMAeJ5F4k94dOsAwuUNesZtTOcrfx+VtwmjuUcQc/zdCKnDN93q
         5Yvm6YCGTu9xl8xFafSoH2W413WBD0NzNr0g6UACwit7XolABelc3dSuutnoVIRPG0bV
         I8R5O2ngS4JXmf1baMnCKQu9YK8iMUJmrBen2XAngUDz/Xc004L8Zm9lGwPXUIdIBjGf
         xgNAlVGrTZOs2zYJZZcyLPxggOE5egT2K8hCdkH9Op82qIx2jT0uVphZV5dBkwKHWAuu
         ltgkDfxz21vPnL7M7K0UfibH8a+8QDKhbV9HOhCqZQwgBqEIWGmvzcrQmvEKgrqdyG6d
         gEnQ==
X-Forwarded-Encrypted: i=1; AL+hErE2VNvTW0dKh7MlHf8ljfLWlRevcNpzBjXfmG8ZEpIJBa3qQ43o0mnD9x7aI8eUk/4Im3Epw2WwQmg=@lists.infradead.org
X-Gm-Message-State: APuU4Z/kZracsK7vITu289VRKoc+2U+fAauYAAJq3HVQhHw8LK9DAj/M
	yFcsvn6G8eeqCEnYdE3DwBNmopsi8s8xCT2haomUDxawQb5nj/tkYXnk
X-Gm-Gg: AYBFou23wE8rYSGij7LzKs9O2tsmWBNj7l8K2YlRpecpoF4fqb4zeo2YljcNdeDlsTy
	IzbGtrWigHZ/PjivBq1f4mve71rfqtz94PqWej4b8YDk+xbxDfc5lzXnLpPbRVwfbHO402Czath
	0XRIzVfUMITz/CU0emgfJqydaMJJZSdYDBpQEfAKBwyrFbJ+JdxcE59xRpMEzdE/dzK6773CK8U
	CFuIdTp3qSmhtap2lpD01/WvyQrWrlM5h29N3XoNT02ULqsahZdwhRL+nfJLUtvLhJl+vdVpMBJ
	FuQDIRy4slaCSOWQJzb/Wo8GcRWkBATjcY8t9IWR0U4RnOyv3v9Y8RVfmo1VgVGQiNHNHjRtNlO
	01Hu86ptRbLstIBe9FqfkvDlOZnRKhAI+UXidh9RfNSuw6IUtPMNwLAjNvyGlJZrXk8haCWSno1
	NFTk+bBC6O39+2sX2uJmcysKT+4jC/lhCAxzCLTRA8z5hCXc5Mkfuaf84vr19/xl9GWPHxYVQqb
	K2/t0pvec3XggvjiSVMMe2oE9oPOehmtFBuKVOKL/vfxZXL5FDtTmEGxK6LinTG4+iIgZ9nNre1
	Y9IG7D4YQeLL1tPkV9RO66LnSxDJjSBSPlLZ6XeQmoe5jBqOLJCh2jmjZqf1Kgn1LfjG/tT143O
	T+tG7aompbtbb6iRKgq6Nt5FwUkU34ejIcCEiGIqVZLhIGEa/Cs3uNHAKgYXyJZqZWRo5nc2yDp
	yUD7loJs7/zbYefyhlBxroJx03A/vtfDi+JZtk9GVCl3lJx8XO6TXn
X-Received: by 2002:a05:6808:e8c:b0:4f3:e98f:fa27 with SMTP id 5614622812f47-57a09c1107cmr6207418b6e.16.1795223462573;
        Fri, 20 Nov 2026 17:11:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:28 -0700
Subject: [PATCH v11 05/26] mtd: rawnand: sunxi: reject ECC layouts that
 overwrite the bad-block marker
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-5-9721b1905ef4@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_171103_864028_3071C62C 
X-CRM114-Status: GOOD (  16.55  )
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

On 8-bit NAND with 512-byte pages the factory bad-block marker is at
OOB byte 5. With a 512-byte BCH16 step and 32 spare bytes, A10 and A23
can fit all the parity, but only bytes 0 through 3 are user data. Byte
5 is generated parity: programming a good block can change its marker,
and a mark-bad write cannot set it independently.

Reject on-host ECC if the marker is outside the two bytes reserved for
it by the layout. Leave the on-flash marker at its NAND-defined offset.

This also rejects some configurations that used to probe. On A10 and
A23, requesting a 1 KiB hardware ECC step on a 512-byte page could
trigger a fallback to software Hamming. That fallback kept the
controller's OOB layout: its first three parity bytes occupied offsets
4 through 6, including the marker at byte 5. Selecting software ECC or
no ECC explicitly does not install the controller's layout.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ffbe851b87c7..086618dee999 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -221,6 +221,7 @@
  * On H6/H616, this size became configurable, from 0 bytes to 32, via the
  * USER_DATA_LEN registers.
  */
+#define SUNXI_NFC_BBM_SIZE 2
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
@@ -1939,14 +1940,9 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 
 	user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
 
-	/*
-	 * The first 2 bytes are used for BB markers, hence we
-	 * only have user_data_sz - 2 bytes available in the first user data
-	 * section.
-	 */
 	if (section == 0) {
-		oobregion->offset = 2;
-		oobregion->length = user_data_sz > 2 ? user_data_sz - 2 : 0;
+		oobregion->offset = SUNXI_NFC_BBM_SIZE;
+		oobregion->length = user_data_sz - SUNXI_NFC_BBM_SIZE;
 
 		return 0;
 	}
@@ -2099,6 +2095,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (mtd->oobsize < sunxi_get_oob_offset(sunxi_nand, ecc, nsectors))
 		return -EINVAL;
 
+	if (nand->badblockpos >= SUNXI_NFC_BBM_SIZE) {
+		dev_err(nfc->dev, "cannot store bad-block marker at OOB byte %u\n",
+			nand->badblockpos);
+		return -EOPNOTSUPP;
+	}
+
 	ecc->read_oob = sunxi_nfc_hw_ecc_read_oob;
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
