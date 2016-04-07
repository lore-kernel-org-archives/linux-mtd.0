Received: from comal.ext.ti.com ([198.47.26.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ao6tM-0002WF-3z
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2016 10:10:29 +0000
From: Roger Quadros <rogerq@ti.com>
To: <tony@atomide.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>
CC: <dwmw2@infradead.org>, <ezequiel@vanguardiasur.com.ar>,
 <javier@dowhile0.org>, <fcooper@ti.com>, <nsekhar@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Roger Quadros
 <rogerq@ti.com>
Subject: [PATCH v6 12/17] memory: omap-gpmc: Move device tree binding to
 correct location
Date: Thu, 7 Apr 2016 13:08:30 +0300
Message-ID: <1460023715-19332-13-git-send-email-rogerq@ti.com>
In-Reply-To: <1460023715-19332-1-git-send-email-rogerq@ti.com>
References: <1460023715-19332-1-git-send-email-rogerq@ti.com>
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
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/{bus/ti-gpmc.txt => memory-controllers/omap-gpmc.txt}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{bus/ti-gpmc.txt => memory-controllers/omap-gpmc.txt} (100%)

diff --git a/Documentation/devicetree/bindings/bus/ti-gpmc.txt b/Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/bus/ti-gpmc.txt
rename to Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
-- 
2.5.0
