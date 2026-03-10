Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D15EB1052
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 11:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xj0wjT7mKJqMppaqBS/uG8YY13ZV+I4uEhAnPtK9xS8=; b=0rbpxrdtrka0Wx
	mzZYBNCoXLiqzITzVH7hWOfHtoAp8jOg5gEhgESRuYF8f1++RrpPyNgSy6LhWRghyowdIScLnUKkQ
	SoVKVtCGjsibnYgsGkrN7tiE/JmfK7O3P68mUDw7V5ev3c00HdHXOQI6YDFv4P6mnx9e6NVu2cAIX
	6JJtnCwoafwdG13ennwXHxMWLgGH8fRcE4MyaviG5bA5I0yqqLqW4+hN3y7vgsfsqgxf6bfMBxfLO
	81OqorR9du+Q7UQ6duzSBA+DfwRBzT7jDQ2fEldJFy6whjk8asvLnLju/OzixdDCQh4HcPRhrJDxG
	CwbBApCXbaulmhS00Izw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvi5-00000009Mts-2E6V;
	Tue, 10 Mar 2026 11:57:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgf-00000009Kfn-2PKu;
	Tue, 10 Mar 2026 11:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1RQt94wsCFG7IJEQyvVRUl8nd2Z953/wokMRXtIM6bI=; b=H0Jn56P77NNw6KywfjvW5oHv2Y
	I0H6YYIMtUSPdYvtFBy89Sxjvl5H7c9PiTAYZcq1bBqZzMLxQhoEJJvfNPHMcQaXG+nXYejp/UoAw
	u270Us6cL+R2aqB6CSGsxzdEy13bvGH5dkqi0xkR8wHyUHrDIOo1HzqqR4gVGNQzS9ss5BUmXUiNY
	4uGxSIb14IAZwIYfBlTGzxPk9EkrJYpDCXIT+ayYQo24I0o4CA8FOo578JWEuFX7NuLUSFhO6Bo7Y
	bRv9gNwGl9u+q+0Rl9Wa+KE5QrdN2yP0nCCPvmhMQXV04DCJ5eyL3GWn/0Ql4vBGOhPkrdvPCUfea
	mw4udQoQ==;
Received: from mail.avm.de ([2001:bf0:244:244::94])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvgS-0000000EQ6k-3nIy;
	Tue, 10 Mar 2026 11:55:40 +0000
Received: from [2001:bf0:244:244::71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.55.2)
	(envelope-from <phahn-oss@avm.de>)
	id 69b006ad-e21d-7f0000032729-7f000001d9e2-1
	for <multiple-recipients>; Tue, 10 Mar 2026 12:55:25 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 10 Mar 2026 12:55:25 +0100 (CET)
From: Philipp Hahn <phahn-oss@avm.de>
Date: Tue, 10 Mar 2026 12:48:47 +0100
Subject: [PATCH 21/61] lib/test: Prefer IS_ERR_OR_NULL over manual NULL
 check
MIME-Version: 1.0
Message-Id: <20260310-b4-is_err_or_null-v1-21-bd63b656022d@avm.de>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
To: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com, 
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr, 
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev, 
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
 linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mm@kvack.org, 
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org, 
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev, 
 Philipp Hahn <phahn-oss@avm.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2236; i=phahn-oss@avm.de;
 h=from:subject:message-id; bh=dZgGx+TJ86HynJEVGMrEA5pIsLW37DebkwtATXmSHOI=;
 b=owEBbQGS/pANAwAKATQtBlPRrKzbAcsmYgBpsAYdDyn9P9EqiNuLjohkPV9X7iASajPgIoE/Y
 Nuv6AjHInyJATMEAAEKAB0WIQQ5bPBtrWDUcDQCppg0LQZT0ays2wUCabAGHQAKCRA0LQZT0ays
 2wT8B/9ExWKAo/Sn9Hy5RU9mMJnGJZfEhSDSh3BrEyzAo8askVVJ9+5gjVv5zubvVRZSl0xsWYD
 ONcBymLUypUnGPDyKoUOhx2btlwnIrxM+A/znjwtFfejlhgahBH8clBf9ppwmWxz+aomfSi8dH0
 gI3DmyyOVIa4OSRnV4I+RdKzJvI1/m5sEwA+61ywfL4pM19NmtFK9XOne0dvmugbwth+SSxAJRb
 vUziX2Dy0AcV+RxD3aCuKKv6tZLzJkBbkKbaQ16k0qyAZb3zbS92hAPdw+yFsGOJMaFjGgEs6OE
 FCCv3wHl+aKzbAwbrH/eK6sw740pLs96xx8NapXtmcrko8Wn
X-Developer-Key: i=phahn-oss@avm.de; a=openpgp;
 fpr=58AF7C2E007CDBE62C59E078F50EFDCF8AD04B1A
X-purgate-ID: 149429::1773143725-98670F2F-CE18AF23/0/0
X-purgate-type: clean
X-purgate-size: 2238
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_115533_706468_BCEDDCE1 
X-CRM114-Status: GOOD (  11.22  )
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

Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
check.

Change generated with coccinelle.

To: Andrew Morton <akpm@linux-foundation.org>
To: Luis Chamberlain <mcgrof@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
To: Daniel Gomez <da.gomez@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-modules@vger.kernel.org
Signed-off-by: Philipp Hahn <phahn-oss@avm.de>
---
 lib/test_firmware.c | 2 +-
 lib/test_kmod.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index b471d720879a70c0db82e605960abe69de28ab4b..fc3177927a02e2d7849915309048529395ece0f8 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -955,7 +955,7 @@ static ssize_t trigger_batched_requests_store(struct device *dev,
 		init_completion(&req->completion);
 		req->task = kthread_run(test_fw_run_batch_request, req,
 					     "%s-%u", KBUILD_MODNAME, req->idx);
-		if (!req->task || IS_ERR(req->task)) {
+		if (IS_ERR_OR_NULL(req->task)) {
 			pr_err("Setting up thread %u failed\n", req->idx);
 			req->task = NULL;
 			rc = -ENOMEM;
diff --git a/lib/test_kmod.c b/lib/test_kmod.c
index f0dd092860ea6f9c69a71e10cb1c8b071b1cd1b7..f44a181f6f1ab53cf95a0a0b598b88cb5f8f369d 100644
--- a/lib/test_kmod.c
+++ b/lib/test_kmod.c
@@ -327,7 +327,7 @@ static int try_one_request(struct kmod_test_device *test_dev, unsigned int idx)
 	info->task_sync = kthread_run(run_request, info, "%s-%u",
 				      KBUILD_MODNAME, idx);
 
-	if (!info->task_sync || IS_ERR(info->task_sync)) {
+	if (IS_ERR_OR_NULL(info->task_sync)) {
 		test_dev->test_is_oom = true;
 		dev_err(test_dev->dev, "Setting up thread %u failed\n", idx);
 		info->task_sync = NULL;
@@ -358,7 +358,7 @@ static void test_dev_kmod_stop_tests(struct kmod_test_device *test_dev)
 
 	for (i=0; i < config->num_threads; i++) {
 		info = &test_dev->info[i];
-		if (info->task_sync && !IS_ERR(info->task_sync)) {
+		if (!IS_ERR_OR_NULL(info->task_sync)) {
 			dev_info(test_dev->dev,
 				 "Stopping still-running thread %i\n", i);
 			kthread_stop(info->task_sync);

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
