Received: from snifit.smb.utfors.se ([195.58.112.20])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Moy1-0003id-VE
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 14:03:14 +0100
Received: from LUMENTIS02 ([212.105.56.242])
 by snifit.smb.utfors.se (iPlanet Messaging Server 5.2 Patch 1 (built Aug 19
 2002)) with SMTP id <0HFU00ID7UYG7J@snifit.smb.utfors.se> for
 linux-mtd@lists.infradead.org; Mon, 02 Jun 2003 15:03:52 +0200 (MEST)
Date: Mon, 02 Jun 2003 15:03:52 +0200
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
In-reply-to: <20030602122631.GB20423@wohnheim.fh-wedel.de>
To: =?UNKNOWN?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Message-id: <IGEFJKJNHJDCBKALBJLLMEBAFNAA.joakim.tjernlund@lumentis.se>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 8BIT
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: RE: [PATCH RFC] 1/2 central workspace for zlib
Reply-To: joakim.tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Sat, 31 May 2003 17:44:06 +0200, Joakim Tjernlund wrote:
> > > jffs2: inflate & deflate, initialized once, 450k
> >
> > 450KB looks like a lot considering JFFS2 will never compress more than a PAGE at a time.
> > I think the actual workspace needed is much less, but none has figured out how to calculate
> > the  real workspace needed for a fixed buffer size, right?
>
> When talking about zlib, "noone has done it yet" is almost always
> right. :)
>
> The kernel workspace #defines MAX_MEM_LEVEL to 9, while the zlib
> default is 8.  That translates to 256k instead of 128k is is likely
> pointless for JFFS2 style of compression.  Another 50k come from the
> seperate workspaces for inflate and deflate.  So JFFS2 should be able
> to work with 280k, roughly.

hmm, won't the mem level in zlib_deflateInit() influence the needed workspace? I always
figured that the memory reuirements listed in zconf.h was worst case.
Since JFFS2 uses mem level 3, is it not possible that JFFS2 needs less memory?

>
> Have you ever seen/done benchmarks that test zlib compression
> efficiency?
no, sorry.

 Jocke
>
> Jörn
