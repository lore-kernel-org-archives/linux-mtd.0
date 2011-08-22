From: Marek Vasut <marek.vasut@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v9 2/3] MTD : add helper functions library and header
	files for GPMI NAND driver
Date: Mon, 22 Aug 2011 13:20:55 +0200
References: <1313581828-16625-1-git-send-email-b32955@freescale.com>
	<201108201346.21647.marek.vasut@gmail.com>
	<4E51E33C.8090800@freescale.com>
In-Reply-To: <4E51E33C.8090800@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201108221320.55929.marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, koen.beel.barco@gmail.com, shijie8@gmail.com,
	w.sang@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, August 22, 2011 07:03:56 AM Huang Shijie wrote:
> Hi,
> 
> > On Wednesday, August 17, 2011 01:50:27 PM Huang Shijie wrote:
> >> bch-regs.h : registers file for BCH module
> >> gpmi-regs.h: registers file for GPMI module
> >> gpmi-lib.c: helper functions library.
> >> 
> >> Signed-off-by: Huang Shijie<b32955@freescale.com>
> >> ---

[...]

> >> +err_out:
> >> +	return ret;
> >> +}
> >> +
> >> +/* This is very useful! */
> > 
> > Really? Cool, what for ?
> > btw. this should really be enclosed in some #ifdef debug or whatnot.
> 
> Yes, it shows the register contents when DMA timeout occurs.
> this routine is called only when error occurs.
> 
Hi,

I'd expect exactly this explanation to be in the comment ;-)

Cheers
