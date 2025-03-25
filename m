Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EC6C35FFC
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Mar 2025 13:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X36DcXbZcVx+f9zWfiJFvqaDith+Pn3Jp6igDK/qwEU=; b=z+zf8EeVKQs7xD
	xLlimK5A7vKKRBsZmwo9b7Oy8lL+ewk/FSvAF3w9ls8+5JVd25XXtrY12q08hOUcz7+RaC3BRAMQn
	d+t1EL4w6jIEc++Md59HaEs9oc+gi6ZGpLXZ0Q9JeP5/E6GsazqoWn0pNPEVdi1PLlY/ezM3ZvQDL
	ueUkH3XE0bfwvLa5qynLtfAek+To9X2ox8jTkFafp13UKPmq/gApN4dfXTgQ/x9U7Prl+v7tVcakb
	5Vrxd4/lil7Dj5S542eiY+oJakykiCQkOa0TqVr1znGY7N6a/KUQm4U/ybQ5p8DtYFZlZl/qaiBaj
	PngJweR9QHmfK6ulgYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4jL-0000000673V-2T1q;
	Tue, 25 Mar 2025 13:54:11 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4Vd-000000063qv-3lpd
	for linux-mtd@lists.infradead.org;
	Tue, 25 Mar 2025 13:40:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2260c915749so74154005ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2025 06:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742910001; x=1743514801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7KyW+xgbNLxpFA5rGlR0S7Pnfhh1eWTcPlYyA5iw4I=;
        b=Euaq3k2/s2ue+n/6GE9s2sf6zudlJdsZJmfHoKK9CVtszkUpjNpddswTrxP0GNJ2iS
         T9UB9FzjFAtcXIdPasuPgZenwTrsnctO0mt2cHKi91WSxAh4NJPIkc2T6GjpZD2fWpA9
         oNZ9xYf5IB00kal+Psb3128iwvfwcLimYykM9YfCE5y+28via5OqAPy0Cps59k5QxmvF
         HngpfTwC4+AgH9KXzIiwx4rXAfsq1BhObbrRH+TyeEAi+7lCYgL70+G0i4ehwzp/Ha0b
         pk0fpvVgG+HXRrbpp+MfW6MOw6PyjR8Fp02LpMLrPcJ6QJFPWQh3hefjaIBlyh1imxNF
         Oaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742910001; x=1743514801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7KyW+xgbNLxpFA5rGlR0S7Pnfhh1eWTcPlYyA5iw4I=;
        b=SyfaNlcmXx3FlSxzQdoiTHoQFr+fov0qUQYc/Bc4YAm8gxH81vKTwIx/pSOeNiqXn+
         oFvUE2pLFJkKJ+dlxPx6stJv789JWgyAbv0Su060OIX2AJitXMWSQm52YqyjVU+7JYLk
         QSW818S+GlPp84FJRKqQ8BNdcqmdjaWfTmJNoYwQZD/gYXbJ53E3R+S1WN9Ym8L5bvyy
         osXqWDRoS7WBHuOo+6ZVFqbFeuoR8Wv80g+QcV7tDwaLNMkzTLAi67RlOJDvlxl9CDvg
         Q34t2tlh8Tq4/8mrfgygWSOeSBgjCciqhQoxuZbInwLzV/pOf7OFLapurOOosbQ69+CC
         jiyg==
X-Gm-Message-State: AOJu0YxcnPfsiPk5qOIgbN88etDxvLIZk/lS4yegTxjila2WJ9bk7XU6
	Ur+FwaCvPS99giBvxJoB7O0/fDxdTRlMH/jvuGjli+0VU9HgCBRH
X-Gm-Gg: ASbGncsh/yhlFvPTcBZXrYNkJ8vJi1TOqvLgTJrNgfA/wf23RrMFE6S6ERpOO7vUkp0
	mdOaCeY5Xz+UijiRVueQZDecZqm2hzN/CxIDQr/5Xj0im1nhKWqzEDYrozacTrMZtr49YaSy6gL
	BMlSwbL/sQArV62T8JfC3jy28hGKUpW6i8Qj0iNZGhUxU4yb7a3Vj22AUE0kXoEh958c7KGrzBp
	qQXx0p9EDmPFnVwqsOPllPk+hd6k7QFmxA901j1uhEVORKn68AMwVb9GJDP2ntxBnRSez+9N2oY
	u9CpSI4fpk5dP9RKpDKNtTDqC8jp5QoKsQloM1xrS8PUcEZz7BA=
X-Google-Smtp-Source: AGHT+IHvVrvPTJwd0z4OCcD5xwNgUnMEn+Ser2wZNJvtcUuuwq6dAQ+8wvnkPBi/iVdn3KIckQ1WoA==
X-Received: by 2002:a17:903:283:b0:224:1e7a:43fe with SMTP id d9443c01a7336-22780e2a566mr231323245ad.46.1742910000734;
        Tue, 25 Mar 2025 06:40:00 -0700 (PDT)
Received: from localhost ([147.11.105.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227e452ec63sm13133435ad.192.2025.03.25.06.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 06:40:00 -0700 (PDT)
From: Liwei Song <liwei.song.lsong@gmail.com>
To: MiquelRaynal <miquel.raynal@bootlin.com>,
	RichardWeinberger <richard@nod.at>,
	VigneshRaghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liwei.song.lsong@gmail.com
Subject: [PATCH] mtd: core: add sync between read/write and unbind device
Date: Tue, 25 Mar 2025 21:39:52 +0800
Message-ID: <20250325133954.3699535-1-liwei.song.lsong@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_064001_942105_5BA8DE77 
X-CRM114-Status: GOOD (  19.51  )
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

When unbinding mtd device or qspi controller with a high frequency
reading to /dev/mtd0 device, there will be Calltrace as below:

$ while true; do cat /dev/mtd0 >/dev/null; done &
$ echo ff8d2000.spi  > /sys/bus/platform/drivers/cadence-qspi/unbind

Internal error: synchronous external abort: 0000000096000210 [#1] PREEMPT SMP
Modules linked in:
CPU: 3 UID: 0 PID: 466 Comm: cat Not tainted 6.14.0-rc7-yocto-standard+ #1
Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
pc : cqspi_indirect_read_execute.isra.0+0x188/0x330
lr : cqspi_indirect_read_execute.isra.0+0x21c/0x330
Call trace:
 cqspi_indirect_read_execute.isra.0+0x188/0x330 (P)
 cqspi_exec_mem_op+0x8bc/0xe40
 spi_mem_exec_op+0x3e0/0x478
 spi_mem_no_dirmap_read+0xa8/0xc8
 spi_mem_dirmap_read+0xdc/0x150
 spi_nor_read_data+0x120/0x198
 spi_nor_read+0xf0/0x280
 mtd_read_oob_std+0x80/0x98
 mtd_read_oob+0x9c/0x168
 mtd_read+0x6c/0xd8
 mtdchar_read+0xdc/0x288
 vfs_read+0xc8/0x2f8
 ksys_read+0x70/0x110
 __arm64_sys_read+0x24/0x38
 invoke_syscall+0x5c/0x130
 el0_svc_common.constprop.0+0x48/0xf8
 do_el0_svc+0x28/0x40
 el0_svc+0x30/0xd0
 el0t_64_sync_handler+0x144/0x168
 el0t_64_sync+0x198/0x1a0
Code: 927e7442 aa1a03e0 8b020342 d503201f (b9400321)
---[ end trace 0000000000000000 ]---

Or:
$ while true; do cat /dev/mtd0 >/dev/null; done &
$ echo spi0.0 > /sys/class/mtd/mtd0/device/driver/unbind

Unable to handle kernel paging request at virtual address 00000000000012e8
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 2 UID: 0 PID: 459 Comm: cat Not tainted 6.14.0-rc7-yocto-standard+ #1
Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : spi_mem_exec_op+0x3e8/0x478
lr : spi_mem_exec_op+0x3e0/0x478
Call trace:
 spi_mem_exec_op+0x3e8/0x478 (P)
 spi_mem_no_dirmap_read+0xa8/0xc8
 spi_mem_dirmap_read+0xdc/0x150
 spi_nor_read_data+0x120/0x198
 spi_nor_read+0xf0/0x280
 mtd_read_oob_std+0x80/0x98
 mtd_read_oob+0x9c/0x168
 mtd_read+0x6c/0xd8
 mtdchar_read+0xdc/0x288
 vfs_read+0xc8/0x2f8
 ksys_read+0x70/0x110
 __arm64_sys_read+0x24/0x38
 invoke_syscall+0x5c/0x130
 el0_svc_common.constprop.0+0x48/0xf8
 do_el0_svc+0x28/0x40
 el0_svc+0x30/0xd0
 el0t_64_sync_handler+0x144/0x168
 el0t_64_sync+0x198/0x1a0
Code: f9400842 d63f0040 2a0003f4 f94002a1 (f9417437)
---[ end trace 0000000000000000 ]---

when unbind is running, the memory allocated to qspi controller and
mtd device is freed during unbinding, but open/close and reading device
are still running, if the reading process get read lock and start
excuting, there will be above illegal memory access. This issue also
can be repruduced on many other platforms like ls1046 and nxpimx8 which
have qspi flash.

In this patch, register a spi bus notifier which will called before
unbind process free device memory, and add a new member mtd_event_remove
to block mtd open/read, then wait for the running task to be finished,
then free memory is safe to be run.

Signed-off-by: Liwei Song <liwei.song.lsong@gmail.com>
---
 drivers/mtd/mtdcore.c   | 57 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |  2 ++
 2 files changed, 59 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..d35c2ecd5d11 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -34,6 +34,10 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+#include <linux/mtd/spi-nor.h>
+#include <linux/delay.h>
 
 #include "mtdcore.h"
 
@@ -422,6 +426,48 @@ static int mtd_reboot_notifier(struct notifier_block *n, unsigned long state,
 	return NOTIFY_DONE;
 }
 
+static int mtd_remove_notifier_call(struct notifier_block *nb,
+				    unsigned long event, void *data)
+{
+	struct device *dev = data;
+	struct spi_device *spi = to_spi_device(dev);
+	struct spi_mem *mem = spi_get_drvdata(spi);
+	struct spi_nor *nor = mem->drvpriv;
+	struct mtd_info *master = &nor->mtd;
+	struct mtd_info *child, *next;
+	int ret;
+	bool removed;
+
+	switch (event) {
+	case BUS_NOTIFY_BOUND_DRIVER:
+		master->mtd_event_remove = false;
+		break;
+	case BUS_NOTIFY_DEL_DEVICE:
+	case BUS_NOTIFY_UNBIND_DRIVER:
+		mutex_lock(&mtd_table_mutex);
+		master->mtd_event_remove = true;
+		mutex_unlock(&mtd_table_mutex);
+
+		while (1) {
+			removed = true;
+			list_for_each_entry_safe(child, next, &master->partitions, part.node) {
+				mutex_lock(&mtd_table_mutex);
+				ret = kref_read(&child->refcnt);
+				if (ret > 1)
+					removed = false;
+				mutex_unlock(&mtd_table_mutex);
+			}
+			msleep(500);
+			if (removed)
+				break;
+		}
+
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
 /**
  * mtd_wunit_to_pairing_info - get pairing information of a wunit
  * @mtd: pointer to new MTD device info structure
@@ -1099,6 +1145,11 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		register_reboot_notifier(&mtd->reboot_notifier);
 	}
 
+	if (!mtd->mtd_remove_nb.notifier_call) {
+		mtd->mtd_remove_nb.notifier_call = mtd_remove_notifier_call;
+		bus_register_notifier(&spi_bus_type, &mtd->mtd_remove_nb);
+	}
+
 out:
 	if (ret) {
 		nvmem_unregister(mtd->otp_user_nvmem);
@@ -1127,6 +1178,9 @@ int mtd_device_unregister(struct mtd_info *master)
 		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
 	}
 
+	bus_unregister_notifier(&spi_bus_type, &master->mtd_remove_nb);
+	memset(&master->mtd_remove_nb, 0, sizeof(master->mtd_remove_nb));
+
 	nvmem_unregister(master->otp_user_nvmem);
 	nvmem_unregister(master->otp_factory_nvmem);
 
@@ -1243,6 +1297,9 @@ int __get_mtd_device(struct mtd_info *mtd)
 	struct mtd_info *master = mtd_get_master(mtd);
 	int err;
 
+	if (master->mtd_event_remove)
+		return -ENODEV;
+
 	if (master->_get_device) {
 		err = master->_get_device(mtd);
 		if (err)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..74a17eb207ad 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -290,6 +290,7 @@ struct mtd_info {
 	/* Kernel-only stuff starts here. */
 	const char *name;
 	int index;
+	bool mtd_event_remove;
 
 	/* OOB layout description */
 	const struct mtd_ooblayout_ops *ooblayout;
@@ -369,6 +370,7 @@ struct mtd_info {
 	bool oops_panic_write;
 
 	struct notifier_block reboot_notifier;  /* default mode before reboot */
+	struct notifier_block mtd_remove_nb;
 
 	/* ECC status information */
 	struct mtd_ecc_stats ecc_stats;
-- 
2.40.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
