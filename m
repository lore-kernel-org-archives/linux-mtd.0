From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060419125551.GA1185@wohnheim.fh-wedel.de>
References: <4444C8FD.1070406@inf.u-szeged.hu>
	<20060418113258.GA4720@wohnheim.fh-wedel.de>
	<1145444426.13200.71.camel@pmac.infradead.org>
	<1145450738.13200.77.camel@pmac.infradead.org>
	<20060419125551.GA1185@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 May 2006 04:22:46 +0100
Message-Id: <1147576966.19840.2.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2006-04-19 at 14:55 +0200, Jörn Engel wrote:
> 
> Too complicated, imo.  The patch writes a pristine node, if
> 1) node is last node of page,
> 2) node is last node of file,
> 3) other nodes exist in the same eraseblock.
> 
> Condition 1 makes sense.  2 can be argued about.  Maybe a benchmark or
> two can show whether it makes sense or not.  3 is fairly complicated
> and I fail to see what it buys us.  If the other fragments are in
> seperate eraseblocks, why shouldn't we write out a pristine node?

Fair enough. I've committed a (cosmetic) variant of Ferenc's original
patch then.

-- 
dwmw2
