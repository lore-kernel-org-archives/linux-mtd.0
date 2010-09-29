Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0wQx-0007wY-6m
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 13:10:55 +0000
Subject: Re: [RFC] Online firmware upgrade in non-embedded systems
From: Ben Hutchings <bhutchings@solarflare.com>
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
In-Reply-To: <4CA334FA.2080707@gmx.net>
References: <1285696787.2282.45.camel@achroite.uk.solarflarecom.com>
	<4CA26F35.6060408@gmx.net>
	<1285763700.2283.6.camel@achroite.uk.solarflarecom.com>
	<4CA334FA.2080707@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 29 Sep 2010 14:10:50 +0100
Message-ID: <1285765850.2283.15.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: netdev <netdev@vger.kernel.org>,
	sf-linux-drivers <linux-net-drivers@solarflare.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	flashrom <flashrom@flashrom.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-29 at 14:45 +0200, Carl-Daniel Hailfinger wrote:
> On 29.09.2010 14:35, Ben Hutchings wrote:
> > On Wed, 2010-09-29 at 00:41 +0200, Carl-Daniel Hailfinger wrote:
> >   
> >> [adding flashrom@flashrom.org to CC, senders will be whitelisted after a
> >> short delay]
> >>
> >> On 28.09.2010 19:59, Ben Hutchings wrote:
> >>     
> >>> Network and disk controllers normally have at least some firmware in
> >>> flash to support their use as boot devices. [...]
> >>>   
> >>>       
> >> Given that the flashrom utility <http://www.flashrom.org/> (GPLv2)
> >> supports flashing many network cards, SATA/PATA controllers, graphics
> >> cards, and of course the main system firmware/BIOS/EFI, and it does that
> >> from userspace without any kernel support,
> >>     
> > [...]
> >
> > I'm looking for a clean solution, not a hack.
> >   
> 
> What would qualify as a clean solution?

One where hardware access is mediated by the kernel, and doesn't involve
unloading or potentially conflicting with the driver for that hardware.

> And is cross-platform code one of your goals?

Not at this level.  At the application level, yes, but we already have a
working application so I'm not interested in using flashrom for that.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
