Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A705C38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:42:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D7BA20735
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jGlwtiYT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CoJqdpej"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D7BA20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jl+9dah3MpAzz6YRgUoTCxAfWP1nQHQpz2SVTNbKbng=; b=jGlwtiYTPGc0qV
	qRIbhZaScY/B5j6CVddl+zYs9306BvhZ/7EfoeTinL+y1GI3BKN0Gm5WvfUxHgdMNHB+o7DtYbi3y
	0SSGMPTp7reLKGq4VSJEMe/XehuI993E+V8DE973h6LtOV3l2AgnjFvTIZT0otc5ywce0QyYHU7KY
	w5OcbXiqDuuDivDhf5IOtIxLnCvQCdNaWJseZyxjmOBE8dPhyqCYr1nEBndhQiXtyQ9WQ/OHp13MG
	bSIVS3XJIG0gI/AC/pQ7PiRXQzMpgFhmWvvMENKv9cD6s4wVwnAwHJIysJ6ZJnUhyybcFHmkqKhv8
	U/LslvM2rdkfy2hDJZgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWwhr-0001K6-Ph; Fri, 08 May 2020 06:41:59 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWwgH-0008Go-1A
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 06:40:25 +0000
Received: by mail-pg1-x542.google.com with SMTP id o18so420115pgg.8
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2020 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sJlRynyKwM9ij0w1G/SUFSujroYzh7qofoVPnXi7QXw=;
 b=CoJqdpejuGbRhbTR7DFCSrHZHFcPl+FwL3vbBxur0o4WhpE9mDalHSJPz75AM9sDjx
 KAe1Hut8JX8GKQHkbeD0xQboPErdDruufe2t3+MQDaypnMpLlITrhHUVYLOGfCEOJQ+q
 Fy4XWj+O7D+qgmC0px4J8B7iQfje5ALsj+Qw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sJlRynyKwM9ij0w1G/SUFSujroYzh7qofoVPnXi7QXw=;
 b=fwZBi0uVbfkXA/yktL2ueUbeKx/zZreB5nEgK1RCzVnL0K8Tn0FMhw8YoEXduWCvYR
 w4Y4qWpTFqfHebzGnFQFwRsPW+kSS1I9DY8S65nv1oftICJ86aooNh/b3nmNxg83qz5V
 cN5Dby0NKaggSu6P9dqmS7ZqB6ce8eM4XQQnIAismc+LorGlE+NKeQv6Q5TrLbuoMA8R
 FZQejHdLC5tb3i01BvKtBTegf474PAY4x8nVyVFiNXvBppSQu5XgYB5KFPkWFJitEe/X
 6BcXbciyx0ToIcUtoE/lfmbR+6614dm2mVPa0lLOHD69cuFq6GkZP4+U5GsUifX8jkC4
 uIZA==
X-Gm-Message-State: AGi0Pub+divfgNmcZPwW0OEh0a1yzHZ4dmHZEHj2A2OTyLcqineAsmhn
 5OKCXVPE7MlH1w7ptFL7zek9oA==
X-Google-Smtp-Source: APiQypIQ5/MGNv6QMaQSPZPiL0/T+ZFEpx3t+4D9V190HUTunRl69M6qEvDs2OqGSgBr4GVFPxfNTg==
X-Received: by 2002:a63:e5a:: with SMTP id 26mr941796pgo.235.1588920019605;
 Thu, 07 May 2020 23:40:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a15sm1509305pju.3.2020.05.07.23.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:40:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v4 08/12] Documentation: Add details for pstore/blk
Date: Thu,  7 May 2020 23:40:00 -0700
Message-Id: <20200508064004.57898-9-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508064004.57898-1-keescook@chromium.org>
References: <20200508064004.57898-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_234021_180382_DF69EC32 
X-CRM114-Status: GOOD (  23.84  )
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org,
 Anton Vorontsov <anton@enomsg.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-mtd@lists.infradead.org, Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: WeiXiong Liao <liaoweixiong@allwinnertech.com>

Add details on using pstore/blk, the new backend of pstore to record
dumps to block devices, in Documentation/admin-guide/pstore-blk.rst

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-8-git-send-email-liaoweixiong@allwinnertech.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/admin-guide/pstore-blk.rst | 229 +++++++++++++++++++++++
 MAINTAINERS                              |   1 +
 fs/pstore/Kconfig                        |   2 +
 3 files changed, 232 insertions(+)
 create mode 100644 Documentation/admin-guide/pstore-blk.rst

diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
new file mode 100644
index 000000000000..484a1502fb49
--- /dev/null
+++ b/Documentation/admin-guide/pstore-blk.rst
@@ -0,0 +1,229 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+pstore block oops/panic logger
+==============================
+
+Introduction
+------------
+
+pstore block (pstore/blk) is an oops/panic logger that writes its logs to a
+block device before the system crashes. You can get these log files by
+mounting pstore filesystem like::
+
+    mount -t pstore pstore /sys/fs/pstore
+
+
+pstore block concepts
+---------------------
+
+pstore/blk provides efficient configuration method for pstore/blk, which
+divides all configurations into two parts, configurations for user and
+configurations for driver.
+
+Configurations for user determine how pstore/blk works, such as pmsg_size,
+kmsg_size and so on. All of them support both Kconfig and module parameters,
+but module parameters have priority over Kconfig.
+
+Configurations for driver are all about block device, such as total_size
+of block device and read/write operations.
+
+Configurations for user
+-----------------------
+
+All of these configurations support both Kconfig and module parameters, but
+module parameters have priority over Kconfig.
+
+Here is an example for module parameters::
+
+        pstore_blk.blkdev=179:7 pstore_blk.kmsg_size=64
+
+The detail of each configurations may be of interest to you.
+
+blkdev
+~~~~~~
+
+The block device to use. Most of the time, it is a partition of block device.
+It's required for pstore/blk.
+
+It accepts the following variants:
+
+1. <hex_major><hex_minor> device number in hexadecimal represents itself; no
+   leading 0x, for example b302.
+#. /dev/<disk_name> represents the device number of disk
+#. /dev/<disk_name><decimal> represents the device number of partition - device
+   number of disk plus the partition number
+#. /dev/<disk_name>p<decimal> - same as the above; this form is used when disk
+   name of partitioned disk ends with a digit.
+#. PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF represents the unique id of
+   a partition if the partition table provides it. The UUID may be either an
+   EFI/GPT UUID, or refer to an MSDOS partition using the format SSSSSSSS-PP,
+   where SSSSSSSS is a zero-filled hex representation of the 32-bit
+   "NT disk signature", and PP is a zero-filled hex representation of the
+   1-based partition number.
+#. PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in relation to a
+   partition with a known unique id.
+#. <major>:<minor> major and minor number of the device separated by a colon.
+
+kmsg_size
+~~~~~~~~~
+
+The chunk size in KB for oops/panic front-end. It **MUST** be a multiple of 4.
+It's optional if you do not care oops/panic log.
+
+There are multiple chunks for oops/panic front-end depending on the remaining
+space except other pstore front-ends.
+
+pstore/blk will log to oops/panic chunks one by one, and always overwrite the
+oldest chunk if there is no more free chunk.
+
+pmsg_size
+~~~~~~~~~
+
+The chunk size in KB for pmsg front-end. It **MUST** be a multiple of 4.
+It's optional if you do not care pmsg log.
+
+Unlike oops/panic front-end, there is only one chunk for pmsg front-end.
+
+Pmsg is a user space accessible pstore object. Writes to */dev/pmsg0* are
+appended to the chunk. On reboot the contents are available in
+*/sys/fs/pstore/pmsg-pstore-blk-0*.
+
+console_size
+~~~~~~~~~~~~
+
+The chunk size in KB for console front-end.  It **MUST** be a multiple of 4.
+It's optional if you do not care console log.
+
+Similar to pmsg front-end, there is only one chunk for console front-end.
+
+All log of console will be appended to the chunk. On reboot the contents are
+available in */sys/fs/pstore/console-pstore-blk-0*.
+
+ftrace_size
+~~~~~~~~~~~
+
+The chunk size in KB for ftrace front-end. It **MUST** be a multiple of 4.
+It's optional if you do not care console log.
+
+Similar to oops front-end, there are multiple chunks for ftrace front-end
+depending on the count of cpu processors. Each chunk size is equal to
+ftrace_size / processors_count.
+
+All log of ftrace will be appended to the chunk. On reboot the contents are
+combined and available in */sys/fs/pstore/ftrace-pstore-blk-0*.
+
+Persistent function tracing might be useful for debugging software or hardware
+related hangs. Here is an example of usage::
+
+ # mount -t pstore pstore /sys/fs/pstore
+ # mount -t debugfs debugfs /sys/kernel/debug/
+ # echo 1 > /sys/kernel/debug/pstore/record_ftrace
+ # reboot -f
+ [...]
+ # mount -t pstore pstore /sys/fs/pstore
+ # tail /sys/fs/pstore/ftrace-pstore-blk-0
+ CPU:0 ts:5914676 c0063828  c0063b94  call_cpuidle <- cpu_startup_entry+0x1b8/0x1e0
+ CPU:0 ts:5914678 c039ecdc  c006385c  cpuidle_enter_state <- call_cpuidle+0x44/0x48
+ CPU:0 ts:5914680 c039e9a0  c039ecf0  cpuidle_enter_freeze <- cpuidle_enter_state+0x304/0x314
+ CPU:0 ts:5914681 c0063870  c039ea30  sched_idle_set_state <- cpuidle_enter_state+0x44/0x314
+ CPU:1 ts:5916720 c0160f59  c015ee04  kernfs_unmap_bin_file <- __kernfs_remove+0x140/0x204
+ CPU:1 ts:5916721 c05ca625  c015ee0c  __mutex_lock_slowpath <- __kernfs_remove+0x148/0x204
+ CPU:1 ts:5916723 c05c813d  c05ca630  yield_to <- __mutex_lock_slowpath+0x314/0x358
+ CPU:1 ts:5916724 c05ca2d1  c05ca638  __ww_mutex_lock <- __mutex_lock_slowpath+0x31c/0x358
+
+max_reason
+~~~~~~~~~~
+
+Limiting which kinds of kmsg dumps are stored can be controlled via
+the ``max_reason`` value, as defined in include/linux/kmsg_dump.h's
+``enum kmsg_dump_reason``. For example, to store both Oopses and Panics,
+``max_reason`` should be set to 2 (KMSG_DUMP_OOPS), to store only Panics
+``max_reason`` should be set to 1 (KMSG_DUMP_PANIC). Setting this to 0
+(KMSG_DUMP_UNDEF), means the reason filtering will be controlled by the
+``printk.always_kmsg_dump`` boot param: if unset, it'll be KMSG_DUMP_OOPS,
+otherwise KMSG_DUMP_MAX.
+
+Configurations for driver
+-------------------------
+
+Only a block device driver cares about these configurations. A block device
+driver uses ``psblk_register_blkdev`` to register to pstore/blk.
+
+.. kernel-doc:: fs/pstore/blk.c
+   :identifiers: psblk_register_blkdev
+
+Compression and header
+----------------------
+
+Block device is large enough for uncompressed oops data. Actually we do not
+recommend data compression because pstore/blk will insert some information into
+the first line of oops/panic data. For example::
+
+        Panic: Total 16 times
+
+It means that it's OOPS|Panic for the 16th time since the first booting.
+Sometimes the number of occurrences of oops|panic since the first booting is
+important to judge whether the system is stable.
+
+The following line is inserted by pstore filesystem. For example::
+
+        Oops#2 Part1
+
+It means that it's OOPS for the 2nd time on the last boot.
+
+Reading the data
+----------------
+
+The dump data can be read from the pstore filesystem. The format for these
+files is ``dmesg-pstore-blk-[N]`` for oops/panic front-end,
+``pmsg-pstore-blk-0`` for pmsg front-end and so on.  The timestamp of the
+dump file records the trigger time. To delete a stored record from block
+device, simply unlink the respective pstore file.
+
+Attentions in panic read/write APIs
+-----------------------------------
+
+If on panic, the kernel is not going to run for much longer, the tasks will not
+be scheduled and most kernel resources will be out of service. It
+looks like a single-threaded program running on a single-core computer.
+
+The following points require special attention for panic read/write APIs:
+
+1. Can **NOT** allocate any memory.
+   If you need memory, just allocate while the block driver is initializing
+   rather than waiting until the panic.
+#. Must be polled, **NOT** interrupt driven.
+   No task schedule any more. The block driver should delay to ensure the write
+   succeeds, but NOT sleep.
+#. Can **NOT** take any lock.
+   There is no other task, nor any shared resource; you are safe to break all
+   locks.
+#. Just use CPU to transfer.
+   Do not use DMA to transfer unless you are sure that DMA will not keep lock.
+#. Control registers directly.
+   Please control registers directly rather than use Linux kernel resources.
+   Do I/O map while initializing rather than wait until a panic occurs.
+#. Reset your block device and controller if necessary.
+   If you are not sure of the state of your block device and controller when
+   a panic occurs, you are safe to stop and reset them.
+
+pstore/blk supports psblk_blkdev_info(), which is defined in
+*linux/pstore_blk.h*, to get information of using block device, such as the
+device number, sector count and start sector of the whole disk.
+
+pstore block internals
+----------------------
+
+For developer reference, here are all the important structures and APIs:
+
+.. kernel-doc:: fs/pstore/zone.c
+   :internal:
+
+.. kernel-doc:: include/linux/pstore_zone.h
+   :internal:
+
+.. kernel-doc:: fs/pstore/blk.c
+   :export:
+
+.. kernel-doc:: include/linux/pstore_blk.h
+   :internal:
diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..9c1f4feff418 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13660,6 +13660,7 @@ M:	Tony Luck <tony.luck@intel.com>
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
 F:	Documentation/admin-guide/ramoops.rst
+F:	Documentation/admin-guide/pstore-blk.rst
 F:	Documentation/devicetree/bindings/reserved-memory/ramoops.txt
 F:	drivers/acpi/apei/erst.c
 F:	drivers/firmware/efi/efi-pstore.c
diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index 16a0440d8d5a..8371d29651a6 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -171,6 +171,8 @@ config PSTORE_BLK
 	  This enables panic and oops message to be logged to a block dev
 	  where it can be read back at some later point.
 
+	  For more information, see Documentation/admin-guide/pstore-blk.rst
+
 	  If unsure, say N.
 
 config PSTORE_BLK_BLKDEV
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
