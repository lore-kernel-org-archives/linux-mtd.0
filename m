Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjWal-0000Ze-R0
 for linux-mtd@lists.infradead.org; Mon, 12 Sep 2016 19:08:34 +0000
Date: Mon, 12 Sep 2016 21:08:10 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mason <slash.tmp@free.fr>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Marc Gonzalez
 <marc_gonzalez@sigmadesigns.com>, Richard Weinberger <richard@nod.at>,
 Sebastian Frias <sf84@laposte.net>, Jean-Baptiste Lescher
 <jblescher@gmail.com>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>
Subject: Re: [PATCH v3] mtd: nand: tango: import driver for tango chips
Message-ID: <20160912210810.79ac23c9@bbrezillon>
In-Reply-To: <57D5530B.2060209@free.fr>
References: <57C94E33.6070304@sigmadesigns.com>
 <20160905091450.017e4aa3@bbrezillon> <57CD4672.1010504@free.fr>
 <20160905131516.0acb8145@bbrezillon>
 <57D189E1.3020508@sigmadesigns.com>
 <57D193C5.8040004@sigmadesigns.com>
 <57D2DF96.7060705@sigmadesigns.com> <57D5530B.2060209@free.fr>
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

On Sun, 11 Sep 2016 14:50:19 +0200
Mason <slash.tmp@free.fr> wrote:

> On 09/09/2016 18:13, Marc Gonzalez wrote:
> 
> > This driver supports the NAND Flash controller embedded in recent
> > Tango chips, such as SMP8758 and SMP8759.
> > 
> > Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> > ---
> >  drivers/mtd/nand/Kconfig      |   6 +
> >  drivers/mtd/nand/Makefile     |   1 +
> >  drivers/mtd/nand/tango_nand.c | 482 ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 489 insertions(+)
> >  create mode 100644 drivers/mtd/nand/tango_nand.c  
> 
> Still on the TODO/MAYBE list:
> 
> 1) Remove the cast in tango_write_page

Nice to have (especially since it's not required at all: do_dma() can
take a const void *)

> 2) Update stats.failed

Mandatory.

> 3) Implement read/write_oob

Mandatory. I've seen your questions on the #mtd chan regarding the
usefulness of ->read/write_oob(). I agree that most of the time it's
not needed, but some MTD users depends on it.

> 4) Report OOB layout to framework (?)

Mandatory. For the exact same reason.

> 5) Tweak (?) Peripheral Bus setup (timings and CS config)

That's up to you, but I'd recommend to sort this out before submitting
the next version.

> 6) Write device_cfg register (or report weirdness as a bug)

I don't get this one.
