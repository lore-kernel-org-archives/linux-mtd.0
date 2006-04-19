From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <1145444426.13200.71.camel@pmac.infradead.org>
References: <4444C8FD.1070406@inf.u-szeged.hu>
	<20060418113258.GA4720@wohnheim.fh-wedel.de>
	<1145444426.13200.71.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Wed, 19 Apr 2006 13:45:38 +0100
Message-Id: <1145450738.13200.77.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2006-04-19 at 12:00 +0100, David Woodhouse wrote:
> So even if we do that, I think Ferenc's patch _also_ makes sense,
> because it fixes the worst of the problem at its source. We could
> perhaps make it conditional -- only write out the whole page if there's
> more than N nodes already in the same page, or if the previous nodes for
> the same page are in the same eraseblock _and_ the new 'full' node would
> actually fit in the eraseblock.

Something like this, perhaps....?

http://git.infradead.org/?p=users/dwmw2/merge-2.6.git;a=commitdiff;h=51d838550c9aaf346e918d7964b2cb66ecd61b8d

-- 
dwmw2
