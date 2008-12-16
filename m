Received: from fnoeppeil48.netpark.at ([217.175.205.176]
	helo=roarinelk.homelinux.net)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCVhu-00071b-2y
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 08:55:10 +0000
Date: Tue, 16 Dec 2008 09:55:01 +0100
From: Manuel Lauss <mano@roarinelk.homelinux.net>
To: linux-mtd@lists.infradead.org
Subject: NAND "low-level format"?
Message-ID: <20081216085501.GA7866@roarinelk.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, 

I have a few devices here which have data written to NAND by WindowsCE. 
When booting linux, all sectors which have been written to by wince are
identified as bad:

NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
Scanning device for bad blocks
Bad eraseblock 0 at 0x00000000
Bad eraseblock 1 at 0x00020000
Bad eraseblock 2 at 0x00040000
Bad eraseblock 3 at 0x00060000
Bad eraseblock 4 at 0x00080000
Bad eraseblock 5 at 0x000a0000
Bad eraseblock 6 at 0x000c0000
Bad eraseblock 7 at 0x000e0000
...
Bad eraseblock 214 at 0x01ac0000
Bad eraseblock 215 at 0x01ae0000
Bad eraseblock 216 at 0x01b00000
Bad eraseblock 1990 at 0x0f8c0000
Bad eraseblock 2236 at 0x11780000
Bad eraseblock 3257 at 0x19720000
Bad eraseblock 3426 at 0x1ac40000
Bad eraseblock 3687 at 0x1cce000

Only the last 5 sectors are actually really bad;  the wince people told me
their nand driver does not touch any of the factory-marked bad blocks.

My question is: is there a utility of sorts which can reclaim the falsely
marked bad sectors for linux use?

Thanks,
	Manuel Lauss
