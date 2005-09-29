Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKy7m-0000rn-30
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 09:07:43 -0400
Date: Thu, 29 Sep 2005 15:07:07 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Message-ID: <20050929130707.GC21332@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<433BBED5.4040306@cetrtapot.si>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433BBED5.4040306@cetrtapot.si>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 September 2005 12:15:49 +0200, hinko.kocevar@cetrtapot.si wrote:
> 
> All of our umounts are unclean - or said better application is not 
> taking care of umount at all. System may be powered off anytime. Which 
> raises another question: Will this impact mount time in long run? Eg. 
> after more and more unclean (u)mounts should we expect significant 
> performance degradation?

Only if your applications write to the fs in small chunks.  Known
problem, noone cared enough to actually fix it yet.

If most writes are in the range of 4k, you're safe.

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
