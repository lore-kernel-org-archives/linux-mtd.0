Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HfBPA-0006LD-Bw
	for linux-mtd@lists.infradead.org; Sat, 21 Apr 2007 04:57:18 -0400
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: [PATCH] Obsolete nodes that are unlinked when possible
Date: Sat, 21 Apr 2007 10:56:49 +0200
Message-ID: <00fe01c783f2$ff8810a0$020120ac@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1177103631.30621.35.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org] 
> Sent: den 20 april 2007 23:14
> To: Joakim Tjernlund
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: [PATCH] Obsolete nodes that are unlinked when possible
> 
> On Thu, 2007-04-19 at 21:34 +0200, Joakim Tjernlund wrote:
> > Ping. 
> 
> Sorry for taking so long to look at this. Did you test this without
> SUMMARY support?

hmm, not sure. I think so, but not much. The idea was that to get
some testing, you need to enable its use in MTD git. 
 
> 
> I agree that we ought to make the summary code _not_ imply
> !jffs2_can_mark_obsolete(). There's a few things I want to 
> change about
> the summary code -- the nodes are currently about twice as 
> large as they
> need to be, too. I'll look at that soon.

Rigth, but more important is that the GC procedure needs to GC
more aggressively, otherwise you will end up with a very fragmented
FS in some cases.

ATM I am doing board bringup and won't be able to spend any time
on JFFS2.

  Jocke
