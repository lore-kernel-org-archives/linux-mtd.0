Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbuxx-0006iF-BL
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 13:38:06 +0000
Date: Wed, 29 Jun 2011 14:31:24 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [RFC PATCH] MTD: atmel_nand: optimize read/write buffer functions
Message-ID: <20110629133124.GO21898@n2100.arm.linux.org.uk>
References: <1309261856-27402-1-git-send-email-nicolas.ferre@atmel.com>
	<20110628111043.GH6588@pengutronix.de>
	<20110628145937.GG21898@n2100.arm.linux.org.uk>
	<4E0B2427.9020202@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E0B2427.9020202@atmel.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: hong.xu@atmel.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 29, 2011 at 03:09:59PM +0200, Nicolas Ferre wrote:
> Le 28/06/2011 16:59, Russell King - ARM Linux :
> > I think you need to read Documentation/bus-virt-phys-mapping.txt,
> > particularly the part after "NOTE NOTE NOTE".
> > 
> > Dereferencing ioremap'd memory is not permitted.  That includes passing
> > it to memcpy.  Even with a cast.
> 
> So that means that I should use memcpy_fromio() even if the code if far
> less optimized.
> 
> Shouldn't I re-implement some kind of IO copying function to deal with
> this IO memory so that I could take advantage of 8 words bursts?

You could improve the IO memcpy/set etc implementations, which are
currently mostly unloved - I think that's a catch-22 which really needs
solving.  They're not efficient because no one has taken the time to use
them, and everyone's avoiding them because they're not very efficient.
So, as no one's using them no one's motivated to improve them.
