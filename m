Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie4.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dLWBg-00052W-BT
 for linux-mtd@lists.infradead.org; Thu, 15 Jun 2017 14:55:59 +0000
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com
 [10.200.68.65])
 by relmlir1.idc.renesas.com (Postfix) with ESMTP id 1D73D7947B
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jun 2017 23:55:32 +0900 (JST)
From: Chris Brandt <Chris.Brandt@renesas.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Does XIP_MTD really exist?
Date: Thu, 15 Jun 2017 14:55:30 +0000
Message-ID: <SG2PR06MB11657F2D01E82DBA288C16948AC00@SG2PR06MB1165.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the MTD directory, there are hints that an XIP from MTD exits, but=20
mostly only to make code run from RAM when modifying a parallel NOR flash.

Is this code all abandoned?

Also, I don't really see of any mainline filesystem driver that would=20
make use of it.

Since as of v4.0, filemap_xip.c was removed (from the guys that added=20
DAX) which broke AXFS which I had been using.

So, now I'm trying to decide if I need to rework AXFS to work with a=20
mainline kernel (basically by adding filemap_xip.c back in under an fs/axfs
directory), or if there is some other obvious XIP file system method=20
that I'm missing.

The NO_MMU + XIP_KERNEL people must be using something for a file=20
system....I'm just not sure what that is.

Any suggestions are welcome.


Thank you,
Chris
