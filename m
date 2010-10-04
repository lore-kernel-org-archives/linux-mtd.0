Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P2ezw-00038F-G6
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2010 06:58:09 +0000
Date: Mon, 4 Oct 2010 08:58:02 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: mxc_nand: do not depend on disabling the irq in
	the interrupt handler
Message-ID: <20101004065802.GA13948@pengutronix.de>
References: <1285054802-21388-1-git-send-email-s.hauer@pengutronix.de>
	<1285054802-21388-2-git-send-email-s.hauer@pengutronix.de>
	<1285240612.29268.76.camel@localhost>
	<20100929072843.GC23406@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20100929072843.GC23406@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 29, 2010 at 09:28:43AM +0200, Sascha Hauer wrote:
> David,
> 
> On Thu, Sep 23, 2010 at 02:16:52PM +0300, Artem Bityutskiy wrote:
> > On Tue, 2010-09-21 at 09:40 +0200, Sascha Hauer wrote:
> > > This patch reverts the driver to enabling/disabling the NFC interrupt
> > > mask rather than enabling/disabling the system interrupt. This cleans
> > > up the driver so that it doesn't rely on interrupts being disabled
> > > within the interrupt handler.
> > > For i.MX21 we keep the current behaviour, that is calling
> > > enable_irq/disable_irq_nosync to enable/disable interrupts.
> > > This patch is based on earlier work by John Ogness.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > Acked-by: John Ogness <john.ogness@linutronix.de>
> > > Tested-by: John Ogness <john.ogness@linutronix.de>
> > 
> > I've created l2-mtd-2.6.git/for-2.6.36 branch, pushed your patch there,
> > pinged dwmw2 for you. I do not give you any guarantees this will reach
> > 2.6.36, you have to ping dwmw2.
> 
> Any chance to get this in? The mxc-nand driver is nonfunctional at the
> moment and 2.6.36 is getting closer.

Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

(for the patch and the request to get it in before 2.6.36.)

Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
