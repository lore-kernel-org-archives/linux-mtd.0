Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DTzUw-0008AW-0E
	for linux-mtd@lists.infradead.org; Fri, 06 May 2005 05:51:55 -0400
Date: Fri, 6 May 2005 11:51:08 +0200
From: Sascha Hauer <sascha@saschahauer.de>
To: Todd Poynor <tpoynor@mvista.com>
Message-ID: <20050506095107.GC28621@herry.saufen>
References: <20050502090308.GA16890@metis.pengutronix.de>
	<42795404.3010601@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42795404.3010601@mvista.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: enable_vpp / disable_vpp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 04, 2005 at 04:00:20PM -0700, Todd Poynor wrote:
> Sascha Hauer wrote:
> >Hi all,
> >
> >I'm using cfi_cmdset_0001.c (intel strata) on a custom pxa board. Our
> >mapping driver implements enable_vpp and disable_vpp. We often receive
> >"Chip reports voltage low on erase" errors. The driver seems to disable
> >vpp during erase operations. If I short-ciruit the disable_vpp function
> >everything works fine. A comment gives a hint on how to do this correct:
> >
> >/* We should really make set_vpp() count, rather than doing this */
> >
> >Is this feature planned for the future? 
> 
> One stab at this was
> http://lists.infradead.org/pipermail/linux-mtd/2005-January/011517.html
> 

I tried something similar. I copied enable_vpp and disable_vpp from the
dilnetpc, which does exactly that. It did not solve my problem, so maybe
counting is not enough. I can't remember how it behaved, but I think I
had one enable_vpp and one disable_vpp, but too early.

Sascha
