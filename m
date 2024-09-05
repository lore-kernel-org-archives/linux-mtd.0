Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322BDCD5BB7
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2024 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhThaNd/aBBLHnpL4gjDpMfy/XwZjXt+hf/tyo4oi64=; b=l1opqYZjrCe/60
	ynbLCFtiFXu633ePuTQsPbUsqoQi+UQvAzkfNSLacqOKSUq3ZMnZUoG84QXun6TjtObwT/OhCInJu
	YEBD17n3WTQwChxwli7Dh5qTX4X/P9hnuBqLl9ebc9Av8FkUMlUHeBx+d/afiI8S+jZOMvZkWoJbZ
	D3SEYKbD0iphJvFig07r9eQdpxK8sepDV6GTXs8tVuFoN0/QTFB9yOmCaMTJC/futRneVlTEFUWVT
	IjRkp0nMIVCOCeX1Tv5NMWsiK+MhKivByBqifAFbFlgbqagAAE+lYzMcXtG1BJEGS8cgj8AxGqpnM
	vg4u7b0EqnANrK01Q7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBTc-00000008HDH-3N86;
	Thu, 05 Sep 2024 12:20:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBTV-00000008H80-31bU
	for linux-mtd@lists.infradead.org;
	Thu, 05 Sep 2024 12:20:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-428e1915e18so5555135e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2024 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725538832; x=1726143632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HaI8H3FoFf5DkYAUaiPm+4Z9x64Xtmwnoeo29QHwWM=;
        b=CS+h5ERlk37sm7HZAj7gL+Jk11TeE4/WwMMYbKmkvpghQrAYZ9bjt+rIx7j5ZT8qEZ
         gwVL8n7RP5Yzv6JhzfhUcaaeOZYXJCEou2BboA12D9nIqTEPxFm/Ej5yoIXr+zTWuGzL
         tkOMqxdtJ7pjTu4ecG6gY3ywLciYYITvYjh7F27kWndjkMJfEvMm9JkTEvqMy25It0R/
         r9lkpTICjPswxVhgh1ZAjUgCVYuCvaXwOZ4f6z7RFkUliZvwz8/93jAW6sNqdDFpw8J5
         6ZRMw5p+ikANXv/t9crvRD8+izf6s5TJP4mj2hEkTq0i6OC32BulXRwmsqEhLh86dCmX
         uXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538832; x=1726143632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HaI8H3FoFf5DkYAUaiPm+4Z9x64Xtmwnoeo29QHwWM=;
        b=FLCfeODtOtujczhJ/uNnbkoC/v50bJoVUbMyl7bgR+Tg5juHqZD036gJujBfLFhzVE
         9G6H93g6emyFa7a7HluYhKMIkGW2NACk1Xe2DhE0PNXVSm4W+ckm722FNMR5XZcJM5ht
         WU2CHpAEbVIGcLpF4pRD8w8w1XodVLsrpoN1M+twze5KCkOMvAl+ir1vg5Nn0U/0eag6
         cIguGdNvJ1KSYA2WXR/QJfWS+xVfN8lirWnjLwQOquuF4RN5bdoAxN+N64WZZHS5hUuZ
         iOxBrzdS1Lu7d8+abrvA8+YcNXeTyojdOEBzz98/hjVYLBUMbDGTFn1sPtRozdWQxHMB
         fo9w==
X-Forwarded-Encrypted: i=1; AJvYcCU1WkKAkgz5miYyemtAyBdNA/HL2fnZuKDLGyZ/ZI1QxcikWpKj7FXGGkmwHzjg8gScIHXhY80CZ+k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPw5DQF0g3f7Ud+zpHgUfzDv3wUdXymjPeB746lqkyrXVj8x2p
	kNiK7NKh93mz/1y2VVexqxMnQdiYKvDj9My0dNHTA6afBuwvCDHKK2nsrHls3Sw=
X-Google-Smtp-Source: AGHT+IE2hEOGwUOJkuyF1I8qI9uOVWO+FZGUIZ7HMVcfHwMRCsmidU8BW4tzIrgihpb0nST6p/Hbfw==
X-Received: by 2002:a05:600c:4ed0:b0:426:654e:16da with SMTP id 5b1f17b1804b1-42c7b517656mr115747575e9.0.1725538832267;
        Thu, 05 Sep 2024 05:20:32 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27364sm230390515e9.34.2024.09.05.05.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:20:31 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 05/18] mtd: tests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Thu,  5 Sep 2024 14:17:13 +0200
Message-ID: <20240905122020.872466-6-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905122020.872466-1-ubizjak@gmail.com>
References: <20240905122020.872466-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_052033_821680_413E49D5 
X-CRM114-Status: GOOD (  11.60  )
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

Usage of pseudo-random functions requires inclusion of
<linux/prandom.h> header instead of <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/tests/oobtest.c     | 2 +-
 drivers/mtd/tests/pagetest.c    | 2 +-
 drivers/mtd/tests/subpagetest.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index 13fed398937e..e1ee68f8b8f8 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -17,7 +17,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "mtd_test.h"
 
diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index 8eb40b6e6dfa..6878700d2fc0 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -17,7 +17,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "mtd_test.h"
 
diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
index 05250a080139..f34bbf033c4d 100644
--- a/drivers/mtd/tests/subpagetest.c
+++ b/drivers/mtd/tests/subpagetest.c
@@ -15,7 +15,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "mtd_test.h"
 
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
