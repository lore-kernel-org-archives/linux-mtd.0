Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02D3C5AC67
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 06:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVQdaLL7peZVqqsnsMfSXpDipNmY7UUFk/BKJ5ITojQ=; b=lErBQpZ7XEMZw1
	FAh504H1ebfLWoIseElNysjXx+QFxmya8Zx9GY8RbFbgO1TBJgvQSKO6mwF6kC43WL6JnG3LIqYnc
	Y36nOZ8a0zqQCiZvo2FZ66YlwwQjd92hynQC5q0hkWtqC0RDWpDxFXtYQxpTRvstgfg1Mobr/0osR
	iiTNPAYMS24Wo/XuRSXmtw6GaLXT4HT7yoSLlNd+jow0ffNMrPgplS4UiH2oqtuzQxA0j+fijLh8A
	ZpwavjDQe72yx8kMmtcN3oTfKkScfnHIMG3+IoCoD/tzLQPmCQ7nzHhK6vrPxieOwEhbhD3vf3y+j
	fFDUvJmPtrrrHbEblF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZ5-0000000DMUl-0pPS;
	Tue, 11 Aug 2026 06:02:19 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfYz-0000000DMRP-2Mix
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 06:02:14 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6acbf97e9a1so1496879eaf.1
        for <linux-mtd@lists.infradead.org>; Mon, 10 Aug 2026 23:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428132; x=1787032932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0tAM+5Cw0fi8Tu1hyOveYDdch8B43Cz5ASbfygeqT0=;
        b=qkAlnc0FG3Yf1QKzDi/vWEW3heA5HL5C3ddhrv8w5MwTdSrO1G5DmjsK0tDmzZTln3
         XM7PNRweCn1lB6sd04ami/S+3f0kJYTOez0Hh8Ov4zu9iPIyeCN6bbIQnFjfbkNNaigz
         4z6x2dvy8So/VpjuLW+nlbuWRakyhaxyfBCxjMtrs2UkI7fT+t8ajVCx59WjQAuq81Jr
         c7Ago9kQb3J5q5bls+9hRdHi7pZKtoLtaPfxG4tKFRWcqfrLsBIrFC0OA6ctT6Ch6ym/
         gA+5lFFGSnMyjcIcZyGvMA+5fPUUoX+0kONpKqq2d8si3DfZ5nV+0mUQHehZSGk1rcHl
         WHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428132; x=1787032932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0tAM+5Cw0fi8Tu1hyOveYDdch8B43Cz5ASbfygeqT0=;
        b=IccP6Od8qUlOAl4Roh1YsXHYVTlcvkGquRAV65tS+JoqRxjIuBAyhFYHsE3LN7ZcaI
         lK4od7NwqGfIqhQOVv3xfDNA7+gv0j9JNzIalJ1hXudTxX24VY+2xWqeTDcOcxBZhgZI
         r/k0GcHNFQTK10KZRg7WTSWF7T8CHsmDLF4L2HvWci0cBslAHih9zexWL+zYkJbW1FNw
         87dD1ucbXXfjxAEvUl+FZh4841XAGHEW8WAHYB2uxdVfNs3vjqelA4VeuN5swjyKM1eO
         mie0OENKXM10JGOLOJZwm3DDG7cm2K0b/7/xTJycpQXbz/h5rWcFOFNcdv7uVv3sRNic
         rDig==
X-Gm-Message-State: AOJu0YzRiU98Fkn5lmHRlwqXUX+wW4lTDvSzeOlanM4qpFvvNmon7IYS
	orA2qKZOWIxiLXjsoYXPV/BREbEEqPPE8CsmaKYIY+9gjXXmzN+IQ4Eu8WjDVg==
X-Gm-Gg: AR+sD11DkuU48lM+8Rr/UBcR+TjCm5RuDpmotDffnV/PqsN9SOilliPBKdGRLtabxH0
	rLLcFJxfJ7EsxJTswc/rS8xbl/xi8qMcEH75b8tN/9RKoeCWEs495X8atUztxI7G2tUY8W175Dl
	LqsncilkCK4B3Fu4RHDOugK8hY3p1DLQQvLTEUSlZgRxnBs03R9UFaaUQ058iup+c1ULNp5zhkh
	w02UrOKUlfYuyuHjRVFKVidNs2J/b88uYQF7ZULEC6SBritW7df3b58vQNi3NvNx07nXpk5W+o4
	WyIOokmw3CKLGYa6fDZ42EbEksPICvtG+c1tDceyjzOCaFxpCDqTnQaIBhG34AkK/Gmp4h36cMi
	25M4Cqcu4HqXruJq7Z0YMDxQO2yy3CX1EVO3FOA7cY81j5Ft2gHCvg8l0FkBJ5L92oux9QQpA0M
	KonmYFx5fs+euDgoZZaoOOccXbtMvkntWlZjL7+c4QK4VpcBZxCCTCpWsIJctppohC5/XQ5oUXK
	GikBX1aiyhH9rnEDzR41VPQdMGqAW5p7ykENVKjaeCROxi+xm1LJN/Q2Wbq1EFWxmExwIdnVfdZ
	zYdCFk1eTTDs/yiiUpWwiRrWUPZ6Ki9wjWNlUy3B0LM5iq9CTDg9NsK/gcz22XvDk3Aqjs6uFVd
	cW+NS9FFEfRRlbRkF
X-Received: by 2002:a05:6820:826:b0:6ac:a45e:ff84 with SMTP id 006d021491bc7-6b0a31724c1mr316204eaf.13.1786428132448;
        Mon, 10 Aug 2026 23:02:12 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 00:02:00 -0600
Subject: [PATCH 2/3] mtd: rawnand: sunxi: reserve a full user-data word for
 BBM
MIME-Version: 1.0
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-2-412e50444673@gmail.com>
References: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
In-Reply-To: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230213_626229_BF2999BB 
X-CRM114-Status: GOOD (  18.19  )
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

H6/H616 protected user-data lengths are encoded in four-byte units,
but ECC maximization reserves only the two bad block marker bytes. A
strength leaving fewer than four bytes therefore selects a zero-byte
first user-data section.

The OOB layout then subtracts the two marker bytes from that unsigned
zero length, and the controller has no protected user-data word in which
to store the marker.

Reserve one complete user-data word while maximizing ECC, reject
configurations which produce no ECC sectors or a shorter first section,
and make the OOB iterator bounds-safe.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 108161fe10cb..01a0d0fa7b62 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1991,7 +1991,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
+	unsigned int user_data_sz;
 
 	/*
 	 * The controller does not provide access to OOB bytes
@@ -2000,6 +2000,8 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section >= ecc->steps)
 		return -ERANGE;
 
+	user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
+
 	/*
 	 * The first 2 bytes are used for BB markers, hence we
 	 * only have user_data_sz - 2 bytes available in the first user data
@@ -2007,7 +2009,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	 */
 	if (section == 0) {
 		oobregion->offset = 2;
-		oobregion->length = user_data_sz - 2;
+		oobregion->length = user_data_sz > 2 ? user_data_sz - 2 : 0;
 
 		return 0;
 	}
@@ -2041,6 +2043,9 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	int remaining_bytes = oobsize - (ecc_bytes * nsectors);
 	int i, step;
 
+	if (nsectors <= 0)
+		return -EINVAL;
+
 	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
 						   GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
@@ -2056,6 +2061,8 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 		if (sunxi_nand->user_data_bytes[step] == 0)
 			break;
 	}
+	if (sunxi_nand->user_data_bytes[0] < USER_DATA_SZ)
+		return -EINVAL;
 
 	return 0;
 }
@@ -2103,10 +2110,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 			bytes -= total_user_data_sz;
 		} else {
 			/*
-			 * remove at least the BBM size before computing the
-			 * max ECC
+			 * User-data lengths are encoded in four-byte units. Reserve
+			 * the first word because it contains the two BBM bytes.
 			 */
-			bytes -= 2;
+			bytes -= USER_DATA_SZ;
 		}
 
 		/*

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
