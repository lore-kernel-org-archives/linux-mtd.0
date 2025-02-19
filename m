Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75BEC021B3
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ygBAfRpzgdk+pMkR1h7m4HFJKMKDS+e6voV2SvE25s=; b=26Z2qpUQgAd1ZB
	x5Scja7IjTiiNj4zo4UgGlS54qTeSdcKPmOX2P5HbbjnagvgJsU+7qIYVWZj8O4LARJoyGu9yirDe
	TWKAQL8xeWPQObYjZ/8vyx8Sfh9awf1B3CefkgmIfqbIy0GkE4zXN7bI/XHgCrKeOKwa98M75XJe8
	kZfjTuuyODOutZW9mrDRgl+UhiNHxV0ku4Z2pv3s2pe+6yrVmM2t3ZXciaKTwnA5Aau2Ijo5yfUj7
	n84xJ0lMj5oPsxdcHVwEAAIhILvrh4sp7a5iOj3HhoWFBOi728yVRvrQqt+tC5OwIthHSEjBsjIZ/
	oVtwE+j/ZflkMVzacveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjkh-0000000CqbU-3lkX;
	Wed, 19 Feb 2025 13:04:35 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjjI-0000000Cq9O-14LV
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 13:03:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220c8f38febso124413085ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2025 05:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739970188; x=1740574988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVAKg3uAXSuYX9ojpdE7ynseyq6cStvToW6Td9Ocagc=;
        b=dulXdh3zhfnSTJfga+xR7Q1+bxzOALS3bgzQdUdUHc24XbHMYp+ILdGyRwQsWlDtHM
         4B/7cLVD0HbdSBZIhWl4G5kvqTCqx8Zp1dZmzCOa4Cmj1IDpdv2Es70ibv14fqCsFbEI
         20iYLlN/Bf087XSgiTms+vznPIwHRenPlm+g5RGlleee3txT2z82vW23BLl4HlsszIXf
         6TKJX4Zxtr2FA+3tfQYyB53nKgytXlnDD6FBjPV5EreA8PUXTo4qUi0JI/9CHNvdNq0H
         G4Tb+xsWV9iPfXugE1ANqh+wf3pnlcSBkTQlcLSP018Uef9ixwYewhGdMs4j6ttZ4MO8
         vTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739970188; x=1740574988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qVAKg3uAXSuYX9ojpdE7ynseyq6cStvToW6Td9Ocagc=;
        b=h6KtJp30fOMJf7gNDaRLk33k2CdPrVo9+HjgJZvrsad5er7DYQQ26FoCqQ9qrgVoSC
         QTAPBJYK0QL+dKANEckAedLNcVwjGYAcoyKffdM+PXk0PrgsBrLGtN7tybVpfdKBclBz
         xtflnpdjm/s58vlMCkLiwsfMI8aOT13ReLjHjN1DMI9FUnMqLKjwnoh3ENv5BbgWFuAZ
         MW+3wUCmod3KW8eDa9J2HQw6Q0CoCVIne0xRRUKeTvy/a2eyMyi9iRr/8SjdyeCHb9xZ
         fkwr2BPmVvoeXCdxHi+C3PDSybIbga8LKbSvY0XPPTvZTcSxAthwwlG2vwWXLhFm4R0Z
         MG/Q==
X-Forwarded-Encrypted: i=1; AJvYcCULZJ+52ThMFL3hyndjJDYatwHfeLVLW7M0QnetfCxErZfkb7nIKWhZAL/IgFUrDuSBNgaTmJe527w=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPbP4Q8d2QzjvjX+WjMhqfnx0VspSMg9mqTPavzLo93EE2Lous
	jMELNmNzFXNsOIpIWpUxuqyzilg5C3SdHNNzxJYLMNqAjMYZ/bqF
X-Gm-Gg: ASbGncsEFkHpsbdKBVg/y2bZDxvWyLkuSj0JaIqdafwWmrcnePL0dQ3oW32xoWPlmGL
	1lhC+BJPOWHugOnfnyaGzrAwjHCNZaxH5VA3LO3gvSbtw8eC/0pMi8AHnf0wQKKxoDBiWB90Cy1
	eOwByxqExG0D3xVPYoF7DF2mTZjwRTS0uWpKpMijTtFcsrR4AS7j0OIQY6hLB29SgCice0B2spt
	h4i+iYdqzloRtAJe+IcwdyKKZ43oleCvfxi7WutvZPk3XME1s7dd2KLYB9wlf+Bo1tq+slD4M16
	uglmQbwJ2WKR4qh74qPhh+KxuVO4
X-Google-Smtp-Source: AGHT+IGRXalK8/o+XxDIyYtqy0ST3Nok+0WlWBswMyuxMQlzXWIEs102Fj94vQLdg2wW4gQP0D6r7A==
X-Received: by 2002:a17:902:e841:b0:21f:860:6d0d with SMTP id d9443c01a7336-22103efb488mr305237715ad.5.1739970187642;
        Wed, 19 Feb 2025 05:03:07 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d7a5:133c:3d2:703a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22120093e41sm57503565ad.93.2025.02.19.05.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:03:06 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 mtd-utils 4/4] ubifs-utils: extract_files: Include <linux/limits.h>
Date: Wed, 19 Feb 2025 10:02:44 -0300
Message-Id: <20250219130244.2119582-4-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219130244.2119582-1-festevam@gmail.com>
References: <20250219130244.2119582-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_050308_289321_C6C2AF45 
X-CRM114-Status: GOOD (  13.62  )
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
Changes since v3:
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
