Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KW9hH-0003Ak-DP
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 12:55:28 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Nick Piggin <nickpiggin@yahoo.com.au>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Date: Thu, 21 Aug 2008 14:53:25 +0200
References: <48AD00C4.6060302@gmail.com> <48AD42AE.4030107@de.ibm.com>
	<200808212043.51209.nickpiggin@yahoo.com.au>
In-Reply-To: <200808212043.51209.nickpiggin@yahoo.com.au>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808211453.26233.arnd@arndb.de>
Cc: linux-embedded@vger.kernel.org, carsteno@de.ibm.com,
	=?iso-8859-1?q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 21 August 2008, Nick Piggin wrote:
> On Thursday 21 August 2008 20:25, Carsten Otte wrote:
> > Jared Hulbert wrote:
> > > I'd like to get a first round of review on my AXFS filesystem.
> >
> > I like the general approach of it. It's much more flexible than the
> > ext2 extension I've done, and the possibility to select XIP vs.
> > compression per page is really really neat. I can imagine that people
> > will prefer this over the ext2 implementation on s390. It is unclear
> > to me how the "secondary block device" thing is supposed to work.
> > Could you elaborate a bit on that?
> 
> Agreed. I haven't had a good look through it yet, but at a glance it
> looks pretty neat. The VM side of things looks pretty reasonable
> (I fear XIP faulting might have another race or two, but that's a
> core mm issue rather than filesystem specific).

Yes, I also like the file system, I guess this is 2.6.28 material and
you should have it added to linux-next when you have addressed the
comments so far.

One thing that would be really nice is if you could add fake-write
support in the way that I proposed for cramfs a few months ago.
This would make axfs much more interesting for another set of
users, and keep cramfs a really simple example file system.

	Arnd <><
