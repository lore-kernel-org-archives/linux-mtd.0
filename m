Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF49DC021B2
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipECz8Y4CikROlbFoqZKFi9AsecG5ufqFJRP6U6+dvY=; b=Q5t+MMcnFTNgcM
	tudOgqX4flvw8SmxaSiQOitGNRP5KU58C9Cqzp6v06ZzJij/0mgRDI2r3vXSvMYCaATbAaWnxR+O/
	cchmJbRgQX1xDLxz0RdbxsHMPR4gF61YDWxdkqHyErVlPWFTyl4YNHLSK59XUoMWLlrLlA/gs1fl7
	MMMmKirX7EIE6FrNGIMC6IsQeakLB/2pWsmDFLEadGpsiKVUYCjrcBVOga0l6uNdo1y4tW8qnTb/y
	yuGoQya3PCnTUYzIlKrq28e2/6D1+zQS/eA91HEBTrjuf7bndkFhflSvp/seBW0N2H/Sa2pS39bAo
	QfKCDnHepfwF5/EXAcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjkg-0000000Cqat-3fRY;
	Wed, 19 Feb 2025 13:04:34 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjjC-0000000Cq7g-3PQG
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 13:03:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-220c92c857aso14455615ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2025 05:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739970182; x=1740574982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ievq53dJ4SRA+0PODN0WketsYwgFf+i7HNoXza6Se3I=;
        b=WxMruPz5rayR0ODGqWSWVvPQa7sCj6pHR/aUdYhIQkZnUmIVLOggzRkMo59jWfToaJ
         8Waw+k+nw9552gC4mCopSyooeLp8mj92MFmPEM+2RPOjQNRH0/lDlXXEOdEzyDMfMugV
         awUCJ5SwgKzmgYtvxHfkS3UlTtaMA3+JM4Rz1CUsyvPPZ9hfdLPc/yo/3DONXYiv1w23
         r+77+okI3Hqhtg53iCoTx2LAwn2jVFVbCbMWy/6iG8BrnAGPsv1J/6kBXWPJaguExRaR
         ErKhRJffYmx5W9lkdUOG3/Oq9EF6dCXDwHuWW6eX43wCedqKRHDaUT6ZOKfkY3REJcPD
         ovZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739970182; x=1740574982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ievq53dJ4SRA+0PODN0WketsYwgFf+i7HNoXza6Se3I=;
        b=VQK8GBu/XjUN4YfSSMwOd0uJbbwf0K9ywoEqh4YE+GCPaaeuZNKT4YaZNDzG2/1Cr1
         dZsqy1d9xDTeznt4+kS7aDgVwWEn7BRg+zEAcaE6NiCkKQte1/2QQJUaW27EiKW3XFTW
         QkTYUOGqp/OSMCItelyrsAZnzs81Ht046CzGwzwGn1Oah2wufbztxGzVHgvDRBtWRdHi
         9TWBOkJI/quIvEInoKDmDpHKEJxK5sy2ygS1fJ+tQYQQkOn3GGYtKtI2+hfM15LBgy8i
         eipY3v5qUTnr6RKe9acuRESPyeAyFrvASQf+9K/FGIwMmEkggGcPxYeRjbsjYypbaMlu
         ufdw==
X-Forwarded-Encrypted: i=1; AJvYcCWhOkeH+0kv0xrNeAB33XG5KQwP4lm7JyNaAweIHN3NnjfGFMx9LQSYHpUyLrTV+T6Kg5NCrUIAIi8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5QP0Y3HmoAlR0bDz3ctrdbk8Y+gUpph9Um0+n9jOCo+P8xOty
	MtK0cleFJhtBdiLV496iG5cob9rNgUsPQl38iFUS6Q3QOJGpdYAQBayZbA==
X-Gm-Gg: ASbGncvcL/Ml3wX/vCSfiQM+Q9/QIJPcb+sx5v0WD1uCne1NNEwovwtZEWDGmCpnJuU
	BRfP3cKJobQgllHGrl14jfFg5IvlFoKXM7fGNG+3gWXr1ZKlMQmNZJGaVN1gWhoGlv4rFayiCLH
	90WaI+/ShMNyfgTHF8WPJXKfaCnth+cjEoUxJxh/Fv+Rf2AX9hnrLjvPQvJKV+XwLMmprHuicu0
	Wv8Py0brw+1etBReJgPYMJ/wewpBg2TB6a3CndAInWkg/UAupDeqzomk1pZrfQfnSY06cHr09yE
	3JJLo5vHoRaN/83WhsmDV33XOamz
X-Google-Smtp-Source: AGHT+IFbIUF5ecWWf2X1ZOmCiynZM6qNKPjgHOWCR9OGxMuh8O1DtrhqT9slph3CfuXX2mdw+rPGDQ==
X-Received: by 2002:a17:902:eccb:b0:215:58be:3349 with SMTP id d9443c01a7336-2216eeb0aaemr63052565ad.14.1739970181712;
        Wed, 19 Feb 2025 05:03:01 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d7a5:133c:3d2:703a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22120093e41sm57503565ad.93.2025.02.19.05.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:03:01 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 mtd-utils 2/4] ubifs-utils: journal: Include <sys/stat.h>
Date: Wed, 19 Feb 2025 10:02:42 -0300
Message-Id: <20250219130244.2119582-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219130244.2119582-1-festevam@gmail.com>
References: <20250219130244.2119582-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_050302_855123_78E43419 
X-CRM114-Status: GOOD (  13.17  )
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

Include the <sys/stat.h> header file to fix the following error
when building with musl:

| ../git/ubifs-utils/libubifs/journal.c: In function 'ubifs_get_dent_type':
| ../git/ubifs-utils/libubifs/journal.c:414:24: error: 'S_IFMT' undeclared (first use in this function)
|   414 |         switch (mode & S_IFMT) {
|       |                        ^~~~~~
| ../git/ubifs-utils/libubifs/journal.c:414:24: note: each undeclared identifier is reported only once for each function it appears in
| ../git/ubifs-utils/libubifs/journal.c:415:14: error: 'S_IFREG' undeclared (first use in this function)
|   415 |         case S_IFREG:

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
Changes since v3:
- Removed Upstream-Status tag.

 ubifs-utils/libubifs/journal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ubifs-utils/libubifs/journal.c b/ubifs-utils/libubifs/journal.c
index e78ea14f3e69..45d82fd54bdb 100644
--- a/ubifs-utils/libubifs/journal.c
+++ b/ubifs-utils/libubifs/journal.c
@@ -46,6 +46,7 @@
  * all the nodes.
  */
 
+#include <sys/stat.h>
 #include "bitops.h"
 #include "kmem.h"
 #include "ubifs.h"
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
