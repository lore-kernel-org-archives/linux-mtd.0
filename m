Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F44C54791
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 10:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0JO8cd/JrIl+mnertcmKvMM9EKd1kre9FmpdRd250pg=; b=JutpeDO3TNNouG
	2yLXQ7KCMqgMvR2K00GPFEZZ2t5OxNPqWEZcfV5jeXdh2R7WthI4Vyp9jsqd5RNh8g2+fFSEN/D2g
	K7IK4GE79ofVsWW0UXqTyM1FnYrMFQBRLJWJTD/CI70frvSjDVnvW1EYAExxoDsr/de9fz6RLCr6j
	Rv5QNYl/L9seqlyT/dI0m5WaDSk37ZUVxqnoDuzuoZ4ke3P8gI2JbH4fanhC3K6UqngJsaiEJLDNq
	rHcO0bQmYT3ybFclXwAncwzOPZlrJIK4wZ5fGzGGnyLN3NcHaQga2TdhEqGNVNM7gFnw3DLf5XjpK
	i889M0OpK+jyXn4WMcbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkLps-00000009ftq-3YdE;
	Wed, 13 Mar 2024 10:27:48 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkLpq-00000009fse-1vrf
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 10:27:47 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2d29111272eso110184741fa.0
        for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2024 03:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710325658; x=1710930458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GrWU5S3r8n7ABKmHosAcw1tFmQwtwioDP9kb+kgmgPc=;
        b=R+MBN0mXVbXLE+w9sbZ5OMgUsUotY1XFAzrVlnKVtidK4H0hCNb2ZohH2VFLd87acH
         EUfKDj3h+ES44HgIFR2YrxoZjJMmvLkdNhF3aLlaakbbOAvO926qc+Z590tqMTogUzfu
         SnZ4NolZNsVuGIvIasMr7kBPlXR/xoWd4iuPs2nK1c1y+PKC5qBsGA+Dsp27O3NtIcx3
         WLBNfYY+CVX9pWZZOljy3UgKhKBFOa+0Ey6sSFkHQ/6j9DhY438pvJhGs744CCMrkFFb
         F/dxq1ASIwzI/hs+5CW/PtdREsajnpdUswzMZBrec/e/m+vWOuX51oj+Gq+EM4j0SR9y
         2yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710325658; x=1710930458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrWU5S3r8n7ABKmHosAcw1tFmQwtwioDP9kb+kgmgPc=;
        b=hBIExGAcJk3y+gm1ftdJWD1eflCTwGV7hm+hj+EH6qkAB75WKyGObaKeZyEbi2SHgL
         fyZ7aRvRNNXzjjnOzBomLX6iZUXvS+HFi0Xm7KsoUmxW6XQlR5AEJNkK5qXtmILvKEQd
         un1MSdDE3t0AsN6CJNRE4Ku6tEKwf7K0LS+DYd811dssXfB2LIN53lhYNv6dlipUJDIz
         7PjM/uL6Vi3NkrPnUcnkJtc9UnIUwUY61j8eS3bNGxO+q9Y0QnoDBrn9CmMyF9gSZqGO
         EPGmOxGIaBTSAfIXbY1L7EtpjEulPBNwzKZtq9vVokWPWPE2/qf6pR2dBxiP9pXmTvpA
         f8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsQgwwk1yvSKt+w6fqvg0n5MY+WsiJFPtrq6fv9jxOhA/fx49YcF2mVunpKvcZws3Ltz+zjjXEzOhqUc5LSzwbA8/E8Hky5GAvXH5Dnw==
X-Gm-Message-State: AOJu0Yy3goHJe8WKc3n2Akm5ezQWodYomGOFqFqXxw0bxCJjqQSamFR9
	qb0bTAChz3Y53sTWomkKm13GTXpoXyyM4EVjdnWMI+KVdDpdz18p
X-Google-Smtp-Source: AGHT+IE0wvyNlJYld1l2UG/SCUa6eIml3WWIv72zVSS2Ajod8IiYL+3saVFji46D+bE9CMBu5yfMxA==
X-Received: by 2002:a2e:7d14:0:b0:2d4:693d:ff10 with SMTP id y20-20020a2e7d14000000b002d4693dff10mr1341497ljc.20.1710325658052;
        Wed, 13 Mar 2024 03:27:38 -0700 (PDT)
Received: from localhost.localdomain ([212.22.67.162])
        by smtp.gmail.com with ESMTPSA id w20-20020a2e9bd4000000b002d0f0f5e395sm2082845ljj.47.2024.03.13.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 03:27:37 -0700 (PDT)
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: Maxim Korotkov <korotkov.maxim.s@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Hector Palacios <hector.palacios@digi.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] mtd: rawnand: hynix: fixed typo
Date: Wed, 13 Mar 2024 13:27:20 +0300
Message-Id: <20240313102721.1991299-1-korotkov.maxim.s@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_032746_521180_5257C3EA 
X-CRM114-Status: GOOD (  13.16  )
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

The function hynix_nand_rr_init() should probably return an error code.
Judging by the usage, it seems that the return code is passed up 
the call stack.
Right now, it always returns 0 and the function hynix_nand_cleanup()
in hynix_nand_init() has never been called.

Found by RASU JSC and Linux Verification Center (linuxtesting.org)

Fixes: 626994e07480 ("mtd: nand: hynix: Add read-retry support for 1x nm MLC NANDs")

Signed-off-by: Maxim Korotkov <korotkov.maxim.s@gmail.com>
---
 drivers/mtd/nand/raw/nand_hynix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 39076735a3fb..9695f07b5eb2 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -402,7 +402,7 @@ static int hynix_nand_rr_init(struct nand_chip *chip)
 	if (ret)
 		pr_warn("failed to initialize read-retry infrastructure");
 
-	return 0;
+	return ret;
 }
 
 static void hynix_nand_extract_oobsize(struct nand_chip *chip,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
