Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHI1D-0008DF-RT
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 05:33:25 -0400
Date: Mon, 19 Sep 2005 11:33:00 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "David A. Braun" <braunster@gmail.com>
Message-ID: <20050919093300.GB21380@wohnheim.fh-wedel.de>
References: <432C2E6C.6050400@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <432C2E6C.6050400@gmail.com>
Cc: linux-mtd@lists.infradead.org, Robert Kaiser <rkaiser@sysgo.com>
Subject: Re: Command line parsing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 17 September 2005 10:55:40 -0400, David A. Braun wrote:
> 
> Is there any particular reason parse_cmdline_partitions() in 
> drivers/mtd/cmdlineparse.c doesn't completely setup the partition 
> table(s) it builds? It fails to initialize the offsets and sizes of any 
> partition tabled unless it is the one named by "master". This one has 
> the offsets and lengths filled in but the others are left zero with the 
> exception of partitions specified with "-" or SIZE_REMAINING. I would 
> have expected all partitions described in the cmdline to be initialized 
> if any are.

Iirc, the code was written by someone at Sysgo, possibly Robert, and
hasn't been touched for quite a while.  So if you have any patches
that improve the situation for you, feel free to send them.

Jörn

-- 
Rules of Optimization:
Rule 1: Don't do it.
Rule 2 (for experts only): Don't do it yet.
-- M.A. Jackson 
