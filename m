Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8JHK-0004u3-6P
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 11:04:34 -0400
Date: Thu, 25 Aug 2005 17:03:29 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050825150329.GC5625@wohnheim.fh-wedel.de>
References: <430B2F84.30307@inf.u-szeged.hu>
	<20050823144542.GA2398@wohnheim.fh-wedel.de>
	<430DDB47.40900@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <430DDB47.40900@inf.u-szeged.hu>
Cc: dedekind@yandex.ru, dwmw2@infradead.org,
	zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 25 August 2005 16:52:55 +0200, Ferenc Havasi wrote:
> Jörn Engel wrote:
> >On Tue, 23 August 2005 16:15:32 +0200, Ferenc Havasi wrote:
> >
> >>Here is the latest version of summary patch:
> >>http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050823.patch
> >>
> >I'm slowly running out of stuff.  Good job.
> >
> Does it mean that we are allowed to commit the patch? (after some some
> more final testing) Or other patches are sceduled earlier?

The 1:1 mapping should get merged first.  Code doesn't exist yet, but
Forrest (Zhao Fusheng) promised to write some.  Once that's in, I'd
like to let it brew for a month or so.

After that is finished, both summary and erase count could be merged.
I'd prefer to take summary first and wait another month before merging
erase count.

So unless anyone has objections to this plan, summary will be merged
in the near future.  Only option for speed-up would be to write the
1:1 mapping code yourself, before Forrest does.

Comments?

Jörn

-- 
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra
