Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4y3M-0004mV-R5
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 05:48:21 -0400
Date: Tue, 16 Aug 2005 11:47:46 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050816094746.GB14405@wohnheim.fh-wedel.de>
References: <430099D1.8000801@inf.u-szeged.hu> <43009BDB.1040108@yandex.ru>
	<20050815134813.GC3829@wohnheim.fh-wedel.de>
	<43009FFC.3090200@yandex.ru>
	<20050815140530.GE3829@wohnheim.fh-wedel.de>
	<1124115547.6148.17.camel@sauron.oktetlabs.ru>
	<20050815143241.GA7045@wohnheim.fh-wedel.de>
	<4300B335.6050006@yandex.ru>
	<1124176573.6148.27.camel@sauron.oktetlabs.ru>
	<430194F4.60802@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <430194F4.60802@yandex.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 August 2005 11:25:40 +0400, Artem B. Bityuckiy wrote:
> Artem B. Bityuckiy wrote:
> >Wait, but how will you then find the needed struct jffs2_eraseblock
> >object by its physical offset on flash ? Use Hash / lists ? Bad idea
> >(slow). Use array of pointers to each object ? It will be rather large,
> >and I cannot take easy the fact that we will use distinct pointers for
> >objects which are mostly physically contiguous in RAM (they are laying
> >contiguously in slabs). This probably will neglect the pluses of
> >colouring, which, BTW, we may also organize using my way...
> >
> >Comments?
> 
> This assumed to be a question for Joern, not to myself :-)

Yes, I'd go for a pointer array.  That would cost us one pointer
dereference per access.

Your approach, imo, is fundamentally borked because it requires
high-order allocations.  Your array of physical pages has to be a
contiguous virtual memory area, which won't always work.  And if you
want to maintain a list of pages instead, you end up with the same
design as with an array of slab objects, just one level higher and
with another indirection.  Whatever the performance is, the code will
be ugly.

You could - if you really want to play tricks - allocate objects that
contain 2, 4, 8, 16, etc. struct jffs2_eraseblocks instead of just
one.  But that wouldn't make the code any better, either.

Oh well.  If you volunteer to write the code and fix the bugs, you get
to decide.  I just have an opinion, nothing more.

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
