Received: from gateway-1237.mvista.com ([12.44.186.158] helo=orion.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BbTMK-0001lw-Ae
	for linux-mtd@lists.infradead.org; Fri, 18 Jun 2004 20:05:28 -0400
Date: Fri, 18 Jun 2004 17:05:14 -0700
From: Jun Sun <jsun@mvista.com>
To: Marc Singer <elf@buici.com>
Message-ID: <20040618170514.A6101@mvista.com>
References: <20040613214329.GA2282@buici.com>
	<200406140207.48467.tglx@linutronix.de>
	<20040614005455.GA4070@buici.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20040614005455.GA4070@buici.com>;
	from elf@buici.com on Sun, Jun 13, 2004 at 05:54:55PM -0700
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD Maps driver for Sharp LH7a40x
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 13, 2004 at 05:54:55PM -0700, Marc Singer wrote:
> On Mon, Jun 14, 2004 at 02:07:48AM +0200, Thomas Gleixner wrote:
> > On Sunday 13 June 2004 23:43, Marc Singer wrote:
> > > I've removed the ununsed, if-def's and commented, code from the
> > > driver.
> > >
> > > As for the C_MAPS loop, there doesn't seem to be a good way to remove
> > > it.  Even though there is only one 'chip', we still the map_info
> > > structure for the simple_map_init() and friends.  The number of code
> > > code bytes to be saved is nomimal.  The change would be to remove the
> > > array references.  How do they make the code 'confusing'?
> > 
> > That's not a question of code bytes. 
> > 
> > Why does this code need a for (i = 0; i < C_MAPS;...) loop, if there is only 
> > one chip which has to be detected, neglected or whatever and C_MAPS is 
> > therefor 1 ?
> 
> You originally stated that you thought it made the driver 'confusing'.
> I'm not seeing how this makes it confusing.
> 
> > 
> > In fact the whole driver could be replaced by command line options.
> 
> So can the memory map.  The presence of a command line option doesn't
> make it a good idea to use it. 
> 
> Let me put this a different way.  Are you saying that you'll apply the
> patch if I remove the loop?
> 

How about just using physmap mapping driver and keep all your
board specific stuff to your board directory?   See include/linux/mtd/physmap.h
for more details.

Jun
