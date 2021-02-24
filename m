Return-Path: <SRS0=Oqae=H2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B5AC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 14:43:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30F1164E7A
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Feb 2021 14:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30F1164E7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8v1FauMXqPbKIlIyzT/6TKUwrqMxykydD3eobTNpymw=; b=AI2sG99FrY3OuTb7x5WWNb7z81
	+bgLNQR0X135CgBZUp+GyTF5zj7+CIPFaui5exxPQ+a8FLvc6GtRp73ff6JIINadqVVh5kZcpARiS
	/6w23xu9vOzmn3PZMQSNB9xquxNQMKrPK1AqQk8BekkfrPc46Q9MiB4macIUNhDXYZ/JXaVIEOoJF
	/xw5baXMXtnDYlv13/GomFPcdtF1CT1YM5kOJBp9rYOhoLJHrOUy3H9YYeD7gOASC4VV9YuriT2kS
	IbIhvaNcXdz/fLQm3/VwfObkyC2pGDsvVZdUsAy2w2c5e8mXOUwSEXxZxTa2ge2qhzw1uWAf2SP6y
	Pwf9BsgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEvNS-0004mU-HL; Wed, 24 Feb 2021 14:42:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEvNQ-0004lq-TI
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2021 14:42:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id u14so2141872wri.3
 for <linux-mtd@lists.infradead.org>; Wed, 24 Feb 2021 06:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Avv6ZnmbXhgqra1UyQEo1jRqhDV3UEf0fLOb0eDNvQ8=;
 b=xZoc3hBIVPJJapaC73bDrdlHYiWZTC8Gd5hvzDsj5M/0Gmhz+TXWHtcm5ek2a1poNV
 ufUQz4YRuGlHWn+djwpPnG9idrsPzvLehgF63M9vJvSXI8aVjU4M97Uy+pXPo2/Us43J
 pEqwK11wGB8W530jG5HXEptjsuh/Y36OJDe1Dmep04wvfMYezvrwLaQ0al88G8e6zgRU
 Vr7hrMVjWud3ibSLkxTEMDiQ1mDXzl2/mZCo16DovjoH1aOD0X5nL90um2wcxiB54xyo
 Pie/uMq/0ZQfO4BXsL8cSZaHcFK29gXfL5l267/39eAo19HMzGdVIRcyqugLzSAV4IhR
 YPuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Avv6ZnmbXhgqra1UyQEo1jRqhDV3UEf0fLOb0eDNvQ8=;
 b=FU+9CQkyV8PdLWq13/3fR5bQVgdzDaGXnrMkxlV+kbKyURyINw+pFEnYZPSYUFOfyk
 NDj8OqV19jp/yZI8dzhw+r0uFPSU9oKxUSrWdo/f6yYqYGPiYRVPa0Xq3rNPl5gUiBjy
 Ck1FgxUkLjDy2Pm4l5ai7bbqfc8py4FuA56caeoyTvHy5sSGhB99ErW849P69WM0Tuc/
 9p4PlKy5mGVqzCU3EU7tO5kC9MSaZ/jDQzJz5GkaoDH7b5Q26pCC8dAm1L7trptD77er
 qrSM/+Tu5AhJQ//hJnbLNbRKVB8nG9IFFRvT0RgYxwQjYCY6GuJ2YesYxNSxL/D7L4FG
 uHTQ==
X-Gm-Message-State: AOAM533XsXDJRPaWys79+Enoq31vO4vn/Ja4vqRZERaVcb+Fql9Kf9mK
 xVeIhtnAQH5OePZN1a5ioz1z1A==
X-Google-Smtp-Source: ABdhPJxWR8fKAlpBPJGDCmIXiINikw6KX+dWZWtvj338MuerAgimT6gWJKuutkrnfT/iEhLRwvQXkg==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr32219677wrr.26.1614177773751; 
 Wed, 24 Feb 2021 06:42:53 -0800 (PST)
Received: from localhost.localdomain
 (lns-bzn-59-82-252-157-252.adsl.proxad.net. [82.252.157.252])
 by smtp.gmail.com with ESMTPSA id p3sm4170669wro.55.2021.02.24.06.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 06:42:53 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: rafael@kernel.org,
	andriy.shevchenko@linux.intel.com
Subject: [PATCH v2 8/9] mtd/drivers/nand: Use HZ macros
Date: Wed, 24 Feb 2021 15:42:18 +0100
Message-Id: <20210224144222.23762-8-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224144222.23762-1-daniel.lezcano@linaro.org>
References: <20210224144222.23762-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_094257_087696_17A0959F 
X-CRM114-Status: GOOD (  14.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 "open list:NAND FLASH SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

HZ unit conversion macros are available in units.h, use them and
remove the duplicate definition.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index a304fda5d1fa..8d00191a4815 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -20,6 +20,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 #include <asm/unaligned.h>
 
 #define EBU_CLC			0x000
@@ -102,7 +103,6 @@
 
 #define MAX_CS	2
 
-#define HZ_PER_MHZ	1000000L
 #define USEC_PER_SEC	1000000L
 
 struct ebu_nand_cs {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
