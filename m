Received: from florence.buici.com ([206.124.142.26])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BZfkX-0005zX-0B
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2004 20:54:58 -0400
Date: Sun, 13 Jun 2004 17:54:55 -0700
From: Marc Singer <elf@buici.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20040614005455.GA4070@buici.com>
References: <20040613214329.GA2282@buici.com>
	<200406140207.48467.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200406140207.48467.tglx@linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD Maps driver for Sharp LH7a40x
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 14, 2004 at 02:07:48AM +0200, Thomas Gleixner wrote:
> On Sunday 13 June 2004 23:43, Marc Singer wrote:
> > I've removed the ununsed, if-def's and commented, code from the
> > driver.
> >
> > As for the C_MAPS loop, there doesn't seem to be a good way to remove
> > it.  Even though there is only one 'chip', we still the map_info
> > structure for the simple_map_init() and friends.  The number of code
> > code bytes to be saved is nomimal.  The change would be to remove the
> > array references.  How do they make the code 'confusing'?
> 
> That's not a question of code bytes. 
> 
> Why does this code need a for (i = 0; i < C_MAPS;...) loop, if there is only 
> one chip which has to be detected, neglected or whatever and C_MAPS is 
> therefor 1 ?

You originally stated that you thought it made the driver 'confusing'.
I'm not seeing how this makes it confusing.

> 
> In fact the whole driver could be replaced by command line options.

So can the memory map.  The presence of a command line option doesn't
make it a good idea to use it. 

Let me put this a different way.  Are you saying that you'll apply the
patch if I remove the loop?

Cheers.
