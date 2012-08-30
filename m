Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6yHZ-0002mb-PV
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 06:31:15 +0000
Date: Thu, 30 Aug 2012 08:31:07 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH resend] i.MX53 Nand support
Message-ID: <20120830063107.GD26594@pengutronix.de>
References: <1346226019-23560-1-git-send-email-s.hauer@pengutronix.de>
 <1346308145.2848.529.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346308145.2848.529.camel@sauron.fi.intel.com>
Cc: Roland Stigge <stigge@antcom.de>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 30, 2012 at 09:29:05AM +0300, Artem Bityutskiy wrote:
> On Wed, 2012-08-29 at 09:40 +0200, Sascha Hauer wrote:
> > Hi All,
> > 
> > The following patches add i.MX53 and dt support to mxc_nand. This
> > is only a resent based on v3.6-rc3 as it seems this series slipped
> > through the cracks last time I posted it.
> > 
> > So Artem, if there are no objections, please consider applying up to
> > 3/4, I would then take 4/4 through my tree.
> 
> Please, take a look at the l2-mtd.git tree, I already have all these
> patches. Actually, they are already in dwmw2's tree, the and were
> supposed to be merged already, but unfortunately the merge window was
> missed because (a) dwmw2 did not send a pull request early enough and
> (b) Linus decided to punish late pull-request senders and closed the
> merge window 2 days earlier than usually.

Ah, I missed to check the tree. Sorry for the noise then.

Thanks
 Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
