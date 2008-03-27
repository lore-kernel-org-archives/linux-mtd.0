Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jeyvd-0002RD-BS
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 20:42:29 +0000
Date: Thu, 27 Mar 2008 13:41:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Brownell <david-b@pacbell.net>
Subject: Re: some minor issues with 2.6.25-rc6-git7-default
Message-Id: <20080327134150.5f79dc0b.akpm@linux-foundation.org>
In-Reply-To: <200803271222.41579.david-b@pacbell.net>
References: <212011377@web.de> <200803260010.25327.rjw@sisk.pl>
	<20080325164236.1061d403.akpm@linux-foundation.org>
	<200803271222.41579.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: devzero@web.de, linux-ide@vger.kernel.org, greg@kroah.com,
	linux-kernel@vger.kernel.org, rjw@sisk.pl,
	linux-acpi@vger.kernel.org, linux-mtd@lists.infradead.org,
	alan@lxorguk.ukuu.org.uk, lenb@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 27 Mar 2008 12:22:41 -0700
David Brownell <david-b@pacbell.net> wrote:

> On Tuesday 25 March 2008, Andrew Morton wrote:
> > 
> > > > Mar 23 09:17:02 opensuse103 kernel: physmap-flash: probe of physmap-flash.0 failed with error -12
> > 
> > There are many physmap-flashes in the tree. __Is this one
> > drivers/mtd/maps/physmap.c?
> 
> And there's a regression in mtd/maps/phsymap.c which should
> be resolved before 2.6.25 ships ... on some platforms it
> newly likes to oops on reboot.

I don't appear to have anything which touches physmap.c here.

> I don't have a URL for that patch, but ISTR it's been
> posted both to LKML and to linux-MTD.  (That doesn't
> include less-good versions I've seen too.)  If needed,
> I can dig it up, but I've been thinking this should have
> a signoff from MTD folk.

Yes, please dig it out and let's look at it.
