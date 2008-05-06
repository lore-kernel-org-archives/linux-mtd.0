Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtAqG-0005sa-1L
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 00:15:36 +0000
Date: Tue, 6 May 2008 10:15:15 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
Message-ID: <20080506001514.GA12796@cloud.net.au>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501202523.GA17828@logfs.org>
	<fe810cf0805040146y64ffcb66vfbf2c4aa82eabfd4@mail.gmail.com>
	<20080505073745.GA13916@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080505073745.GA13916@logfs.org>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 05, 2008 at 09:37:45AM +0200, Jörn Engel wrote:
> On Sun, 4 May 2008 12:46:31 +0400, Alexander Belyakov wrote:
> > On Fri, May 2, 2008 at 12:25 AM, Jörn Engel <joern@logfs.org> wrote:
> > >
> > > ...and creates a peculiar conflict of interests in me.  I've added full
> > > caching of the complete mtd in logfs, which gave a huge speedup to some
> > > of my testcases.  However caching is done in page granularity, therefore
> > > it would completely defeat this patch, which also gives a speedup.
> > 
> > There is a special case for page aligned data where generic
> > read_page() is being used instead of read_subpage(). I believe logfs
> > caching won't suffer from this patch.
> 
> Actually, logfs caching would help jffs2 as well, as soon as you have
> several parallel readers.  It should be made generic mtd caching.  And
> when made generic, it would effectively defeat this patch, as all reads
> would be (DRAM-) pagesized.

.. and therefore performance would be worse for UBI attach, for example.
Caching only makes sense when you can read extra data at no cost. Unless
you can find some way to cache while idle but abort if it is delaying
another read?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
