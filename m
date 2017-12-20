Date: Wed, 20 Dec 2017 15:06:06 -0600
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
 Sean =?iso-8859-1?Q?Nyekj=E6r?= <sean.nyekjaer@prevas.dk>
Subject: Re: [PATCH v2 4/5] dt-bindings: mtd: remove pxa3xx NAND controller
 documentation
Message-ID: <20171220210606.dpx646hka2qtru5s@rob-hp-laptop>
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
 <20171219132942.27433-5-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171219132942.27433-5-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 19, 2017 at 02:29:41PM +0100, Miquel Raynal wrote:
> The deprecated pxa3xx_nand.c driver does not exist anymore, it has been
> replaced by marvell_nand.c which has its own up-to-date documentation.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  .../devicetree/bindings/mtd/pxa3xx-nand.txt        | 50 ----------------------
>  1 file changed, 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt

Reviewed-by: Rob Herring <robh@kernel.org>
