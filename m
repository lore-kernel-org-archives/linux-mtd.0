Received: from 5.mo53.mail-out.ovh.net ([46.105.48.2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbkvT-0003Sl-5y
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 09:22:06 +0000
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo53.mail-out.ovh.net (Postfix) with ESMTP id 9A78438448
 for <linux-mtd@lists.infradead.org>; Thu,  9 Feb 2017 10:21:40 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 0/2] Add a "label" property to the mtd device
Date: Thu,  9 Feb 2017 10:21:06 +0100
Message-Id: <1486632068-14894-1-git-send-email-clg@kaod.org>
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

 Changes since v2:

 - only assign device name from label if mtd->name is undefined

 Changes since v1:

 - moved the use of the "label" property from mtd_set_dev_defaults()
   to mtd_set_of_node() to let drivers keep control on how mtd->name
   is set and allocated.

Cédric Le Goater (2):
  mtd: name the mtd device with an optional label property
  dt-bindings: mtd: add a common label property to all mtd devices

 Documentation/devicetree/bindings/mtd/common.txt | 15 +++++++++++++++
 include/linux/mtd/mtd.h                          |  3 +++
 2 files changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/common.txt

-- 
2.7.4
