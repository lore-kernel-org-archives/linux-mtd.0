Received: from [203.63.104.245] (helo=cobalttech.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9ZtR-0000ZO-Ja
	for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2003 01:52:01 +0100
Date: Wed, 15 Oct 2003 10:50:28 +1000 (EST)
From: Michael McLellan <michael-mclellan@swsa.com.au>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1066120362.14783.140.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.53.0310151029390.12868@slop.cobalttech.com>
References: <Pine.LNX.4.53.0310141537460.12298@slop.cobalttech.com>
 <1066111607.3172.40.camel@imladris.demon.co.uk>
 <Pine.LNX.4.53.0310141638470.12391@slop.cobalttech.com>
 <1066120362.14783.140.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: mtd list <linux-mtd@lists.infradead.org>
Subject: Re: DoC Grub booting problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OK, I've worked it out.

I forgot I had to hack the code a bit to make it compile and part of that
affected stage2 stuff. I was using grub-0.93

So I compiled against the latest CVS code and all works OK.

Thanks for your help.

Mikey.

On Tue, 14 Oct 2003, David Woodhouse wrote:

> On Tue, 2003-10-14 at 16:45 +1000, Michael McLellan wrote:
> > > Don't you have to tell it that the menu.lst file is on (dc0,0) to make
> > > it look there?
> >
> > Yes I do, thats the problem.
>
> Hmmm. Look at, and add more debugging to, find_config() and
> try_config_partition() in stage2.c.
>
> Find out if they're actually being called. If not, why not -- and if so,
> why aren't they finding the config file?
>
> --
> dwmw2
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
