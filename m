Received: from p3plsmtpa01-08.prod.phx3.secureserver.net ([72.167.82.88])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QrsVV-0002Mm-Hq
	for linux-mtd@lists.infradead.org; Fri, 12 Aug 2011 14:14:42 +0000
Message-ID: <4E458415.7040005@vaaraahi.com>
Date: Fri, 12 Aug 2011 19:50:45 +0000
From: Nataraj S Narayan <nataraj@vaaraahi.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Ubifs issues on Samsung Nand versus Micron
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Using Samsung Manufacturer ID: 0xec, Chip ID: 0xda (Samsung NAND 256MiB
3,3V 8-bit), on at91sam9263 board, with Arm-linux.

Getting the following errors intermittently:-


UBI error: ubi_io_read: error -74 (ECC error) while reading 129024 bytes
from PEB 517:2048, read 129024 bytes
usb 1-1: new full speed USB device number 2 using at91_ohci
UBIFS: recovery needed
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
uncorrectable error :
UBI error: ubi_io_read: error -74 (ECC error) while reading 106496 bytes
from PEB 782:2048, read 106496 bytes
UBIFS error (pid 1): ubifs_recover_leb: LEB 225 scanning failed
VFS: Cannot open root device "ubi0:root" or unknown-block(0,0)
~


Same issue when on kernel 2.6.30 and also on "commit
d6c9836c1114242aa89ea228bb1c43c17752b76c" of  ubifs-2.6.

I don't have the said problem with Mircon Nand.

Please help to find a solution to this issue. Is it the nand driver
which is the culprit?

warm regards

Nataraj

~
