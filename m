Received: from smtp122.sbc.mail.sp1.yahoo.com ([69.147.64.95])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jeyny-0004zP-Tu
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 20:34:35 +0000
From: David Brownell <david-b@pacbell.net>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-mtd@lists.infradead.org
Subject: Re: some minor issues with 2.6.25-rc6-git7-default
Date: Thu, 27 Mar 2008 12:22:41 -0700
References: <212011377@web.de> <200803260010.25327.rjw@sisk.pl>
	<20080325164236.1061d403.akpm@linux-foundation.org>
In-Reply-To: <20080325164236.1061d403.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200803271222.41579.david-b@pacbell.net>
Cc: devzero@web.de, linux-ide@vger.kernel.org, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>,
	ACPI Devel Mailing List <linux-acpi@vger.kernel.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>, Len Brown <lenb@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 25 March 2008, Andrew Morton wrote:
> 
> > > Mar 23 09:17:02 opensuse103 kernel: physmap-flash: probe of physmap-flash.0 failed with error -12
> 
> There are many physmap-flashes in the tree.  Is this one
> drivers/mtd/maps/physmap.c?

And there's a regression in mtd/maps/phsymap.c which should
be resolved before 2.6.25 ships ... on some platforms it
newly likes to oops on reboot.

I don't have a URL for that patch, but ISTR it's been
posted both to LKML and to linux-MTD.  (That doesn't
include less-good versions I've seen too.)  If needed,
I can dig it up, but I've been thinking this should have
a signoff from MTD folk.

- Dave
