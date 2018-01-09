From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>,
 Neta Zur Hershkovits <neta@marvell.com>, Willy Tarreau <w@1wt.eu>,
 Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: [PATCH v3 1/7] dt-bindings: mtd: document new nand-rb property
Date: Tue,  9 Jan 2018 11:36:31 +0100
Message-Id: <20180109103637.23798-2-miquel.raynal@free-electrons.com>
In-Reply-To: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are already an atmel,rb and an allwinner,rb properties, let's not
make other ones and instead use a generic term: nand-rb to define NAND
chips Ready/Busy lines.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 Documentation/devicetree/bindings/mtd/nand.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index 133f3813719c..8bb11d809429 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -43,6 +43,7 @@ Optional NAND chip properties:
 		     This is particularly useful when only the in-band area is
 		     used by the upper layers, and you want to make your NAND
 		     as reliable as possible.
+- nand-rb: shall contain the native Ready/Busy ids.
 
 The ECC strength and ECC step size properties define the correction capability
 of a controller. Together, they say a controller can correct "{strength} bit
-- 
2.11.0
