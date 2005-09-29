Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKx3C-0007DD-0Y
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 07:58:18 -0400
Message-ID: <433BD7A6.60405@inf.u-szeged.hu>
Date: Thu, 29 Sep 2005 14:01:42 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<433BBED5.4040306@cetrtapot.si>
In-Reply-To: <433BBED5.4040306@cetrtapot.si>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
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

hinko.kocevar@cetrtapot.si wrote:

> All of our umounts are unclean - or said better application is not
> taking care of umount at all. System may be powered off anytime. Which
> raises another question: Will this impact mount time in long run? Eg.
> after more and more unclean (u)mounts should we expect significant
> performance degradation?

Using EBS there should not be significant performance degradation even
if there is no umount at all.

Only CS needs clean umount.

Ferenc
