Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTUDH-0002wi-JM
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 05:18:00 +0000
Date: Wed, 22 Jul 2009 07:17:39 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Nicolas Pitre <nico@marvell.com>
Subject: Re: [PATCH] register orion_nand using platform_driver_probe
Message-ID: <20090722051739.GA614@pengutronix.de>
References: <alpine.LFD.2.00.0907141211260.3138@xanadu.home>
	<1248209196-15705-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<alpine.LFD.2.00.0907211822330.30629@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.2.00.0907211822330.30629@xanadu.home>
Cc: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Saeed Bishara <saeed@marvell.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lennert Buijtenhek <buytenh@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nicolas,

On Tue, Jul 21, 2009 at 06:26:50PM -0400, Nicolas Pitre wrote:
> On Tue, 21 Jul 2009, Uwe Kleine-König wrote:
> 
> > orion_nand_probe lives in .init.text, so using platform_driver_register
> > to register it is wrong because binding a device after the init memory
> > is discarded (e.g. via sysfs) results in an oops.
> > 
> > As requested by Nicolas Pitre platform_driver_probe is used instead of
> > moving the probe function to .devinit.text as proposed initially.
> > This saves some memory, but devices registered after the driver is
> > probed are not bound (probably there are none) and binding via sysfs
> > isn't possible.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > Cc: Lennert Buytenhek <buytenh@marvell.com>
> > Cc: Saeed Bishara <saeed@marvell.com>
> > Cc: Jörn Engel <joern@logfs.org>
> > Cc: Nicolas Pitre <nico@marvell.com>
> > Cc: Tzachi Perelstein <tzachi@marvell.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Greg Kroah-Hartman <gregkh@suse.de>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: linux-mtd@lists.infradead.org
> 
> Acked-by: Nicolas Pitre <nico@marvell.com>
Did you test if all devices bind as expected?
 
> Thanks.  BTW Tzachi's email address is no longer valid.
Yes, I got a mail from Marvell's mailer daemon stating the same.  :-)

Best regards
Uwe

-- 
Pengutronix e.K.                              | Uwe Kleine-König            |
Industrial Linux Solutions                    | http://www.pengutronix.de/  |
