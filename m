Received: from mail-tul01m020-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnLx3-0005DQ-MD
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2012 03:12:42 +0000
Received: by obcuz6 with SMTP id uz6so4824500obc.36
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2012 19:12:36 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 18 Jan 2012 03:12:36 +0000
Message-ID: <CACJFQ2X831y+Kr2==4NS+Jz8wtOn+k5WMuidepjOQuRQ-SKO9Q@mail.gmail.com>
Subject: identifying a flash file system
From: Ballymunboy <ballymunboy@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We have extracted the NAND flash contents from the TriMedia-based
routers from 2Wire.

We would like to re-build the router's firmware. But, as yet, the
flash file system to those devices cannot be identified.

There is a header found in the first half of page zero of the flash
device.  Fields in that header appear to reference two partitions - a
boot partition and a file system partition.  [1]

There is a hunch that the devices are using the flash translation
layer from m-Systems TrueFFS  (now part of Sandisk). [2]

The 2Wires are running an in-house flavour of BSD  (rtBSD/tm) so maybe
the file system itself is ported from elsewhere in the *BSD platform.

Has anyone here worked with TrueFFS?  What would be the best method
for mounting the volume on a Linux PC for examination?

All comments and suggestions gratefully received!

cheers,
asbokid

[1] http://hackingbtbusinesshub.wordpress.com/category/nand-flash/
[2] http://www.texim-europe.com/promotion/119/trueffs%20product%20brief.pdf
