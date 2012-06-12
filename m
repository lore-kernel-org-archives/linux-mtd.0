Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeTp9-0005gG-LD
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 16:20:09 +0000
Date: Tue, 12 Jun 2012 18:20:04 +0200
From: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
To: Alex Gershgorin <alexg@meprolight.com>
Subject: Re: mtd mxc_nand: mx35 kernel panic during request to read Device	ID
Message-ID: <20120612162004.GS30400@pengutronix.de>
References: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD332F@MEP-EXCH.meprolight.com>
 <20120612115008.GT22191@pengutronix.de>
 <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3330@MEP-EXCH.meprolight.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4875438356E7CA4A8F2145FCD3E61C0B2CD8AD3330@MEP-EXCH.meprolight.com>
Cc: "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 12, 2012 at 03:13:47PM +0300, Alex Gershgorin wrote:
> Hi Alex,
> 
> > On Tue, Jun 12, 2012 at 01:35:57PM +0300, Alex Gershgorin wrote:
> > In kernel 3.4, I have not encountered this problem
> 
> > > Which version did you test? Does reverting
> 
> I tested with v3.5-rc1 and v3.5-rc2, in two cases, I get a kernel panic
> 
> >> 4b6f05e14df163e319bc85ca6e35d2720a91207d help? If so Sascha's patch send
> >> with Message-Id:
> >> 1338279369-25915-1-git-send-email-s.hauer@pengutronix.de might help you.
> 
> I'm using v3.5-rc2 + that starts from commit 7452ca511c217b9d7bbadf4680018555c7d9a7ce,
> this includes Sasha's patch

You need this one:

http://patchwork.ozlabs.org/patch/161373/

This is not yet in Linus' tree

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
