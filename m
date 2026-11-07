Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C68606D80D
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Nov 2026 05:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tv6PKh4D;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iYZhIC3y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=affAfQHJ1Nhg9SaQbxEGsaQG8jBbuaUwPw8FjWoWscc=; b=tv6PKh4DLVM3kfY8k4+GiVe8IG
	ldfxMsKL/PFQMPFMCMXvgV5vHQH/ZcMzVJ6sdGtk6ImJezeQMVMZ+3vPjVkYnitHPcQvgn80xrYkY
	Pwvu/TMfC6s43V4872jwlblMGIn1wUCqDS5VnvOPOfuuwlQa2/rhRwYDkIm4OJAAPTxRdcZFtgDZK
	cMGmOU/y324aWOROe6Gui/nQCf1XGVkjnD1PB5nVwADr02VbajIi+A3nMCyB0UohD0o3SuxRIU/2w
	rSnWMGd679KIf06BAXp6O29bJ0lUAj1iikttzNLCxrq8k/K20/GizOP1Yk++87Sb9Oevu+gsGbbuH
	jH102dtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPYrA-0000000EDuE-44On;
	Sat, 07 Nov 2026 05:20:48 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPYr6-0000000EDsn-1vHx
	for linux-mtd@lists.infradead.org;
	Sat, 07 Nov 2026 05:20:47 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4f55a53898cso683652b6e.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2026 21:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028843; x=1794633643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LwMhLl+xu0B7C01c0BCieuyM+EtzW58W4xVt/k6oVs=;
        b=iYZhIC3y8EQdsFpkbMkLwOoVwzye8drzVEpTr157yjvyUzEbJJKKkFrB7DQ3c/HkKz
         DnvFQOXVWyN/EdXYFradCgpwAeIHL/a/GamSmKHiealeo6ozWYlkPRrV50uyMV07Od7K
         22ife11GOlqRmiPW9tMh+BJQKreftI0zQzbJAK91mR12MBZcr3w6i/+AwwCP++QTBo5n
         BPve4ywJK+6O8XvWIhI9rakGyAXrpAB+DBG9h4cpfcSqiS1RE5PtSiVFBdYu3+hxrglq
         oA2UhNcjXbPUDBoOpgOK/urYQa4PSHp9yaKnzOQh7hYSDUurCXS+o/d/fzImNyyRZPwK
         C5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028843; x=1794633643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LwMhLl+xu0B7C01c0BCieuyM+EtzW58W4xVt/k6oVs=;
        b=l1Mj21iHmeNRJaiDyLZYGouXuLjL1C3BjQRinGW5NiZKHOPopavhISU+AFfBe85DfY
         sFx0UNTxKZh6GM/hyqEHVdeRMNiFst9bfZ84ma4tbEhxRfrkQnmA8MCYMf7pdX6T3Yoq
         fKrCgXPFObGJC7T5jcKy8QSFS7AK+tWBHmhu/hMLyhIsjGYdqarEzJsejuyh+qv3i0Uh
         EOp4N7p0oDn/PWOz0mauNcl7lkn7P1HySmmyjws55l4S5z8s+Xii3MRI5E838WDYeKR6
         krKbeOsgCk9NqgeIDg7Awxum0fUSqQOCrf23y29pq3xKiNgxS3tpmk8Y6KX8XhH2kb2O
         lSjQ==
X-Gm-Message-State: APuU4Z90XatsX8OuQZSpjrsGZipdMq+IXRfJeNJZbs9qtYVwfKjaXizk
	jDqoB9SxgERfJE2p3d7DU6mh3E51NCx4SSBES7IIPSdmgl4brfNcczGhqIu4hw==
X-Gm-Gg: AYBFou0r3WbSw2+bJvaNu8zjPZK8zs7dUAhRrdbhr1MiwND6Jqhi2Av4O9j4BzXDFLo
	Tk/yAUUoWpEKYvM6RCQM2fEUdcK2GBFKkIQQmPkQmg4UZjy2xpRw3t0hnm/EHECAPM+3XI0uMed
	TIlOCuDwO6eFg9FoKYtDFq2VDsKfxqSxkSy7afv5vI1BW99f9YDYa8VnJKDHWqFrvo6tPMua5YD
	snneyhTqCHZ1VgCftEyOEDhervTpb6GPqwEq4fJdr/Cn3JiBpBB4u8NgssJ2YnZhjS4ZvAwD3jB
	r2NwNficujSkM7CBgPUsvxoI1EKml0EDpsOlAyCrh9Z3iQ50F6t67M4r+xtXXSECGzqZrwiWAad
	cXMl0JgvyWO6nekDy2OxPi3gPfPEiLaoPl7r7BgITmtC27ZhkNHJQzSJ5WU80c7cm7SGq8cnp0q
	PROpid3F2AoFMJYTvG6bf2POB0I48fWv0RrNQ2qrv7sp/+mfWWPSwR0fU9dyTGcZKNuBshcRKC1
	c4h52MU0J38TgS85XdqoQtMm3TN0IOz96eP3eI6VxGajTRwNW2AFUt+csKhs3aWmFlf+F/ZFSKo
	6hm25jiLq1wMEN7/zVPxdobZ8pK/TZ1bW/5PHPPvt1nxy9HcWk43KLqVEmSz5VZ10/kCriTVwrh
	GPS0X326SM8XD9MKyHi4bveWZYrDR1dmxt5xvg7kk9Y/fPNFUsRcquA9/J8813SlYPBg7DE2Psk
	Q/6MUH0zG2KQAbF4KSIu+2EjqokU8liOcO70vBpvulrfVynLIC39WGTu2XVj6Q2k9e1E0kKRzeb
	w==
X-Received: by 2002:a05:6808:4497:b0:50a:6fcf:d287 with SMTP id 5614622812f47-567e152f7d4mr3697226b6e.37.1794028843358;
        Fri, 06 Nov 2026 21:20:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7ebf4edsm3059846b6e.13.2026.11.06.21.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:20:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 06 Nov 2026 22:20:39 -0700
Subject: [PATCH 1/3] mtdchar: calculate OOB capacity from the starting
 column
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-submit-mtdchar-page-chunking-v1-v1-1-2973a03531bc@gmail.com>
References: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
In-Reply-To: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_212045_708023_BE3BC047 
X-CRM114-Status: GOOD (  11.44  )
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
