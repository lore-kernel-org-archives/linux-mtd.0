Received: from mtiwmhc13.worldnet.att.net ([204.127.131.117])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KbJ7Q-0002yi-FE
	for linux-mtd@lists.infradead.org; Thu, 04 Sep 2008 17:59:44 +0000
From: Jeff Sutherland <jeffs@fomsystems.com>
To: linux-mtd@lists.infradead.org
Subject: mtd concatenate support for pxa2xx-flash mapping driver
Date: Thu, 4 Sep 2008 13:59:32 -0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200809041359.33626.jeffs@fomsystems.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm working currently in 2.6.25.  Is anyone working on mtd concatenation 
support for this particular driver?  $customer selected 64Mbyte NOR flash 
chip for root filesystem, but in reality it is two 32Mb die in one package, 
and I need one mtd partition > 32mb after taking care of bootloader, 
environment, and kernel.

Regards,
-Jeff
