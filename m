Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A28FC4320E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 09:09:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E1C761054
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 09:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E1C761054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cVGt08JbSP1e396vOm+9i9KAI2JoEQh77GQ/FFL9hWo=; b=2sLRqS1nOTGpjc
	ck4r6w5IhlHEosdTkT/E8s+q7Yi3W4oTSdsPRzAE496GxCBMNtLoQQZYIs+//4PR0zTKoOLE7gWc3
	FAVONeM8PaF/922OnA7V+EJz0ApRloYb5c7suQ8r/Qk3Tw89LVIkXrzI9A52PbkRCiLwFw6/siTLI
	TDASb3S88+Gw7uWtgamOhqcfh74GCx7OLbJnZQ2Znv5VgxK5hflPbnJW7198bswmz7Pb4vrESNbwB
	QPOwHhIkw52OKbBp9DZm+WX8B5ssXJ/zFjl9z1q/8mbB9J+EFX4QKqlvh3nEF63FaxRSBWddnZ7wV
	jVPTOZ98r67hSuykutJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLMEG-004m8P-TL; Wed, 01 Sep 2021 09:08:21 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLiA-004b5Z-Fy
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 08:35:14 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 4BC3C440F5F;
 Wed,  1 Sep 2021 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1630485302; bh=IrFgfhIfMtYxjCmgturAExJe7UDGUvUwMIkPGhYH5o0=;
 h=From:To:Cc:Subject:Date;
 b=Yy8YTNeC7q1OmsyX4zkFnJRAuSZY1GDWU7P4DSRfXT7ihT2vQstfDsXZilY7EFglA
 K54Kd2v3AfT5ODifASS5NKQD1PhEGkov5yoVvMYMeZreVhOg80ZfdsbqjsIRgbbjTt
 N4ERFczGw4uGULKeCaXk5xaE1g/aeKs8rcslCJlYEFcS11b5+dDDaaJFxKv/CNKT19
 78MT6sx/+yN/izxHjZ3CnThtsw8aLGhKIroH8G7n5mIKCuaJCuENpNjOzUT85afOi8
 bWwKowOaiGE2lswTSyvVoKwZ/vDA4ezUFLrMKGpI5tsMcQHHokMyF2OcFjPg1hvRqt
 +ja43jaiJKPQA==
From: Sean Nyekjaer <sean@geanix.com>
To: miquel.raynal@bootlin.com, s.hauer@pengutronix.de, richard@nod.at,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, len.brown@intel.com
Cc: Sean Nyekjaer <sean@geanix.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] PM / suspend: move userspace freeze before disk sync
Date: Wed,  1 Sep 2021 10:34:42 +0200
Message-Id: <20210901083442.210230-1-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_013510_751177_6A745F61 
X-CRM114-Status: GOOD (  11.79  )
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

This fixes an issue where data remains unwritten before suspend.
UBI tried to write data, before the mtd device had been unsuspended.

Seen on an iMX6ULL board fitted with rawnand flash.

Before:
PM: suspend entry (deep)
Filesystems sync: 0.088 seconds
Freezing user space processes ... (elapsed 0.000 seconds) done.
OOM killer disabled.
Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
printk: Suspending console(s) (use no_console_suspend to debug)
PM: suspend devices took 0.030 seconds
Disabling non-boot CPUs ...
ubi0 error: ubi_io_write: error -16 while writing 4096 bytes to PEB 1762:94208, written 0 bytes

After:
PM: suspend entry (deep)
Freezing user space processes ... (elapsed 0.001 seconds) done.
OOM killer disabled.
Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
Filesystems sync: 0.060 seconds
printk: Suspending console(s) (use no_console_suspend to debug)
PM: suspend devices took 0.040 seconds
Disabling non-boot CPUs ...
PM: resume devices took 0.100 seconds

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---

Some explanation/discussion here:
http://lists.infradead.org/pipermail/linux-mtd/2021-July/087390.html

 kernel/power/suspend.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
index 87331565e505..4ee3fcbb0e7a 100644
--- a/kernel/power/suspend.c
+++ b/kernel/power/suspend.c
@@ -562,6 +562,12 @@ static int enter_state(suspend_state_t state)
 	if (state == PM_SUSPEND_TO_IDLE)
 		s2idle_begin();
 
+	pm_pr_dbg("Preparing system for sleep (%s)\n", mem_sleep_labels[state]);
+	pm_suspend_clear_flags();
+	error = suspend_prepare(state);
+	if (error)
+		goto Unlock;
+
 #ifndef CONFIG_SUSPEND_SKIP_SYNC
 	trace_suspend_resume(TPS("sync_filesystems"), 0, true);
 	pr_info("Syncing filesystems ... ");
@@ -570,12 +576,6 @@ static int enter_state(suspend_state_t state)
 	trace_suspend_resume(TPS("sync_filesystems"), 0, false);
 #endif
 
-	pm_pr_dbg("Preparing system for sleep (%s)\n", mem_sleep_labels[state]);
-	pm_suspend_clear_flags();
-	error = suspend_prepare(state);
-	if (error)
-		goto Unlock;
-
 	if (suspend_test(TEST_FREEZER))
 		goto Finish;
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
