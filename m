Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKYjg-0002Ja-5F
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 06:00:38 -0400
Date: Wed, 28 Sep 2005 12:00:31 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Message-ID: <20050928100031.GA18192@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433A640D.6030200@cetrtapot.si>
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

On Wed, 28 September 2005 11:36:13 +0200, hinko.kocevar@cetrtapot.si wrote:
> 
> On new setup - using yesterdays MTD CVS and 2.6.12 kernel with EBS enabled:
> Mounting flash4 clean partition	[1]
> real    0m 3.75s
> user    0m 0.02s
> sys     0m 1.17s
> -- -- -- -- -- -- -- -- -- --
> Mounting flash4 dirty partition	[2]
> real    0m 0.75s
> user    0m 0.02s
> sys     0m 0.73s

I assume above numbers are for a dirty partition and below for a clean
one?


Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
