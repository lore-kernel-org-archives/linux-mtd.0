Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JTEjg-0004Fr-D9
	for linux-mtd@lists.infradead.org; Sun, 24 Feb 2008 11:09:36 +0000
Date: Sun, 24 Feb 2008 12:08:58 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: jffs2: -ENOSPC when truncating file?!
Message-ID: <20080224110858.GC31293@lazybastard.org>
References: <20080223235742.GE2202@elf.ucw.cz>
	<1203813368.5771.174.camel@shinybook.infradead.org>
	<20080224065751.GA31293@lazybastard.org>
	<1203850653.13749.9.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1203850653.13749.9.camel@shinybook.infradead.org>
Cc: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, linux-mtd@lists.infradead.org,
	kernel list <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 24 February 2008 18:57:32 +0800, David Woodhouse wrote:
> On Sun, 2008-02-24 at 07:57 +0100, Jörn Engel wrote:
> > Could a naïve implementation of this get exploited by doing a large
> > number of truncates that just shave single bytes off various files?
> 
> Yeah, which is why _my_ naïve implementation would do it for
> truncate-to-zero instead of just _any_ truncate (which could even be
> truncate-to-larger).

Truncate-to-larger is trivial to check.  Almost every filesystem does it
somewhere, including JFFS2. ;)

But yeah, truncate-to-zero should catch the common case.

> If allowing only truncate-to-zero isn't good enough, perhaps we could
> allow truncation to use the ALLOC_DELETION pool when it's going to
> obsolete at least one full data node. That's not so hard to check.

I would simply always write out a "full" replacement node, i.e. the
complete tail page for the file.  No need to check if an old node gets
obsoleted, we just made sure it does.  Anyway, it is your baby, so you
get to change the dirty diapers and pick your favorite pair of clean
ones.

Jörn

-- 
Joern's library part 3:
http://inst.eecs.berkeley.edu/~cs152/fa05/handouts/clark-test.pdf
