Received: from lo.gmane.org ([80.91.229.12])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NIHwa-0004Da-2P
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 08:30:48 +0000
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NIHwV-0008JO-Ix
	for linux-mtd@lists.infradead.org; Wed, 09 Dec 2009 09:30:39 +0100
Received: from vpn8.rz.tu-ilmenau.de ([141.24.172.8])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2009 09:30:39 +0100
Received: from andre.puschmann by vpn8.rz.tu-ilmenau.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2009 09:30:39 +0100
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
Subject: UBIFS on Atmel Dataflash
Date: Wed, 09 Dec 2009 09:30:22 +0100
Message-ID: <hfnn6u$ah1$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

this is my very first try to get UBIFS working. My target is an Atmel
AT91RM9200 cpu which has a 8MB Atmel Dataflash AT45DB642x. Pagesize is
1056 Bytes.

I cross-compiled the ubi tools and my first try to attach was not
successful:

$ ./ubiattach /dev/ubi_ctrl -m 6
UBI: attaching mtd6 to ubi0
UBI error: io_init: min. I/O unit (1056) is not power of 2

My question is if it's possible (in general) to get a working version of
UBIFS on this kind of flash (with no power of two pagesize)? Anybody
ever tried this?

I also tried ubiformat which raises a segfault:

$ ./ubiformat /dev/mtd6
ubiformat: warning!: your MTD system is old and it is impossible to
detect sub-page size. Use -s to get rid of this warning
ubiformat: assume sub-page to be 1056
ubiformat: mtd6 (dataflash), size 4815360 bytes (4.6 MiB), 4560
eraseblocks of 1056 bytes (1.0 KiB), min. I/O size 1056 bytes
libscan: scanning eraseblock 4559 -- 100 % complete
ubiformat: 4554 eraseblocks are supposedly empty
ubiformat: warning!: 6 of 4560 eraseblocks contain non-ubifs data
ubiformat: continue? (yes/no)  yes
ubiformat: warning!: only 0 of 4560 eraseblocks have valid erase counter
ubiformat: erase counter 0 will be used for all eraseblocks
ubiformat: note, arbitrary erase counter value may be specified using -e
option
ubiformat: continue? (yes/no)  yes
ubiformat: use erase counter 0 for all eraseblocks
ubiformat: formatting eraseblock 4559 -- 100 % complete
Segmentation fault

Any comments on this are highly appreciated.

Best regards,

Andre
