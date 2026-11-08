Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E785606A33A
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 23:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N6VudB0H;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q7D82cPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=affAfQHJ1Nhg9SaQbxEGsaQG8jBbuaUwPw8FjWoWscc=; b=N6VudB0Hs5A4doah1bDXTFydcD
	WostsfZkITylYZUyLWTV3VAEKpzSk5reXpazpmtgaTexUAtES8kZboZYcT9dTsQ8R9kJTYvwVcgsc
	BfFVt/ZqrSLhDMr+3iyF5G4eY1BX+u1DhKV79JHzolVppLR1uRdegDqt5drtzv29AhwQNX5VOYLsr
	m32NtYCujfqo7xp87Jx5oVqClA7ghRuZ/8gc+lbhGo6hmfh2CZA+iCkqaVAhc1BWFJPXyL9ZyhvQe
	aPlLqlp6WOMfLiCSDvwUFoWEv5BJIy3Rs/Xga5ACIn0eMwt6HWurt63Rnr1t/oNdJ9AUjlxhgqxVS
	wth/oSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCdx-0000000Gw1x-1kPZ;
	Sun, 08 Nov 2026 23:49:49 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCdu-0000000Gw0l-3lzy
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 23:49:48 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-53aa0802881so143582b6e.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 15:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794181785; x=1794786585; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LwMhLl+xu0B7C01c0BCieuyM+EtzW58W4xVt/k6oVs=;
        b=Q7D82cPsJKXub/TXcLHotFuQuOARsbjjpxmCluWnJFPu2B4djDA9CvU5xyRmGoghDI
         qDql/qFxAlJTJ3LAhvA/zO6AhPNq/EXso4GMMZausKO3P1y2kDB667qih1Al6NMuTIeG
         /JyOB2ihLoG08vxrxAepbwlT/oHBMvlQW0ye+Y+ec3/555xSm4oja36+uDCViKEh9Pte
         yPYMqTvMCdckoTIrIe/Ksu61o7rHHSd7b/EuSr+o/bGV/qvpepZWD0u9CWYUagyOx4gC
         SUgdXJtozVyMjpI5eMDp9lJj1sU947wLCFif/wwCQfX1E7o8LukPcqlQ48agw0qaKWQV
         zg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794181785; x=1794786585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LwMhLl+xu0B7C01c0BCieuyM+EtzW58W4xVt/k6oVs=;
        b=IzgeMzHG0XFcJD7aM4LgOTcuty/TRXH9leROVHGtPc+xQ4HFesl3pxWTCq0qUdXHW9
         RaNEjUTEXNlp9YvW1PBpplCaTGY1XOdrOByHmAfELKpOa9VSmGCjDLzHfJwyEGHhpyex
         nJ5yOBJiyHA8ZGrxF/+iSB19nUJZ1ZwY28My7vNHevJ1i8kVpbS3WzvfSHYaQxS5gOYm
         dr0CK/TQxN8jizirZWJiuc1fmEP4yTkNKg8rK2vHy1Jmd0EFae2JjJWkK7NoikPyP3Su
         +sOm2KAi6dNYKnkjLxq+9cT0fMqAgO/qTJlySvP3DQgphq/wdzu+lmzlOtwiAdFk1JdY
         PgNw==
X-Gm-Message-State: APuU4Z94LNEB+sY8tBJqyxFcWaNCvOfNcUUCVwFgrPcF8xQNif0X6jSE
	7R+SxBvJ4RXWTtOETEWXAK9uYdrEfzt4R9uTybys+Gbsajda/zAKL+bt
X-Gm-Gg: AYBFou1kk/FODJ9SCLjKwXqY2A8yK4WrcQpraWJhUpUqVXCFPA0+fvXRl+vE9Dg8YbU
	m9vBgCwcQW90sz+FLfD3Tgi1HarH220Yy+iRhcodyDGs/qHbwmHlfNYdOtv+9yql5dlRl4S4Ics
	uRpGgTObHxy7+IDrKJJ+j1i9tZFlB97OdwBjGR+NsmRAq/ungmr2QTZdQUwpAeLKKZQFYqfHyx1
	Cfodah0rdlMjuEzqrHQR1w3r7F3Z9s71PJ49ZKSZvNat3jL4wRHidK3a20axyPJV/mJ4jJJbICa
	ADK5VIMExQfOdG3sChTDmtPZBjzOADB2wAgdeno2dcXjvYhlFHeevj7QNAT9JnoNpSSLZHRh+hz
	d2xyjMUC0WVezavnUzViTfMY8qSIffZS54KELJZx/NngmhJrPwWrYNQ20RB5YiLvR2RyvbYP14u
	v+xGBw0xkvbhPeJMVkNuLaTWGDpxZBkF6Tls/iG5IYQ3dGRlxy+c2qYpFSgUhYoWym9XMXYdxtD
	3X0HpFCrZYBYj5OhUW8Ivav8Q17QMVriF88OumON/FwhEDouXXkkcvYZvMz3szon+c1L1CGZD8y
	VkAFPs4qp+PxDnNpVV0QxTPQI4K7g6z3dKt5X0EShvAnzhEHSQPP3+OXrDwGhTE57R7n0oNh+6Q
	IPTcWi+Gd2SfgnxpHMvTa9esx7NzBzGvJoZeoU8ViUf7loDkgbl7xktppxsF8ucdc3poDQMl8cT
	bt2sJwAbww8oApJQIAzOQipAp5eppfqSb2K60o5T7X3O19jrJvPPQ=
X-Received: by 2002:a05:6808:50a5:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-56814451b9bmr2054982b6e.18.1794181785525;
        Sun, 08 Nov 2026 15:49:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3019435b6e.1.2026.11.08.15.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:49:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:49:12 -0700
Subject: [PATCH v2 1/4] mtdchar: calculate OOB capacity from the starting
 column
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-mtdchar-page-chunking-v1-v2-1-838cf8934ba6@gmail.com>
References: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
In-Reply-To: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_154946_974301_94889A0E 
X-CRM114-Status: GOOD (  12.04  )
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

adjust_oob_length() needs the number of pages covered by an operation,
not their absolute indices. Calculate that count from the initial page
column and the data length instead of subtracting absolute page numbers.

Use a u64 product for the resulting OOB capacity before limiting the
requested OOB length. This keeps the calculation independent of the
absolute flash offset and avoids narrowing the capacity before the
comparison.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index bf01e6ac7293..19d33dacb62d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -576,18 +576,17 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 static void adjust_oob_length(struct mtd_info *mtd, uint64_t start,
 			      struct mtd_oob_ops *ops)
 {
-	uint32_t start_page, end_page;
+	u64 pages;
 	u32 oob_per_page;
 
 	if (ops->len == 0 || ops->ooblen == 0)
 		return;
 
-	start_page = mtd_div_by_ws(start, mtd);
-	end_page = mtd_div_by_ws(start + ops->len - 1, mtd);
+	pages = mtd_div_by_ws(mtd_mod_by_ws(start, mtd) + (u64)ops->len - 1,
+			      mtd) + 1;
 	oob_per_page = mtd_oobavail(mtd, ops);
 
-	ops->ooblen = min_t(size_t, ops->ooblen,
-			    (end_page - start_page + 1) * oob_per_page);
+	ops->ooblen = min_t(u64, ops->ooblen, pages * oob_per_page);
 }
 
 static noinline_for_stack int

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
