Received: from e3.ny.us.ibm.com ([32.97.182.143])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E8K7m-0006C2-FZ
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 11:58:48 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e3.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j7PFweEU019014
	for <linux-mtd@lists.infradead.org>; Thu, 25 Aug 2005 11:58:40 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j7PFvXct262946
	for <linux-mtd@lists.infradead.org>; Thu, 25 Aug 2005 09:57:33 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	j7PFvMxM014383
	for <linux-mtd@lists.infradead.org>; Thu, 25 Aug 2005 09:57:23 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050825150329.GC5625@wohnheim.fh-wedel.de>
References: <430B2F84.30307@inf.u-szeged.hu>
	<20050823144542.GA2398@wohnheim.fh-wedel.de>
	<430DDB47.40900@inf.u-szeged.hu>
	<20050825150329.GC5625@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=utf-8
Date: Thu, 25 Aug 2005 10:56:43 -0500
Message-Id: <1124985403.29360.3.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dedekind@yandex.ru, zhao forrest <zhao_fusheng@hotmail.com>,
	dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-08-25 at 17:03 +0200, Jörn Engel wrote:
> On Thu, 25 August 2005 16:52:55 +0200, Ferenc Havasi wrote:
> > Jörn Engel wrote:
> > >On Tue, 23 August 2005 16:15:32 +0200, Ferenc Havasi wrote:
> > >
> > >>Here is the latest version of summary patch:
> > >>http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050823.patch
> > >>
> > >I'm slowly running out of stuff.  Good job.
> > >
> > Does it mean that we are allowed to commit the patch? (after some some
> > more final testing) Or other patches are sceduled earlier?
> 
> The 1:1 mapping should get merged first.  Code doesn't exist yet, but
> Forrest (Zhao Fusheng) promised to write some.  Once that's in, I'd
> like to let it brew for a month or so.
> 
> After that is finished, both summary and erase count could be merged.
> I'd prefer to take summary first and wait another month before merging
> erase count.
> 
> So unless anyone has objections to this plan, summary will be merged
> in the near future.  Only option for speed-up would be to write the
> 1:1 mapping code yourself, before Forrest does.

I've been out of the loop for a bit.  What does 1:1 mapping refer too?
A pointer to the thread talking about would be appreciated?

josh
