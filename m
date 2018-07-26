Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fika6-0003hi-La
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 18:01:44 +0000
Date: Thu, 26 Jul 2018 20:01:20 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH v5 12/17] mtd: rawnand: tegra: convert driver to
 nand_scan()
Message-ID: <20180726200120.0dd4bcb7@bbrezillon>
In-Reply-To: <b7eded62209b18d8d0143fefbfa95905@agner.ch>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
 <20180725133152.30898-13-miquel.raynal@bootlin.com>
 <b7eded62209b18d8d0143fefbfa95905@agner.ch>
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

On Thu, 26 Jul 2018 18:29:36 +0200
Stefan Agner <stefan@agner.ch> wrote:

> On 25.07.2018 15:31, Miquel Raynal wrote:
> > Two helpers have been added to the core to do all kind of controller
> > side configuration/initialization between the detection phase and the
> > final NAND scan. Implement these hooks so that we can convert the driver
> > to just use nand_scan() instead of the nand_scan_ident() +
> > nand_scan_tail() pair.
> >   
> 
> While the patch looks technically correct, I wonder whether the driver
> now does what we expect it from attach logically...
> 
> E.g. shouldn't we get the wp_gpio in attach?

Well, this series does things mechanically to avoid breaking drivers (we
just move all the code between ident and tail into the attach hook),
but any resource that is not needed for the identification phase and is
tied to the NAND chip could/should be requested in the attach hook (the
WP pin is such a resource).

Feel free to send a patch to change that.
