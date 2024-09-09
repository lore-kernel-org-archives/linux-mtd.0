Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EBDE6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LnBxD9u5qE41um6/sPNObJWQsFnABpr7HRUlyBqqxyk=; b=DeYDWI9YwuCwxx
	mi19Dr5VQvvzyugI2hP1s6f5hfpt+cOfTMIBxIot57U1bzrFs+ZEAyg7o9ZZDoUfv26id5lNy059i
	srCjDk7FMk6BAuo2jXUfEBFET/S4bLhbvKkAUYf6d4Dktmu1h9t3F3YSgTZ6eBKQ2N68Acbw1fTzp
	N/M2+fZJ0IgrpqyjTwwZvJbP/ekIgT+uecJnoN5BszXX0sNsQjAB45Gp3ZNLV3FtpMLYkMbdVMaXg
	xa3rid+HubAdJr5FIEZU0nPsWHGptpkIROv/vRepABEkkxlGyx2skdQpQQ8vNYwQHM2HkRW9otKuv
	9l2iivkLzkDLC7UkAr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGn-00000000wGW-1uwF;
	Mon, 09 Sep 2024 07:57:09 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGc-00000000w4Q-1TCB
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:02 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-374c7d14191so2727409f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868616; x=1726473416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT07a8fYg2mX8zdZb0NUXYrNfwc3Lxt6djOa1kz4aGg=;
        b=el5hTfyhoUtIJF6oT4Y2mFcmtvZMRAoNr5pme6WTHnkwkB4Sl9zJjcNgKwJtjC53xB
         dA7lyigbGGvCuWb90Z7Qaxa4niV1fQRKVK6hUTEl1ZQSWfRrfU08Zkjcy1J9A5EkQoiW
         YqeewD/o+yHw1VYHLEJ2U8iFdF8SnO1jYDPL4frkH9M5B/jF42rDj+4k8qwt7v09u+ji
         F+k208rKuFMVi/yORIsE+neBWXUsnF/RoSE6Ru6dcFSIyrQ/3i8hp3dASSrmfcsls09c
         G7duwRfsgf+EVYULwTDJKC1AZQI4X7V88Bm8jd/srMdtPOmwpsYQTy9rZbHxehVTADKk
         Cgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868616; x=1726473416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tT07a8fYg2mX8zdZb0NUXYrNfwc3Lxt6djOa1kz4aGg=;
        b=TiNIJLm8g2pGvjvltkvbnMiciXQPE8e06C7fpER2tWirG2gDSf3TZT0DBpwAOt4n0u
         FhC4jctMfRIhEOlVYXCp7S8HIL9w8+kwnlUo+rttgVU866y+IAY4uhJ9cQAMrtDpTnlg
         0jW5wYVzPv3xG2y10mFvFKJwVrk4V9o601jjmUZr2Ux/xaR7XzS0j7X7s0J0wXWAyc37
         66BFVLhnXIUQAnNm+hKUUlVmqW/dqVDI27PsCcF2JEOt1BCFYMdPA6hfTmpUqjvq23To
         FyjnyNsQO5uOnLn2hd0oNRCMRaWuGeXNPiF+44epH6wzblmmROLe1Trd98Esdh3CKx+m
         SUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTOUOn8EzuRfBs6jMlGQfiHKHW2yVupR2TrMGCAsCSmBFhqePnXi8h6yVqsBFURPOFXA49H8YuSLc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNiQY8jaV6xdI72nK/p7hHW7cb130qUy6ipiEeWT4jUHg4JekX
	+dRIVEe9NKtp8xctXDNcO0R6MV741isTLc3m1FX2aZX+eO9D7QWW
X-Google-Smtp-Source: AGHT+IGmZsYZCmG7YYhzHupjmmuJRGqS/FOf75V/9MKd4VXHMgO9wuyXejXAu7fFGUQHBhuwF3txfA==
X-Received: by 2002:a05:6000:a8c:b0:374:d006:ffae with SMTP id ffacd0b85a97d-378885c04ebmr6261181f8f.6.1725868615928;
        Mon, 09 Sep 2024 00:56:55 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:56:55 -0700 (PDT)
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
Subject: [PATCH RESEND v2 06/19] mtd: tests: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:49 +0200
Message-ID: <20240909075641.258968-7-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005658_523967_4EC0A4DE 
X-CRM114-Status: GOOD (  11.61  )
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
