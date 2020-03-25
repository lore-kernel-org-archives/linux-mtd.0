Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3785C18E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 08:56:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A63DD20714
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 08:56:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fwSrw25h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A63DD20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allwinnertech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VdepWPNO3uUyNBO16+e8HYCCNFP9uEM+tEG54hU3RZw=; b=fwSrw25h/yDucWjRCszvVrssZ1
	Rda7tFdJplqvAzML4JDYKmR5Fg+4d7twFxY+3ZgZWs1rpQZQGT9L1lnmcxOE9OOUhqK2eTuBPz63N
	OzLclqKRAwwgORbkXag/gu6610yqKSwu4ttHcoFVvMDPZ2/DdSu6/lVQnAAvxfaF1dnZuKk+ef/zf
	ys4PvUa0nRIBU0+2J6IJU7zYOZacI2vmzxRmg3YTv5x8rValftWnC0tzaoTOoLbAJnVtVrdE+TJ2P
	0HeVjB1jL5zCHGgfjLhN78qYSHqgJItHfJGs7D75qYWwZ04bdCxup7y7tdiI/ngTQaLhhEBf+56uW
	5apqMYnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH1q3-0000q6-Or; Wed, 25 Mar 2020 08:56:39 +0000
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH1p3-0008Gz-KE
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 08:55:42 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0137709-0.000556379-0.985673;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03267; MF=liaoweixiong@allwinnertech.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.H50xpyL_1585126516; 
Received: from
 PC-liaoweixiong.allwinnertech.com(mailfrom:liaoweixiong@allwinnertech.com
 fp:SMTPD_---.H50xpyL_1585126516)
 by smtp.aliyun-inc.com(10.147.42.241);
 Wed, 25 Mar 2020 16:55:32 +0800
From: WeiXiong Liao <liaoweixiong@allwinnertech.com>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v3 07/11] Documentation: create document for pstore/blk
Date: Wed, 25 Mar 2020 16:55:02 +0800
Message-Id: <1585126506-18635-8-git-send-email-liaoweixiong@allwinnertech.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
References: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_015537_926076_7080B828 
X-CRM114-Status: GOOD (  22.74  )
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
Cc: WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Pstore/blk is a new back-end of pstore to dump oops/pmsg log to
block device.

The document, at Documentation/admin-guide/pstore-block.rst, tells us
how to use pstore/blk.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
---
 Documentation/admin-guide/pstore-block.rst | 223 +++++++++++++++++++++++++++++
 MAINTAINERS                                |   1 +
 fs/pstore/Kconfig                          |   2 +
 3 files changed, 226 insertions(+)
 create mode 100644 Documentation/admin-guide/pstore-block.rst

diff --git a/Documentation/admin-guide/pstore-block.rst b/Documentation/admin-guide/pstore-block.rst
new file mode 100644
index 000000000000..a96415eaaf24
--- /dev/null
+++ b/Documentation/admin-guide/pstore-block.rst
@@ -0,0 +1,223 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Pstore block oops/panic logger
+==============================
+
+Introduction
+------------
+
+Pstore block (pstore/blk) is an oops/panic logger that writes its logs to a
+block device before the system crashes. You can get these log files by
+mounting pstore filesystem like::
+
+    mount -t pstore pstore /sys/fs/pstore
+
+
+Pstore block concepts
+---------------------
+
+Pstore/blk provides efficient configuration method for pstore/blk, which
+divides all configurations into two parts, configurations for user and
+configurations for driver.
+
+Configurations for user determine how pstore/blk works, such as pmsg_size,
+oops_size and so on. All of them support both Kconfig and module parameters,
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
+        pstore_blk.blkdev=179:7 pstore_blk.oops_size=64
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
+oops_size
+~~~~~~~~~
+
+The chunk size in KB for oops/panic front-end. It **MUST** be a multiple of 4.
+It's optional if you do not care oops/panic log.
+
+There are multiple chunks for oops/panic front-end depending on the remaining
+space except other pstore front-ends.
+
+Pstore/blk will log to oops/panic chunks one by one, and always overwrite the
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
+dump_oops
+~~~~~~~~~
+
+Dumping both oopses and panics can be done by setting 1 (not zero) in the
+``dump_oops`` member while setting 0 in that variable dumps only the panics.
+
+Configurations for driver
+-------------------------
+
+Only a block device driver cares about these configurations. A block device
+driver uses ``psblk_register_blkdev`` to register to pstore/blk.
+
+.. kernel-doc:: fs/pstore/pstore_blk.c
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
+Pstore/blk supports psblk_blkdev_info(), which is defined in
+*linux/pstore_blk.h*, to get information of using block device, such as the
+device number, sector count and start sector of the whole disk.
+
+pstore block internals
+----------------------
+
+For developer reference, here are all the important structures and APIs:
+
+.. kernel-doc:: fs/pstore/pstore_zone.c
+   :internal:
+
+.. kernel-doc:: include/linux/pstore_zone.h
+   :internal:
+
+.. kernel-doc:: fs/pstore/pstore_blk.c
+   :export:
+
+.. kernel-doc:: include/linux/pstore_blk.h
+   :internal:
diff --git a/MAINTAINERS b/MAINTAINERS
index cc0a4a8ae06a..f553323b68c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13380,6 +13380,7 @@ F:	include/linux/pstore*
 F:	drivers/firmware/efi/efi-pstore.c
 F:	drivers/acpi/apei/erst.c
 F:	Documentation/admin-guide/ramoops.rst
+F:	Documentation/admin-guide/pstore-block.rst
 F:	Documentation/devicetree/bindings/reserved-memory/ramoops.txt
 K:	\b(pstore|ramoops)
 
diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index 55ce726be795..699f1925948f 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -171,6 +171,8 @@ config PSTORE_BLK
 	  This enables panic and oops message to be logged to a block dev
 	  where it can be read back at some later point.
 
+	  For more information, see Documentation/admin-guide/pstore-block.rst.
+
 	  If unsure, say N.
 
 config PSTORE_BLK_BLKDEV
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
