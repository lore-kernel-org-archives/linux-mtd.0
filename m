Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8RCq-0005Ty-AH
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2018 14:35:58 +0000
Date: Fri, 5 Oct 2018 16:35:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: toshiba: Pass a single nand_chip object
 to the status helper
Message-ID: <20181005163528.7fa80080@xps13>
In-Reply-To: <20180924093518.22021-1-miquel.raynal@bootlin.com>
References: <20180924093518.22021-1-miquel.raynal@bootlin.com>
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


Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 24 Sep 2018
11:35:18 +0200:

> Now that most of the raw NAND API is consistent and has almost all its
> helpers and hooks using a single nand_chip object instead of an mtd_info
> one (or both), let's do the same cleanup in the raw NAND vendors
> drivers.
> 
> Apply this change to the Toshiba driver so that the internal helper to
> retrieve the ECC status does only take a nand_chip object.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to nand/next.
