Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8EFCE8D68
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ppWFegd9SMfxE9q25eYcNeHvT+hM8SSGjlcg/qwP+o=; b=UhBPwtV/cDe0SM
	bWSkbB5L31yPIsBf/L2kYyWc0qVyCO06BXuhE1atLr2416FSzEbZDa3Z9cx31vSsjDLgNbFzOkIbU
	kw04IE2BHMFZCaYDX9Tg9Mr6ol9i3MkUlT2Q9lN6rl5KAJZWTBZo5YfB8AoXWlf+e8/j0NOPY1vec
	6V2dUdc3f0yimgYh5hY9ki7TUE8duFf9i6GMa0NeaxmbsVzFAJ9BoQlfE4vP01/SCS46d2s0UDPPd
	RbchRhWLrjoSQFFSEXjFgU4sJngkoZ/LFTADiib/KIS0N8XNLSV+lqOMPaUcsA71idG7JLCYIT+KE
	6TmHVC8jztfy0ypmkuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzq-0000000CthX-3XXP;
	Fri, 14 Nov 2025 17:54:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzl-0000000CtXL-0EqA
	for linux-mtd@bombadil.infradead.org;
	Fri, 14 Nov 2025 17:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5c7nU0Bm0YxzBe7qlrProznhtoWlm5xYXGQJgAo2tsc=; b=ftmU9iC+omOASgJv8Z+XwW7YQd
	jhe7dbN5L+d737RaKbAtqY2C2/OotTLSCumq9XihRBjw09Aooi9iumm0+qAaPyNVcvtTKDHG5orM4
	X10aFxXx5AJLk1Kr4JT+KcZu5fbIDGcx6He/XFKItp/S68RwU9/RVvPnxD2Kzb+8q/NbMpdoqU++B
	nRR96PYzmn6F9v0O125uQt4I7mv+dgMKqASmZg96cR7nLpT+yWMb0UGg5kPsSgJAHXiiDOQEZ4sXC
	JrOlNyeCsviaRDNoLMKJWHd4Qc/cUpl0s4fjp7EifcUw+D+BQJl8wsNl2ElIRXvDK0oE9LE6AGg1z
	jIi/r4OA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzg-00000009i3p-2bj9
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:53:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 35FCBC10F6D;
	Fri, 14 Nov 2025 17:53:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BDAA6060E;
	Fri, 14 Nov 2025 17:53:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1DA010371988;
	Fri, 14 Nov 2025 18:53:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142828; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5c7nU0Bm0YxzBe7qlrProznhtoWlm5xYXGQJgAo2tsc=;
	b=CN1RJ2BxF1x6GzAxGqcE5kS+XGu4nceWagqPj6qm3pFYWGzpUN+8rr1SDxM/jV6m7mbbyY
	IO+e/8acqG4YZvO8KaFhncSb2gzMGyyIAvJEegNVUHCXJDD2mH7gjbnb9S4KejeUIGP5RQ
	qRjYPrwOqZbaHAeTJ5rNhMKhYpuW6Iruz04SRC/hX+kD85SC4clBCNZbUN/IRprDVJu1yx
	0y3JUqDKbDxroHByR5L/7bIhNYHvYC1DEVpKI+7gLHsKThxPYzuDLLdJUi+UaMf01BW9NB
	4mmdz6ge28rAaR213MxUx5JqbBb2pLpYOrv1V6YyCfjyKkk+sOrz5Pd/BwOY8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:17 +0100
Subject: [PATCH 16/19] mtd: spi-nor: Add steps for testing locking support
MIME-Version: 1.0
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-16-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_175356_726116_16365FC8 
X-CRM114-Status: GOOD (  11.41  )
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
 Documentation/driver-api/mtd/spi-nor.rst | 118 +++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 148fa4288760b6ba47d530ed72c5ef81397d598f..d56ff5c42a98af23a65097c9b77cd20ef2504a49 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -203,3 +203,121 @@ section, after the ``---`` marker.
     mtd.writesize = 1
     mtd.oobsize = 0
     regions = 0
+
+5) If your flash supports locking, also follow the following test
+   procedure to make sure it correctly behaves. These tests must be
+   conducted with #WP high (no hardware protection) or the `no-wp`
+   property in the DT node.
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
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
