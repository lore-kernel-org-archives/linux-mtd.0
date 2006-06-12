Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fpqol-0007hk-8p
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 14:07:20 -0400
Date: Mon, 12 Jun 2006 20:06:53 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2/xattr problems.
Message-ID: <20060612180653.GA17177@wohnheim.fh-wedel.de>
References: <1148150486.3875.251.camel@pmac.infradead.org>
	<44704CA9.8010604@ak.jp.nec.com> <448CCEC8.2080903@ak.jp.nec.com>
	<1150099418.11159.44.camel@shinybook.infradead.org>
	<448D3752.3090605@ak.jp.nec.com>
	<1150105995.8184.17.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1150105995.8184.17.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org, KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 June 2006 10:53:15 +0100, David Woodhouse wrote:
> On Mon, 2006-06-12 at 18:43 +0900, KaiGai Kohei wrote:
> > In my opinion, a xattr across multiple nodes isn't neccesary.
> > What do you think?
> 
> I'd be happier if it worked -- some of us have plans to abuse XATTR
> support by building a simple database on it... :)
> 
> But as long as the failure mode is _graceful_, I suppose we can live
> without it for now, if ext3 is also limited to 4KiB.

Seems you missed Ted's presentation at LCA this year.  Among the
interesting bits:
o Pretty much anything on Linux is limited to 64KiB or less.
o Ext[23] is limited to 4KiB total for all attributes, including all
  keys and all values.
o The biggest user of Alternate Streams (less-limited versions of
  xattr on Windows, Solaris, etc.) arguably is root kits.  Alternate
  Streams have the advantage that tripwire etc. don't understand them
  and won't look for malware there.
o Some system administrators have no plans to upgrade to Solaris 9
  ever, because it supports Alternate Streams.  The trouble of hidden
  malware is not worth the gains.

Notable was also, that Ted repeated the last two points in several
variations.  Not sure if I would follow his line of thought 100%, but
he does have a point.

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
