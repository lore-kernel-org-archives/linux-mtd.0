Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A828C433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  5 Dec 2021 23:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3batRsMyIZj/yLy7NKd6td0p9vC0XPazZpV+BxGxmtQ=; b=G0bNsUyEPR6VJ6
	r6fKSDn9UfVo4pP1UA/H3O+1Zn9JXxQkXXYwGjvCqX2VXJpbrE+legEA2w6PxAlkur2vfdKYqKo72
	vUZH5Jk5kYLreoYsqw7AjPFfkzTrM0iDxYLkBeupT6lNKn7dvW2m9UOtiDNkJb5TN0pymaG1749CM
	hZmrsJMGZ1diYy1Bl1QtmZOtUeit1iPmSYamEULqgVvFJWJM8OvFlwKsSENqca5tlumTZkYX6Az3B
	REkyAhunySZCqxKkJOYjwqs/W1ozW6rcQpE+lYBIKIrnuoGmR77xRXfDutX97IxAU+SB8gxo2xtA4
	E6wxWA2dZ2iIF0EEDOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu0ba-0027gi-Dq; Sun, 05 Dec 2021 23:07:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu0bV-0027fv-0d
 for linux-mtd@lists.infradead.org; Sun, 05 Dec 2021 23:07:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so6378126wms.3
 for <linux-mtd@lists.infradead.org>; Sun, 05 Dec 2021 15:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YCs4/c+MZjNeQBr7owALQPbVfoikSkuepr0D43CkZt4=;
 b=etuc3JNHYSR2qBMjnECcQbwGd67gHRN3VVYeLjsq7ZYhehTG+8aw7oVS5D1GcLQDrG
 otwhCin6RMIapm4tLRYP/3a7VSx384sq9rI+TcPg9b8JpCHLcLkwxLK0/vlOEAknDceI
 sfkaeaS5DZmPeHdmNZof/Mcamu9ZioITqILs2lOoSObPpJU1/cd1sropa2N6CSlpa1G6
 moEinBVkA7wyfKCcltaRX+ISLt5Y9piQXX2ELVTW1kxF98pNDQ7GsdOEdKWZFQZJFYpH
 sg4IVc78cn7t98JlQ67ttGJ8PNABFLcNg1mma7j1yULMER8vP2y262/YJIuVTHmovo+8
 pHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YCs4/c+MZjNeQBr7owALQPbVfoikSkuepr0D43CkZt4=;
 b=OmD7E3I0h2IJr8DjJlo1F9DNtjV5JLA3ZjhSaCAdfWeDkNTKe6NsRpksPcDT3XRe/+
 aQyTisPNNo63xzPNsTKUx6XmFzH6SMhfe4R9VoMRWt3jUV7VI8aoqsWXT7AgEd2PatCe
 pqnWM4x3EMv7oSOgopMapIhOeSPiiIIFTonUVavaOZodZlTFelFh9ljHFJJzvmNgiOfi
 HtR1qRlqpZkNayWT/z3qKP/jAUqTbUIMEWxKsdhR07xcQGkz9xsLm8W7F8fc2OXQuFg2
 nsw417i1lc2mv4QLWRWYDh5kTrXyIdHtNUkE9gNTBNamdj8O9wQapC1weeHf9sVZ3QNw
 uegw==
X-Gm-Message-State: AOAM531tND5dLES+NiswP+eBY9Avs+01/quKrp0m+1X+OewA1l8JAIbH
 gkud3SjxD8y2BrqarLOb+bs=
X-Google-Smtp-Source: ABdhPJzFzTk4VJ2Kcyr0vUgFhVC5261Y6D40B5sxj5N0OrHad1y7My8v8MECFMVz/HoWa7xmbQ28Ww==
X-Received: by 2002:a05:600c:6025:: with SMTP id
 az37mr34685964wmb.194.1638745650500; 
 Sun, 05 Dec 2021 15:07:30 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id q123sm11389887wma.30.2021.12.05.15.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 15:07:30 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: onenand: remove redundant variable ooblen
Date: Sun,  5 Dec 2021 23:07:29 +0000
Message-Id: <20211205230729.79337-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_150733_119454_1799903E 
X-CRM114-Status: GOOD (  13.06  )
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

Variable ooblen is being initialized with a value that is never read.
The variable is never used after this, so it is redundant and can be
removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/nand/onenand/onenand_bbt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_bbt.c b/drivers/mtd/nand/onenand/onenand_bbt.c
index def89f108007..b17315f8e1d4 100644
--- a/drivers/mtd/nand/onenand/onenand_bbt.c
+++ b/drivers/mtd/nand/onenand/onenand_bbt.c
@@ -60,7 +60,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 	int i, j, numblocks, len, scanlen;
 	int startblock;
 	loff_t from;
-	size_t readlen, ooblen;
+	size_t readlen;
 	struct mtd_oob_ops ops;
 	int rgn;
 
@@ -69,7 +69,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 	len = 2;
 
 	/* We need only read few bytes from the OOB area */
-	scanlen = ooblen = 0;
+	scanlen = 0;
 	readlen = bd->len;
 
 	/* chip == -1 case only */
-- 
2.33.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
