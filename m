Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0939C021A9
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 00:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4FrnnPHsAVPIgfM0aChXzWgqlHRRseIHa3L45XhZ3M=; b=oH4EbwM1fqDaG9
	t+rdU3Wkrn0CVQU3vTOPLyDVXamm/8WTH6z2MgF7nYRTXShabrZzOSTN6fU/Pxq5PtELIknLDuZhn
	A+cJwsyA1/WdJfmyPD4Ew9UV90ZeXzd6uzjHe6LXOVNlWS2DYvjkcvhPqcuyX3FwtXAjPVN3DrO4Z
	l06Yv8oN4VTvKZhP5fGWIF/sgIGFuuIs7UacjeJfFdSaVsxHi7sqkKczGu0hvjqaeR+MT6oDSypdn
	ucBpMXVrmKkSUzpz5hNXmnzehFxOEo7CgXIGtLtc6BCuSSzveV6I0l9lMnn/VQp2EvfPEa7tqWrEY
	np1TALsdb5TVqmos75Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBH2-00000006JR8-0aaa;
	Tue, 18 Feb 2025 00:15:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBGy-00000006JQH-3q3I
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 00:15:38 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22100006bc8so45692045ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2025 16:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739837736; x=1740442536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h03XOQ+e0ldyM+bp/IykDC6UVfjdB91yiKxQRynepww=;
        b=K5hqnJiB/EQw6VG6HIMMf64jGEqJdfaIHsT/qvwNPRfjNeMaA1T7/IZY2GVJo3J0kG
         UdU5XZun2QTX6MdrZZtl7gdvDtgEdMv7RBIbIiAZh6YCPPYZ12SIwsNdM2qCjBN0CNFS
         yIG/bqIcHH1JG+dzz3DrB+1OE+8TrM67htgEsZOFTEuLA66awRF3ndOV2v3X838GIpnW
         9K+pMwYhmyyqJFsE9Akx+PGaDcA6X7aMrMGoWt7c5UV3ce4TWIfzKs3UFHO2K28T6PyH
         jigLO1R6xGBHPdu+81CmMe3Jg54V2oBqrgCagGJM9La7L1h5uMfLnYHTnTDIqDEpsjQM
         Micw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739837736; x=1740442536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h03XOQ+e0ldyM+bp/IykDC6UVfjdB91yiKxQRynepww=;
        b=rieY5MevbW/sJ25SSUjkO4iuZfgTkxoBMO83CooBw+FA1v6P6P7juYoFrW/J1kSkGC
         kTE8xAWYuvW0ssVX/dKo+WdEQtjudcoVkAAqhYUsKkhN7BcwkWvk2dysvxBzWiGkrDAv
         HFfPaRvJK9m5YSx1vx2ld1sxURBzK0Xde3+QaAz36plMrpS1QKEWYHOxfZWAfv3GnrVD
         ELXYng/wVBvlsz9pvEZh3fUFD30HvQWp4UGx6Lvj8gWYakE4RtiqR1hEZyzlDOquip1k
         zHUNEtkAtAspC0X4jU6BGoPDdNvdWE2fU5FARzjAaB7yS//6+LdnWhatpODxHYiMhs4G
         sS3A==
X-Forwarded-Encrypted: i=1; AJvYcCXLdOlnvSbIw8f6lhY8zrEd5xhCPxKrcu7DsNwzuDSbBobWO4IsT8myQXkhy8dyZk5jGJnFy5sLZ/M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAVk9W+kb03E1XOaRJVwoIkhV/Hb8MrZpca6cfcffhZrHP6P/7
	ya19zM6B0Jk10hBzfRkVN/1/D1wZ1DHrpKIXRmqNqPMvIRopyQHLT8sjwA==
X-Gm-Gg: ASbGncve8lYb45X2Z1rxEHE7tPtqnjK3EPcKDSUvyQVra2GjtFOfP+XYlgzNFZYFybX
	2rHGUrEr3qHVUj/L3uHtRWiWLdgp0u3wYGaJ8JE2Twbyg4FvRHfEl99ugJEwL9ZOZi9GW7G9I8p
	lqFiCMkuvyP8FPJXoEMp+PdafGd8o30iSHf/by5E9ajyVUXcwY4aCSqYVD5Hs5tbWnU8Ff3ViEb
	rWDlPW28+18qgq77IAepxw1fu8z2qTZv96Bloa+YFYYwI6D1mirxsSm+lNF5L8vGkV//XRrwTVR
	2BpXBGZ7iOGRJBwa5sa1hQMncs6LRQ==
X-Google-Smtp-Source: AGHT+IGeSEB1VMpOHrPxq+FGPyvVka7Q/5ahAyhj/3l+6AhaOgLVhBJBO+Ub4vjigafuwLCmGcwOVw==
X-Received: by 2002:a05:6a00:4f95:b0:730:794e:7aca with SMTP id d2e1a72fcca58-732618c1c26mr19576581b3a.16.1739837735976;
        Mon, 17 Feb 2025 16:15:35 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e94a:c6e7:6507:f007])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327eb20b98sm2554519b3a.147.2025.02.17.16.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 16:15:35 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH mtd-utils 2/5] ubifs-utils: ubifs.h: Include <fcntl.h>
Date: Mon, 17 Feb 2025 21:15:09 -0300
Message-Id: <20250218001512.1862030-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218001512.1862030-1-festevam@gmail.com>
References: <20250218001512.1862030-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_161536_952358_82DD46E6 
X-CRM114-Status: UNSURE (   9.55  )
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
