Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8D5C48BC4
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0+NGVEm6sVvaJKw0Mz7Mz2fZu0t30c/uL1578buwqsQ=; b=HFnAdEPt5WJtLY
	Weg3uWuvytZ8Gk/C+n8V7zgrQTiBgtGtlu6zP+KoumgHxnHJ8vo4cU8RUayZcQs+4RB0LDhvMQCPl
	Sg0yUIIyG7ZfAffiakK7sHNY0nA6V/WvIaeaqGsTOGbDEMM2TGKWahetLmRLAHTKIhyQm/0JACuf5
	5aUQSZStEJt4pgdXd8mQbdwU1mj8CpkC94I0SqX+SGB2NaWunsgKR8Os75ktX8T7JWmr+szgGawvd
	HmUHS46rFAoYvLDcYFsLL/fZRea7hEM2+Wf1G+9kW54hjRTsbGXMaW+SqvvL7OQL47lQ8WF6S0asj
	4c8zTTei/ht6X8zddBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racIb-0000000GUKv-3Sse;
	Thu, 15 Feb 2024 14:01:13 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1racIZ-0000000GUIx-3ThZ
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 14:01:13 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33d01faf711so471723f8f.1
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 06:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708005668; x=1708610468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=byROdOa7RThrRxfbEAlUg2egljys0iMmL1dy4Jts6eE=;
        b=SpC+o4N5IY1CrWDFCV/WeapHxNpC3NfeGdmGaYdqIbUJcDZIFyqKlS/D6VMmdEQFD4
         zAGDqS5f3ihuUXhsdvCn/y8vNJ5RVw4tCvuwNrl1CGSmH24kp29/L8YLCzymoeGPyy6F
         drLWwhO2O9MT3SHXIaG1OLc+r/r3w8FMdG8I5ZgWhfcRECS2zZymf7Vl0tfw6Sa3Wgvh
         Qxz+tdc6iq8Gn7iuBvY8BRnpvWBeYSo5oKYuVAard26U33jlMTWPSXYUDRKDDHeP8BVc
         VxQnw2ArzsBXdulqO7H4X6r/uyfLDo3oTwsuOwFSZpjVhRK9brZPwTYKSf3924c6c5jg
         FbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708005668; x=1708610468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byROdOa7RThrRxfbEAlUg2egljys0iMmL1dy4Jts6eE=;
        b=I8MrPgoCB+ej2odyuIj4mZsTDvOXxReIPJiwak5jWxXlBzpFGxnnptxqATn21zwIkW
         G4rF/zKnswaFbhkgSEpQps5J6/lDzBb8LLc5N3lYJd8jhO4/rANN7SLIejgwKYsRoTS9
         Wiu2GhWHDx1o9Ct7nOCK2SgSHwK079QGs7/h9qVnEVw0UB7ozvUQNJj6LuKrt0zHPini
         5ODNuZO1Oi49zo251HBF12P+RVs1Ny/GVroExlKRK6U6kK7/1AWeFXoH47G1cVUMJWqi
         c3H8SP9bnADlnqbZsig6jDTy2P0Twj+vuOROyZdPC0BX+yZeXciijPCEOim0rCtJ7Yde
         VUEg==
X-Forwarded-Encrypted: i=1; AJvYcCW0NVnJLwvkw14Qn9fc6RNhIW4D3h4czvNms6eOPYt6HGZxhfXcPjvDwAooIGu+mTcrjJSWgEEmQzLv7I1HNHoa6HwgaqZ8d6+dYosXog==
X-Gm-Message-State: AOJu0YywEmwFMbmYNOVwYWjoch0M4vRLL/H/tNrwyRpWBJbhOBUM/9yM
	iF1d6TjFV1/I84b4WqqXPEgM382994eXI5qH3zmXoF7YXV4Cj7Zs
X-Google-Smtp-Source: AGHT+IHe2sxmoy/X2Ezb2Q3D0GQv0IZZRrxcTzQ/dTI5Yy67muJihjhwDVPF4Li07ni+kuSFVdu8jA==
X-Received: by 2002:adf:e911:0:b0:33d:461:ebc2 with SMTP id f17-20020adfe911000000b0033d0461ebc2mr1302521wrm.28.1708005668074;
        Thu, 15 Feb 2024 06:01:08 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id q25-20020a056000137900b0033cffd1a302sm1872343wrz.57.2024.02.15.06.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:01:07 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: chips: remove redundant assignment to variable timeo
Date: Thu, 15 Feb 2024 14:01:06 +0000
Message-Id: <20240215140106.2062858-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_060111_928150_234F112A 
X-CRM114-Status: GOOD (  13.88  )
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

In two functions the variable timeo is being initialized with a value
that is never read, it is being re-assigned later on. The initializations
are redundant and can be removed.

Cleans up clang scan build warning:
warning: Value stored to 'timeo' during its initialization is never
read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index df589d9b4d70..9f2223d3e8e1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -2411,7 +2411,7 @@ static int cfi_amdstd_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
+	unsigned long timeo;
 	unsigned long int adr;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret;
@@ -2512,7 +2512,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr, int len, void *thunk)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
+	unsigned long timeo;
 	DECLARE_WAITQUEUE(wait, current);
 	int ret;
 	int retry_cnt = 0;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
