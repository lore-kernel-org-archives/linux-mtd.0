Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jt2nk-0004mn-78
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 15:40:29 +0000
Date: Mon, 5 May 2008 17:39:59 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
Message-ID: <20080505153959.GA17330@logfs.org>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501202523.GA17828@logfs.org>
	<fe810cf0805040146y64ffcb66vfbf2c4aa82eabfd4@mail.gmail.com>
	<20080505073745.GA13916@logfs.org>
	<fe810cf0805050510g2bf7ef4brfaf4352454dd204b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe810cf0805050510g2bf7ef4brfaf4352454dd204b@mail.gmail.com>
Cc: dwmw2@infradead.org, tglx@linutronix.de, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 5 May 2008 16:10:46 +0400, Alexander Belyakov wrote:
> On Mon, May 5, 2008 at 11:37 AM, Jörn Engel <joern@logfs.org> wrote:
> >
> > Actually, logfs caching would help jffs2 as well, as soon as you have
> > several parallel readers.  It should be made generic mtd caching.  And
> > when made generic, it would effectively defeat this patch, as all reads
> > would be (DRAM-) pagesized.
> >
> > We could theoretically use buggerheads and do the caching in smaller
> > granularities.
> 
> We'd like to look at this new mtd caching layer. Have you working
> prototype to play with?

Take a look into fs/logfs/dev_mtd.c in the logfs patch or git tree:
http://lazybastard.org/~joern/patches/logfs.patch.773
http://git.kernel.org/?p=linux/kernel/git/joern/logfs.git;a=summary

It is currently part of logfs, but moving it over to
drivers/mtd/mtdcore.c shouldn't be too hard.

Jörn

-- 
Optimizations always bust things, because all optimizations are, in
the long haul, a form of cheating, and cheaters eventually get caught.
-- Larry Wall
