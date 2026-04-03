Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41546E85371
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfThXVAoZQAb/MRL5fkJ4EU0SrkB/QB/CfEt1oGW/gA=; b=vvP/F952O/X/4H
	GosQEWlbids2ADQGoFPl0WIvOve3lp1KCP8EveeL1dBPVlrlztJFNqSCCQ9GLBgg2ceL0crbral9P
	tj2pQqub4S6RKhGjtNc6y/bCk8uUlsUzHgHsgC3uiuVEUhxX/YKS+sv+hebQKIJNGkYseTkVfeQ/U
	fP1odFiuVvbFShzGjnU/4RAkwKKYXOocTycws2F4kP2URRdp+r68U68C0ra4exHzBrH8jBM0BrdR9
	m1rqguXSTtb3uSCBAyng1g9zPTyMqcYjLvk2BKcLREb4Pb/fBefGNtL5LllpxuDZsWJVKkHgS7Lz9
	BFZkuHQCRqdj9a9s5lag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h6X-00000002HuU-1Eyx;
	Fri, 03 Apr 2026 16:10:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h6T-00000002HoI-2Ox5
	for linux-mtd@bombadil.infradead.org;
	Fri, 03 Apr 2026 16:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=rBjeS7Y+svFeJ3kkZc7HFjvdCDhIs6VUadHpnKxpakQ=; b=vfHT+B8gSoq3AjNKWiZVZianxG
	kotSfQ4dlSvUVsBBxat/A5bFdG/2meHolxzD8bOgDDpFNe6K9mWvzz8iLxPm6BsNIlYmHiHKID0tp
	qalP2daXiG9bhw92tT8hZoqqZskcjAG8cNujOs0iOrt0Pu4GCeUiXQK0Wez0Fx9az3sUvU2NuvlE0
	KfNVa4WHBWepulwMgjagt1yoX183oKEX6+B0bmgREX/9d3qi0nqkbL7qtBIZNGTn+FJXY5gI1QZ8W
	6iu6S3GS5Fad8LfyRQxBaUvybfR5yAaClAmPeQrCoEiHtP5/NPQX4+oln+KUrj7DPuc9wFSnZGl0/
	33Oz5pPw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8h6I-0000000EgfX-32MW
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:10:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E41A1A312C;
	Fri,  3 Apr 2026 16:10:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B0EC603C1;
	Fri,  3 Apr 2026 16:10:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B134B1045010A;
	Fri,  3 Apr 2026 18:10:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rBjeS7Y+svFeJ3kkZc7HFjvdCDhIs6VUadHpnKxpakQ=;
	b=WRUdMRLiLM1dBCv2ifyVz44zPpLmIdO2W03YMcMUY3RA99giK6iDbI2wWn5X8XOQ3PAg4r
	TCiHrBfOG4vwqwTdDysuV4RsgmyVc5aU1+HTyUlHmIbhUERt+EaltFEZhB24WTcORNe0Ig
	l7aOYDzYfriGmuzfNaQ+Ux4GSy7r8v/N5YVRZ7pOYsTo/Fd3veSZM2uUQTjXE8ezCLw3FO
	rDGh3RTgU3v89VRZOzL9vrxB0e7wBwDSmQuS4T//zzC+AlC7JdWj3JONyINHgQroc1GEOR
	QggETdPkVe8V0efdjIWFt+6eJbS36cbSnqs7nUD9NX7Q0SD05RLZRqKsTsF8jA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:37 +0200
Subject: [PATCH v4 19/27] mtd: spi-nor: Add steps for testing locking
 support
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-19-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_171027_348906_2ACEC03E 
X-CRM114-Status: GOOD (  14.11  )
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
 Documentation/driver-api/mtd/spi-nor.rst | 128 +++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 148fa4288760..4755eb75fe5e 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -203,3 +203,131 @@ section, after the ``---`` marker.
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
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
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
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-03ffffff |   locked | 1024
+
+   Once we trust the debugfs output we can use it to test various
+   situations. Check top locking/unlocking (end of the device)::
+
+    root@1:~# bs=$(cat /sys/class/mtd/mtd0/erasesize)
+    root@1:~# size=$(cat /sys/class/mtd/mtd0/size)
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2 * $bs))) 2 # last two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-03fdffff | unlocked | 1022
+     03fe0000-03ffffff |   locked | 2
+    root@1:~# flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # last one
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-03feffff | unlocked | 1023
+     03ff0000-03ffffff |   locked | 1
+
+   If the flash features 4 block protection bits (BP), we can protect
+   more than 4MB (typically 128 64kiB-blocks or more), with a finer
+   grain than locking the entire device::
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 $(($size - (2**7 * $bs))) $((2**7))
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-037fffff | unlocked | 896
+     03800000-03ffffff |   locked | 128
+
+   If the flash features a Top/Bottom (TB) bit, we can protect the
+   beginning of the flash::
+
+    root@1:~# flash_lock -u /dev/mtd0
+    root@1:~# flash_lock -l /dev/mtd0 0 2 # first two
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-0001ffff |   locked | 2
+     00020000-03ffffff | unlocked | 1022
+    root@1:~# flash_lock -u /dev/mtd0 $bs 1 # first one
+    root@1:~# show_sectors
+    software locked sectors
+     region (in hex)   | status   | #blocks
+     ------------------+----------+--------
+     00000000-0000ffff |   locked | 1
+     00010000-03ffffff | unlocked | 1023

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
