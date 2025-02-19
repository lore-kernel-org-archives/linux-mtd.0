Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2143FC021AA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 00:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zWOI9lcqPVNA87vDRU7Unm96w0XBeWIPZa1gdB20ts=; b=VbB6cYvZ5c8wS6
	UX8dTATojQtHwYt3TBXdmXQrSsJnYC9KQjC/w2/pC60TABpJ+pUs97K7gD3KQY9AMZENwaW0+usW8
	URkXYThZWPYJhDsazD48kmB9xk5MTM9zIyvpBp7QmLEqBhedydqzgq61wyM8r7W0vGy6IIIXyKY/g
	nmrVtdMSJm68op/POftGrexi60ifoIK4XZnNFtEIyhvRSncR6+MzC1oXEENNM2P3aKu0rfVVGKgdx
	hpdXCcDvf43oF153jGcciNW3FcWXag4WGBuoI2Z7mqT2LNwg3czTOOfxcljfknC64pNenUOL/7opc
	Loa/gre2FfWdJekbxcZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkY2O-0000000AMjc-246z;
	Wed, 19 Feb 2025 00:34:04 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkY2M-0000000AMi9-0dHJ
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 00:34:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220f4dd756eso83305285ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 16:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739925241; x=1740530041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utpeDguS6h54yIFe5iAtLr1SpWdCG6JmVTmFESUoO+w=;
        b=EcjtmuJI42Rxs3iHU0XIW0FTMEpmBsQ2zKThpuPoRwLWbq98KfxACNI+1chuHQJyB7
         Ykqg7YL4ndYUr9QHSqlss58tKFtq6L0okJ8l8GCN2Niidg1/JZ6KOxn8lMlK4Zq3QzE2
         1bKKGXmZUbmQHNcZr9es74b+axt2oiSPR2Yb9XvCYiuctn1RMCiJJ1nYYHg1ZA/ieiz+
         HqyBBM2x6WWFX5toZ2xVF0PZOxJA2e1Xe/kp36GHyI3M7/RQ/L1xC5HrwakF+7DT+aNV
         3fAzn2tLEuN3MpiHyO15ynBAF+rHzH0lzpTgewN1k6rsex+9/RM7zg0BILDBrWyt1OyE
         nPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739925241; x=1740530041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utpeDguS6h54yIFe5iAtLr1SpWdCG6JmVTmFESUoO+w=;
        b=iDYF09DNyVnyAsZ40tOG16OqEfLFo9plQ8jXQmI2zknGGzQwQT/BixTdGNPlNsu/8q
         ryj7+6L2G0yqkh5U9Lqv6RWFVgPoGnJLjo64qnqo/6684zw/4OqVTVHxJ0oI0OlSf1mG
         NzkplJx3nY0hYBwyqryAkmmVBoMLTgrt9hGw7NAdOFIgOU5rDX0QUXZFkLyNOu8BAohJ
         e6p2C63vcActCDLoTejab7qHbxaPO6Ek9PPPKmqcp3G2Bzki1WyLfujlaxg0+zvMpEPI
         s4m6F7CmJo9hpiyjPlT1rSaAZDa/ZH9ovrcv045VmuDLXpq08E2gAAeUuRN8t92zbpki
         YfSA==
X-Forwarded-Encrypted: i=1; AJvYcCXQRSeRW/bRuKXhpaCo94Q/ml71cOo0+Dl/YJXBb+8A05qpGxi04d+9a8PjyFJf5Mp9c6K4ljHtrxY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq46Pwm4h0Lk9Vl18wOERGOOxxOnJDK8CWfcfuEVokSrMsyLrB
	z7tz5l/TA2FgrsJukem1J58Cdi4UDFC3831fuTF3swIBrKnq9PmoKz8/LA==
X-Gm-Gg: ASbGncuQKKwW3L6kTydappS1ifCqXQZBCYA1C/t84ELiQEkjYUBnBIqefUOk8Oef+HJ
	LjmdwprWBSPMv8+3fV5KMQzfrG0c91+FTxGYSvsRe6ObtN2gPoszjh0LDHlrfmD/7MmE2lqfRqu
	9Lbzeh/ROIyLIJ7HC39HhlFBoKvws/M2ihbb9kJVovKmWc/Fk/qDsAx/j9cYOpRa/fWgHqrT34x
	kan22lLNiqKETx1TCkiPLOwg77D1AKtow3kEPEY1KPi132AVS9rHitl97bR2YTbGtCouZPtslai
	D/rYGkVOrihDQ7GgSRadaqwvJB0K7g==
X-Google-Smtp-Source: AGHT+IEDa4fcaAQd4ust+l6v4RwGBxqhhKeptvJkYeKr+CPJ9zd2A1kA3Cdos6YwBrjaXCa3ICZDRQ==
X-Received: by 2002:a05:6a20:7486:b0:1ee:bed7:f9c4 with SMTP id adf61e73a8af0-1eebed8002bmr13928017637.8.1739925241252;
        Tue, 18 Feb 2025 16:34:01 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9d59:514f:431d:4a45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e34bsm10965017b3a.108.2025.02.18.16.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 16:34:00 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 mtd-utils 4/4] ubifs-utils: extract_files: Include <linux/limits.h>
Date: Tue, 18 Feb 2025 21:33:29 -0300
Message-Id: <20250219003329.2078308-4-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219003329.2078308-1-festevam@gmail.com>
References: <20250219003329.2078308-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_163402_193224_6F0E58FD 
X-CRM114-Status: GOOD (  13.50  )
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

Include <linux/limits.h> to fix the following build error when building
with musl:

| ../git/ubifs-utils/fsck.ubifs/extract_files.c: In function 'parse_ino_node':
| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: error: 'XATTR_LIST_MAX' undeclared (first use in this function)
|   144 |         if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) {
|       |                                               ^~~~~~~~~~~~~~
| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: note: each undeclared identifier is reported only once for each function it appears in
| make: *** [Makefile:4374: ubifs-utils/fsck.ubifs/fsck_ubifs-extract_files.o] Error 1

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
Changes since v2:
- None.

 ubifs-utils/fsck.ubifs/extract_files.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
index c83d37749bc0..000ef5d10565 100644
--- a/ubifs-utils/fsck.ubifs/extract_files.c
+++ b/ubifs-utils/fsck.ubifs/extract_files.c
@@ -10,6 +10,8 @@
 #include <getopt.h>
 #include <sys/stat.h>
 
+#include <linux/limits.h>
+
 #include "linux_err.h"
 #include "bitops.h"
 #include "kmem.h"
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
