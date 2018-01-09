Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYrlq-0008B3-HU
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 11:08:44 +0000
Date: Tue, 9 Jan 2018 12:08:29 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, kernel@pengutronix.de
Subject: Re: [PATCH v2] mtd: tests: nandbiterrs: Fix read_page return value
Message-ID: <20180109110829.tteckyyt2lzkz2t4@pengutronix.de>
References: <20180109094702.21488-1-s.hauer@pengutronix.de>
 <20180109105108.4ece18cf@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109105108.4ece18cf@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 09, 2018 at 10:51:08AM +0100, Boris Brezillon wrote:
> On Tue,  9 Jan 2018 10:47:02 +0100
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > The number of corrected bitflips is not correctly reported by
> > the test until the bitflip threshold is reached.
> > 
> > read_page() shall return the number of corrected bitflips, but
> > mtd_read() returns 0 or a negative error, so we can't forward
> > its return value. In the absence of an error we always have
> > calculate the number of bitflips ourselves.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> I'll apply this patch, but you should really start using the userspace
> tests provided by mtd-utils, because I still plan to remove the
> in-kernel test modules at some point ;-).

Please do so. When I cannot find the in-kernel tests anymore I'll recall
that there are tests in userspace ;)

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
