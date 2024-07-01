Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9563BC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 04:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2kTxwGX5E/980Kmg2s3dXCVN0eovxgCtkCWYpZasRBo=; b=DdBwxJ9DUhli88
	AzgQEIfxpS9c3QFpT+fF9aAsEVJ+ehY5II2DN8EJOSMyZqxG0AS+R2OdCq/9JGcEZhyAqclEgukIH
	0ykLHHEQvnfuw0D5ZMGgzHFKIXzlPcl9DJT6f4MBwACi0o3bXahVq+5LZmh7HY4GXP6b91h9VKDsw
	ES0waKfkJwC5ek4tbYnySkJVn3d8yQwfS9/gVZ/8ONmzVbIOD8mO7oqj/T2clJgDByN/XUWuf8Xf7
	O2z1XPPfEtBTsIg6lF3xRIZCptaE7/LqVsV7XDkQwsZNlUZA8myjj/Kjlelfsan7fb7TgvtEws2Cu
	/Ky5xsUf1pE9hqz4OTLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO91Z-00000001grg-3ljR;
	Mon, 01 Jul 2024 04:52:21 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO91W-00000001gr0-3nH2
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 04:52:20 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-706680d3a25so1514603b3a.0
        for <linux-mtd@lists.infradead.org>; Sun, 30 Jun 2024 21:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719809538; x=1720414338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t+L7BI00lIFylFFLESW6ozge3fM7WKLb9kC850GFECg=;
        b=XqMfgt024Ac1Ht6edzeUkVTosy5aypQ/F4icheO3txT2X3Q5yq5XeRfstXidU2bIpN
         MJk2+CN61icebw/0lshVDFAhx1OX+oEDU7kl8ZpPfiW6PX0ey66ptTBRScaobgwAVCoA
         K8uh32cbOj4xP2oDfX52nQbfDwN1mi3nNDn433ocrhevSauKJuO6V5hS6uR+pXn362yb
         7WMRtQRFIECmb//SbbH76HEJdju6eB1ghjOD7TjHmEhU7EmntN23gWF0yeRg4NzimjB2
         XKSEG3zkiBL0N/71Kb+3NkIbTn4sYma98ZyBqmJOTu2Vg9/9qanSL23UdivfXlFTaQn9
         p25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719809538; x=1720414338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+L7BI00lIFylFFLESW6ozge3fM7WKLb9kC850GFECg=;
        b=cRR1ngDbSsu6IxdHxVC2gLyLv3oXAlmgTrqsIVi+KWDQN/9siRGB1/oU5dqXHVhfuU
         tcvjWbO4BthWnI8rIB10VY9imykzd8AuCuRfLoFcMGhB5ruVjAMz2UyR1nGqpx/VCcpX
         VEWKaAisFqSavZTVgi80H5Beth1pupBnStm7fJTaLXCAmpI0vfqtVpfFQ0BrtW02yTr/
         UiIIgKLW+qZoDW7sDCuIRppWIT/KMc7OKqc9/pfLLrYGEYxoSmXFOAxJ6BlGqsF73Svq
         G7o+AjSruPalSh6GWxmvVHiCgSamXAqmSpiTbJaQnwFF05I40M9tmEGV9CrK7rOkxkp3
         HV7A==
X-Forwarded-Encrypted: i=1; AJvYcCVvyvSQYp/T8IGK5Mb3fz9Jj1uob+Q9Ib8iMa/LgwpGzpZI+SCrmb/5xJ0aH8cJXF4srbT/yJPQ7o1s2zq6W7se6QZjd82govP9qeOCWA==
X-Gm-Message-State: AOJu0YwpkdqTx1qdRqpoadGAPx5UA+SCvc12kmcy4JW5pjzYVT2ace4c
	sV8MMqquGP4PAZPeB8lLPOlsfuH8aZUJZ8/zxDXBQuvYbb4F28kEByq1yJYG
X-Google-Smtp-Source: AGHT+IF610b9OyUPP35WVsNJmw68/ZgQqgi5D1JVTHEUov/7kMsegjHXm8fabI2r/qp9jntWMqBdmQ==
X-Received: by 2002:a05:6a20:3948:b0:1bd:fef5:ab0b with SMTP id adf61e73a8af0-1bef611b985mr4019720637.8.1719809537499;
        Sun, 30 Jun 2024 21:52:17 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:80c9:183c::26a:88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1568dd9sm54238515ad.182.2024.06.30.21.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 21:52:17 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Qingfang Deng <qingfang.deng@siflower.com.cn>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: fix use of uninitialized variable
Date: Mon,  1 Jul 2024 12:52:05 +0800
Message-Id: <20240701045206.162103-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_215218_970144_0F7B2755 
X-CRM114-Status: GOOD (  11.01  )
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

From: Qingfang Deng <qingfang.deng@siflower.com.cn>

When building the kernel with -Wmaybe-uninitialized, the compiler
reports this warning:

In function 'jffs2_mark_erased_block',
    inlined from 'jffs2_erase_pending_blocks' at fs/jffs2/erase.c:116:4:
fs/jffs2/erase.c:474:9: warning: 'bad_offset' may be used uninitialized [-Wmaybe-uninitialized]
  474 |         jffs2_erase_failed(c, jeb, bad_offset);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
fs/jffs2/erase.c: In function 'jffs2_erase_pending_blocks':
fs/jffs2/erase.c:402:18: note: 'bad_offset' was declared here
  402 |         uint32_t bad_offset;
      |                  ^~~~~~~~~~

When mtd->point() is used, jffs2_erase_pending_blocks can return -EIO
without initializing bad_offset, which is later used at the filebad
label in jffs2_mark_erased_block.
Fix it by initializing this variable.

Fixes: 8a0f572397ca ("[JFFS2] Return values of jffs2_block_check_erase error paths")
Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
---
 fs/jffs2/erase.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index acd32f05b519..ef3a1e1b6cb0 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -338,10 +338,9 @@ static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct jffs2_erasebl
 		} while(--retlen);
 		mtd_unpoint(c->mtd, jeb->offset, c->sector_size);
 		if (retlen) {
-			pr_warn("Newly-erased block contained word 0x%lx at offset 0x%08tx\n",
-				*wordebuf,
-				jeb->offset +
-				c->sector_size-retlen * sizeof(*wordebuf));
+			*bad_offset = jeb->offset + c->sector_size - retlen * sizeof(*wordebuf);
+			pr_warn("Newly-erased block contained word 0x%lx at offset 0x%08x\n",
+				*wordebuf, *bad_offset);
 			return -EIO;
 		}
 		return 0;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
