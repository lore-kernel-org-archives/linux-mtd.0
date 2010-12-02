Received: from lilly.ping.de ([83.97.42.2])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO5OE-00022t-Lf
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 09:23:47 +0000
Date: Thu, 2 Dec 2010 10:17:33 +0100
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS oops after remount ro
Message-ID: <20101202091733.GM23237@leila.ping.de>
References: <20101126135005.GV23237@leila.ping.de>
	<1290785057.2552.14.camel@localhost>
	<20101129131807.GB23237@leila.ping.de>
	<1291040469.2141.10.camel@koala>
	<20101129151729.GE23237@leila.ping.de>
	<1291049157.2141.17.camel@koala>
	<20101129170223.GF23237@leila.ping.de>
	<1291260934.14534.6.camel@koala>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291260934.14534.6.camel@koala>
From: wolfgang@leila.ping.de (Wolfgang Wegner)
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Thu, Dec 02, 2010 at 05:35:34AM +0200, Artem Bityutskiy wrote:
> 
> Mostly vendors change drivers and board files. They usually do not touch
> core functionality. So you can try to merge 2.6.32

there had in fact been some special ARM and/or kirkwood things in this
2.6.32 release, but meanwhile this is all integrated into mainline, as
far as I can see.

> Probably 2.6.35 would be good.

I merged our (very few) local changes into 2.6.36 and am now running
this.

> Anyway, the problem is that I do not really have time to drive you
> through debugging of your issue. I only have time to get "big" results
> from you and provide some help in form of my opinion :-(

Thank you very much for your hints and help so far!

The big result I can give is that I already got this oops once with
2.6.36, too - but could not reproduce it. I also have some other thing
to fix right now, but in case I get back to the problem, I will of
course post results (if any) - thanks to you I now got some pointers
where I can start debugging, this is already great and valuable help.

Regards,
Wolfgang
