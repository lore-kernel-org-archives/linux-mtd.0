Return-Path: <SRS0=I5Ka=MI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83517C12002
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 20:50:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C637613D8
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jul 2021 20:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C637613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mentor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6uGW3otHqw4QIIyCQ4T1VeQivvvTAnLamL+cN8izFUI=; b=ys6Z4EFbtI8uSU
	3Z5vJJ91yXnPC+a2STkdylhfuOvc2yZr+vTJ7J1nI5zQ4ASTXqkM8lIGRzerW6drMrocB3qPbjd/O
	BM0g1sDzYwDrcjcUy40zZrvgXbj9bQRiD83PQ9tnsQ3LUwwARJF3pevBeTuSiv8ocbBmvb13QW6j7
	5kT+gptHncwXv8XyQuySuK8ZRI+tJHMjzOJLRs+z8M7Pr7s7jfsUkwT/ZEyNT139ITJtS99u2eF/7
	w4cZECSQZsqSlQ7dY2jfIUmvBDxijF+TCNr0K1FVyYPTbpTcPmKpmiQUNOiKahYAfYqQfap+omIEG
	CCRWOVBYkUTg50KSTcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4UmR-005EiQ-Sb; Fri, 16 Jul 2021 20:49:55 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4UmO-005Eho-DO
 for linux-mtd@lists.infradead.org; Fri, 16 Jul 2021 20:49:54 +0000
IronPort-SDR: B3hKGZa10j3Y+J/hNFYrERQKl5ZD68r7V+1E3NJQANkID0gYdmlR9ir4BvJKD/l4OgBWOtRYeS
 2fKhywdNIQuX0IpUdW2bXJ3xvmiwdcSD2y9tAPE0loNKI/uESVaSNU8hyQ7EgjJdTRVaybL5hp
 el/Zld5C6YvcoFarVgqpcJnNpA9B0t05JKFUiZRtnfdDGNsn++bFxv8vNeQEh1fyI9PXb2M4rd
 goLQ06Uxd1p/9Xt2YCI1jRf9UlDpAC7lu8mJDzwtBvWWIIFqG9CQfvyF5mNkt5W3s+pGZY9nGZ
 0KrKR6KyE8XfO83Z3HVWlQuM
X-IronPort-AV: E=Sophos;i="5.84,245,1620720000"; d="scan'208";a="63615887"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa3.mentor.iphmx.com with ESMTP; 16 Jul 2021 12:49:49 -0800
IronPort-SDR: 0LTvEaGOpdPEEWRO6+30U5xaO2Sm4vp//3nOGRfD7A4rotBp9QK2ds7YuSLHQpbBflUPM7gJri
 YE+KevlY04a9vga5SFFby77GL9INzEzaGcm6APCnrX+SmjthJhRteGpYcIw7/hn/9zejxsLull
 mI8eD7blGpaZzUGCYxf63FYtPXyZ+yjwQiwo74Q6dDGgCTop31fOan+VoeBeIcUFhxrU/rjxGw
 PHqUjUA/dEQOgIAM+0BofCGSDHb80UeHuCNhC8iJxzmEVtFg3CatH+ueN5/gyabA2DLq/fYr4F
 uJk=
From: "George G. Davis" <george_davis@mentor.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "George G.
 Davis" <george_davis@mentor.com>, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "open list:HYPERBUS
 SUPPORT" <linux-mtd@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
CC: "George G. Davis" <davis.george@siemens.com>
Subject: [PATCH] mtd: hyperbus: rpc-if: fix bug in rpcif_hb_remove
Date: Fri, 16 Jul 2021 16:49:35 -0400
Message-ID: <20210716204935.25859-1-george_davis@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_134952_558800_A801BB7D 
X-CRM114-Status: GOOD (  11.36  )
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

From: "George G. Davis" <davis.george@siemens.com>

The following KASAN BUG is observed when testing the rpc-if driver on
rcar-gen3:

root@rcar-gen3:~# modprobe -r rpc-if
[  101.930146] ==================================================================
[  101.937408] BUG: KASAN: slab-out-of-bounds in __lock_acquire+0x518/0x25d0
[  101.944240] Read of size 8 at addr ffff0004c5be2750 by task modprobe/664
[  101.950959]
[  101.952466] CPU: 2 PID: 664 Comm: modprobe Not tainted 5.14.0-rc1-00342-g1a1464d7aa31 #1
[  101.960578] Hardware name: Renesas H3ULCB board based on r8a77951 (DT)
[  101.967120] Call trace:
[  101.969580]  dump_backtrace+0x0/0x2c0
[  101.973275]  show_stack+0x1c/0x30
[  101.976616]  dump_stack_lvl+0x9c/0xd8
[  101.980301]  print_address_description.constprop.0+0x74/0x2b8
[  101.986071]  kasan_report+0x1f4/0x26c
[  101.989757]  __asan_load8+0x98/0xd4
[  101.993266]  __lock_acquire+0x518/0x25d0
[  101.997215]  lock_acquire.part.0+0x18c/0x360
[  102.001506]  lock_acquire+0x74/0x90
[  102.005013]  _raw_spin_lock_irq+0x98/0x130
[  102.009131]  __pm_runtime_disable+0x30/0x210
[  102.013427]  rpcif_hb_remove+0x5c/0x70 [rpc_if]
[  102.018001]  platform_remove+0x40/0x80
[  102.021771]  __device_release_driver+0x234/0x350
[  102.026412]  driver_detach+0x158/0x20c
[  102.030179]  bus_remove_driver+0xa0/0x140
[  102.034212]  driver_unregister+0x48/0x80
[  102.038153]  platform_driver_unregister+0x18/0x24
[  102.042879]  rpcif_platform_driver_exit+0x1c/0x34 [rpc_if]
[  102.048400]  __arm64_sys_delete_module+0x210/0x310
[  102.053212]  invoke_syscall+0x60/0x190
[  102.056986]  el0_svc_common+0x12c/0x144
[  102.060844]  do_el0_svc+0x88/0xac
[  102.064181]  el0_svc+0x24/0x3c
[  102.067257]  el0t_64_sync_handler+0x1a8/0x1b0
[  102.071634]  el0t_64_sync+0x198/0x19c
[  102.075315]
[  102.076815] Allocated by task 628:
[  102.080781]
[  102.082280] Last potentially related work creation:
[  102.087524]
[  102.089022] The buggy address belongs to the object at ffff0004c5be2000
[  102.089022]  which belongs to the cache kmalloc-2k of size 2048
[  102.101555] The buggy address is located 1872 bytes inside of
[  102.101555]  2048-byte region [ffff0004c5be2000, ffff0004c5be2800)
[  102.113486] The buggy address belongs to the page:
[  102.118409]
[  102.119908] Memory state around the buggy address:
[  102.124711]  ffff0004c5be2600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  102.131947]  ffff0004c5be2680: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  102.139181] >ffff0004c5be2700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  102.146412]                                                  ^
[  102.152257]  ffff0004c5be2780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  102.159491]  ffff0004c5be2800: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  102.166723] ==================================================================

The above bug is caused by use of the wrong pointer in the
rpcif_disable_rpm() call. Fix the bug by using the correct pointer.

Fixes: e806241e03b7 ("mtd: hyperbus: add Renesas RPC-IF driver")
Signed-off-by: George G. Davis <davis.george@siemens.com>
---
 drivers/mtd/hyperbus/rpc-if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index ecb050ba95cd..2806024b50ac 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -150,9 +150,9 @@ static int rpcif_hb_remove(struct platform_device *pdev)
 {
 	struct rpcif_hyperbus *hyperbus = platform_get_drvdata(pdev);
 	int error = hyperbus_unregister_device(&hyperbus->hbdev);
-	struct rpcif *rpc = dev_get_drvdata(pdev->dev.parent);
 
-	rpcif_disable_rpm(rpc);
+	rpcif_disable_rpm(&hyperbus->rpc);
+
 	return error;
 }
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
