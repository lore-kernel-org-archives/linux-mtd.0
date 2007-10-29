Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1ImUDN-00015f-Si
	for linux-mtd@lists.infradead.org; Mon, 29 Oct 2007 08:59:40 -0400
Subject: RE: getdents64 problem in 2.6.23
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1193617605.2915.84.camel@shinybook.infradead.org>
References: <005201c819be$649f47e0$5267a8c0@Jocke>
	<1193617605.2915.84.camel@shinybook.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 29 Oct 2007 13:58:51 +0100
Message-Id: <1193662731.26497.4.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?=27J=F6rn?= Engel' <joern@logfs.org>,
	'Jamie Lokier' <jamie@shareable.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2007-10-28 at 20:26 -0400, David Woodhouse wrote:
> On Mon, 2007-10-29 at 00:58 +0100, Joakim Tjernlund wrote:
> > David, before rewriting getdents et. all may I ask you to apply the
> > patch I sent today? Then we will have something that works and go
> > from there.
> 
> I'm not happy about having fd->raw still pointing to nodes which may no
> longer exist. Can't we set it to NULL (and cope with potential fallout)?

Thats a diffrent story. Now I fixed the bug so it behaves like the 
!mark_node_obsolete case. Walking through all ->raw references is
something I will save for a rainy dag, I need to fix a few other bugs in
our system ATM.

   Jocke
