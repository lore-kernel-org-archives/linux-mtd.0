Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19MoO2-0003Di-4G
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 13:26:02 +0100
Date: Mon, 2 Jun 2003 14:26:31 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Message-ID: <20030602122631.GB20423@wohnheim.fh-wedel.de>
References: <20030530144959.GA4736@wohnheim.fh-wedel.de>
	<002101c3278b$7b5d37f0$020120b0@jockeXP>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002101c3278b$7b5d37f0$020120b0@jockeXP>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 31 May 2003 17:44:06 +0200, Joakim Tjernlund wrote:
> > jffs2: inflate & deflate, initialized once, 450k
> 
> 450KB looks like a lot considering JFFS2 will never compress more than a PAGE at a time.
> I think the actual workspace needed is much less, but none has figured out how to calculate
> the  real workspace needed for a fixed buffer size, right?

When talking about zlib, "noone has done it yet" is almost always
right. :)

The kernel workspace #defines MAX_MEM_LEVEL to 9, while the zlib
default is 8.  That translates to 256k instead of 128k is is likely
pointless for JFFS2 style of compression.  Another 50k come from the
seperate workspaces for inflate and deflate.  So JFFS2 should be able
to work with 280k, roughly.

Have you ever seen/done benchmarks that test zlib compression
efficiency?

Jörn

-- 
Eighty percent of success is showing up.
-- Woody Allen
