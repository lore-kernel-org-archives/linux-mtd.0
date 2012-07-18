Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SrUCs-0006pJ-HK
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 13:22:23 +0000
From: Pawel Moll <pawel.moll@arm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/2] Regulator control of physmap-ed chip's VPP
Date: Wed, 18 Jul 2012 14:21:59 +0100
Message-Id: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
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

Hello again,

After posting the previous, GPIO-based series (see
http://thread.gmane.org/gmane.linux.drivers.mtd/42502) I had a go
with the regulator version. It turned out to be much cleaner, so
that's what I'd propose for merge...

Regards

Pawel

Pawel Moll (2):
  mtd: maps: physmap: Add VPP regulator control
  mtd: maps: physmap_of: Add VPP regulator control

 .../devicetree/bindings/mtd/mtd-physmap.txt        |    4 ++-
 drivers/mtd/maps/physmap.c                         |   24 ++++++++++++----=
-
 drivers/mtd/maps/physmap_of.c                      |   28 ++++++++++++++++=
++++
 3 files changed, 48 insertions(+), 8 deletions(-)

--=20
1.7.9.5
