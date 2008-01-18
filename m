Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFySl-000454-LZ
	for linux-mtd@lists.infradead.org; Fri, 18 Jan 2008 21:09:19 +0000
Date: Fri, 18 Jan 2008 22:00:19 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080118210019.GA16849@lazybastard.org>
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
	<2B52FCEB-D871-4D9B-81D1-E03F7698AF96@logicaloutcome.ca>
	<20080118183900.GC21136@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080118183900.GC21136@shareable.org>
Cc: linux-mtd@lists.infradead.org, Glenn Henshaw <thraxisp@logicaloutcome.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 18 January 2008 18:39:01 +0000, Jamie Lokier wrote:
> 
> Yes!  I have exactly the same problem, except I'm using 2.4.26-uc0,
> and it's a 1MB partition (16 blocks of 64kbytes).
> 
> I am tempted to modify the JFFS2 code to implement a hard limit of 50%
> full at the kernel level.
> 
> The JFFS2 docs suggest 5 free blocks are enough to ensure GC is
> working.  In my experience that does often work, but occasionally
> there's a catastrophically long and CPU intensive GC.

If you want to make GC go berzerk, here's a simple recipe:
1. Fill filesystem 100%.
2. Randomly replace single blocks.

There are two ways to solve this problem:
1. Reserve some amount of free space for GC performance.
2. Write in some non-random fashion.

Solution 2 works even better if the filesystem actually sorts data
very roughly by life expectency.  That requires writing to several
blocks in parallel, i.e. one for long-lived data, one for short-lived
data.  Made an impressive difference in logfs when I implemented that.

And of course academics can write many papers about good heuristics to
predict life expectency.  In fact, they already have.

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
