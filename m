Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJlaz-0008J3-2I
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 20:03:22 +0000
Date: Fri, 18 May 2018 22:02:59 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Nicholas Mc Guire <der.herr@hofr.at>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH V2 RFC] mtd: spi-nor: intel: provide a range for
 poll_timout
Message-ID: <20180518220259.04a85a05@bbrezillon>
In-Reply-To: <20170214094724.GB15721@lahna.fi.intel.com>
References: <1486973622-1072-1-git-send-email-der.herr@hofr.at>
 <20170214094724.GB15721@lahna.fi.intel.com>
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

On Tue, 14 Feb 2017 11:47:24 +0200
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> On Mon, Feb 13, 2017 at 09:13:42AM +0100, Nicholas Mc Guire wrote:
> > The overall poll time here is INTEL_SPI_TIMEOUT * 1000 which is
> > 5000 * 1000 - so 5seconds and it is coded as a tight loop here delay_us
> > to readl_poll_timeout() is set to 0. As this is never called in an atomic
> > context sleeping should be no issue and there is no reasons for the
> > tight-loop here.
> > 
> > Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>  
> 
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Queued to spi-nor/next.

Thanks,

Boris

> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
