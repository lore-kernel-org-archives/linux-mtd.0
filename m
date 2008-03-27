Received: from smtp123.sbc.mail.sp1.yahoo.com ([69.147.64.96])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JezVD-0004bA-MG
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 21:19:16 +0000
From: David Brownell <david-b@pacbell.net>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: some minor issues with 2.6.25-rc6-git7-default
Date: Thu, 27 Mar 2008 14:18:44 -0700
References: <212011377@web.de> <200803271222.41579.david-b@pacbell.net>
	<20080327134150.5f79dc0b.akpm@linux-foundation.org>
In-Reply-To: <20080327134150.5f79dc0b.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200803271418.44944.david-b@pacbell.net>
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

On Thursday 27 March 2008, Andrew Morton wrote:
> 
> > And there's a regression in mtd/maps/phsymap.c which should
> > be resolved before 2.6.25 ships ... on some platforms it
> > newly likes to oops on reboot.
> 
> I don't appear to have anything which touches physmap.c here.
> 
> > I don't have a URL for that patch, but ISTR it's been
> > posted both to LKML and to linux-MTD.  (That doesn't
> > include less-good versions I've seen too.)  If needed,
> > I can dig it up, but I've been thinking this should have
> > a signoff from MTD folk.
> 
> Yes, please dig it out and let's look at it.

Posted 13-March, but it wasn't quite new then:

  http://marc.info/?l=linux-kernel&m=120542496625709&w=2

I'll forward it again.
