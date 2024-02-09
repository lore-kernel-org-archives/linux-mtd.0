Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD66C4828F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Feb 2024 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nHWpRmUp5plL+AChjITdhi16usV+aeFo8kfygxtLNPM=; b=fBosAOYUoIidL+
	oixNpWGHzZTo4GiJ73RpfqX1qrgLd1g8WCM8SmxDLTL43K5UY9iJ6uGSdHtUPK9XkIUust40Jqq/7
	nfT/eE8WvErFnmGFyKjPTuZrK2YZIqdRztqieTfKfc/4g2VSa3HuwTCo8wBUDugpJF7u1HDTinJif
	Vn+fAs/e5zGH9SPFFEoa+TE1aV1hjO8N8IVv2ISl6NDvoAgAVCv4Hxzc7RG+yhr9wUhfNJMz2V3zj
	F15teqyv+iN4HyERkKRvb3U/BURyFheuV28cG32RsfsvLh0kaBeEhY7Nc7Y3UdMxVXxjT+wlNKpM8
	7fuOjYbqd3sz5h2y3bOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYUrV-000000009JQ-0Foc;
	Fri, 09 Feb 2024 17:40:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYUrS-000000009Gn-03M8
	for linux-mtd@lists.infradead.org;
	Fri, 09 Feb 2024 17:40:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4101eb5a115so11088635e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 09 Feb 2024 09:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707500421; x=1708105221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7o1axzx5/29BUOyumXHlsexf5uphP2TrHuxCCp3IKM=;
        b=B3KxEA0IjwqUF0qFWYBgoA0LmaTPLpSjdiQfIwUFAhIuZvRBsbok7eD4RzmFNMetjD
         w6D4wt60gvN7kpkBZRRMWOd/R0PoBbWJvac/GsC/F36UBzui0aj4VQcI3zARd5TulXFI
         OW5xN3Ty22RtrCoGob0rNwHnAgFabGyUxGjHGd6boqFhjBQK9Y6uz/uztQSofTq/tPNj
         lk8oE4O8YLOWjeYhmzZ3eEEtq7HTGbFRLX1JEnhZ0fNQv7lcWAbr0Mliv4Vd2qbisIOC
         seX55Y+tGTRYyOICZMBh8nryWRXIegCX2NLuWscEMKqz1IXHiEoRy51xM51hV2s9CihD
         +a/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707500421; x=1708105221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7o1axzx5/29BUOyumXHlsexf5uphP2TrHuxCCp3IKM=;
        b=iJIOgEN2ZsYulX17DpKqV3KzmeUj5oY15VJHGMzGBYsHNnjf6V5No6iJf7D4g4y0vs
         f2td9WqDS18tFlwviClA+xIVByr6XsxHlV7LLzqJrN4UNPIwYtrpBRFjMFSUSrCRyB7V
         FOy7f9Hq5BQ3Y2VBZvQpYoOtGYBShZJw+W8jHwNPqZp0lWZqfbt1vc1wMsjXbWTkyDtI
         Z8lRkDp3EkGTLSRtybhJZcjuMaTtLmKxM32Nc6uqd7sLJ0nGjv+M8gvTFvZ1urGS0q+O
         +DBPSGAUT8u+7OnPFvT0OWuy9DeyRVDqj7plEVs7sTbeVQ+kq/ExCV9rMsOJ0MVm4arF
         gYoQ==
X-Gm-Message-State: AOJu0YzRbz93PdgFIpodbLUfMGsJ1gr59EdTPi1XGl5SB81idAB/PNpm
	u/KCmfvpRNIjlvo1BsYmbax5Sd+dqkA3Or0w8daHfX2aIVrht6/K/lUUwNPErqA=
X-Google-Smtp-Source: AGHT+IEtokBxjIdNhOmh8A68nah3DLmTE+sLMrL/Kgdxjz5r5d23ErT2ogib9AgEzsuBcTF7twxrIg==
X-Received: by 2002:a05:600c:3b8a:b0:410:773e:c3d8 with SMTP id n10-20020a05600c3b8a00b00410773ec3d8mr15510wms.8.1707500420990;
        Fri, 09 Feb 2024 09:40:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIOqXUw3d1nTfvZcV0yzAkoNyy6hvU6EFjAQHC7E+mtCEA8QlFw80vRI/ONVOrcSeEIHvM9xzcGZjkwDDakAlLwxa2xgDiscZVc118DfVJP82HTimJQ8v1itETxplvM8Z82vn6xRYC30F1iuKBbUyOpFv9kT6fe3pkCt1zS4G/HdoBg0hCjvwyC+dNJ97P3+rlHPbY+0P84ttQ8x3fZQqc5m1b2Q==
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id fs20-20020a05600c3f9400b00410232ffb2csm1249064wmb.25.2024.02.09.09.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 09:40:20 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: rawnand: remove redundant assignment to variable bbtblocks
Date: Fri,  9 Feb 2024 17:40:19 +0000
Message-Id: <20240209174019.3933233-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_094026_071781_E10182CE 
X-CRM114-Status: GOOD (  11.15  )
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

The variable bbtblocks is being assigned a value that is never
read. The assignment is redundant and can be removed.

Cleans up clang scan build warning:
drivers/mtd/nand/raw/nand_bbt.c:579:3: warning: Value stored to
'bbtblocks' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index e4664fa6fd9e..a8fba5f39f59 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -576,7 +576,6 @@ static int search_bbt(struct nand_chip *this, uint8_t *buf,
 		startblock &= bbtblocks - 1;
 	} else {
 		chips = 1;
-		bbtblocks = mtd->size >> this->bbt_erase_shift;
 	}
 
 	for (i = 0; i < chips; i++) {
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
