Received: from 17.mo5.mail-out.ovh.net ([46.105.56.132])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWS9J-00013V-Li
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 18:18:27 +0000
Received: from player695.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 448969242B
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jan 2017 19:18:02 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 0/2] Add a "label" property to the mtd device
Date: Wed, 25 Jan 2017 19:17:33 +0100
Message-Id: <1485368255-12038-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Herer are a couple of patches adding a "label" property to the mtd
device, which can be used to identify a specific chip on a system with
multiple chips. This is common on the OpenPower boards, there can be
four chips holding the firmware for the BMC and the firmware for the
host, plus chips with golden images for recovery.

Thanks,

C.

Cédric Le Goater (2):
  mtd: name the mtd device with an optional label property
  dt-bindings: mtd: add a common label property to all mtd devices

 Documentation/devicetree/bindings/mtd/common.txt | 15 +++++++++++++++
 include/linux/mtd/mtd.h                          |  2 ++
 2 files changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/common.txt

-- 
2.7.4
