Subject: Re: [PATCH] mtd/maps: add mtd-ram support to physmap_of
From: Artem Bityutskiy <dedekind@infradead.org>
To: Grant Likely <grant.likely@secretlab.ca>
In-Reply-To: <fa686aa40908072243x56d2160fk688149f4b7b912ae@mail.gmail.com>
References: <1247834363-28198-1-git-send-email-w.sang@pengutronix.de>
	<fa686aa40908072243x56d2160fk688149f4b7b912ae@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 09 Aug 2009 08:17:23 +0300
Message-Id: <1249795043.9157.37.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree-discuss@ozlabs.org, Vitaly Wool <vwool@ru.mvista.com>,
	Albrecht =?ISO-8859-1?Q?Dre=DF?= <albrecht.dress@arcor.de>,
	Wolfram Sang <w.sang@pengutronix.de>, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, Ken MacLeod <ken@bitsko.slc.ut.us>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-08-07 at 23:43 -0600, Grant Likely wrote:
> On Fri, Jul 17, 2009 at 6:39 AM, Wolfram Sang<w.sang@pengutronix.de> wrote:
> > Use physmap_of to access RAMs as mtd and add documenation for it. This approach
> > is a lot less intrusive as adding an of-wrapper around plat-ram.c. As most
> > extensions of plat-ram.c (e.g. custom map-functions) can't be mapped to the
> > device tree anyhow, extending physmap_of seems to be the cleanest approach.
> >
> > Tested with a phyCORE-MPC5121e.
> >
> > Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> 
> Looks good to me.
> 
> Acked-by: Grant Likely <grant.likely@secretlab.ca>

This patch is sitting in my l2-mtd-2.6.git tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
