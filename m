Date: Thu, 11 Jan 2018 16:25:50 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Rutland <mark.rutland@arm.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>, Ofer Heifetz <oferh@marvell.com>,
 Hanna Hawa <hannah@marvell.com>,
 Neta Zur Hershkovits <neta@marvell.com>, Willy Tarreau <w@1wt.eu>,
 Sean Nyekjaer <sean.nyekjaer@prevas.dk>
Subject: Re: [PATCH v3 2/7] dt-bindings: mtd: add Marvell NAND controller
 documentation
Message-ID: <20180111222550.nxus25nqoyvhq22r@rob-hp-laptop>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180109103637.23798-3-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109103637.23798-3-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 09, 2018 at 11:36:32AM +0100, Miquel Raynal wrote:
> Document the legacy and the new bindings for Marvell NAND controller.
> 
> The pxa3xx_nand.c driver does only support legacy bindings, which are
> incomplete and inaccurate. A rework of this controller (called
> marvell_nand.c) does support both.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  .../devicetree/bindings/mtd/marvell-nand.txt       | 123 +++++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt

Reviewed-by: Rob Herring <robh@kernel.org>
