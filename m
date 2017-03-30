Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctZed-0008Ro-Hf
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 12:58:21 +0000
Date: Thu, 30 Mar 2017 14:57:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, richard@nod.at,
 computersforpeace@gmail.com, thomas.petazzoni@free-electrons.com,
 marex@denx.de, cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 peterpansjtu@gmail.com, linshunquan1@hisilicon.com
Subject: Re: [PATCH v4 7/9] nand: spi: add Micron spi nand support
Message-ID: <20170330145753.66d56e02@bbrezillon>
In-Reply-To: <f2215f3c-dbbc-3580-50bc-fa1190d96fc4@gmail.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-8-git-send-email-peterpandong@micron.com>
 <f2215f3c-dbbc-3580-50bc-fa1190d96fc4@gmail.com>
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

On Thu, 30 Mar 2017 14:31:54 +0200
Arnaud Mouiche <arnaud.mouiche@gmail.com> wrote:

> > +
> > +static struct spinand_ecc_engine_ops generic_spi_ecc_engine_ops = {
> > +	.get_ecc_status = mt29f_get_ecc_status,
> > +};
> > +  
> 
> MT29F1G01AAADD already has a different ecc status mask (only 2 bits) 
> requiring a different get_ecc_status op.

Interesting. It seems that NAND/NOR manufacturers are doing the same
mistakes over and over again :-/. And it tends to confirm that having
per-vendor drivers is actually a good idea if we want to isolate
all these vendor specific handling bits from the core.

> Maybe you should add directly an entry in MICRON_SPI_NAND_INFO(...) 
> macro to specify the ecc_engine_ops.

Yep, sounds reasonable.

> 
> Also, shouldn't this generic_spi_ecc_engine_ops be a "static const struct" ?

Definitely.
