Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7A3C79F89
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IIEFbUoIiFYnuzj0+4uFyYlYBOSaDm1C3gaQUDDvZKg=; b=ksBHGuV07AhfmS
	InWQrmZ+ZOtXwRVi4LU6yiV02LK8LG3XsxPeW9mt4rNeZKjzZD4wB1/Mt3hIL1ojtjNfUoz6NT9NO
	AWQd8C8RkVLUxyApuJ/YMkzwMh2CVQyzy7OA1b2knh5QThia6Xhry6otogFjazvTBI5r94JEIeXWA
	yoiC5rrXm1uINvoM1OV5VUABSp2Z5cYier+qUPEXfHpnQ+NY+wEgmtZ5083TMXPDqhx5+KqK0wvzY
	/63ZGIOVAal3+8VljCiy5tWqqbq0zli/KK7FQv7GGcZQh6ZHF0sjZiugatFgjrh5qqEl1jNSFe4vh
	Zznv4m5TEm+WO9Od1/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ssx-000000061Yg-2idd;
	Mon, 07 Sep 2026 06:31:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ssv-000000061Xz-1n1e
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 06:31:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2519140a91.2
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 23:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762676; x=1789367476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dq0SpKsLNqUdhZGKulcWkvLVKywODwI8oaC6/cTsqsk=;
        b=F1NCdM//h2QjMxpo693EGBwSkB0fSHBSqdJHWdDv9ytWFuUwWUd585Di52ONIjYGTf
         Yc2XAmGjj+FHlWrFUS5SdJC5UL5pTeiz3vlho0AhRI3/lVnyfXloKOLGbi2POhBfW03E
         PhDMqSIs6LhR4tRj2pCsAolcnLxjeY2WLxNHed39pMEbvSaswy08dat+hZSZ9omCT7vE
         nOabSjCjfgbhS8VrbVvZ40k+dXX1N+WIa8ctHI3HE3Cw/UKShlxJ3+FiWO5s7RMwB08O
         aCckdtZFLSir6bNo5E7NKA8j0FUsuEaeqViBpqSiPnXeiFX9tpnXuQ+HHxhiH5VdqDGr
         b4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762676; x=1789367476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dq0SpKsLNqUdhZGKulcWkvLVKywODwI8oaC6/cTsqsk=;
        b=o+TWHUCk55W1hC2ZelWqZzbvImfv02KC5L0m6kusZvOFEVEDKy6ygdjmtbbg0Vji9T
         u/3ER0wi6hb4BVewlt4cXFqsxKCiKRZFU3FruaUo7hICsXj1qKDaP8XM41xlNDSN7bnx
         BW3g5pfDP9IsJHtRsfUAS7B0yymNXydo2oCjShDsvr12EmKRMyrNGhtp4HzkIAtYRRCU
         wJuXicI08kDkfkL5LGsIyHzd6IW35m/EvrbxGClWs973QwmhKfzno15cUTcu4Mqr4W0F
         JMtvjoGJZ461IAosGKjubkBNeCNP4NueFct1SnPz6beJHkfvoG1zne68m3JTt9PV1rCc
         3Yjg==
X-Gm-Message-State: AFuF++kNAiDGno8mjFLcvS20/jIe/R4Vg9YrHN/H8j5Xwfd0A4Zgf8aQ
	MZmnHiTt0sS6bfAn3Bzwao3qMoz/Na5frVT1ysqSJTMT8A8KGNRLB7CO
X-Gm-Gg: AYBFou0aQFhSStXbg7YlGT9Ly1bIiqSU8VxmjveEvb3DRIRd6Js3T4p0N9qTho4qbQe
	7o9S7RYBKivmTqFfslyAympA3KdQdhBTio6jrvdpZq/okfk6bYfgTl5WmXDl1tjaJ4ojI4UH51Y
	+TTdunX/EBHvYUs6EouCryxu7Am+dkFG53UDUxfTXDLC7Xac+yafgzowHzONoBmRztfLIzHpRe5
	aM4aP/C549yJb9yw6V7Doke9EujMchAt/l2bPTPjUmwNqQtSxYRORuuSQ+4as1d4tbvCRymPtGp
	Uh8dn6GLsnX6AsBTY9/ao/EnqA17j3L2tegli3Nbihac+Q0VWqO9vQ9stJb70o3yz13Rcyt9sSy
	Iy9h/lLjDkPDunU4WnndD1CrX+4+deoj0b5ZVHIxTNgbTlSqXaD2j4h7cOVCIMcUfiVvy66jdMO
	RJO4bWRGhy1grPBL1O3mvGmI7hwOiJSXcwJZ7OT27bcIjk6RjSNm2Qt+hQxRMwsAClJ6BOeTN/D
	dftuo5N53gLj2XRG8r6YhiM
X-Received: by 2002:a17:90b:2552:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39b262728cdmr32640824a91.15.1788762676486;
        Sun, 06 Sep 2026 23:31:16 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm28325245eec.1.2026.09.06.23.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:31:16 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: ubi: fix typo "occured" in comment
Date: Mon,  7 Sep 2026 12:01:11 +0530
Message-ID: <20260907063111.19769-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_233117_463761_E4220941 
X-CRM114-Status: GOOD (  12.13  )
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

Correct "occured" to "occurred", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 5a0db928a90e..44237de52250 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1486,7 +1486,7 @@ static bool scrub_possible(struct ubi_device *ubi, struct ubi_wl_entry *e)
  * @pnum: the physical eraseblock to schedule
  * @force: don't read the block, assume bitflips happened and take action.
  *
- * This function reads the given eraseblock and checks if bitflips occured.
+ * This function reads the given eraseblock and checks if bitflips occurred.
  * In case of bitflips, the eraseblock is scheduled for scrubbing.
  * If scrubbing is forced with @force, the eraseblock is not read,
  * but scheduled for scrubbing right away.
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
