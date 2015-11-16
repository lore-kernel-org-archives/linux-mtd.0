Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZySN2-0004DD-1x
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 22:35:32 +0000
Received: by pacdm15 with SMTP id dm15so188454921pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2015 14:35:09 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/3] mtd: m25p80: fix some module and documentation issues
Date: Mon, 16 Nov 2015 14:34:49 -0800
Message-Id: <1447713292-91525-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

There were a few mistakes and improvements pointed out at various points in
this thread, subject:

    spi: OF module autoloading is still broken
    (was: Re: m25p80: Commit "allow arbitrary OF matching for "jedec,spi-nor""
    breaks module autoloading)

    http://lists.infradead.org/pipermail/linux-mtd/2015-October/062369.html
    https://lkml.org/lkml/2015/11/12/574

That thread covers some other interesting issues that are still not solved, but
let's fix the ones we can here in MTD right now.

Regards,
Brian


Brian Norris (3):
  mtd: m25p80: fix module autoloading for "jedec,spi-nor" and "spi-nor"
  mtd: m25p80: replace leftover "nor-jedec" with "spi-nor" in comments
  doc: dt: mtd: stop referring to driver code for spi-nor IDs

 .../devicetree/bindings/mtd/jedec,spi-nor.txt      | 56 ++++++++++++++++++++--
 drivers/mtd/devices/m25p80.c                       | 17 +++++--
 2 files changed, 64 insertions(+), 9 deletions(-)

-- 
2.6.0.rc2.230.g3dd15c0
