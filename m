Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddItf-00005j-IL
 for linux-mtd@lists.infradead.org; Thu, 03 Aug 2017 16:22:53 +0000
Received: by mail-pf0-x242.google.com with SMTP id p13so1933394pfd.4
 for <linux-mtd@lists.infradead.org>; Thu, 03 Aug 2017 09:22:30 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] constify mtd pci_device_id
Date: Thu,  3 Aug 2017 21:52:04 +0530
Message-Id: <1501777330-21380-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

pci_device_id are not supposed to change at runtime. All functions
working with pci_device_id provided by <linux/pci.h> work with
const pci_device_id. So mark the non-const structs as const.

Arvind Yadav (6):
  [PATCH 1/6] mtd: maps: ichxrom: constify pci_device_id.
  [PATCH 2/6] mtd: amd76xrom: constify pci_device_id.
  [PATCH 3/6] mtd: esb2rom: constify pci_device_id.
  [PATCH 4/6] mtd: ck804xrom: constify pci_device_id.
  [PATCH 5/6] mtd: intel_vr_nor: constify pci_device_id.
  [PATCH 6/6] mtd: pci: constify pci_device_id.

 drivers/mtd/maps/amd76xrom.c    | 4 ++--
 drivers/mtd/maps/ck804xrom.c    | 4 ++--
 drivers/mtd/maps/esb2rom.c      | 4 ++--
 drivers/mtd/maps/ichxrom.c      | 4 ++--
 drivers/mtd/maps/intel_vr_nor.c | 2 +-
 drivers/mtd/maps/pci.c          | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.7.4
