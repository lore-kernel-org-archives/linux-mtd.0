Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OfqHS-0002Lj-KH
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2010 08:21:55 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.243])
	by co202.xi-lite.net (Postfix) with ESMTPS id C476C2602BC
	for <linux-mtd@lists.infradead.org>;
	Mon,  2 Aug 2010 10:21:51 +0200 (CEST)
Message-ID: <4C56801D.3040300@parrot.com>
Date: Mon, 2 Aug 2010 10:21:49 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: mtdchar : writing image with oob and NOP=1
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We need to write our bootloader with a special ecc (use by cpu rom).

For that we use MTD_MODE_RAW, write and MEMWRITEOOB. This work fine, but 
from my understanding this will do a first page program with oob set to 
0xff and then program again oob.

But some recent nand support only 1 program per page (NOP=1).
How can we program nand with NOP=1 with a custom ecc ?

 From what I see in mtdchar either datbuf is set (and oobbuf is null) or 
oobbuf is set (and datbuf is null).

So this mean we need to add an ioctl to do that ?

Matthieu
