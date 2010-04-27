Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6l8V-0000s5-Tn
	for linux-mtd@lists.infradead.org; Tue, 27 Apr 2010 13:47:40 +0000
Date: Tue, 27 Apr 2010 14:47:37 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCHv2 1/2] MTD: cfi_cmdset_0002: Add reboot notifier for AMD
	flashes
Message-ID: <20100427134737.GB25405@shareable.org>
References: <1271221078.2532.5.camel@localhost.localdomain>
	<a00f98bfcda7db841108605ebab8d07363f4aa8b@localhost.localdomain>
	<20100415025321.GB14954@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100415025321.GB14954@pengutronix.de>
Cc: dedekind1@gmail.com, saeed.bishara@gmail.com,
	Kevin Cernekee <cernekee@gmail.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Wolfram Sang wrote:
> On Wed, Apr 14, 2010 at 05:57:33PM -0700, Kevin Cernekee wrote:
> > Ensure that the flash device is in a quiescent state before rebooting.
> > The implementation is closely modeled after the cfe_cmdset_0001 reboot
> > notifier, commit 963a6fb0a0d336d0513083b7e4b5c3ff9d6d2061 .
> > 
> > Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> 
> Yes, if this is present for Intel, it should be present for AMD, IMHO.
> 
> Acked-by: Wolfram Sang <w.sang@pengutronix.de>
> 
> Still, the correct solution is to wire the correct reset-line to the flashes.
> Above patch will not help if a watchdog kicks in. Been there :(

Isn't the patch intended to handle _software_ resets where the hard reset
line isn't toggled?

-- Jamie
