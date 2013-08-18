Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAuCp-0006xM-0N
 for linux-mtd@lists.infradead.org; Sun, 18 Aug 2013 04:03:07 +0000
Received: by mail-pa0-f54.google.com with SMTP id kx10so3407194pab.13
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 21:02:45 -0700 (PDT)
Message-ID: <5210F132.8030306@gmail.com>
Date: Sun, 18 Aug 2013 12:07:14 -0400
From: Huang Shijie <shijie8@gmail.com>
MIME-Version: 1.0
To: joern@logfs.org, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, dedekind1@gmail.com
Subject: Does this patch set affect your driver(drivers/mtd/nand/alauda.c)?
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joern:

I have submitted a patch set to expose the ecc step size to the user space.

see:
http://lists.infradead.org/pipermail/linux-mtd/2013-August/048114.html

Since your driver does not set the ecc.size, nor calls the
nand_scan/nand_scan_ident/nand_scan_tail.

I am not sure if this patch set affect your driver or not.
Please let me know if it does affect your driver.

thanks
Huang Shijie
