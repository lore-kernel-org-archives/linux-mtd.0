Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D78C021AF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 00:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMmRt4zX0Tyw2kTP71LPkKRm/L3ZToN3nKfp+qIUmZs=; b=SAE2VxFYT7sKlA
	vcNSy7ajmzC8vSxLOZCFKasQFeLaSu7JCX4/vUCeQPWqxUtIbwHjhWBot/01z1zOD3UOFhYqNqQ9K
	eDbKfLnqIgyeJQDu+qwZ+cfOfZGCW/G7obbMJj2y6EYc6TOloSs+Be1cU//Rya7tXQ+J4uQAVUMRJ
	pi7X9JRBU9+ivS3HZSjfk/L0ng4lPihZbEh9/y3g909YYCD54TyQ9Kkxwmx7QSPRrxlRlk3MtrZ74
	fW10XBnlEA+6CEBFjhr/45IaRT86aXrE5Q6dROIwT5IqEKXJ/dWFWob/iu7+YB9c0S8eGYIHsl1ME
	fPsguFpCLjFCJancATng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBH8-00000006JTd-0rMN;
	Tue, 18 Feb 2025 00:15:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBH5-00000006JSN-0Okd
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 00:15:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-220c4159f87so63663985ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2025 16:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739837742; x=1740442542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4cemERKng7gD7h7AEpWaXdoi9B26WHH5uY5ow9C7bs=;
        b=dtYPDAdIWuMuMLZSwMFkq6O/2sjzaJ1hi+a1hL4HsOQ4Sl7Sq3NooieSASI/303iMo
         g3MG+zVlt0yLz72y+2FA7sltWEFF4so2/AW0pgImzrk2KOwTY+p5g6H1mxehhjNVJxZy
         9Wb1P3aUCEWx+hloLzIYiGhwQM5semIqEyTtcaoP/OuMi4xZFvAu3ja2vELTWS9zxjz9
         DwdWB+9s7qDjSGOj2Wyopa6D0s1mv1yeea87Xzs6ZcTTnz8Dz8KCvBNRbgeN6RMto+yR
         RBCG3FhYnGQNTf2Ly02cq1FG5mUMGG3jdXEO9ZH3vf7k3rfLRQm/BpmFPw2QEzlBwR6+
         5l6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739837742; x=1740442542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4cemERKng7gD7h7AEpWaXdoi9B26WHH5uY5ow9C7bs=;
        b=YtAb6TKlwN5KRYIwey/Uv8LvCf9iUSk4/918WK3+BPI0CWombNJgjy8OnK4Tqg/Nie
         rGaW3CHYN5ZKVpavbrOKKUbv76136Fm3atSAOFOf6tS8I4RrL1s5zVQ2Dl/5ilcJnod3
         E8w/vFzIYTwWf74XHuO+mjEVeBxeMmpwHCQYgooE+ZjkvTqrLzlUjVKeMLBuXKkDMX4w
         +Q384kbSzVG15s1EmRfEVUBzxh6Bi6KzL2BLiJVUBreSq+oxP5GlAw9v+GXIqbtPPvMc
         /lW6vOwoiAiyg1ulMvnRCdJ/crunie7i+4Ivf7dGSMmaTtH8v2adAWIb+eLGSxL6rICg
         XGbA==
X-Forwarded-Encrypted: i=1; AJvYcCVyIDfiVq2NCE+7geNYmEnNWYVnFD5Yp5ZbfR7i3RhXkmu8kmiFYcxzMWLVB0A2/O3eNea8zBslwhQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsa9dYF5XZMERmCZc3bEmfrLlYKfGAQtqOiDj2cZNdVLFE15t2
	1IQCb1aqk7LGD4lO16ECH5s1qcYzowI2UkhlmlZ/OZggNwQOZ1PK
X-Gm-Gg: ASbGncupVX7XfxNlxGiGlURWTu7UW+imd5Tt9yoAg6ayf3Sdr71+hy8Zddj0NHLwW/3
	kkZI+4UoMqwkt01NEifsH5w0v8dU7HRj4D77SgqsVV7fQy5zpjeOpzUUy6bAuytG+rKRCFvb0qJ
	W47RCPLVUJ97ntC1g2Ob70aY+AT3iR+vildTXUhO+z1p0y28tYxyyqs6jsGMN+XJOr/R2mocCwP
	ucODYq6qfPJSUvcOSYyGk/kenDhQAB4mXuQsaVmNyRafaJ6izCaQiIMzPZ8PDULG/aJAyPqT4vk
	6IFHRHDmBYSlWVOJXbX+KmDheQWd+A==
X-Google-Smtp-Source: AGHT+IHiGC/mMhPbHCh3FhVZrHnH8xI49R/ghUn/5Cc+LBiMkeSD6QSRs3CgENPripyQHVuD7Cyxfg==
X-Received: by 2002:aa7:888e:0:b0:730:8d25:4c24 with SMTP id d2e1a72fcca58-7326179e908mr17590981b3a.10.1739837742537;
        Mon, 17 Feb 2025 16:15:42 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e94a:c6e7:6507:f007])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327eb20b98sm2554519b3a.147.2025.02.17.16.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 16:15:42 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH mtd-utils 5/5] ubifs-utils: extract_files: Define XATTR_LIST_MAX locally
Date: Mon, 17 Feb 2025 21:15:12 -0300
Message-Id: <20250218001512.1862030-5-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218001512.1862030-1-festevam@gmail.com>
References: <20250218001512.1862030-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_161543_132894_9C9B0FAF 
X-CRM114-Status: GOOD (  13.53  )
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

musl does not define XATTR_LIST_MAX.

Define it locally to fix the following build error when building with musl:

| ../git/ubifs-utils/fsck.ubifs/extract_files.c: In function 'parse_ino_node':
| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: error: 'XATTR_LIST_MAX' undeclared (first use in this function)
|   144 |         if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) {
|       |                                               ^~~~~~~~~~~~~~
| ../git/ubifs-utils/fsck.ubifs/extract_files.c:144:47: note: each undeclared identifier is reported only once for each function it appears in
| make: *** [Makefile:4374: ubifs-utils/fsck.ubifs/fsck_ubifs-extract_files.o] Error 1

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 ubifs-utils/fsck.ubifs/extract_files.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
index c83d37749bc0..a33173694de7 100644
--- a/ubifs-utils/fsck.ubifs/extract_files.c
+++ b/ubifs-utils/fsck.ubifs/extract_files.c
@@ -21,6 +21,10 @@
 #include "misc.h"
 #include "fsck.ubifs.h"
 
+#ifndef XATTR_LIST_MAX
+#define XATTR_LIST_MAX 65536
+#endif
+
 static void parse_node_header(int lnum, int offs, int len,
 			      unsigned long long sqnum,
 			      struct scanned_node *header)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
