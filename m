Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3610AC05027
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Feb 2023 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xHNp3rMzvIGGh8q/TgDvK/WJ1JQaMqkaJxLZXVm9oRE=; b=WbYoznLME9FRJf
	bSYDBnZP0qLfdHZKdrIkb0zKb5x0JIpSvSSIHspsMDo8sUskV4bupq+oOb3bUKvBTpHaVxxElcRJq
	Uss1FbuenDL+IdBdOnWdSNim9anaMsffFCBDmjE4cKo/GDfYQDYTvh6m0/22UCAb/wyVhOvr/IYAc
	Vca4tMfz9DsQ3BPvfMbNR3yhTmmgsAxeAuWuorkbf308u0TcJV3a9pXX0LpMhtbN538rFDfWhGZc3
	+ChPI+9fvfVMZK3NoXkbHHtICRcZOSO+8aijirgd4pZQKGo4SlkK5HLl/erlzYypxxo8Xlrqs/f6f
	xkHIPOd3hZWRb31fIAmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNarE-00GCDU-F8; Thu, 02 Feb 2023 14:46:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNarC-00GCD1-FH
	for linux-mtd@lists.infradead.org; Thu, 02 Feb 2023 14:46:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso3893944wmp.3
        for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2023 06:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J0fzJnEdJhZs6pzCO3QQHXezw8AwzK62aFAVJcTyA3k=;
        b=CoyyTK621tmUL/qz7HY01Buj71zKbLt+AinKrr+uU+lAXFAvi5OVelGgJiZGH+MlOp
         RB4PeDCSowhaROxovbzinvAreugeFJ8bF1fXqgZi1E2no2eG6WOePy5LiWwNrSyes1Dn
         gdh0Rc06thZopl0gFcX1RtktfPBjdYMFl1Kxqgz26ajbye0vg3WqVt9FQssUTrg2s7Bl
         c/wavxv2GlztcpGOyAgEKz6/ezfuPCZx3R4cxLtqaY4KhiIwffZQ1ee/YN76E8bNlXcP
         eywJqHChG1HYyFGGPe+sdIdZN8hiU+BqhhTEEuaod1ihARy3dLeXyl6bNSaBNf9x/7P3
         as/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0fzJnEdJhZs6pzCO3QQHXezw8AwzK62aFAVJcTyA3k=;
        b=i0htsDIj0lzTjDFPFihiufMuJZn/pW8PLK50QZjJuZWidBXkP6cu29IX7NBPOXimzA
         aQKOa0/rA09C9rQCGKQzX7pVaPiIksLXl+wIBnh3I6UJ+UQl505fUsY5cwmvvKGS1r04
         QZEQj/NR9EERbqKrIp8woEGDn9S7bpcTUDyzb6MoeYJX+PHN+6ZKTaPjxt1PuOqmX+KX
         zZdxhvri+CdSmmMSWOfk3QJz65soD3GLlyaYXkMc0rdtu9xvAmy37rlk7estzhWE0ZYT
         L7wtmL4fCKHeaGqQKaEy1s7kZ2Vc6Z+CUdTT/s7YNKc9mU97xYfUKxro1NGB7vzKPDl7
         SMjQ==
X-Gm-Message-State: AO0yUKWgXy33EVdngI0xZaCQX6xZITfos2acQBU4jssBecrvaeiieDPk
	VSXW8asDgR5LB4u9vsoH2+yEKA==
X-Google-Smtp-Source: AK7set91pbKUq+jVvKK+Ei04Wn4aADYjb1vFONXliCGvfx+8s37To2li9nAhPaiWD6IOzxBHg0VuJw==
X-Received: by 2002:a05:600c:46ca:b0:3de:1588:bcee with SMTP id q10-20020a05600c46ca00b003de1588bceemr6347743wmo.13.1675349191766;
        Thu, 02 Feb 2023 06:46:31 -0800 (PST)
Received: from 1.. ([79.115.63.122])
        by smtp.gmail.com with ESMTPSA id i40-20020a05600c4b2800b003dc42d48defsm4687337wmp.6.2023.02.02.06.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 06:46:31 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] mtd: spi-nor: Sort headers alphabetically
Date: Thu,  2 Feb 2023 16:46:28 +0200
Message-Id: <20230202144628.14443-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=tudor.ambarus@linaro.org; h=from:subject; bh=0gGH7H0BhjnUjMUAb0C6utVrv4qHVqzlIDWKnNiDBLE=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBj28zE7R1LDrqHWCEpy8gJcsplwB0YFOUhAGW8t fMAyEFs3raJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCY9vMxAAKCRBLVU9HpY0U 6blPB/9faYjcDUu2AALLFjO6bnmDq6+ip+Bx1SnP+D0W8kwb6zvWT0O0UljDgIjkpfyXTNLYogK 9I1pFo6ef7Xtta3xhOQ7ZarQb/pYxRx4Q4mmg8yEHkJduxeiDnhsWDHD13MXnkKpGV4AUz283SO bUhkQPaXPMAxTSaaxWWk+a8V1sBhtn13A2OEjSs7PMolkBSiun0EklKsXakoVMGn1hblHmDHvzm dTjhwDWLZd2WotTf13PkimCVRFHAKdKTaYT66XzWcAqyvxPGV83eox5IUK8++wBx0pBXc2byxlz DPBcv9q3HBv21yZxNlMjIbXcRd7SE5yGWd1vrbAr8wCB2Dqq
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_064634_533430_DC2CC465 
X-CRM114-Status: GOOD (  10.25  )
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

Sort headers alphabetically - it helps locating duplicates, and makes it
easier to figure out where to insert new headers. Alphabetic order should
also prove that each header is self-contained, i.e. can be included without
prerequisites.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c    | 13 ++++++-------
 drivers/mtd/spi-nor/debugfs.c |  2 +-
 drivers/mtd/spi-nor/sfdp.c    |  2 +-
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b500655f7937..247d1014879a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -9,19 +9,18 @@
 
 #include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/module.h>
+#include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/mutex.h>
 #include <linux/math64.h>
-#include <linux/sizes.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
-
+#include <linux/module.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/spi-nor.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/sched/task_stack.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
 #include <linux/spi/flash.h>
-#include <linux/mtd/spi-nor.h>
 
 #include "core.h"
 
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index ff895f6758ea..845b78c7ecc7 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/debugfs.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
-#include <linux/debugfs.h>
 
 #include "core.h"
 
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 3acc01c3a900..fd4daf8fa5df 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -5,9 +5,9 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/mtd/spi-nor.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
-#include <linux/mtd/spi-nor.h>
 
 #include "core.h"
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
