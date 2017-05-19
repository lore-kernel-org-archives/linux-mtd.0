Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdc-0000PN-Q6
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:35 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 02/31] bt8xxgpio.txt: standardize document format
Date: Thu, 18 May 2017 22:22:07 -0300
Message-Id: <70359a28fff3be1e1c64bb99d9d74155def6c0e9.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Adjust titles to match the convention;
- use a literal block for ascii artwork.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/bt8xxgpio.txt | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/Documentation/bt8xxgpio.txt b/Documentation/bt8xxgpio.txt
index d8297e4ebd26..a845feb074de 100644
--- a/Documentation/bt8xxgpio.txt
+++ b/Documentation/bt8xxgpio.txt
@@ -1,12 +1,8 @@
-===============================================================
-==  BT8XXGPIO driver                                         ==
-==                                                           ==
-==  A driver for a selfmade cheap BT8xx based PCI GPIO-card  ==
-==                                                           ==
-==  For advanced documentation, see                          ==
-==  http://www.bu3sch.de/btgpio.php                          ==
-===============================================================
+===================================================================
+A driver for a selfmade cheap BT8xx based PCI GPIO-card (bt8xxgpio)
+===================================================================
 
+For advanced documentation, see http://www.bu3sch.de/btgpio.php
 
 A generic digital 24-port PCI GPIO card can be built out of an ordinary
 Brooktree bt848, bt849, bt878 or bt879 based analog TV tuner card. The
@@ -17,9 +13,8 @@ The bt8xx chip does have 24 digital GPIO ports.
 These ports are accessible via 24 pins on the SMD chip package.
 
 
-==============================================
-==  How to physically access the GPIO pins  ==
-==============================================
+How to physically access the GPIO pins
+======================================
 
 The are several ways to access these pins. One might unsolder the whole chip
 and put it on a custom PCI board, or one might only unsolder each individual
@@ -27,7 +22,7 @@ GPIO pin and solder that to some tiny wire. As the chip package really is tiny
 there are some advanced soldering skills needed in any case.
 
 The physical pinouts are drawn in the following ASCII art.
-The GPIO pins are marked with G00-G23
+The GPIO pins are marked with G00-G23::
 
                                            G G G G G G G G G G G G     G G G G G G
                                            0 0 0 0 0 0 0 0 0 0 1 1     1 1 1 1 1 1
-- 
2.9.4
