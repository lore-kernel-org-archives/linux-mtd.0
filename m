Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5708EC3600B
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Mar 2025 16:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ubOf3cmHWcaldpvjYwONPJ/CSHfqKzrVc5/gNo6NLQ=; b=mZqonLyN0Ts0xv
	9UZXjzvexvIvMB7hSiifSqHnU2skiZ4dQGRTEXZkWX7jXCC0+XLt9mzigBWc9jRtqE8YssIIa1W+k
	8/GcFuwEhZMoj3Y+OpSC13/Jv/HZHokNz/sQD55O77iLefNWQ10yR5+FzoZWlmHFmLcIh65lNuUWa
	oqqg22mDsIIvkfAjlCQk+zf0ZAVMGKgxDjsfHd6ZrpCdCYKE6dS8D5BJhOBHiWv0NcIZM5OqYk3oz
	o6DfQVfToFnT62IfKA85STHODRsK2vMamEOhFgX14ZpmDOL6x4xvV9m0EyC1b0oIr0/B0y1S/25Ks
	MyXUHqZQYsiDLu6s0Pkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHo2-00000000wwK-1JSr;
	Mon, 31 Mar 2025 16:16:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHnx-00000000wua-3PXR
	for linux-mtd@lists.infradead.org;
	Mon, 31 Mar 2025 16:16:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-227b650504fso93309645ad.0
        for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2025 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743437764; x=1744042564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32bd+4WU1DygbAHbysKUy0FZhXcvnuwbKsO8ps8kv08=;
        b=bryXhndP/6VEFiJR+iIFzkptkkpRTBxvJx/roRvIHPZ3H9rH9oXEDPosKPXalXMDVR
         O+6OpOJdieMJCXGx3PhzCO9aTNB+JNGrFpoIi5LhEY8a3BXgalZFWtxfuCw/kOHUWLOn
         sJvRhwhnbs3+Cx03/zx/AcElg4osT7FCK7A9hXF5ZCOU8eA0OWplJY6ST7rEaSGkoFvL
         BotmwYj2nB42cdk6jo4v3yqO9E08DvNx5F6xuNfnliMHRfOcyCCeoy2u8Qwtf5cF/UuE
         XnSe2TQ/5BLn4SOhlMxGv+6vhjSOrZj1mvC7tAdyAtHEbFpds63ZSJia9WEIyW4ovw/I
         PB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437764; x=1744042564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32bd+4WU1DygbAHbysKUy0FZhXcvnuwbKsO8ps8kv08=;
        b=bOyskHiOkKkyJEhSx68ih3RC0d1veOsTbc0fg5lMdfV4cPU88an+0ds9XZf4ovWqqa
         NnIT81qR7As7T+ofimtbTHcAboAzOO7C98eCNO9WpcuaCMT0nKmPSklFzX1YW0ZoByai
         YNJE8jajERaABorMj3bR44TA8jiNk3yofBuo3ZZZfLA2DSA2g20cSr/CVv0d11FRXc0X
         QRSHzqhVgz5g49+yhwJ1J8hUK/2qULI6VxovRNMOgJLg5D7pwnX8rQWbO343245jDfAq
         nQAjvdXyRCXAT/pNvic1AAkQ2gFZAXu1U8l7DJUXlIq+oIKgYsUczxXZoHo8dKCiO32I
         5cHg==
X-Gm-Message-State: AOJu0YzbDC/bf2VFJFemY315owBGzp47tgq1E/XKR6B47/hxKyW5jXJ/
	nTh/aBpiK2OYuExc03viAouGdxbOO4nz3UxGVJew6C8G71Cm5GJ2
X-Gm-Gg: ASbGnctfGSMzuhfZyv3eYf0NFuUOncsU0bWd41HxBhcLoB3G4UvMH3ROkTO3n0mK1SS
	Sw7o9QixYFKigJKL6kHvKIgO30bE42FqVdxLy0aT3LtKCcRFh4KYfRaue0Xf6iTzFf28ZbVYNs4
	GYsUM8RIVdlNffYwuoK2f5jtXNvyzwFrBuFwlEI/FJu5/1yENCNEt9wk49ByfXubCtq1jsNaEsm
	GRUOcnxext/t5Tx1s1a3lIfsZ2iugHC2IkzDe5ckj5Tr0RXpsKdxQLvO03+2W+womyLJdlVsffv
	5uzDMfNx5Fry0+Fl+DY7O65mHL/CtSEVBPZgZrOkQdz/alJ7bl8=
X-Google-Smtp-Source: AGHT+IFq34IJqsQCFZdeoT9wP/Jnw+8SIAHV25r6mxakLM5VltpGIBIQxBHcz6Kp92UN6c5Ie0iZKg==
X-Received: by 2002:a17:902:ec85:b0:223:54e5:bf4b with SMTP id d9443c01a7336-2292f9736a3mr153317055ad.25.1743437763996;
        Mon, 31 Mar 2025 09:16:03 -0700 (PDT)
Received: from localhost ([147.11.105.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cec2fsm70872195ad.117.2025.03.31.09.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:16:03 -0700 (PDT)
From: Liwei Song <liwei.song.lsong@gmail.com>
To: MiquelRaynal <miquel.raynal@bootlin.com>,
	RichardWeinberger <richard@nod.at>,
	VigneshRaghavendra <vigneshr@ti.com>,
	TudorAmbarus <tudor.ambarus@linaro.org>,
	PratyushYadav <pratyush@kernel.org>,
	MichaelWalle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liwei.song.lsong@gmail.com
Subject: [PATCH v2] mtd: core: add sync between read/write and unbind device
Date: Tue,  1 Apr 2025 00:15:20 +0800
Message-ID: <20250331161542.3040005-1-liwei.song.lsong@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325133954.3699535-1-liwei.song.lsong@gmail.com>
References: <20250325133954.3699535-1-liwei.song.lsong@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_091605_858772_AA1F67DB 
X-CRM114-Status: GOOD (  23.50  )
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

When unbind mtd device or qspi controller with a high frequency
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

In this patch, register a spi bus notifier which will be called before
unbind process freeing device memory, add a new member mtd_event_remove
to block mtd open/read, then waiting for the running task to be finished,
after that, memory is safe to be free.

Signed-off-by: Liwei Song <liwei.song.lsong@gmail.com>
---

Hi Maintainer,

This is an improved patch compared with the original one:
(https://patchwork.ozlabs.org/project/linux-mtd/patch/20250325133954.3699535-1-liwei.song.lsong@gmail.com/),
This v2 patch move notifier to spi-nor to avoid crash other types of flash.
now this patch only aim at fixing nor-flash "bind/unbind while reading" calltrace,
but for other types of flash like nand also have this issue.

Thanks,
Liwei.

---
 drivers/mtd/mtdcore.c       |  3 +++
 drivers/mtd/spi-nor/core.c  | 46 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h     |  1 +
 include/linux/mtd/spi-nor.h |  1 +
 4 files changed, 51 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..a78044ee603e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1243,6 +1243,9 @@ int __get_mtd_device(struct mtd_info *mtd)
 	struct mtd_info *master = mtd_get_master(mtd);
 	int err;
 
+	if (master->mtd_event_remove)
+		return -ENODEV;
+
 	if (master->_get_device) {
 		err = master->_get_device(mtd);
 		if (err)
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 19eb98bd6821..ae879d445046 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -16,6 +16,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
@@ -44,6 +45,9 @@
 #define SPI_NOR_SRST_SLEEP_MIN 200
 #define SPI_NOR_SRST_SLEEP_MAX 400
 
+static int spi_nor_remove_notifier_call(struct notifier_block *nb,
+					unsigned long event, void *data);
+
 /**
  * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
  *			   extension type.
@@ -1191,6 +1195,9 @@ static int spi_nor_prep(struct spi_nor *nor)
 	if (nor->controller_ops && nor->controller_ops->prepare)
 		ret = nor->controller_ops->prepare(nor);
 
+	if (nor->mtd.mtd_event_remove)
+		return -ENODEV;
+
 	return ret;
 }
 
@@ -3649,6 +3656,11 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	if (ret)
 		return ret;
 
+	if (!nor->spi_nor_remove_nb.notifier_call) {
+		nor->spi_nor_remove_nb.notifier_call = spi_nor_remove_notifier_call;
+		bus_register_notifier(&spi_bus_type, &nor->spi_nor_remove_nb);
+	}
+
 	return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
 				   data ? data->nr_parts : 0);
 }
@@ -3659,6 +3671,9 @@ static int spi_nor_remove(struct spi_mem *spimem)
 
 	spi_nor_restore(nor);
 
+	bus_unregister_notifier(&spi_bus_type, &nor->spi_nor_remove_nb);
+	memset(&nor->spi_nor_remove_nb, 0, sizeof(nor->spi_nor_remove_nb));
+
 	/* Clean up MTD stuff. */
 	return mtd_device_unregister(&nor->mtd);
 }
@@ -3737,6 +3752,37 @@ static const struct of_device_id spi_nor_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, spi_nor_of_table);
 
+static int spi_nor_remove_notifier_call(struct notifier_block *nb,
+				    unsigned long event, void *data)
+{
+	struct device *dev = data;
+	struct spi_device *spi;
+	struct spi_mem *mem;
+	struct spi_nor *nor;
+
+	if (!of_match_device(spi_nor_of_table, dev))
+		return 0;
+
+	switch (event) {
+	case BUS_NOTIFY_DEL_DEVICE:
+	case BUS_NOTIFY_UNBIND_DRIVER:
+		spi = to_spi_device(dev);
+		mem = spi_get_drvdata(spi);
+		if (!mem)
+			return NOTIFY_DONE;
+		nor = spi_mem_get_drvdata(mem);
+
+		mutex_lock(&nor->lock);
+		nor->mtd.mtd_event_remove = true;
+		mutex_unlock(&nor->lock);
+		msleep(300);
+
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
 /*
  * REVISIT: many of these chips have deep power-down modes, which
  * should clearly be entered on suspend() to minimize power use.
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..134bfa6fcf76 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -290,6 +290,7 @@ struct mtd_info {
 	/* Kernel-only stuff starts here. */
 	const char *name;
 	int index;
+	bool mtd_event_remove;
 
 	/* OOB layout description */
 	const struct mtd_ooblayout_ops *ooblayout;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d..d176af8fe2f2 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -420,6 +420,7 @@ struct spi_nor {
 	} dirmap;
 
 	void *priv;
+	struct notifier_block spi_nor_remove_nb;
 };
 
 static inline void spi_nor_set_flash_node(struct spi_nor *nor,
-- 
2.40.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
