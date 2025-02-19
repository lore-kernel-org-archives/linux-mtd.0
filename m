Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B752C021AD
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 00:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hXChPLmMc/H676h+KMCtnBcroiNMAlkXt5vQtZTDorc=; b=WSuQxpfdCVrDsn
	XLukUq8UhOZOfpdbp/Rlxo7/7k+0ZnVqCe7XYFqBjF5mg+6vui6MGU0BTtE4bXyB7la/IV61dlYc1
	bmAxUWiTwKEtKhT+tRv/nefZbYXynLpZL5Fp9Np4kRA3sslFGWwo/LCewhharlpc4hS/ndwo1iMaT
	vnqhy0XaC92gxWS4E/JLhV/+WjoMYOTeGkw1lJ+5c2bg/7bQmGpzqe3E/5qkKMeaLMN9fYryPdAHT
	ff1+saozaJBEYJ0Vlsfrfv9BO8UKis+99xF7ajmBmcYO8jmbmi80xHnaBbmwV+KH0zmar6J5jSeMd
	EcPpb/+tbUEyTkEJGrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkY2I-0000000AMfm-1rky;
	Wed, 19 Feb 2025 00:33:58 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkY2F-0000000AMf0-0KBy
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 00:33:56 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso8773311a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 16:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739925234; x=1740530034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U4UHtVjW6Zx3WIT7dy1J94xDmRbbCqipWzYkaLVrwec=;
        b=NYNlWR/z4YZte5/ojyrV/Xljf/BJk4k712AVRsLSr3T34CPclP07AKVieK/LY5Xri8
         sMkp/SEGaf61xgsB8sH7l8jTX5PfIlV8fNY0IhbZt1zdeXn+XRafTMk2YMT9grzIzRWB
         LQve3MsIM20mS096t/wU7pnT4wNo7t9mA5ioAhUw1ZtKF2qOlWm6gvjZo8Iy51Jo2x5B
         VJY4t790MphP+4LfnaZ1c5trTsMk1V5WXQVzGTQmThgTWboxgVFvN7Fw7f2yKTj+gkGc
         gFjOH6aqNHsb2x69gqP/77l9FMpTwAr75zIRmnIP28Majo19rHd2pRXiFFmrI25bwod9
         4sXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739925234; x=1740530034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4UHtVjW6Zx3WIT7dy1J94xDmRbbCqipWzYkaLVrwec=;
        b=RKhgEjWpKJbZYt+cmimYP4kk7aSFtFQFvYJQ9pN3ljLxtGsNcz1Bwz7+PxrQWO0UkT
         W6ni0TV7wFQ6O1oDR56iOZ6TsBBZvnOY7+7A6ktJW1thmv+xRu30DjYGef9xclYcLSSY
         TVhPOhnkUgve4DrBKNE331/o0XmFuKxeKCiNIGN/zuD+nMZzn8oYsBuXz6BARr4VX6Fu
         H+EB0vPDdIkLenKAQt5MXB1YmoDuQ88wxycKHA2wXK7ySn+fppHSqE/XqjZMh2akDDhm
         eXTBGMADeF4dif2fhLJ5X9Cp4zrgjKkzJhQODaj/F39xYt1m1ykIKzUxbM6h3vKYj7xy
         OdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYBXQhRoE+07gRD3CG2gNP4c6mXl3rqIQOBhXUcUFs2/rFWQ2ii6CVdpTPzhpsgNqfkGs7ugy9Fwo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+7A3b5/ihSbZ6aqw2pOmPJ0AueabMbAlTDTAFlhfrqY77U0+m
	BFHtrYz7K+zCQ3wu+dP285TMQCbHHYYQZ9UwCAPza7KiFhEG319E
X-Gm-Gg: ASbGncs8FpOejqwWRm5iR0Mox+iaTCXLt9Hp9OIseFFhcrXGJDZYI8V3Md7jh3j7C5L
	Bn8Nelmmo1G8In9hB8L05peEsqFHUkxuLp5xD6Dc72HsFf/PGM71/Ntk+g6scRG1SUwva/JxLpH
	a8Czyyk5b58Dahgqz9RO29Io+ohytYsYlFRWn9h/a9fTnFW0YiU1czb9sBzg+tsZLUI2ivvh2Ps
	w5SgryWu3JxYOWTsJetDV/0DI9JFRFtcuKtyjMO8y1Lo3tJx5pW6qjllmh3qPRWaZiwCL2Mpa/i
	KuIOXV4ZWnhsRlZ+QCbrHT4BNlcMaQ==
X-Google-Smtp-Source: AGHT+IHuEwNSiPb7cKsYlnFhHSP0VvAPUx8ZBHR2egCtpQKNPEt5i17ecJ4Kv6jl9N7vlIpCzW8aGw==
X-Received: by 2002:a05:6a00:2342:b0:725:df1a:285 with SMTP id d2e1a72fcca58-7329de89645mr1812052b3a.12.1739925234092;
        Tue, 18 Feb 2025 16:33:54 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9d59:514f:431d:4a45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e34bsm10965017b3a.108.2025.02.18.16.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 16:33:53 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 mtd-utils 1/4] ubifs-utils: ubifs.h: Include <fcntl.h>
Date: Tue, 18 Feb 2025 21:33:26 -0300
Message-Id: <20250219003329.2078308-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_163355_113748_B25C9D1B 
X-CRM114-Status: UNSURE (   9.21  )
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

Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250218001512.1862030-2-festevam@gmail.com/T/#t]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
Changes since v2:
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
