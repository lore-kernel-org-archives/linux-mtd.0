Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2k0I-0000h8-9r
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 21:27:53 +0000
Date: Wed, 19 Sep 2018 23:27:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Gregory
 Clement <gregory.clement@bootlin.com>, Antoine Tenart
 <antoine.tenart@bootlin.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Ofer Heifetz <oferh@marvell.com>,
 Konstantin Porotchkin <kostap@marvell.com>
Subject: Re: [PATCH] mtd: rawnand: marvell: Add support for 8kiB pages NAND
 chips layout
Message-ID: <20180919232709.6d9ec5d4@xps13>
In-Reply-To: <20180907143436.13391-1-miquel.raynal@bootlin.com>
References: <20180907143436.13391-1-miquel.raynal@bootlin.com>
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

Hello,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri,  7 Sep 2018
16:34:36 +0200:

> From: Konstantin Porotchkin <kostap@marvell.com>
> 
> Add support for two new layouts: 8kiB pages NAND chips, requesting
> either 4 or 8 bit of correctability per 512B step.
> 
> Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to nand/next.
