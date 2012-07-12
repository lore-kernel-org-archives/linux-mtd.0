Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpDLC-00018h-AO
 for linux-mtd@lists.infradead.org; Thu, 12 Jul 2012 06:57:35 +0000
Date: Thu, 12 Jul 2012 08:57:22 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: mxc-nand fix for 3.5 (Was: Re: [PATCH v2] mtd mxc_nand: use 32bit
 copy functions)
Message-ID: <20120712065722.GA592@pengutronix.de>
References: <1338279369-25915-1-git-send-email-s.hauer@pengutronix.de>
 <1340970369.3070.166.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1340970369.3070.166.camel@sauron.fi.intel.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 29, 2012 at 02:46:09PM +0300, Artem Bityutskiy wrote:
> On Tue, 2012-05-29 at 10:16 +0200, Sascha Hauer wrote:
> > The following commit changes the function used to copy from/to
> > the hardware buffer to memcpy_[from|to]io. This does not work
> > since the hardware cannot handle the byte accesses used by these
> > functions. Instead of reverting this patch introduce 32bit
> > correspondents of these functions.
> 
> Pushed to l2-mtd.git, thanks!
The mxc_nand driver is completely useless with

	5775ba3 (mtd: mxc_nand: fix several sparse warnings about incorrect address space)

but without this patch. So it would be great if we could have it in 3.5.
Or alternatively revert 5775ba3. This fix currently it sits as

	096bcc2 (mtd: mxc_nand: use 32bit copy functions)

in next/master.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
