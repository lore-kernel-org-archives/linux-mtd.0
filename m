Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1feRRP-0005qf-Nj
 for linux-mtd@lists.infradead.org; Sat, 14 Jul 2018 20:46:58 +0000
Date: Sat, 14 Jul 2018 22:46:12 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] Documentation: mtd: remove stale pxa3xx NAND
 controller documentation
Message-ID: <20180714224612.1477269b@windsurf>
In-Reply-To: <20180714135428.26955-2-miquel.raynal@bootlin.com>
References: <20180714135428.26955-1-miquel.raynal@bootlin.com>
 <20180714135428.26955-2-miquel.raynal@bootlin.com>
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

On Sat, 14 Jul 2018 15:54:28 +0200, Miquel Raynal wrote:
> It is preferred to have the documentation about the drivers directly
> embedded in the driver itself. Remove this file now that the most
> important information from this file have been re-written in
> marvell_nand.c.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I agree with moving the documentation to the driver itself, but the
documentation you've added in PATCH 1/2 into the driver is much, much
more limited than the documentation present in this file.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
