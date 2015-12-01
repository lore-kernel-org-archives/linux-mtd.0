Date: Tue, 1 Dec 2015 13:27:45 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Hartley
 Sweeten <hsweeten@visionengravers.com>, Ryan Mallon <rmallon@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Imre
 Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>, Tony
 Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Alexander Clouter
 <alex@digriz.org.uk>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT
 <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Marek
 Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net, Mikael Starvik
 <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-cris-kernel@axis.com, Josh Wu <josh.wu@atmel.com>, Wan ZongShun
 <mcuos.com@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Maxim Levitsky
 <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof
 Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-sunxi@googlegroups.com, Stefan Agner
 <stefan@agner.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org
Subject: Re: [PATCH v2 11/25] coccinelle: nand: detect and correct drivers
 embedding an mtd_info object
Message-ID: <20151201132745.2bc1e294@bbrezillon>
In-Reply-To: <alpine.DEB.2.10.1512011207580.2736@hadrien>
References: <1448967802-25796-1-git-send-email-boris.brezillon@free-electrons.com>
 <1448967802-25796-12-git-send-email-boris.brezillon@free-electrons.com>
 <alpine.DEB.2.10.1512011207580.2736@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 1 Dec 2015 12:17:44 +0100 (CET)
Julia Lawall <julia.lawall@lip6.fr> wrote:

> 
> 
> On Tue, 1 Dec 2015, Boris Brezillon wrote:
> 
> > Add nand-priv-no-mtd.cocci to detect and correct NAND controller drivers
> > directly embedding an mtd_info struct in their private struct.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: Julia Lawall <Julia.Lawall@lip6.fr>
> > ---
> > Hi Julia,
> >
> > Not sure this is the correct way to detect and fix offending drivers,
> > but I get some warnings when launching coccicheck in org or report mode:
> >
> > "warning: fix2: inherited metavariable __chipfield not used in the -, +,
> > or context code"
> >
> > Note that I don't get those warnings when running in patch mode.
> >
> > Any idea (feel free to propose a better solution to detect and fix those
> > offending drivers)?
> 
> Hi,
> 
> Is this code generated with sgen?  If so, could you send me the original
> semantic patch?

Nope, it's been hand written, which might explain the warnings :-/.
Didn't know about sgen, I thought those scripts were all hand written.

> 
> Another thing that is immediately apparent is that you have <... ...> on
> the outside of one of the rules.  This should never be needed.
> 
> The warning suggests that your org and report versions are not doing as
> much as the patch version.  If you have used sgen to generate the semantic
> patch then that would be strange.  If you have hand written the whole
> thing, then maybe you could simplify it to just do the patch version, and
> then I can check it and run sgen on it to make a complete version.

Sure, here it is:

--->8---
virtual patch

@fix1@
identifier __chipfield, __mtdfield;
type __type;
@@
(
	__type {
		...
		struct nand_chip __chipfield;
		...
-		struct mtd_info __mtdfield;
		...
	};
|
	__type {
		...
-		struct mtd_info __mtdfield;
		...
		struct nand_chip __chipfield;
		...
	};
)

@fix2 depends on fix1@
identifier fix1.__chipfield, fix1.__mtdfield;
identifier __subfield;
type fix1.__type;
__type *__priv;
@@
(
-	__priv->__mtdfield.__subfield
+	nand_to_mtd(&__priv->__chipfield)->__subfield
|
-	&(__priv->__mtdfield)
+	nand_to_mtd(&__priv->__chipfield)
)
--->8---

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
