Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SpMPn-0007dD-Fn
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2012 16:38:56 +0000
From: Pawel Moll <pawel.moll@arm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] GPIO control of physmap-ed chip's VPP
Date: Thu, 12 Jul 2012 17:38:39 +0100
Message-Id: <1342111121-23161-1-git-send-email-pawel.moll@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Some time ago physmap driver gained "set_vpp" platform function. That's
good but it can't be used on a Device Tree platform. This micro-series
adds the necessary bindings in the physmap_of driver, and - to keep
harmony in nature ;-) - makes similar change in the "normal" physmap
driver.

Alternatively this could be done via regulator framework (flash chip
could request a "vpp" supply) instead of GPIO. I don't mind either
solution - I just came up with GPIO first. If there is any preference
on the regulator side, I'll rework this code.

Regards

Pawel

Pawel Moll (2):
  mtd: maps: physmap: Add GPIO VPP control
  mtd: maps: physmap_of: Add GPIO VPP control

 .../devicetree/bindings/mtd/mtd-physmap.txt        |    7 +++-
 drivers/mtd/maps/physmap.c                         |   22 ++++++++++
 drivers/mtd/maps/physmap_of.c                      |   42 ++++++++++++++++=
++++
 include/linux/mtd/physmap.h                        |    2 +
 4 files changed, 72 insertions(+), 1 deletion(-)

--=20
1.7.9.5
