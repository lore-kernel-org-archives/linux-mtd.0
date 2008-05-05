Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JsvGl-00019r-MW
	for linux-mtd@lists.infradead.org; Mon, 05 May 2008 07:37:55 +0000
Date: Mon, 5 May 2008 09:37:45 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
Message-ID: <20080505073745.GA13916@logfs.org>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501202523.GA17828@logfs.org>
	<fe810cf0805040146y64ffcb66vfbf2c4aa82eabfd4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe810cf0805040146y64ffcb66vfbf2c4aa82eabfd4@mail.gmail.com>
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

On Sun, 4 May 2008 12:46:31 +0400, Alexander Belyakov wrote:
> On Fri, May 2, 2008 at 12:25 AM, Jörn Engel <joern@logfs.org> wrote:
> >
> > ...and creates a peculiar conflict of interests in me.  I've added full
> > caching of the complete mtd in logfs, which gave a huge speedup to some
> > of my testcases.  However caching is done in page granularity, therefore
> > it would completely defeat this patch, which also gives a speedup.
> 
> There is a special case for page aligned data where generic
> read_page() is being used instead of read_subpage(). I believe logfs
> caching won't suffer from this patch.

Actually, logfs caching would help jffs2 as well, as soon as you have
several parallel readers.  It should be made generic mtd caching.  And
when made generic, it would effectively defeat this patch, as all reads
would be (DRAM-) pagesized.

We could theoretically use buggerheads and do the caching in smaller
granularities.

Jörn

-- 
All models are wrong. Some models are useful.
-- George Box
