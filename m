Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1epK9B-0003j7-AY
 for linux-mtd@lists.infradead.org; Fri, 23 Feb 2018 20:40:51 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Eric Miao <eric.y.miao@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, <devicetree@vger.kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Nadav Haklai <nadavh@marvell.com>,
 linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org>
Subject: Re: [PATCH v4 1/6] mtd: nand: use Marvell reworked NAND controller
 driver with all platforms
References: <20180219223557.2458-1-miquel.raynal@bootlin.com>
 <20180219223557.2458-2-miquel.raynal@bootlin.com>
 <20180222104943.5a155319@bbrezillon>
Date: Fri, 23 Feb 2018 21:40:26 +0100
In-Reply-To: <20180222104943.5a155319@bbrezillon> (Boris Brezillon's message
 of "Thu, 22 Feb 2018 10:49:43 +0100")
Message-ID: <87tvu7783p.fsf@belgarion.home>
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

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> +Arnd and the LAKML
>
> Arnd, Robert, I'd like to apply this patch through the MTD tree so
> we can get rid of the pxa driver in 4.17. Robert already gave his
> Tested-by, but I wanted to make sure this was okay for me to take it
> through the MTD tree. I can provide an immutable branch if needed.
>
> Thanks,
>
> Boris
Hi Boris,

As I'm expecting conflicts in the pxa tree this next cycle (I have gpio, mtd and
the normal pxa tree in mind), an immutable branch is needed for me please. I'll
merge it into the pxa/for-next tree just to be sure I have all the conflict
covered.

Cheers.

--
Robert
