Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiUlX-0004yL-Ik
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 21:54:52 +0000
Received: by wicgb1 with SMTP id gb1so73597394wic.1
 for <linux-mtd@lists.infradead.org>; Sat, 03 Oct 2015 14:54:30 -0700 (PDT)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: m25p80: Commit "allow arbitrary OF matching for "jedec,spi-nor""
 breaks module autoloading
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>
Message-ID: <56104E88.3040807@gmail.com>
Date: Sat, 3 Oct 2015 23:54:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Seems like commit 43163022927b6e7d202a7e6f939c3f392465494d
(allow arbitrary OF matching for "jedec,spi-nor") broke autoloading
of the m25p80 module.
MODALIAS is "spi:spi-nor" and removing "spi-nor" as device alias
prevents module autoloading.

Of course we could revert the removal of the "spi-nor" device alias.
However it might be better to switch to DT-based matching for
DT-configured devices.

Adding a call to of_device_uevent_modalias to spi_uevent in spi.c
solved the issue for me, drawback however is that just the first
"compatible" value is used as modalias. In case of m25p80 this means
that "jedec,spi-nor" has to be the first "compatible" value.
This constraint might be too strict ..

Having said that I'm not sure what could be a better way to fix
the issue than just re-introducing the "spi-nor" device alias.
