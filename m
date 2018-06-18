Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUu2a-00030Q-HM
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 13:18:00 +0000
Date: Mon, 18 Jun 2018 15:17:30 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, dwmw2@infradead.org,
 computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [RFC PATCH 1/2] mtd: rawnand: handle ONFI revision number field
 being 0
Message-ID: <20180618151730.77bb168f@bbrezillon>
In-Reply-To: <20180618150521.067ef156@xps13>
References: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
 <20180618045255.8015-2-chris.packham@alliedtelesis.co.nz>
 <20180618150521.067ef156@xps13>
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

On Mon, 18 Jun 2018 15:05:21 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Chris,
> 
> On Mon, 18 Jun 2018 16:52:54 +1200, Chris Packham
> <chris.packham@alliedtelesis.co.nz> wrote:
> 
> > Some Micron NAND chips (MT29F1G08ABAFAWP-ITE:F) report 00 00 for the
> > revision number field of the ONFI parameter page. Rather than rejecting
> > these outright assume ONFI version 1.0 if the revision number is 00 00.
> >   
> 
> Thanks for getting your hands into this.
> 
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> > At the moment I haven't qualified this check on anything, I should
> > probably at least include vendor == MICRON.  
> 
> The more I think about it the more I convince myself that this is not
> needed. If the 4 first bytes are "ONFI", then the chip is ONFI...
> 
> Then what you do below is simple and readable and (sadly) probably
> right.

Hm, I'm not entirely convinced considering version = 0 <=> version = 1
is the right thing to do. Clearly, we don't know if other chips are
also broken WRT version field but the actual version might differ.

I'd recommend letting the manufacturer driver fix the param page
instead of guessing what has to been done in the core. That means
adding a new hook to nand_manufacturer_ops (->fixup_onfi_param_page()?)
and calling it just after the CRC has been checked [1].

[1]https://elixir.bootlin.com/linux/v4.18-rc1/source/drivers/mtd/nand/raw/nand_base.c#L5170
