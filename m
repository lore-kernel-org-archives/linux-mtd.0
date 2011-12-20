Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rd4fW-0001G3-Bz
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2011 18:44:06 +0000
From: Mike Dunn <mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] always use partition wrappers; drivers return bitflips
Date: Tue, 20 Dec 2011 10:42:14 -0800
Message-Id: <1324406536-18250-1-git-send-email-mikedunn@newsguy.com>
To: linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mike Dunn <mikedunn@newsguy.com>,
 Scott Branden <sbranden@broadcom.com>, Wan ZongShun <mcuos.com@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Vimal Singh <vimal.newwork@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 Jiandong Zheng <jdzheng@broadcom.com>, Andres Salomon <dilinger@queued.net>,
 Olof Johansson <olof@lixom.net>, Jamie Iles <jamie@jamieiles.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

These two patches accomplish the goal of returning bitflip info from the drivers
to mtd without requiring the huge patch that results from changing the prototype
of the read() method.

The first patch ensures that driver methods always go through the wrappers in
the partitioning code by creating a "partition" that spans the entire device on
otherwise unpartitioned devices.

Now that the methods always pass through the mtd code via the partitioning
wrappers, the second patch tweaks the meaning of the return code from the
driver's read() and read_oob() methods.  Where previously, in the absence of a
hard error, the driver returned either -EUCLEAN (one or more bitflips were
corrected) or 0 (no bitflips), the driver now returns, absent an error, the
maximum number of bitflips corrected on any single page.  The original set of
possible values (and their meanings) returned from mtd to the higher layer
remains unchanged for now.

This bifurcation of the driver <-> mtd and mtd <-> higher layer is admitedly a
little kludgy and potentially confusing for driver writers, but has the
advantage of touching few files.  With two exceptions, all drivers for devices
with ecc capability go through the nand or onenand interfaces, limiting the
changes to the nand and onenand infrastructure code.  Absent an error, devices
without ecc already return 0 always, so they comply with the modified api by
default.

If this flies, I'll follow up with patches to implement the change in the
meaning of -EUCLEAN returned from mtd that was previously discussed. Otherwise,
I can resubmit the large patch with the change to the read() prototype in lieu
of patch 2/2.

Thanks,
Mike

Mike Dunn (2):
  MTD: pass driver methods through partition wrappers on unpartitioned
    devices
  MTD: read(), read_oob() driver methods return num bitflips

 drivers/mtd/devices/docg3.c        |    5 +++-
 drivers/mtd/mtdcore.c              |   17 ++++++++++++--
 drivers/mtd/mtdpart.c              |   39 +++++++++++++++++++++++++++--------
 drivers/mtd/nand/alauda.c          |    4 +-
 drivers/mtd/nand/nand_base.c       |   10 +++++++-
 drivers/mtd/onenand/onenand_base.c |    6 +++-
 6 files changed, 62 insertions(+), 19 deletions(-)

-- 
1.7.3.4
