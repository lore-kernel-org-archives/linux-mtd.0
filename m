Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6987C19F2D
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Aug 2022 03:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gy8txSEd7CYoLWsQzsXRivQRnhybxvFKzg66ARyGijM=; b=dZ93RSGDc7yI9H
	2npfTRiD+5AmJz/yJHEB9ssmQgN2JAi2mpFpfqY3tsEzQLjkDxwdXMaQ5tbj+UlqNwCaWzf0g3Obq
	UuNsFZdQLpft45ssTVlJjk8MqO9TtDflJF/YejGU975mLLrllaDvm2eKXJgWic9Nr5OvTORMK6p9k
	7ckh9bI6kW8fLWJScvwwERzIqo9xANQ3JWO8SGc5Tv/SFfbYaYxgVLc9xSfeySnQfZUeUbyW4O/Br
	WKY4L71pzR1J53XmxpNrISjzo/pbcfNYA9EvapYmBGLIYLMvMLaUkK9B6O3+zCOFfG3Jr1L1pOH8H
	gbC14kwsC6PyzwvR8ACA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKWrO-005TUe-NB; Sun, 07 Aug 2022 03:21:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKWrL-005TP2-Me
	for linux-mtd@lists.infradead.org; Sun, 07 Aug 2022 03:21:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d16so5822960pll.11
        for <linux-mtd@lists.infradead.org>; Sat, 06 Aug 2022 20:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=NTzHtkdEZnMB/4HoW5gkJEwPE4Fp6AqgeO1NbhBen8w=;
        b=i8yVCd6IBqdAYmycUr32PABDWYk/6WI6ZKZy0++N7kML76Y9QRjJ4x5J5v3wR/h8a8
         rAtRDzWnB6oyOKOEofFKYKdHWEPZ61p1uRa+b5g8GkQM46ScNs33cNAescOZFHIt/Ee1
         HSKGHrLuZQerX58o8NpArjM/8Lzu36+lZMb1ABuP/vJA3mIDr4n74drV9l36cd4+JnEo
         WHjuGNv4M7RZXaLs/ejddoryZlXoQ7az1zGiD/7TS9RnAtMbVSRsdNQnJ/DfQ7inpJcb
         NIi/sQXh3hLBcgMPMqd95LSPkylml65DEA4Y9382ctST+T4csD0IsWy7dSfpPEFC4RxF
         9HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=NTzHtkdEZnMB/4HoW5gkJEwPE4Fp6AqgeO1NbhBen8w=;
        b=wfCjH+4bGWuJneOkmP2nuesFhjFPFOprI3lf42polxf/1tAmFDDRs3Wyy4Da7aAJZq
         Ad7pVtHXUqbCVXqUZFpESx1d5aayt/FoEM+GFLWTbZgx3VvFxwrBO1ecBEXCGS3Ga/pb
         3cHtTWeML0zB+AQSknu9bvJ6Q+rJ5etkfJbi6zdT86Gt/m6bOnKxfPJd+bHaCrq2jUa5
         q+j4ajQo+ykEd80JkGQhdQ+zpg1ldU7gwWyucdJv8v/xfGpW/Sk3vfeZZJTf73JuE26u
         +CF7qFLX0/JBDWMBovGMk+VSsHsFt+NejvE+o6xSokwzWAf5VKXgHNSfWq5MFdhbK3yr
         Vzbw==
X-Gm-Message-State: ACgBeo1NFDWI/d6DEAIURer735Be0/mfx/QAmr1W01PGtXPQvnd1icI7
	jOhwVHaKDhlPp2FdWryVp6z3K0H/cR8=
X-Google-Smtp-Source: AA6agR7/gnKwLe6JEO1i5uNzRf789gnSFzaHjb0bBL4ed/L4o3AGsRsiRfJXUZO6dZ2UFHwCU0hkXg==
X-Received: by 2002:a17:903:32d2:b0:16e:dfed:b4b6 with SMTP id i18-20020a17090332d200b0016edfedb4b6mr13094360plr.108.1659842504784;
        Sat, 06 Aug 2022 20:21:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id n15-20020a170903110f00b0016ef1e058e5sm5738398plh.295.2022.08.06.20.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 20:21:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [mtd-utils][PATCH] tests: Remove unused linux/fs.h header from includes
Date: Sat,  6 Aug 2022 20:21:39 -0700
Message-Id: <20220807032139.2218208-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220806_202147_775593_419FCC25 
X-CRM114-Status: UNSURE (   7.37  )
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

This header is not needed, moreover it includes linux/mount.h which is
now in conflict[1] with glibc provided sys/mount.h from glibc 2.36 onwards

[1] https://sourceware.org/glibc/wiki/Release/2.36

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 tests/fs-tests/lib/tests.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
index d1a2e0c..3db0426 100644
--- a/tests/fs-tests/lib/tests.c
+++ b/tests/fs-tests/lib/tests.c
@@ -35,7 +35,6 @@
 #include <sys/vfs.h>
 #include <sys/mount.h>
 #include <sys/statvfs.h>
-#include <linux/fs.h>
 #include <linux/jffs2.h>
 
 #include "tests.h"
-- 
2.37.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
