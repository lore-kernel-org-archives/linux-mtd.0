Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E640C02192
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 02:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ag0yzKbl5NA8fj/opDGJkb8w0Pmq8BYkt5fPYljQBsI=; b=cIK6R7FVTqUVOo
	SxYR20B+EFZxYGNVbOgzxacr8olMJDbsJfazmln38GLRwikuewWpjUrX2r0cDQgqKIDicFseW44bS
	3d5PhLIf2EsAvbUim7LvA72Q6i9KkoyVNuxbsTS8ddTnkfevhNyPcJupNL004oVlSol0Fe4d9WsVF
	l0hWvV9/RVHuruTEDC/vX4CQnzpIgt0TA7AIYSVp+GYScnYplcUAV6AShlIMNMdh+ezuK86GdkaEH
	LAChFuxrxaKZZEXWqhu9pXHR2YfhKWfyPzvQfOrqB4E1abY2lJDsH5kGOsqlt1RvUjYblFNjhzRzt
	/AXDWsOHCrQNpC+9K6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf8kk-0000000H77a-1C76;
	Tue, 04 Feb 2025 02:33:30 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf8ki-0000000H76a-1u1W
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 02:33:29 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7b6ed9ed5b9so859087285a.2
        for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2025 18:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738636407; x=1739241207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cH7H0PH3nCsAonZFaIiiXIpDDBfA5/nUJG90X2bZFn8=;
        b=aer0fcDhBLkryLpsfqSlMuNRZp8x79kefeQsET71osuleDfe0Iu5LPiUbzw/cOaCPf
         e3kmKIvjMWwahDxrcQMOknSrJFtkNkx86QMTnXi2xXvJK2MIn70n2DP0hk6cbP7Pf/Lr
         /msEcfN73Dt53uktChshtUUkEgi3be2evy8K07erZ/kZ6KWAf6pM9bH1rp9O/pKHCVB5
         CfR1F8Fa1l54J/K/Br81AaCdr75WmlVaITgI+rEdZDXws6jFb+aa9bxO268H5M6W1n+d
         K6yMH46w/24yCj6vm6h3Ri4QHET+3HNXc7a0HtbSlMLDjiv+SCfwfnPFqV6pRshKrtYc
         Kvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738636407; x=1739241207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cH7H0PH3nCsAonZFaIiiXIpDDBfA5/nUJG90X2bZFn8=;
        b=HmAFrXDTvR5ZSTyUqjIJTyWFY27O42pNLDdjdEutzAt0gdzVOSJbO0UMBcvbk5CwVz
         XiBHZStCR24zX+Z7q5wQMHYDtQT6kvI8IX760U2RwptSLX3SNbLJzAGxe6JY9J2+oK8M
         A1w7nIDEREiZKUQLuS2ZdE9Cc98buX+pNOiTL7wLmXoauPZ43wxpgpHxJf8YkVRq3kuu
         KUtbVRWKbWy3BIs8YR/EGPKO0zfIoRPCT1PWQvI7EjiKK0RSTl79BdgcxoK0r5FhRWTY
         gma8F3YbQ77zPVDHy2TVSGIsJHcZh+GlW3/tsaCKBP6FCg7Qzb1sBQV0XWKeb/8OeSot
         cBkA==
X-Forwarded-Encrypted: i=1; AJvYcCWHcTa1cP0b2gbb18Jkgm5B2MK6b6oneUy3VP1HrT6+CuDTw6RJvuoGn2aSZC4p8LECRynVRCweUz8=@lists.infradead.org
X-Gm-Message-State: AOJu0YylTUjdPYVqwpmuRvMNt9qydroREQX5O+TzyXDUAHtKDHW4O1bD
	J7yJ5AsJvvDruZ1ylqfm0pDDHFCmGQ+z663bjdXmEhKSTkKCYyil
X-Gm-Gg: ASbGncsIwCK0ReWk1d8yo5XKJSnc0M6G7zEkFS1om3q9ChY5H7ktVH3xMDJjvYKjs1L
	PbGR54HnZU0nynYNndsB3x8vSSJ16ZrbcLe97/OCCmYn31Hw+ufBQAKZGPArlg0uVSj50u/UMEt
	9bKDBWQLEovHQK0lz85z5d3jg7CpunHToJPhzjm8RWdVCJnLOC6jhx2JMsf2YHNn+UArThprEKo
	mWQ37UQjiN3gJgmKic0lbdMlvy11hkIag5smnKRxVvCecLIEJCGdGRpN+p9ZCRLIb46YHC/Cb4z
	wUcV/3xeNgSOSGQWWXs67T2E5t5YBmo6aR/Pow==
X-Google-Smtp-Source: AGHT+IFkU0QnpYEf727d4vGDJg7962NUWX2M0s4YoN/ETYbpRFdzQ54W40zKw1w4f5qr3g91DhlqwA==
X-Received: by 2002:a05:620a:8394:b0:7b6:ce6e:229c with SMTP id af79cd13be357-7bffcd9b5ecmr4006496785a.55.1738636406808;
        Mon, 03 Feb 2025 18:33:26 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90ccd0sm588688485a.99.2025.02.03.18.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 18:33:26 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: christophe.jaillet@wanadoo.fr
Cc: gmpy.liaowx@gmail.com,
	jiashengjiangcool@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	stable@vger.kernel.org
Subject: [PATCH v2] mtd: Add check and kfree() for kcalloc()
Date: Tue,  4 Feb 2025 02:33:23 +0000
Message-Id: <20250204023323.14213-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
References: <30ad77af-4a7b-4a15-9c0b-b0c70d9e1643@wanadoo.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_183328_503314_B5876964 
X-CRM114-Status: GOOD (  11.32  )
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

Add a check for kcalloc() to ensure successful allocation.
Moreover, add kfree() in the error-handling path to prevent memory leaks.

Fixes: 78c08247b9d3 ("mtd: Support kmsg dumper based on pstore/blk")
Cc: <stable@vger.kernel.org> # v5.10+
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Remove redundant logging.
2. Add kfree() in the error-handling path.
---
 drivers/mtd/mtdpstore.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
index 7ac8ac901306..2d8e330dd215 100644
--- a/drivers/mtd/mtdpstore.c
+++ b/drivers/mtd/mtdpstore.c
@@ -418,10 +418,17 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 
 	longcnt = BITS_TO_LONGS(div_u64(mtd->size, info->kmsg_size));
 	cxt->rmmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
+	if (!cxt->rmmap)
+		goto end;
+
 	cxt->usedmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
+	if (!cxt->usedmap)
+		goto free_rmmap;
 
 	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
 	cxt->badmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
+	if (!cxt->badmap)
+		goto free_usedmap;
 
 	/* just support dmesg right now */
 	cxt->dev.flags = PSTORE_FLAGS_DMESG;
@@ -435,10 +442,20 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 	if (ret) {
 		dev_err(&mtd->dev, "mtd%d register to psblk failed\n",
 				mtd->index);
-		return;
+		goto free_badmap;
 	}
 	cxt->mtd = mtd;
 	dev_info(&mtd->dev, "Attached to MTD device %d\n", mtd->index);
+	goto end;
+
+free_badmap:
+	kfree(cxt->badmap);
+free_usedmap:
+	kfree(cxt->usedmap);
+free_rmmap:
+	kfree(cxt->rmmap);
+end:
+	return;
 }
 
 static int mtdpstore_flush_removed_do(struct mtdpstore_context *cxt,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
