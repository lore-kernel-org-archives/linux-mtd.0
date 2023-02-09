Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B645EC05027
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Feb 2023 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlxlwHV1uzNPs4I/yBG/5o6p8/RJfx6mt0VHIFhsxdI=; b=OuAWVQeQ5PxzqM
	3Labw5SV6h4HWdVdQbpCQW37whzCqK8QZy1+hqnhXC4B6S4Mh53vAqruDm4qlZd+tanv0YvbPOBb4
	NW7tkLlH+k4bcYy8obKEmlUD+bYheQj9gqfwGB2HK72yxfRS9Sc59uJPeQsrSsfKJdBvwvccTagWD
	eFtuBuUQZlaWuzeVmbYE8L4AhAIcumtEniv0zQ8U4UbRcXMquej0HXS0qn2vbRFuEZDNCbK4pJury
	ATYUecjYhNaLKtVo0ZLKTkVGSuidvmRunWPs1BLZaQFWP+VrUQtCZ4vvQk33/acZTPzqb4XODBIrL
	65S7yhqj2YN7B2XsZnug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5jl-001SM8-Rp; Thu, 09 Feb 2023 12:09:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5ji-001SJ0-FZ
	for linux-mtd@lists.infradead.org; Thu, 09 Feb 2023 12:09:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d8so1356653plr.10
        for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2023 04:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vXcr3EDcRp0Ylbj62qgTtHk0lPW9mgyMeN9wckFm4I=;
        b=crJD710JuyXL0EULzJ3GmukihX4/IbiqnMRcoasZyKSJTAMg0LjWdQa6KvSNXvvhRQ
         OlxqvOBKr2V+bqMK+XedPf0jWxz7U8habHo/LdMHf4oX/d9OzZuFvllR9d6CSs2raQbM
         6P8HTvYnCqwBLTOM7hQrzj4GOGtcnTJAzxmKbevka9ixlz8Dhs8qAQPd7f48mP+muYjm
         h7HggT8I+IxCSyAZ1HSVsTWnX1jBAk+gP1CXwn4Czh6bnebj3gMO3H+5NM+Dkfh9NvSm
         gx1pGiVo9hkVK28Dfk9sxGIc0kAY9hp/3WH3jgmdNuNS6kPwHrNubh5jSOtIU7wIpomz
         FZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vXcr3EDcRp0Ylbj62qgTtHk0lPW9mgyMeN9wckFm4I=;
        b=fGZ4nrFW3rrvpnKm9cxOGjxp2xelBkq+FkbUqvIxXi5h9kpakcE8Pu/EkoZjwfyp3Y
         3rfD3Qg8RhAKfH7/hINSqu0Ef4ftwjXpxk192W49ECHGWPKX83FL2bd9O8cS9+ZiVO8h
         KmlN3m7EtmNregaNW7/G6vy+hJD/OR6kJy93gq6jZPBkkBnM4BXb2pYKtyOtyVF/4VtO
         qawwT/YMKvSD32BFMJQJ7RQ5XV8DTKWzI/2sPu0FUYHt9NGDTD12Iltdj62B81Azj74D
         oZBvIHX+W9f7ZngjNcBT19pysca/NtyM5JJfJz4xalZneXxSqyMc4gG1j9Fclz0MvSBX
         STYw==
X-Gm-Message-State: AO0yUKV8+CqV77y0/uYygeUj0Q6dSVr67IIxlmkMuOXkkx5H5mjIEAoe
	LxWP3zv8W6HHi+QItkbUCdYMMqWLlKc=
X-Google-Smtp-Source: AK7set/rMKQwUGeduxtTNp+wm/S1F1rxV4AU5UgUH66YL8tujQSpC4AcQjWOV3nPmdXHAp1tb0sjBg==
X-Received: by 2002:a17:90b:4c02:b0:230:860a:3c7d with SMTP id na2-20020a17090b4c0200b00230860a3c7dmr12207670pjb.22.1675944548543;
        Thu, 09 Feb 2023 04:09:08 -0800 (PST)
Received: from mp600-ThinkCentre-M710t.. ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id ms15-20020a17090b234f00b00233217fa85esm449746pjb.28.2023.02.09.04.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:09:08 -0800 (PST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com
Subject: [PATCH v2 4/4] mtd: spinand: macronix: Add continuous read support for Macronix Flash
Date: Thu,  9 Feb 2023 20:08:53 +0800
Message-Id: <20230209120853.660564-5-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209120853.660564-1-jaimeliao.tw@gmail.com>
References: <20230209120853.660564-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_040910_544600_823DBEDD 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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

Add continuous read flag for those flash with continuous read
feature.

Signed-off-by: Jaime Liao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/spi/macronix.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index dce835132a1e..12c321db892f 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -126,7 +126,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF4GE4AD",
@@ -136,7 +136,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35LF1G24AD",
@@ -214,7 +214,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G14AC",
@@ -244,7 +244,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2GE4AC",
@@ -254,7 +254,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF1G14AC",
@@ -284,7 +284,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF1GE4AC",
@@ -294,7 +294,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     SPINAND_HAS_QE_BIT | SPINAND_HAS_CONT_READ_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
