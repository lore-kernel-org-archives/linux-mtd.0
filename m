Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BCFCCF9E9
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Oct 2025 20:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3T0APV5QShKTxKMAza30OTH0xOf9IBn1yWPjSi1D/0=; b=hnAhurpj8fiQUL
	BvVBYjgNo71s2BmGuope6V5hBUpS6ioSCBqVwricQn7q9ly/e/ieXziiT4/RreN1bx1bDXoTSZoWG
	kbts/i/MvouI/8Qt9J4fy4bEUmIbzQsh8I0rn0wA3NzHxYzOT7f0ezBXcnIf/oa+tr+1p4g2kZRI7
	AOaOg6xbl85+AXFBHw/L6V90oGZmqIPxMJghTOHHwR6v/3f1CwWquciU0JWbNJ+BaIvXtlbjg/uMx
	/AJqlxn+TatlJFzcK5z25Wy0H7Er4o5gHc4k/v/KwLmXpZOIlRhhd0G8iWtAbHzmnsBIStgTI/mp3
	vb+8ktvA1KF7c6ta5riw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6vM-0000000CgoC-2o9L;
	Sun, 26 Oct 2025 20:01:08 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6vK-0000000CgnI-2pTY
	for linux-mtd@lists.infradead.org;
	Sun, 26 Oct 2025 20:01:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a2852819a8so2274382b3a.3
        for <linux-mtd@lists.infradead.org>; Sun, 26 Oct 2025 13:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761508866; x=1762113666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hb6iCZLT+0XKfA4pR/3eh+yoD9wmq48M4TyTjs5dVsg=;
        b=KHJqyHlp0f50P3YO4GH2we0z2PSE0HTr9PXIohosZEoQPb/QAc6HzoSkFycrKtoE0q
         wear29qMMw/QtEZ5BLfRJAhugM99EppPgPFwAC0ULzH1wqjdHLdXPuslU9qYWPO9Fg/o
         S4czwYKPqoEXnFZGccV6b5NuJKIjhTT6N7Saa0m7nPF1PMytZfkymRX032PgJDQ7gJJT
         MJ2OC76el1SQz9sAhx3A7/IGEWzGaU7lts58aTqoKZodHTbc9yUNigHdrsc7WAV99jx0
         ZUiRu7rmdt01jWf4vhbVoQv/IODosWHj6ZfOGoT5jWUmvyVfCDime8yfcCXcTuRBPSoP
         Kn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761508866; x=1762113666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hb6iCZLT+0XKfA4pR/3eh+yoD9wmq48M4TyTjs5dVsg=;
        b=DqCQ91deEFutarkuUXIeBkQBlTXFS3A3LThnv9oeOfuAWCTFSLnK1F7cMq1VHplfGz
         mMucfDEMRi+A+qJvrqT3ZfH5Ed5Y9o2NPEhXnHAbVJ+O5lsg7wECJIRWGh6qR9o/hs9h
         yOfldnm/aUDZYQdxh7qT2qXdmiMjQQA/T2qvnS0QPQxKeFbMmuxcT3XZeXpsc0jwtxXz
         MCRGBrOX8LW+XAAUUjxn7XvxtOiVtp5JCWAQOEXnEreeRJxL4nHpRszZihns/5H89s+E
         cbm9XySUpsvFvQ5xvGYFqLfy122NYYVjCNnnhLJ0DncK8uC8ayHB4z8GAXS6xQCtGrKp
         DOwA==
X-Gm-Message-State: AOJu0YycCBXUBXzA1UxLnM74fP6/uAIvMwiN+1wXuPagqDVV+arRKKDE
	MPs+aEDSMxSVVUe5qjTt1gpIjtFk5UTC1UD9q+aDTcel9eX/BsICakwOQ+I+rw==
X-Gm-Gg: ASbGnctxVirC8v5LOvdZ7m6+AP2w5F8+QgnI07KefTMk1z8EBZDowiZk1Hob0OK5H1R
	LX3ZiZy8C2n0H5QlJF9C3phytdXzNQjNoSjHMM5BwSIBm0xpkXd1iSe6+lPqnwbdEdcf0M8Uo+P
	a2aLAdlENYMLt17RpWmUf2sfEyWAQy3Q8gdfvOUa2OB2ZfmejryktJx5xtOhDr4iViEYL1hoqJV
	/Mb04NLfrYB5qFhE8VW/UgtUtZuI3EOP1zF59JlG6SGXIr79N+VoNFzcpKjAfRItKEa/8kXnEnu
	37TJhPKVHY5VlzXCAJhDr3hNRgyQpLEsRmnzrX+kXgWLPTJlehzw2kuRtiMwPV5Vn7CHYbIIAOo
	aTe4ATaPhZ14PbYc4ti2z6jXy4CfDShcMjGN42vOLHI5B1XA=
X-Google-Smtp-Source: AGHT+IH1UR44gREowlj75IDKEUkJUUeKj/0coghW+JAqXgXnmzibb52I5jNUoH1gBeeILZtDDzm2EA==
X-Received: by 2002:a17:902:e74a:b0:290:dc5d:c0d0 with SMTP id d9443c01a7336-2946e247211mr162273445ad.49.1761508865561;
        Sun, 26 Oct 2025 13:01:05 -0700 (PDT)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf352esm56444675ad.17.2025.10.26.13.01.04
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 13:01:05 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] mtd-utils: reduce linux/types.h usage
Date: Sun, 26 Oct 2025 13:00:47 -0700
Message-ID: <20251026200049.25152-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026200049.25152-1-rosenp@gmail.com>
References: <20251026200049.25152-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_130106_713264_48175E20 
X-CRM114-Status: GOOD (  10.74  )
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

In the cases where it's needed, replace with asm variant. It's more
portable.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 nor-utils/rfddump.c              | 1 -
 nor-utils/rfdformat.c            | 1 -
 ubifs-utils/common/compr.c       | 1 -
 ubifs-utils/common/linux_types.h | 2 +-
 ubifs-utils/common/sign.c        | 1 -
 ubifs-utils/common/sort.c        | 1 +
 6 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/nor-utils/rfddump.c b/nor-utils/rfddump.c
index d6d7f68..2e9e275 100644
--- a/nor-utils/rfddump.c
+++ b/nor-utils/rfddump.c
@@ -24,7 +24,6 @@
 #include <getopt.h>
 
 #include <mtd/mtd-user.h>
-#include <linux/types.h>
 #include <mtd_swab.h>
 
 #include "common.h"
diff --git a/nor-utils/rfdformat.c b/nor-utils/rfdformat.c
index 0a3d9fb..6a78122 100644
--- a/nor-utils/rfdformat.c
+++ b/nor-utils/rfdformat.c
@@ -26,7 +26,6 @@
 #include <getopt.h>
 
 #include <mtd/mtd-user.h>
-#include <linux/types.h>
 
 #include "common.h"
 
diff --git a/ubifs-utils/common/compr.c b/ubifs-utils/common/compr.c
index 6f90151..ef540ee 100644
--- a/ubifs-utils/common/compr.c
+++ b/ubifs-utils/common/compr.c
@@ -27,7 +27,6 @@
 #ifdef WITH_LZO
 #include <lzo/lzo1x.h>
 #endif
-#include <linux/types.h>
 #ifdef WITH_ZSTD
 #include <zstd.h>
 #endif
diff --git a/ubifs-utils/common/linux_types.h b/ubifs-utils/common/linux_types.h
index ebf9ecd..c172657 100644
--- a/ubifs-utils/common/linux_types.h
+++ b/ubifs-utils/common/linux_types.h
@@ -1,7 +1,7 @@
 #ifndef __LINUX_TYPES_H__
 #define __LINUX_TYPES_H__
 
-#include <linux/types.h>
+#include <asm/types.h>
 #include <sys/types.h>
 #include <byteswap.h>
 #include <stdint.h>
diff --git a/ubifs-utils/common/sign.c b/ubifs-utils/common/sign.c
index 032a6ac..379d2e4 100644
--- a/ubifs-utils/common/sign.c
+++ b/ubifs-utils/common/sign.c
@@ -28,7 +28,6 @@
 #include <openssl/conf.h>
 #include <err.h>
 
-#include "linux_types.h"
 #include "sign.h"
 #include "ubifs.h"
 #include "defs.h"
diff --git a/ubifs-utils/common/sort.c b/ubifs-utils/common/sort.c
index d585836..a9cfa67 100644
--- a/ubifs-utils/common/sort.c
+++ b/ubifs-utils/common/sort.c
@@ -12,6 +12,7 @@
 
 #include <stdio.h>
 #include <stdbool.h>
+
 #include <linux/types.h>
 
 #include "sort.h"
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
