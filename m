Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BnH6S-0006LS-UL
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2004 09:25:49 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
In-Reply-To: <1090411396.15766.37.camel@famine>
References: <1089643331.3951.42.camel@famine>
	<1089711000.2899.96.camel@hades.cambridge.redhat.com>
	<1089712151.5995.21.camel@famine>
	<1089713133.2899.117.camel@hades.cambridge.redhat.com>
	<1089726079.6288.5.camel@famine>
	<1089759689.8822.18.camel@imladris.demon.co.uk>
	<1089792912.7607.22.camel@famine> <1090246707.13401.18.camel@famine>
	<Pine.LNX.4.58.0407191522360.4985@localhost.localdomain>
	<1090250145.14173.3.camel@famine>
	<1090285839.4149.8.camel@localhost.localdomain>
	<1090305682.14825.2.camel@famine>
	<1090331120.4614.3.camel@localhost.localdomain>
	<1090337308.15094.2.camel@famine>
	<1090338869.4614.7.camel@localhost.localdomain>
	<1090349564.15140.3.camel@famine>
	<1090361318.9473.10.camel@localhost.localdomain>
	<1090391133.15766.4.camel@famine>
	<1090410703.4280.10.camel@localhost.localdomain>
	<1090411396.15766.37.camel@famine>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jul 2004 09:25:33 -0400
Message-Id: <1090416333.4280.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, ecos-discuss@sources.redhat.com
Subject: Re: JFFS2 eats memory
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-07-21 at 14:03 +0200, Øyvind Harboe wrote:
> > Obviously I'm wrong -- you have empirical evidence. But why?
> 
> I have no idea. It is easy to reproduce in the fashion I described and
> this problem is complex enough that it takes a JFFS2 export a couple of
> rounds in the debugger to sort out. At this point I think little would
> be gained by me pursuing it.

OK, I'll look at it when I get home from OLS.

> But. What about my fix where I set jeb->gc_node to the previous element?
> Isn't that a better solution in any case?

I don't like the idea that the gc_node could go _backwards_ very much.
Although it should be fine really I'd like to know why moving it
forwards (in particular to NULL) was causing the code to break. 

If my assumptions about the behaviour were flawed, I'd like to know
precisely why. It might affect the other alternative too, just not as
obviously.

-- 
dwmw2
