Received: from wtms.nl ([194.109.57.126])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mvoO-00026j-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 12:00:25 +0000
Received: from wtms.linux.mtd via Gateway (Mailtraq/2.0.0.1249) by wtms.nl
	for linux-mtd@lists.infradead.org; Mon, 18 Mar 2002 13:10:45 +0100
From: Wil Taphoorn <wil@wtms.nl>
To: linux-mtd@lists.infradead.org
Subject: How to protect DoC 2000 from power fail?
Date: Mon, 18 Mar 2002 13:10:45 +0100
Message-ID: <3C95D945.2DCE55AA@wtms.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Gentlemen,

I am looking for some rigid means of power fail protection
for a DoC 2000 based embedded system. From what I have read
so far I understand that almost any brand of journalling file
system should do well but, then again, those readings also
mention raw FLASH and not DoC, in other words, I think I am
lost. Would someone be so kind to enlighten me?

The system in question runs on a customized 486 SoC, boots
from EEPROM and loads LILO from DoC. The kernel uses initrd
to load the M-sys supplied DoC driver.

Thanks,
Wil
