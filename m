Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C06606A323
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 23:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4oR68/Dj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=muwZkKGZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PR735w4ig2y2Ih2TJlqIrAHBYzFH6JVEj/Ljg1mgIZM=; b=4oR68/DjyCjG43ZP6vYcwBm4o9
	TMvRu8dqW4TAy7yJD+Sk6l6ocPkqLjPVLVYwVSTDge+SkNYDdfSSVPBNoZep2moyNnZeTOnHzApzv
	9pGgwI9va6PqhSOF0pdy2mIhx1oA7U7oMT8UX2lklj2SneYGYxuHEbqy0XRzzMenj+ddE+tnZWFYO
	Q6/zkAUxYs/jRBrAHqOa5RmXOX+xKmJSxUjPWwZDsEunXmt6t+bmB0CgP9BcNdeEyDMIfiHDnZBOx
	TO/eyRTkRVy3EPrzYN4yLfBEuFTEK0t6RGj/O86vUoogDJxMB5zedu8xTq0Lz8zz/nxE6+ymkYLzh
	4WTignoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNFx-0000000GtBn-1eVa;
	Sat, 14 Nov 2026 23:34:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNFv-0000000GtBM-01is
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 23:34:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ede7cb02daso23213015ad.1
        for <linux-mtd@lists.infradead.org>; Sat, 14 Nov 2026 15:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699237; x=1795304037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ts7qrELy4iZVhgGdLhRbHtA5AlBQL00T0NsgUzPShXI=;
        b=muwZkKGZgbm3NvDkig28s06y571UReT6eXcleY95sfvGaym5VgJ6FqMZYtFV3IHwHD
         1cXpYX6dNbjPwmygHETj7GwpZbH3bPS87y6tkF3WrW/jUVLA/bESjp/VYYAAIWFiIJ7p
         tWHygbA78YWKaoLuc153Ki56MrU0iC9B7um9Nr3OurZO/10YQHc4swU0smxXOSCF7Bjk
         x85HOzoV/LdbDnIFgKtAQ7OY0qre2eZ0n+9EW3DfdpSsLGtkcZMORwMfrPYJM26DcrCJ
         6nSqf9ZlH63J0jSPJNXlIUkn4LJGcVm4FQcv6U9+1eYLPpfoZKOLNkjuewV8h+0D7x9h
         hhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699237; x=1795304037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ts7qrELy4iZVhgGdLhRbHtA5AlBQL00T0NsgUzPShXI=;
        b=m686ji2F0Bw9tiGes+2jWYdPndNB+w2J/Qnd+OL7TTH1vn5WvR5MPTNkdPdUsYiua+
         SPcODg28W29ykVunqYKLTexvQAF/S/EyoYuuCmxXVSZOb1p+w/lzN409OWyHFPHaoB9L
         AJMDnyT1eAijpoc6L+BsKUQvquiO0jCw3YLepKslvF8yGBXmyqCYTFI3qnXkbsKRh3Cv
         agrttkeWHQRs3Knu95+n4y4R6jk97Fgyc6ejiydetHKdkJWnLIDhBAoWYYgJ22jLe1sU
         VeqvCiYMCLIrncXHzvoZRgzwa4hSrKvt1tHVgza+wDd/oYsIkKGOTMXxEVTjEhQLY2MV
         /UTw==
X-Gm-Message-State: APuU4Z+IOJhe4pjKu8gzth9uic0M5MpUcpARo8Ynkd6me3voM0qgPfzY
	V3mmaFWG8ba/LCZXzrdPBbfrmtkm6sunO95gkoh3eA3ed2cX2fQufWnjdxB7Ag==
X-Gm-Gg: AYBFou2vkjXFomYFOfB+j3AubODeqh/jNDUNw1PU0XPIV/lunAgomeb74Bt/XnS/kFH
	UpIUPiofHNz06XmAFC1L54MAoiapgY+C7zXCsRzub4MNAaK9ZfjJ4Bwgso62BamPWxK6GLGGsZz
	M6gau1NY/UxXfhaqYRzBi2FWAPDZXWOUac4olLFRmBSZWqqcknkKeLCxZJOjoHSZgHbvrYnRMXP
	qPqB8Mb282+FNvh/NHu1M+4ddUlCy66YE6F8xfo8VIB+JLRg5zMITLani1uxiWqT+EfFQiN4jHz
	aLzN5pB36UUAkgiJiB/AYPnxFZRq6WBEjlILl8H5hlHy8gIc6cpInXGOmeDU9LQU7XJCRudjAbR
	MkNYAhHgiOejDhnw3nkfppKShMU4QuN77Blh8Ow7NTtK057JLrw1Wkuo0eDYoMhuISfo1L7sZFP
	FQQkJ/Xt9KRgYS5ijTW0Wl4F1nxHti/oNVxgQWWEclrDbaYdmJ6fBEQVF/pZsFK7yGGT3HX9SDJ
	LcUvc6fWUKvdz8btn5yOIvZLl8ixWmVo3tPDlJnrWUnvadI669bdjIZmQrIWwpzxPk4NVsknV8G
	5XmMsLWfJTqMr5ttaDcjGbOp3UqdvYSeuONHP1nX6881o+p/QFszUtRkiB33UiNaoFpotARInFp
	tiBypVRhwBgkRwNNaWEmxQoxZM9a1mdkh5M9AtDBsZvE4hoceA9aTes5PYh0NQhi5y6d1XUNPlc
	0jEA==
X-Received: by 2002:a17:90a:fc4f:b0:3ae:8983:4ef8 with SMTP id 98e67ed59e1d1-3b1b0b5c008mr3971105a91.9.1794699237483;
        Sat, 14 Nov 2026 15:33:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm15393908a91.16.2026.11.14.15.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:33:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] lib/bch: use flexible array member for xi_tab
Date: Sat, 14 Nov 2026 15:33:54 -0800
Message-ID: <20261114233354.84841-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_153359_056288_50E12977 
X-CRM114-Status: GOOD (  12.77  )
X-Spam-Score: -2.1 (--)
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

Convert xi_tab in struct bch_control from a separately allocated
pointer to a flexible array member trailing the struct. This co-locates
the xi_tab data with the struct allocation, reducing the number of
individual heap allocations and simplifying cleanup.

The xi_tab member is moved to the end of the struct and changed from
'unsigned int *' to 'unsigned int []'. The allocation in bch_init()
switches from kzalloc_obj + bch_alloc to kzalloc_flex, and the
corresponding kfree in bch_free() is removed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: resend
 include/linux/bch.h | 2 +-
 lib/bch.c           | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/bch.h b/include/linux/bch.h
index 85fdce83d4e2..e736b3a46e96 100644
--- a/include/linux/bch.h
+++ b/include/linux/bch.h
@@ -47,12 +47,12 @@ struct bch_control {
 	uint32_t       *mod8_tab;
 	uint32_t       *ecc_buf;
 	uint32_t       *ecc_buf2;
-	unsigned int   *xi_tab;
 	unsigned int   *syn;
 	int            *cache;
 	struct gf_poly *elp;
 	struct gf_poly *poly_2t[4];
 	bool		swap_bits;
+	unsigned int    xi_tab[];
 };
 
 struct bch_control *bch_init(int m, int t, unsigned int prim_poly,
diff --git a/lib/bch.c b/lib/bch.c
index c991c71c4cbd..f003965a21b9 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -1320,7 +1320,7 @@ struct bch_control *bch_init(int m, int t, unsigned int prim_poly,
 	if (prim_poly == 0)
 		prim_poly = prim_poly_tab[m-min_m];
 
-	bch = kzalloc_obj(*bch);
+	bch = kzalloc_flex(*bch, xi_tab, m);
 	if (bch == NULL)
 		goto fail;
 
@@ -1334,7 +1334,6 @@ struct bch_control *bch_init(int m, int t, unsigned int prim_poly,
 	bch->mod8_tab  = bch_alloc(words*1024*sizeof(*bch->mod8_tab), &err);
 	bch->ecc_buf   = bch_alloc(words*sizeof(*bch->ecc_buf), &err);
 	bch->ecc_buf2  = bch_alloc(words*sizeof(*bch->ecc_buf2), &err);
-	bch->xi_tab    = bch_alloc(m*sizeof(*bch->xi_tab), &err);
 	bch->syn       = bch_alloc(2*t*sizeof(*bch->syn), &err);
 	bch->cache     = bch_alloc(2*t*sizeof(*bch->cache), &err);
 	bch->elp       = bch_alloc((t+1)*sizeof(struct gf_poly_deg1), &err);
@@ -1384,7 +1383,6 @@ void bch_free(struct bch_control *bch)
 		kfree(bch->mod8_tab);
 		kfree(bch->ecc_buf);
 		kfree(bch->ecc_buf2);
-		kfree(bch->xi_tab);
 		kfree(bch->syn);
 		kfree(bch->cache);
 		kfree(bch->elp);
-- 
2.56.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
