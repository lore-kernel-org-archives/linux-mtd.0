Received: from arroyo.ext.ti.com ([192.94.94.40])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zcx4v-00035f-23
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 14:55:57 +0000
From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>
CC: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <ezequiel@vanguardiasur.com.ar>, <javier@dowhile0.org>,
 <fcooper@ti.com>, <nsekhar@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH v3 14/27] memory: omap-gpmc: Move device tree binding to
 correct location
Date: Fri, 18 Sep 2015 17:53:36 +0300
Message-ID: <1442588029-13769-15-git-send-email-rogerq@ti.com>
In-Reply-To: <1442588029-13769-1-git-send-email-rogerq@ti.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

omap-gpmc.c is a memory controller so move the binding to the
right place.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 .../bindings/{bus/ti-gpmc.txt => memory-controllers/omap-gpmc.txt}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{bus/ti-gpmc.txt => memory-controllers/omap-gpmc.txt} (100%)

diff --git a/Documentation/devicetree/bindings/bus/ti-gpmc.txt b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/bus/ti-gpmc.txt
rename to Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
-- 
2.1.4
