Received: from [2002:d412:e8ba::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CtDoC-00053W-Pk
	for linux-mtd@lists.infradead.org; Mon, 24 Jan 2005 18:39:49 -0500
Date: Mon, 24 Jan 2005 23:39:41 +0000
From: Russell King <rmk@arm.linux.org.uk>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Message-ID: <20050124233941.C5541@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: 
Subject: Fix MTD device probing... (really)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix MTD device probing, trying larger numbers of chips before smaller
numbers of chips across the bus width.

This means we'll avoid misdetecting a 2 x16 array as 1 x32 if the
high 16-bits happen to read as zeros in the QRY area.

--- orig/drivers/mtd/chips/gen_probe.c	Sat Oct 23 11:38:17 2004
+++ linux/drivers/mtd/chips/gen_probe.c	Mon Jan 24 22:54:38 2005
@@ -162,7 +162,7 @@ static int genprobe_new_chip(struct map_
 	int max_chips = map_bankwidth(map); /* And minimum 1 */
 	int nr_chips, type;
 
-	for (nr_chips = min_chips; nr_chips <= max_chips; nr_chips <<= 1) {
+	for (nr_chips = max_chips; nr_chips >= min_chips; nr_chips >>= 1) {
 
 		if (!cfi_interleave_supported(nr_chips))
 		    continue;

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
