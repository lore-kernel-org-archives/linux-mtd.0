Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287F9F8E4A5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 04:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ijv5V7YaM3S7n2m3oBUDf4XyrbltRUTeldaE/xg61M=; b=fvtvngeKgRC7QB
	fXjhwrkmAi9nu6JzYqmxhRs6alSOUGv5O4RPThdn4B7L+mSqPjnGSPFI1AXgIHKk99j0Bsoeu8Vaj
	EOZEmRT8wFwC29Ui+sOAtfmaG5QWpBKli0zramDlgUVULqovNNrjOh0hyuUc/REUprzgK8B3s0mJG
	+8z5AihP1DcLuGFn13z/YNKd+84AgWml4/KUYxUaff+6MbWR0cEawisWv1mKVSlUQBofNeoO3KNiM
	uGSt3P0pN/QPpQc+sV5RI3IPrb/Sc2BSO5Dsez8U4qUkVGgVQxWdG6pkWaO6j5YN/K1P4VERGcKGo
	K558mWmkWi6VFKp6wCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaWz-00000003PEt-3zE1;
	Fri, 17 Apr 2026 04:10:13 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaWx-00000003PDt-0aCG
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 04:10:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b2ea1b3962so1376225ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2026 21:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776399010; x=1777003810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8hl6ndgkcLN/B5VYGouQ3PaB3QiaN1IHGvG4dIhEOA=;
        b=FjPfRQOiudNpuH12S5tPIulcW8WdXtrPh3etcdnAiSUw73rOcYLTs7RrqNbEogmXxc
         DV5/Jb6ERvpdoI/AdCcFbZcGa2V2PexKPq6ZK+hFQMT3r+RSHgxa1VyZ9Fbl0tL6DWGv
         HU1zx9Ei9IDl3buhgVmri1I01tOShy4hUri7VCDf9ObAisMBBAsNMdanRCzl6fCB20zj
         1F847UL7QLS88mEC7NPOW4RqxeJnzGI73zol5ze+gqao/jPoLKIDVJ3kPtyBzSutlEvs
         Y6rmxzY7ZIquiqGWW98+HwkyW4kWDMk8IGIJDJLzQyzkK8aDc++OJ5WVxACSvxlQFRkw
         FUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776399010; x=1777003810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8hl6ndgkcLN/B5VYGouQ3PaB3QiaN1IHGvG4dIhEOA=;
        b=R+3mkApOHDX9KznVOTfSOwrJkQ4Xgs5VkpCxlNV3zc6e0JDZbw3TUXfDQtqQdF150e
         HwMQd/Umw+CvMONm0T4txepHqwF1LWud/JANif5tZ+o28e13tTp1FwHGdYSf1RwUzXIY
         KHSKkjuveHAsZnQWIAL08sB1iSLFtk55BEHFkkAGIWy4/vr1snaIUeRFOkUcYBzqTJ5Q
         sbQZcg/Ao3VUscFRS0RxRws1Z11uE7rSEoFkdGVceIsULI70wugV2WNT1dtLBOqqMlve
         ngYPqwnppk+sXS2fVb3oLCag+Ut3HkWZSyZ+m/tbIkyHtidxewxjGlE+Lqc6FFD9tNwz
         ATKA==
X-Gm-Message-State: AOJu0Yy2vnSpJRpm5ojX76H9zf4hyW3viVs50/AP081PKBEMu57IHlQ4
	6mRi7QAo+jLTvMZC9awVOOD+txVOPrXzFU23Gd5ik3DVj1+bT7bxnbE8
X-Gm-Gg: AeBDievm1+DujoWPVfx9xerRnbxnzzOguZGJiOrGd8vXp2b+F2C/1P/C/M9yfzAtkAA
	U1YY67IZs2o65dlmqjdeLw6EItIN5BIPIuZQqxJC/Cr8f/sJEKr/wO3aJ78FnIENgsmCL7pF23o
	JIrA1eQg9siax7u73pK1GuokDijerO8QesZ4ZfZjhHyqkTJG2Oz8AnmntfDD6KRZZdeFfp0F7WC
	7bOT2lkNhoKjN8EykRbLA9gD4+0Tasq7fV61N7q2oSMjbqjpl4pxFhJxkeDf62z9isOow2EmK0S
	GgXfES1ylMrs+X5s9Zjw1RCGiUDw+3wP4CuduMJZJx0wTlDuS7wsyGAWQ4tuLqnwMsojTmA4tYL
	IWgdL9VpmDDuOrKx20iCyA1P4Dmu9KNqpb7MSKled+QLYC9mf8ByiXmWDFK/6IIEOQzDdZWEO5M
	4+BsTzAqFkwvHSc0h9G1ilKXOB1wjPL0fVTwJu4ago5dquR1feflcdSdRZe5jxiGHDzNQe4NN21
	k67ev49aOxg9WXM7jD8f3J77+iaoINIPYCQtETI
X-Received: by 2002:a17:902:cf0e:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b5f9f0099cmr13187845ad.16.1776399010301;
        Thu, 16 Apr 2026 21:10:10 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab288aesm4505305ad.65.2026.04.16.21.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 21:10:09 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
X-Google-Original-From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Date: Fri, 17 Apr 2026 13:09:36 +0900
Subject: [PATCH 1/2] mtd: spi-nor: spansion: use die erase for multi-die
 devices only
MIME-Version: 1.0
Message-Id: <20260417-die-erase-fix-v1-1-4f93ca586c2e@infineon.com>
References: <20260417-die-erase-fix-v1-0-4f93ca586c2e@infineon.com>
In-Reply-To: <20260417-die-erase-fix-v1-0-4f93ca586c2e@infineon.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, stable@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776399001; l=1018;
 i=takahiro.kuwano@infineon.com; s=20250227; h=from:subject:message-id;
 bh=8yx//9tvT7Tt3lxpUbTiukCjbjkctB90zoxhmldjicY=;
 b=5dnrdAWkHf9ZVcIPTnpG2276KtB2HqVyGFpWPqT5ioqr4rwVsv779asH6LvBceORTBB57Xaej
 8t8Zc36CsYbATFvMCTwk3QBfXovIARc56656dPvqbFaxQethFrKGprc
X-Developer-Key: i=takahiro.kuwano@infineon.com; a=ed25519;
 pk=aS8V9WLuMUkl0vmgD0xJU19ZajdJmuyFBnBfVj0dfDs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_211011_185775_6B482B64 
X-CRM114-Status: GOOD (  11.46  )
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

Die erase opcode is supported in multi-die devices only. For single die
devices, default chip erase opcode must be used.

In s25hx_t_late_init(), die erase opcode is set only when the device is
multi-die.

Fixes: 461d0babb544 ("mtd: spi-nor: spansion: enable die erase for multi die flashes")
Cc: stable@kernel.org
Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>
---
 drivers/mtd/spi-nor/spansion.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 8498c7003d88..b6023076903a 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -674,7 +674,9 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	params->ready = cypress_nor_sr_ready_and_clear;
 	cypress_nor_ecc_init(nor);
 
-	params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+	if (params->n_dice > 1)
+		params->die_erase_opcode = SPINOR_OP_CYPRESS_DIE_ERASE;
+
 	return 0;
 }
 

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
