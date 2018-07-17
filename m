Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffOd0-0003ke-LL
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 11:58:52 +0000
Date: Tue, 17 Jul 2018 13:58:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 1/3] mtd: rawnand: better name for the controller
 structure
Message-ID: <20180717135837.29afdbde@xps13>
In-Reply-To: <20180717134950.69b59136@bbrezillon>
References: <20180717095454.27935-1-miquel.raynal@bootlin.com>
 <20180717095454.27935-2-miquel.raynal@bootlin.com>
 <20180717134950.69b59136@bbrezillon>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 17 Jul 2018
13:49:50 +0200:

> On Tue, 17 Jul 2018 11:54:52 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > In the raw NAND core, a NAND chip is described by a nand_chip structure,
> > while a NAND controller is described with a nand_hw_control structure
> > which is not very meaningful. 'control' is misleading and 'hw' has no
> > meaning here has it refers to hardware ECC operations only,  
> 
> I don't think hw refers to hardware ECC, but I agree that
> nand_controller is a better name for this structure.
> 
> How about dropping the last sentence?

Do you mean, removing
"'control' is misleading [...] which is too restrictive"
or
"Rename this structure nand_controller"
?

> 
> > which is too
> > restrictive.
> > 
> > Rename this structure nand_controller.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  
> 
> Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>
> 
