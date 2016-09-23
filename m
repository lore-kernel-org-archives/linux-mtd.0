Received: from mail-by2nam03on0082.outbound.protection.outlook.com
 ([104.47.42.82] helo=NAM03-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bnOgL-0007fA-I0
 for linux-mtd@lists.infradead.org; Fri, 23 Sep 2016 11:30:18 +0000
Date: Fri, 23 Sep 2016 13:29:44 +0200
From: Jan Glauber <jan.glauber@caviumnetworks.com>
To: <linux-mtd@lists.infradead.org>
Subject: Question about nand_scan()
Message-ID: <20160923112944.GB4580@hardcore>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm working on a driver for the NAND controller on Cavium's ThunderX.

So far I implemented the low-level functions for using the controller
to access a NAND chip. I can read the ONFI ID and parameter page
with that.

Now I wanted to use nand_scan() instead of manually reading the chip
parameters, but it fails with "No NAND device found".

The hardware I'm using has one NAND device wired as chip 1 (the NAND
controller support chips 0..7).

The reason for the failure seems to be that nand_get_flash_type()
returns an error before all the chips are scanned. What I don't
understand is in that function chip 0 is selected before the loop
that would scan all chips:

        /* Select the device */
        chip->select_chip(mtd, 0);

My select_chip() stores the chip number (in that case 0) and uses
that for subsequent commands to the controller. Since there is no
chip 0 the read returns nothing and nand_scan() fails.

Probably I'm missing something, would be great if someone could
help me...

thanks,
Jan
