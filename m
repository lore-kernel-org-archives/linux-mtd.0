Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fgy7j-0000yS-8g
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 02:06:13 -0400
Date: Fri, 19 May 2006 08:05:59 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060519060559.GA17270@wohnheim.fh-wedel.de>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1147999465.13399.33.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 19 May 2006 01:44:24 +0100, David Woodhouse wrote:
> 
> It's a little unfortunate that we have to actually keep a second copy of
> the name in the summary. Is there any way we could avoid it?
> 
> One possibility might be to refrain from storing the name in the dirent
> node itself -- store it _only_ in the summary. This could happen only
> during garbage collection -- when we GC a dirent node, we could write it
> out _without_ its name. In fact, we could possibly refrain from writing
> the GC'd dirent to the log at all -- put it _only_ in the summary.
> 
> That does break backwards compatibility though, which isn't ideal.

Worse, what happens if the power fails?  Do we block creat/mkdir/mknod
until summary is written?  Could be a long time.  Or do we return to
userspace and claim we've written everything while in fact we haven't?

I'd pick the other option.

Jörn

-- 
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
