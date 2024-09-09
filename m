Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1E8ECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LnBxD9u5qE41um6/sPNObJWQsFnABpr7HRUlyBqqxyk=; b=p5DJJTsDgLjvBb
	PCJGTjYd9j63JfmZkMbzvm+NSmCjDIe/RHEuSlSLSJWFdnZ86FvxoAGImEYaJiEkqTdhwfnIruFRQ
	Z+I90ZpFf08IgYdp6D9DkzJOw4eAeUqUmIhzuQw+JMk8XQb+f69rBDjYm9W1Q6EaVV+QkQIJDaWSw
	JxgOGtUlIyjQp8HcS885vd7mD3lSEOJ+Ptcyii9znj9Q4xnFYNFHl8TStU1POe1Z5OVYezQbkwf+j
	QqpsFpBh5mF5D9vdWNTiwfLDkc1zR14gvKU08Y5+tIsC9thxam1dK/SB+70+sm1DE7x0FfdDBQVNl
	dKBl+KNOmEPvGOv3h3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVo-00000000jgI-3s9r;
	Mon, 09 Sep 2024 07:08:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVk-00000000jap-1QXl
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tT07a8fYg2mX8zdZb0NUXYrNfwc3Lxt6djOa1kz4aGg=; b=VNeoS1QOmo1el/CabuMFqUYWc8
	TBK8C7cfl8bpc6jSI/mVzRMbCaYr1jWZf7yJvwHOxXN6WzRHCG0CFM74j8v/eHwRoxFpsiliR1Oyi
	niNzYLJ+fbBBoHaB6iDaU/7Bzu4H/QOdlGhLoyjzJwlM1uKAmuER0YnYpTmPHWOKLGfCgMKZp9hKL
	x4v+9iHG72wfKclYJEuqoZaM5spEuuNnXzhjYulhgVNWRba2SzTiWKrBFKgE7fE5cm8MPMz/3mRa7
	uMGzpmxEqIQycJhYBDUa9ei02Tqnkjqh0zMUaziF4/seP3z7VcGw3xbhGE/A1Gmv/rzlx0ncNmm/O
	dusrg0vg==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snYVg-00000000KW4-2FBt
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so2573565f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865705; x=1726470505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT07a8fYg2mX8zdZb0NUXYrNfwc3Lxt6djOa1kz4aGg=;
        b=AwraCgq4eHdFgilly37u5Bs//Ar0Y/Bi8y1qZTD1g1AW1pSULjt/ucNjQg2w/SVScJ
         F/d9tdEoSeICIFKhpkmlQkRvxLAeVYndORlQmh1pbahEceUn2AX2OiO5Js4CIoSnnhcB
         Dv50+5YfX4RKdEuNzRb9w/Y9pOBI9B9jKRld9fIaPcjhU2zU52FA4k0wnthFX4QpQEfI
         QwTse/hNuNmJrCEfEBqsofTEKoP6wyVHuLRMlOesEr3G2Ij62GL/uP36ZIEt5xQJ7XvH
         22+23J95DA0n9FmJO/fksZLbnimw+7j8R3ZekGrfr2c2cFmnXXOaB47Ym3lmXyHVUiii
         priw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865705; x=1726470505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tT07a8fYg2mX8zdZb0NUXYrNfwc3Lxt6djOa1kz4aGg=;
        b=EF4QYOmp/900j9gNMdCQ0BpeRfQcFlU2iFkFwP/OIOiJ+36NMdwvHl2zXl5uXLWtu2
         5bdMtN138TYelAYCPKr8ufXtATCLFgYDoZhX60AjdmoLB4vbBciSytOsUEpmez4UqXSc
         YAnV8TwPl8h0puhROM16vdQcrWnFhC0R2B2H/M9KoOMbRlCw3ozLyHFkFcYcLAkMi6w6
         8BdDAsIluOGlmz3t+nZnpWca0MZuqTkWHq7WuFr8Nas16epjVb3tQssejH4Z8+mXU5si
         3y2bdqZ9wHAns1nkl3GA/i7GTjkfhcOr9uXxx8DyDp4Iffr8IotUkYzSIRM7vQMzn3+k
         EIyA==
X-Forwarded-Encrypted: i=1; AJvYcCXX9+D+PFDMGMPGJjXb7UkN2ZCp+wV9s2mQrfHIoUTS2GYC7eu6V7Olov8zCZ1dchepIsL73Fz4XZU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDqjV6lK7lv6tloVbBbU9NcmxgDYjLcsvPLR0PUJ99QsWMCpgB
	wUrHWAuin1AdAM6MuEwynexTYDLZ/mosnBfLEIgpgQSh9hTQfiCt
X-Google-Smtp-Source: AGHT+IGIhx0PsdDJkaVvZyexO/Bqs/D/rzFr7Dv46t2ZpbAiLjLs7eY7rO6Hc7JCeQzZ4hCsEhbaWg==
X-Received: by 2002:adf:ed0b:0:b0:374:c1c5:859e with SMTP id ffacd0b85a97d-3788967e478mr6891163f8f.42.1725865705078;
        Mon, 09 Sep 2024 00:08:25 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:24 -0700 (PDT)
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
	kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 06/19] mtd: tests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:20 +0200
Message-ID: <20240909070742.75425-7-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_080829_165979_79D9F3D7 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
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
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
