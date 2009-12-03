Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NGAM0-0000jJ-BG
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 12:00:17 +0000
Date: Thu, 3 Dec 2009 13:00:00 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH] fio infrastructure
Message-ID: <20091203115959.GA17758@logfs.org>
References: <20091120163744.GB1716@logfs.org>
	<6934efce0912030322o270e0adalea41e367d4728b52@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0912030322o270e0adalea41e367d4728b52@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 3 December 2009 03:22:01 -0800, Jared Hulbert wrote:
> 
> In theory this could address some problems I was contemplating earlier
> today.  If Jörn vision of large scale flash storage device without the
> added FTL overhead is to realized, we'll need this sort of thing.  For
> that matter, take the Atom processor line, aren't the newer ones
> planning on raw NAND access built in?  If you want to get the
> performance a several NAND chips can enable you'd need something like
> this, no?

I cannot comment on processor lines, Atom or otherwise.  But afaics the
only alternative to asynchronous operations would be striping.
Disadvantage of striping is that erase block size (and potentially page
size) increases and bad block in one stripe poison good blocks in all
other stripes.  Not too appealing to me.

Plus, you can get all the benefits from striping with fio as well.

> 
> > I really wish I could have tested this with working hardware, but the
> > gods are against that idea.  So here is a patch anyway.
> 
> What is needed, bare minimum, to test this?  Is access to multiple
> bare NAND chips enough?

Yes.

Jörn

-- 
Premature optimization is the root of all evil.
-- Donald Knuth
