Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7eJw-0004Yp-FR
	for linux-mtd@lists.infradead.org; Wed, 15 Sep 2004 14:15:57 -0400
To: Pantelis Antoniou <panto@intracom.gr>
References: <41457E01.6060507@intracom.gr>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 15 Sep 2004 12:15:51 -0600
In-Reply-To: <41457E01.6060507@intracom.gr>
Message-ID: <m3pt4n8kko.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: MTD lock support for AMD_STD flash.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pantelis Antoniou <panto@intracom.gr> writes:

> Hi there
> 
> While trying to get MTD in 2.6 working in my board I stubbled on
> this.
> 
> The lock/unlock logic does not seem to work for AMD STD jedec flashes.

Right.  We got away with this for a while because the on devices
without lock/unlock methods people usually don't call them.
 
> This happens when trying to lock a block for MX29LV040C, and I think
> will happen with all AMD STD flashes.
> 
> The thing is that these chips don't have support for locking, but I can't
> find a way to declare it in the command set.
> 
> So the way to avoid this I set the lock & unlock methods in my map file.
> 
> This is a gross hack however and I'm wondering if there's an easier way...

Yes.  It should already be committed into MTD cvs.  Please check it out.
With a little luck I will start pushing these changes to 2.6 in the next
day or so.

Eric
