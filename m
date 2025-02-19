Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D57AC021AF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 00:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3xQbkVBNqBXWJ1aTMQxww6xdlcCBJ05rUtUFjrl+PQ=; b=t6WKsojItU9gUE
	dsIqaePvD/7gpaYIQj+fE2ujfQsuVfhQg34RAfl+U9qJn8YIx+nV7K2FTJ9c62+0xj3sjmCK4N1tp
	eqtU9ACHyxRGY/mickgWbnABg1+PURpJcxtzPm0k4pUcgFBEkYJYZiFQ0Vv9cM36lgbQ8dnbx2fUP
	wkhHAVtnpzxgEiRAeujxyH+kyQ7BQArAmtAbQDpjko4Kn3YkjBkY9yOnrAtwaDJAOJxAMj0j8IeXg
	TyEkmVIy/OCb9n5f6ef2aKiPd3TEhMfrmheut09OjeuDzP0dnU1gIcQ8r0v4Vdx3/8HpJTfj6HHU8
	I8jxva9+E7ZkJxGEuLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkY2I-0000000AMgW-3uiJ;
	Wed, 19 Feb 2025 00:33:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkY2H-0000000AMfj-1XxS
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 00:33:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22100006bc8so67109525ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 16:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739925236; x=1740530036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NGXOn7+DfqfEFS1FlVDyboXNlhLWmqldkg9EmAKZ40=;
        b=YNqq3Rc/FFIr4MI2GK4W5E9fd3jmJ3j79KQSu/2TFdX7X3cCmBROkabUag+OGh4ubu
         DWrhe9D+9upyVo6SBf6fI0c+k+YGe5oZ7jGjewbpwpJQOiFVDe3Tol0/fj1utcjcr5Lp
         jpIWSf01VT6oRaNUoZjU1v7Td1UMmnk+xh/KNw7nM48BGC6R+LXs9q4RHKlDKXyVDHsV
         ighgln6AN5K5tOk9kx79d433rmNLIBl2oM3AoaSDIJIOhuo7+B2yRMJ6l6nQWybwqrSp
         jPpobeJYvshfd28O3NShb1EwQgtmW5wZFAnOimVKw2bo/noeCMLXMg//56rmx3g+ZCHw
         AgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739925236; x=1740530036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NGXOn7+DfqfEFS1FlVDyboXNlhLWmqldkg9EmAKZ40=;
        b=gs1lYW59LDH449Hd7d24N9e0UFq09ERuTzGBaqK9qRWvK+KaRtFo9V5uqF9VlRcAOm
         brIhXhIjJFfHWasOEyQ6Xbfdd82Abea1piSurs+yoI1wsIwSNcdayR1Hzu+gLyofSKqq
         0dtsMF23UIizBXiLaS8fRJeTeZSSc0efAXXokOAPUCXi5rx3xE9vVBREpIrsNtttDniC
         DeiHBIu2HMBS+D6DpZPAty7YYaks0oPB1iiyyro/v/BHhA9Ohdu14ki8LJ9O1d3JsoCe
         HPaWvzJZQdLuJtevCD3YUvdL6ODgloLrTNcRWTw2HjLEaJw/57O8/FejImCA66mXHg5Q
         5eRA==
X-Forwarded-Encrypted: i=1; AJvYcCVMZPlUcdhKWzSgae7qOJ43B2k6xq/PutJxSFnczz7P2lSFC4VvP5qJHmX3qcGPEtzWfx1kSXXGRYU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEWRRyqPs6RRv9bSWiKZHjEOnlQEVzpp882BqZzM5gQLfrA6hC
	Qf2DMzGthlLotHJFuBbSG3FoCdCCsqvDHx2JTrdk+e2N6V+wlReI
X-Gm-Gg: ASbGncvM+zu1ypDMVIkJ/Bkp8p+LjPxHlunmaMNyDWlznD0uDz2WW9RaH5YQV1w2+uP
	IBob/v6fPG6c/qlL03aB8nRbrtvgJwHw49OR9t8FVNcpPGF8C+AiRYaZHfmYKYX864Nh10apTg5
	NjMZ/95ngJyQvRSHbT7EG0knVXEaxN37CD9pWdrfGhCpd/Pqg26zSjXBxroxVKmcUnfq610n1RU
	MLi81XNaLXKl1E6g7cRhTdmm/aZjkQWvh/TAujsNjZa+wuyicilP5cqe5zVSUQx8oO0QDNgJfm8
	17DP1BHIG1ftJ1rTgT4sCavYZnpVPQ==
X-Google-Smtp-Source: AGHT+IFCk7hlRQxAqvPCkwwz0NyQQNenVszUN2259h14Z/gpvlBHWah3sPTQl+gBIPGjzfEB+y2eVA==
X-Received: by 2002:a05:6a00:3e0c:b0:730:9334:18f3 with SMTP id d2e1a72fcca58-732618c2523mr24259581b3a.19.1739925236508;
        Tue, 18 Feb 2025 16:33:56 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9d59:514f:431d:4a45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e34bsm10965017b3a.108.2025.02.18.16.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 16:33:56 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 mtd-utils 2/4] ubifs-utils: journal: Include <sys/stat.h>
Date: Tue, 18 Feb 2025 21:33:27 -0300
Message-Id: <20250219003329.2078308-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219003329.2078308-1-festevam@gmail.com>
References: <20250219003329.2078308-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_163357_404890_FE6F13CE 
X-CRM114-Status: GOOD (  12.89  )
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

Upstream-Status: Submitted [https://lore.kernel.org/linux-mtd/20250218001512.1862030-3-festevam@gmail.com/T/#t]
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
Changes since v2:
- None.

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
