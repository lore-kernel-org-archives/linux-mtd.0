Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10525C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBzE1qeH0G4d+jzHbBwd/914LjQZOIa/FTG6r8jAVmA=; b=00iZ5/waM8ciVz
	+3SDtoGNZq7/tD1r/+4kgzgpOtosvpiWJ2kuYYIEZTBcXwigcd0DX8ySmEcPROxTPWEEWggbLAUIG
	w9gKeuGPuD0bzmNNK/sanSprD4sHfoqPVPqkeWFK+m2Ljek4dd3PAfh3eEkh4WRaiHi1A40sEP0hH
	+P6QpKAI7JaSFnWd2uIv3lTiZ0SC1YZ3u8m++nNxbqtyumAaVGVf+YPVZ4G+MLdHxMEnJHky1uqw3
	1SqarcNWPfl6DY4vllJJeOYUtHEzsyB2GNoIuOpWfb+mCRrSSL9KZcDVAiqgziMCrMnWI6e9Rf6Uc
	xkqWX/mKe7rapQsg+Z+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4RH-00EMCv-6W; Wed, 23 Mar 2022 17:06:27 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4Qn-00EM2Z-3W
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 17:05:58 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so2432915pjp.3
 for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2022 10:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ssq5dDChvV3SEH+iBZz7RZMY9wDHZR/XhgXvcgOGwCI=;
 b=dw5UoxYpnGE2oTvda4PTtPcXkQuuVcU7JUOgPKpwUTHh85/sPmb+lsnCCQK/dt+DUH
 /eeYqFy73mb0EwRTqmY2TY6t282AokEoP9hdeu72qJ1ZARUz5fm+mUQigogiiB8zZcNm
 0Aifmvqopy8697S+6rcbV+WgMC14E9NrrRg82jesK/eub2U5CecSUNd69RFow1ZgPSxo
 gGKKxXIJ4tgUTj8DVYvy2H+z/QzmiNqa3+XFZe9cpO6vSzYU2w/rYthnXSkPmBZFFr1g
 9H3yR6cV/WExdgcaTM6YDtGf+Jeo1qlZHDazZyan1JDdo7pemW0hQ6y8d7zKp2f7h7LX
 +ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ssq5dDChvV3SEH+iBZz7RZMY9wDHZR/XhgXvcgOGwCI=;
 b=ZctzpMsG4RLxd7ZmYMeCcK+WX84HnAqJxzMIOzFmLc6HJdA4s4Zrk/i/yG5r4RyFL1
 x0DMqjqMr6uWEw9yflkBoinyPb2MZUV0rDGSeMEABIV+Q5iS4CjqIt9GCKI/XWGbSQJ2
 YlujARPulJrzdO6/HcyyjFftGAxB1sgtxy9B229XlCWLtSF93J00MUs5sy+RU1YKb6SW
 5evigDtZTZmAAakk954YKVe/mOFbQCuyZsFgzna9M7bcMqne5kYXrL+M/8ksrefhUB14
 tBHQkeKjslGuW/K704Ecgctg0tps5+J4G0F/nUfg3psHfPe7Zh9HBpB8l13EKtvQhimg
 eBJQ==
X-Gm-Message-State: AOAM530t0XBp77DQ1Q6MLCFpVkl89llr3e3M9bnWgTRd2GVfi5baARMf
 teNcYKBY/vpBsPsnoEF5aYQ=
X-Google-Smtp-Source: ABdhPJw/hgA3okEEQfgNg6N5D2emMAbCexK+0bcYNKulX09vLm+XJ00+HU8ebFP7WDoT9JmqFAfBqg==
X-Received: by 2002:a17:903:244d:b0:154:3772:6b32 with SMTP id
 l13-20020a170903244d00b0015437726b32mr984977pls.70.1648055155802; 
 Wed, 23 Mar 2022 10:05:55 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:98c:eff5:b721:5f7b])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090a890c00b001b8efcf8e48sm6649709pjn.14.2022.03.23.10.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:05:55 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 Tokunori Ikegami <ikegami.t@gmail.com>
Subject: [PATCH v7 4/4] mtd: cfi_cmdset_0002: Rename chip_ready variables
Date: Thu, 24 Mar 2022 02:04:58 +0900
Message-Id: <20220323170458.5608-5-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220323170458.5608-1-ikegami.t@gmail.com>
References: <20220323170458.5608-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_100557_229030_18568D29 
X-CRM114-Status: UNSURE (   9.14  )
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

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index b31439e44435..67453f59c69c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -834,7 +834,7 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 			       unsigned long addr, map_word *expected)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word d, t;
+	map_word oldd, curd;
 	int ret;
 
 	if (cfi_use_status_reg(cfi)) {
@@ -845,20 +845,20 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 		 */
 		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
 				 cfi->device_type, NULL);
-		t = map_read(map, addr);
+		curd = map_read(map, addr);
 
-		return map_word_andequal(map, t, ready, ready);
+		return map_word_andequal(map, curd, ready, ready);
 	}
 
-	d = map_read(map, addr);
-	t = map_read(map, addr);
+	oldd = map_read(map, addr);
+	curd = map_read(map, addr);
 
-	ret = map_word_equal(map, d, t);
+	ret = map_word_equal(map, oldd, curd);
 
 	if (!ret || !expected)
 		return ret;
 
-	return map_word_equal(map, t, *expected);
+	return map_word_equal(map, curd, *expected);
 }
 
 static int __xipram chip_good(struct map_info *map, struct flchip *chip,
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
