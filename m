Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKuo6-0002l2-Bd
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 05:34:38 -0400
Date: Thu, 29 Sep 2005 11:34:33 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050929093433.GB18741@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <433BA402.3040703@inf.u-szeged.hu>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	"hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 September 2005 10:21:22 +0200, Ferenc Havasi wrote:
> >
> > Is this the only way to upgrade 'old' jffs2 partitions already in
> > place (on the nand flash) to use EBS? Thing is, we have several system
> > up and running in the wild and would like to upgrade jffs2 partitions
> > as-painless-as-possible, preferably without complete reflash of the
> > systems.
> 
> At this moment: yes, that is the only way. If more people need it we can
> implement a special extension for EBS. (but it takes time) This
> extension would make possible if user set a special mount option the
> system will convert all the non-summarizied erase blocks to summarized.
> It would take a lot of time (and need some percent free space), but only
> at that mount.

Just fyi - such a patch should not get merged into cvs.  Long-term,
the demand for it will approximate zero, so there is no good
justification for extra code.

> Or you may try our other technique: CS (Centralized Summary). That
> technique does not requie user space tool, and cause very fast mount
> after any clean umount. (if the umount was not clean the speed will be
> same as before). It is not the part of the official JFFS2 now, we would
> like to little bit rewrite before bringing on it. But it works already -
> use the variant which stores the reference in the first erase block. You
> can download it from our webpage ( http://www.inf.u-szeged.hu/jffs2/ ).

How is the CS information found during mount?  Special location?

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
