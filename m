Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296B4C021AA
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wN6TcPYz30VHG8KQgwAWSgUzX6P74b72c9CXgPY7hIs=; b=DIWDWkoBn2vgW+
	Ib3Vsi4N5A6oxMjep5g0GlQW2HEDgdPsQsCPeiuv1R8uHhxOgJLveql4O5bRmYKbnq/CzvoX68+MC
	apZ94vqKBN+o14qswWZgKSj949payYVYKUtAYT4rr3mozajx5es6ay3EUGEyDdFkAkJVi00KqFpRf
	Z6AkJDjpFeXpmnElfIrfiyTbIdUULjQWiuW+N3W8yKSmQ4yjE8lqr04AON/JZMrg0Yt5iRrqtgj2L
	R2baz1aKdD+kyRVWijPge6tg4JqS3R0troqLsD4iSUoVQclhJkDXtzuZOTqJA7ZatMbCpEeuz2trh
	In8vKW8q2amQmseiCDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMBx-000000082V8-1A7o;
	Tue, 18 Feb 2025 11:55:09 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLpA-00000007yIf-2DnS
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 11:31:37 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-220d132f16dso75973215ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 03:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739878295; x=1740483095; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m5PuqS19ZjTlpJ41jgFwB2Pyz70njykuYY649rQQozc=;
        b=GubtnnCohB3007RyJY9TBD+hnqM7UxcrQL9oNSQ2YantTVOoNIcrNOGfezq4JHIazT
         e5JR1Baobnx3cxEbG/sSHz108qLZNy5MM0uLqGYMWHG5A9bK0JwSL4FQFmRDH4RjK8/E
         KUKhd32QlOLNeLKDJBu+oJUrbkpaRHjIcMCIm/fuxwMjhObtP8LMQ6goF0X/h6FAYNos
         KYm5uuRzTmFT1q/WeQ6hUrzL/4Uj1SNucEbCUlwsMz3TiYjR75412Iql199jWDDUVEAD
         ukPmtg2Qu4wbtg6h/LlL5LVBZNC3Bv9IKXXwqS0P15qTsIUx4l1AIHW8GbM88PdqxrXN
         Ia8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878295; x=1740483095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5PuqS19ZjTlpJ41jgFwB2Pyz70njykuYY649rQQozc=;
        b=Xlagdho4WolcGopcDjotw2jN/6C0GXKjUCYmY2hYexB9ld/ELS6xjv5SvcLqMxfF4s
         z12PZ4bwCK2VOk/5fw+p/OevNP/jLP+30R+7M5qrodhba2UtWxUryhoy4JTKq2kKL00N
         XZST4JkNxcZGd9EoAkePstVk+j62fmz677QiFxtKXS0r7atdda/sY5Z7sA5T0e9OT7Z5
         3uLew83bBMhWwxB+kdK7mlnzTRbe/U2DVJSH0ekabY42Wc8i+WWkGjpsz0b1rfV1SqF0
         n0/Z5dEKX4PSsDcGPJx18UgB9MwhfCq2yquhCrojL3i8j4RP8Mq+jY93peuqXy49FZWH
         WGWg==
X-Forwarded-Encrypted: i=1; AJvYcCVR992AFVfRNjdAaUIzZKnZ5uNEt+s9HTTb599luspros/Fy5GJkitkS0Fn1uDymKJcDNVuwgPvK6A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ8OVtCVlie4uqUxFrcgwRfWBJeXjWK4SGHTTHpVqcvyH8Bwkr
	dRQtylQQz/54DQXB/mlDodqg9Nd9CUpUfP0M4nfuDFqiB7xObrIu
X-Gm-Gg: ASbGncsIxuXBRBt281j0NXgwbTgX6iml6W8dpJXgEq9nFrGtfi4M8Qn5ILKZtUcimY3
	UJs+IPWYg6mX9fm7bwTu9Wm7Onr0RG8JLghs4wWAFvAfX+v+QWLzNIhFgaX9JUHqrm/2PyxroIm
	6aVOnWKHD05kyfsvjWyY0aYO5g9g659LiSeTVseHsKGNUJu9p6ouFZGaaneeZVjWicM2Hcz/YIZ
	DbBXEBIvWhIaZjh12CNGeWYWyTbtkzGKtH0v+2mII/z8Zh2cW4QJQLyvigv2xQQQ8UHC3gCldNa
	x012ahyD+fUywhEtDUpkcqKard7U7g==
X-Google-Smtp-Source: AGHT+IEVr95VMebYqK9mMk0uYTvQhsc9j5Xi1t8FAnBJJHzuyHDVVLxVqbB8VUjrZCTLD/amrcMwUw==
X-Received: by 2002:a05:6a21:e8d:b0:1e1:aef4:9ce8 with SMTP id adf61e73a8af0-1ee8cba0fc4mr25539623637.28.1739878295433;
        Tue, 18 Feb 2025 03:31:35 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e94a:c6e7:6507:f007])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546835sm9876661b3a.35.2025.02.18.03.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:31:34 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 mtd-utils 1/4] ubifs-utils: ubifs.h: Include <fcntl.h>
Date: Tue, 18 Feb 2025 08:31:20 -0300
Message-Id: <20250218113123.1956575-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_033136_565861_84FE8D83 
X-CRM114-Status: UNSURE (   8.91  )
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

Include the <fcntl.h> header file to fix the following error
when building with musl:

| In file included from ../git/ubifs-utils/common/compr.c:42:
| ../git/ubifs-utils/libubifs/ubifs.h:313:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
|   313 |         loff_t ui_size;
|       |         ^~~~~~
|       |         off_t
| ../git/ubifs-utils/libubifs/ubifs.h:1341:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
|  1341 |         loff_t i_size;
|       |         ^~~~~~
|       |         off_t
| ../git/ubifs-utils/libubifs/ubifs.h:1342:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
|  1342 |         loff_t d_size;
|       |         ^~~~~~
|       |         off_t
| ../git/ubifs-utils/libubifs/ubifs.h:1899:44: error: unknown type name 'loff_t'; did you mean 'off_t'?
|  1899 |                              int deletion, loff_t new_size);
|       |                                            ^~~~~~
|       |                                            off_t
| make: *** [Makefile:4878: ubifs-utils/common/mkfs_ubifs-compr.o] Error 1

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None.

 ubifs-utils/libubifs/ubifs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
index 0908a2289208..1c7bc7bd0c80 100644
--- a/ubifs-utils/libubifs/ubifs.h
+++ b/ubifs-utils/libubifs/ubifs.h
@@ -11,6 +11,7 @@
 #ifndef __UBIFS_H__
 #define __UBIFS_H__
 
+#include <fcntl.h>
 #include <string.h>
 
 #include "linux_types.h"
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
