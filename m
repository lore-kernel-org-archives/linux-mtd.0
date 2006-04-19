Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FWCQJ-0006k6-Hw
	for linux-mtd@lists.infradead.org; Wed, 19 Apr 2006 09:09:00 -0400
Date: Wed, 19 Apr 2006 14:55:51 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20060419125551.GA1185@wohnheim.fh-wedel.de>
References: <4444C8FD.1070406@inf.u-szeged.hu>
	<20060418113258.GA4720@wohnheim.fh-wedel.de>
	<1145444426.13200.71.camel@pmac.infradead.org>
	<1145450738.13200.77.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1145450738.13200.77.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: A JFFS2 optimization related to syslog
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 April 2006 13:45:38 +0100, David Woodhouse wrote:
> On Wed, 2006-04-19 at 12:00 +0100, David Woodhouse wrote:
> > So even if we do that, I think Ferenc's patch _also_ makes sense,
> > because it fixes the worst of the problem at its source. We could
> > perhaps make it conditional -- only write out the whole page if there's
> > more than N nodes already in the same page, or if the previous nodes for
> > the same page are in the same eraseblock _and_ the new 'full' node would
> > actually fit in the eraseblock.
> 
> Something like this, perhaps....?
> 
> http://git.infradead.org/?p=users/dwmw2/merge-2.6.git;a=commitdiff;h=51d838550c9aaf346e918d7964b2cb66ecd61b8d

Too complicated, imo.  The patch writes a pristine node, if
1) node is last node of page,
2) node is last node of file,
3) other nodes exist in the same eraseblock.

Condition 1 makes sense.  2 can be argued about.  Maybe a benchmark or
two can show whether it makes sense or not.  3 is fairly complicated
and I fail to see what it buys us.  If the other fragments are in
seperate eraseblocks, why shouldn't we write out a pristine node?

Jörn

-- 
Schrödinger's cat is <BLINK>not</BLINK> dead.
-- Illiad
