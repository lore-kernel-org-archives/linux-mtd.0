Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7F6CE8347
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xa97yWAlaZsmYceMKyqnR0jzh808nDa9cAlOHORK+nY=; b=eTI/8aSnJEl7O5
	BKK2p8GJcJr37SgM/yYJOBAscdv+/ajUN7y+pWHz5h7Ii6CJ9k6LZAnJk5rq7jwS5d1vjFzTpGvh3
	fhLM3iPxqgHAHwACWwO+8oT8MMgE8spKwAQWHOsey/xiacywPs3Mqev+AlzQOOoheLxDAus+KocIy
	MCu62gAXPdkPtC7uI8k+RY+xcqK+1WUHjWAcNgOmPKjXG2z6KR67N6GL4YCCI5SmkTUyHsqyzw5oi
	HoYZpfMTYmriFBVvXsFllTytrtGkN6I7CpdeBfvcv9whxjXWlcu0VhQ7VYpyjzD7FkmnCyG9TXO5x
	pbvyx8FaNFGMWU636vHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGB2-0000000HDgO-2PJ3;
	Mon, 30 Sep 2024 13:11:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeR-0000000H4q3-1AZj
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so39874445e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699837; x=1728304637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTtABT1rYfIzK3Apk8cuoRmJAsuypkLox4BN8k8T5lM=;
        b=OuVlIfHtgHij/1GDm3W5zaPO5ty8FoACZvLHKXOkajoscrPjlm3p1HOCBNdSkeAFR9
         3VdhOI9QABhMAWtWOkdNWT6iHP/kjIQmiFwpKV6dMbDfuWFlBjW/XVyB8u8OS74VX7AX
         c/MK6nQOuZ1GULvG65shX9JGodoeSEuaAH2P56yWJ5GLE5vDjxUJWqf1wqrXNkSDPgJy
         daaPMUmB6HkD5tvThqGgQeFauhVIrtUeJ7R/xBiORdsHxb1WEi9EadA3H7VLDv8G1lag
         nAg0gOrbUPFAa4JBjR2+fjNZPJPyz/LV6Ew1DFYg5TxCJMc0TZvwTTyXCaItmyt1jZ6P
         wpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699837; x=1728304637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTtABT1rYfIzK3Apk8cuoRmJAsuypkLox4BN8k8T5lM=;
        b=eUoHfl+hRgHY0UHij8LE0IZA3ItkZxj+l3sv1U+ZmYQ0qa2CTTi3Bmwi4r5lDyxPdV
         uknZ/C9MNxyMb/glAJFNzseUD3pr0u5BdL1CbeEzHtCiE3rAuKtLenEfVX1LH2wiqoXw
         4jexuBkZ1oqIV6Lw3e3N0s7Rljrl/AltDhpq0oRDwLZVqWsfYmQ0DtY2koZnD7VemggY
         +PT5r3QCKVkV/j5E6oNzbP594nK2LQkqrqnLWVFqvoDY5bLA6D1LtQ2388elMBH0wVzi
         WgC33V+a12s6XfZFbqrJEUQ4urBqMPoolixf2vMQcICRlxCkS4MrZU1plk0JD72F2t7A
         wv3g==
X-Forwarded-Encrypted: i=1; AJvYcCVSaj+1POGYBGo+oWhkIZDKOYj21PSxgAvK4FVQgS2bYnNcNeNYSOsqEYSS5MxDJAbpinkz5p8MlpA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1EpI5xwfd9Ogg7kpRGAcmHRJu2tZFTlOUZk/XEh80ERjR3suo
	k15gJq11iNQzuhSEj8j5uN1QELoC0EJDhTDVuJ0YzXCk2RcnRKZ7
X-Google-Smtp-Source: AGHT+IHBiyuHQnT3ULO5RBx3Lp6OpesRYqemaXFPJxpMx4yYeqmrbcmToiuf+tr1+RXNDEzbJ1b58w==
X-Received: by 2002:a05:600c:4f86:b0:42c:bae0:f066 with SMTP id 5b1f17b1804b1-42f58434768mr79576095e9.13.1727699837034;
        Mon, 30 Sep 2024 05:37:17 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:16 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 06/19] mtd: tests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:17 +0200
Message-ID: <20240930123702.803617-7-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053719_471265_3B879B51 
X-CRM114-Status: GOOD (  11.88  )
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
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
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
