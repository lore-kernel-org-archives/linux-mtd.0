MIME-Version: 1.0
Date: Sun, 23 Dec 2012 21:02:05 -0300
Message-ID: <CALF0-+VOjr6O=+EPFsav1jghfsp624H9w48+JP8_JQgFoAAt=Q@mail.gmail.com>
Subject: [PATCH 0/3] OMAP GPMC OneNAND DT bindings
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Javier Martinez Canillas <martinez.javier@gmail.com>,
 Benoit Cousson <b-cousson@ti.com>, Tony Lindgren <tony@atomide.com>,
 Daniel Mack <zonque@gmail.com>, Grant Likely <grant.likely@secretlab.ca>,
 Enric Balletbo Serra <eballetbo@gmail.com>, jon-hunter@ti.com,
 matthias.bgg@googlemail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everyone,

Just in case anyone wants to access his OneNAND device,
here's a little patchset. Feedback is more than welcome.

It's based on arm-soc/for-next with Daniel Mack's GPMC patches.

Ezequiel Garcia (3):
  mtd: omap-onenand: pass device_node in platform data
  arm: omap2: gpmc-onenand: drop __init annotation
  arm: omap2: gpmc: add DT bindings for OneNAND

 .../devicetree/bindings/mtd/gpmc-onenand.txt       |   44 ++++++++++++++++++++
 arch/arm/mach-omap2/gpmc-onenand.c                 |    2 +-
 arch/arm/mach-omap2/gpmc.c                         |   44 ++++++++++++++++++++
 drivers/mtd/onenand/omap2.c                        |    4 +-
 include/linux/platform_data/mtd-onenand-omap2.h    |    3 +
 5 files changed, 95 insertions(+), 2 deletions(-)

Regards,

-- 
    Ezequiel
