Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blsIX-00039E-4b
 for linux-mtd@lists.infradead.org; Mon, 19 Sep 2016 06:43:25 +0000
Date: Mon, 19 Sep 2016 08:43:02 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] mtd: nand: automate NAND timings selection
Message-ID: <20160919064302.72upn6bd5dlyyv2v@pengutronix.de>
References: <1473928373-8680-1-git-send-email-s.hauer@pengutronix.de>
 <20160916141918.0353f65f@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160916141918.0353f65f@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 16, 2016 at 02:19:18PM +0200, Boris Brezillon wrote:
> On Thu, 15 Sep 2016 10:32:44 +0200
> Sascha Hauer <s.hauer@pengutronix.de> wrote:
> 
> > This series aims at automating the NAND timings selection which is
> > currently supposed to be done in each NAND controller driver, thus
> > simplifying drivers implementation.
> > 
> > As suggested by Boris this version of the series introduces a nand_reset()
> > function which replaces the several open coded NAND_CMD_RESET commands
> > in the code. This makes sure we can apply the timing each time after
> > after reset.
> > 
> > Also I have brought back the conversion patch for teh sunxi driver whic
> > was part of Boris initial posting. It's untested due to the lack of hardware,
> > so please test before applying.
> 
> Applied after fixing a few coding style issues (to make checkpatch
> happy), and exporting the onfi_init_data_interface() function (not sure
> it's the best solution, but at least, it's consistent with the other
> functions defined in nand_timings.c).

Thanks Boris.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
