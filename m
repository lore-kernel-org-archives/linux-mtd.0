Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C973BCD3446
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwOgf2cr731/Zt2c7UhJN9v9RDh0h5sYiOZGAQzFTqk=; b=HKPd5hxXc201GY
	7yaeBXlU/km5PEXHL8nNSMFfYbKGyOFzwQc6qIUiyWgWdn3n52pPLvgbXRDgSd2SyMnJ0L0hOUV/D
	ySQtE20KsgTqYgHPrmCfjwf7tq2xhtb0TxIxw8wTocdWBQeNVun7fXaOs+LoeekEsn4f0q1D6sHO4
	6EElsz7XFlNPtAs7CxlkaoYjPv+j8LXiRgS0kYJWgFcjLGd3i/uQZNRUn1c57TU1V2khf3AMGwMbu
	364VEYhvVMspUpcdOgntN+dAGnsnjqZKSgPt24gmT297Ev0uZwKZLGsiyY1d5qKdA87yNwseUFRRX
	K90g30Feolzyi9h1nILw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1st-00000004NY4-1tDP;
	Thu, 07 May 2026 16:47:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1sr-00000004NTd-1NER
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 16:47:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 86818C5DC60;
	Thu,  7 May 2026 16:48:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBAD4605CF;
	Thu,  7 May 2026 16:47:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7880A108194E4;
	Thu,  7 May 2026 18:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vA9icDvy306xR1K0kstfOr9lQ8ml0UsecMyKCH6123E=;
	b=sSJSM5CIVUqsQmJyHSjIkwVY1iX+Hb6ixlo1qEYgw1Fax9vw+DsYRjbXKgvvWouhm7iviY
	APYKq+AFbFz0FaGLsV7wqkZh1daxWLmwCE59yquiGgxGFKIjHWlDziu+LnJqE6QwXi7tr0
	Imc0fMQug8rXb90fs5DehToANzrc6kR/tILsM9tMkhmNH6nSpTGsZU/2qSThVOyfV+sP1I
	ntOPEVN3ngcxcfYmA5o5UTU495r7UCqDtqmzTtwMpPYn04mI2n1baRT/P80pocvFHPUTWQ
	hbfWWGOb+dY4NwnuSY7MMF/9dL1jX86TbV2lpHO+nRcPY2ajx7c4jSuRVUmjPA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:47:01 +0200
Subject: [PATCH v5 20/28] mtd: spi-nor: Add steps for testing locking
 support
MIME-Version: 1.0
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-20-93453e1a9597@bootlin.com>
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_094733_662827_26CEC9FE 
X-CRM114-Status: GOOD (  15.10  )
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

As recently raised on the mailing list, it may be useful to propose a
list of steps to go through in order to proove the devices have been
described correctly, especially since all the block protection
information is not stored in any kind of table and is instead filled
manually by developpers.

Use the debugfs output to ease the comparison between expectations and
reality.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/driver-api/mtd/spi-nor.rst | 132 +++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 148fa4288760..b42de32c6eba 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -203,3 +203,135 @@ section, after the ``---`` marker.
     mtd.writesize = 1
     mtd.oobsize = 0
     regions = 0
+
+5) If your flash supports locking, please go through the following test
+   procedure to make sure it correctly behaves. The below example
+   expects the typical situation where eraseblocks and lock sectors have
+   the same size. In case you enabled MTD_SPI_NOR_USE_4K_SECTORS, you
+   must adapt `bs` accordingly.
+
+   Warning: These tests may hard lock your device! Make sure:
+   - The device is not hard locked already (#WP strapped to low and
+     SR_SRWD bit set)
+   - If you have a WPn pin, you may want to set `no-wp` in your DT for
+     the time of the test, to only make use of software protection.
+     Otherwise, clearing the locking state depends on the WPn
+     signal and if it is tied to low, the flash will be permanently
+     locked.
+
+   Test full chip locking and make sure expectations, the MEMISLOCKED
+   ioctl output, the debugfs output and experimental results are all
+   aligned::
+
+    root@1:~# alias show_sectors='grep -A4 "locked sectors" /sys/kernel/debug/spi-nor/spi0.0/params'
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -i /dev/mtd0
+    Device: /dev/mtd0
+    Start: 0
+    Len: 0x4000000
+    Lock status: unlocked
+    Return code: 0
+    root@1:~# mtd_debug erase /dev/mtd0 0 2097152
+    Erased 2097152 bytes from address 0x00000000 in flash
+    root@1:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
+    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
+    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+    root@1:~# sha256sum spi*
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_test
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-03ffffff | unlocked | 1024
+
+    root@1:~# flash_lock -l /dev/mtd0
+    root@1:~# flash_lock -i /dev/mtd0
+    Device: /dev/mtd0
+    Start: 0
+    Len: 0x4000000
+    Lock status: locked
+    Return code: 1
+    root@1:~# mtd_debug erase /dev/mtd0 0 2097152
+    Erased 2097152 bytes from address 0x00000000 in flash
+    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
+    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+    root@1:~# sha256sum spi*
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_test
+    root@1:~# dd if=/dev/urandom of=./spi_test2 bs=1M count=2
+    2+0 records in
+    2+0 records out
+    root@1:~# mtd_debug write /dev/mtd0 0 2097152 spi_test2
+    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
+    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read2
+    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
+    root@1:~# sha256sum spi*
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read2
+    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_test
+    bea9334df51c620440f86751cba0799214a016329f1736f9456d40cf40efdc88  spi_test2
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-03ffffff |   locked | 1024
+    root@1:~# flash_lock -u /dev/mtd0
+
+   Once we trust the debugfs output we can use it to test various
+   situations. Check top locking/unlocking (end of the device)::
+
+    root@1:~# size=$(cat /sys/class/mtd/mtd0/size)
+    root@1:~# bs=$(cat /sys/class/mtd/mtd0/erasesize)
+    root@1:~# nsectors=$(grep unlocked /sys/kernel/debug/spi-nor/spi0.0/params | sed -e 's/.*unlocked | //')
+    root@1:~# ss=$(($size / $nsectors))
+    root@1:~# bps=$(($ss / $bs))
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2 * $ss))) $((2 * $bps)) # last two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-03fdffff | unlocked | 1022
+     03fe0000-03ffffff |   locked | 2
+    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $ss))) $((1 * $bps)) # last one
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-03feffff | unlocked | 1023
+     03ff0000-03ffffff |   locked | 1
+
+   If the flash features 4 block protection bits (BP), we can protect
+   more than 4MB (typically 128 64kiB-blocks or more), with a finer
+   grain than locking the entire device::
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2**7 * $ss))) $((2**7 * $bps))
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-037fffff | unlocked | 896
+     03800000-03ffffff |   locked | 128
+
+   If the flash features a Top/Bottom (TB) bit, we can protect the
+   beginning of the flash::
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 0 $((2 * $bps)) # first two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-0001ffff |   locked | 2
+     00020000-03ffffff | unlocked | 1022
+    root@1:~# flash_lock -u /dev/mtd0 $ss $((1 * $bps)) # first one
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #sectors
+     ------------------+----------+---------
+     00000000-0000ffff |   locked | 1
+     00010000-03ffffff | unlocked | 1023

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
