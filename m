Received: from e5.ny.us.ibm.com ([32.97.182.145])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1ConSx-0006lX-1d
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 13:43:58 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e5.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0CIhWTb026997
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 13:43:32 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0CIhWK2283774
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 13:43:32 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0CIhVPB032425
	for <linux-mtd@lists.infradead.org>; Wed, 12 Jan 2005 13:43:31 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050112182638.GK25638@wohnheim.fh-wedel.de>
References: <41E4D6E5.1090407@imc-berlin.de>
	<41E4EDBE.8070302@inf.u-szeged.hu> <41E52EAD.2090302@imc-berlin.de>
	<Pine.LNX.4.58.0501121508270.10617@phoenix.infradead.org>
	<20050112182638.GK25638@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=
Message-Id: <1105555410.3896.34.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Wed, 12 Jan 2005 12:43:30 -0600
Content-Transfer-Encoding: 8bit
Cc: Steven Scholz <steven.scholz@imc-berlin.de>, linux-mtd@lists.infradead.org
Subject: Re: JFFS2: checking CRCs twice!?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 12:26, Jörn Engel wrote:
> On Wed, 12 January 2005 15:11:09 +0000, Artem B. Bityuckiy wrote:
> > On Wed, 12 Jan 2005, Steven Scholz wrote:
> > 
> > > If a sector got broken just by reading it then the whole embedded system is 
> > > broken and has to be replaced ...
> 
> Amen, brother!
> 
> > This seems to be true for NOR. But  chrcking CRC helps at least *detect* 
> > and *report* media problems.
> 
> Well, more and more I come to the conclusion that media problems are a
> non-issue.  At least, flashes are about as reliable as hard drives.

I've seen them fail.  Multiple times.  And yes, the CRCs detected it and
helped me figure out that the hardware was borked.

You may be right that failures are rare, and when they do occur the
flash definitely needs to be replaced.  But I'd much rather debug a card
that had CRC errors than one that just had apps mysteriously getting
SIGILL because a bit flipped and the filesystem didn't bother to verify
the data before using it.

Unless you'd be willing to debug all those cards for me.  In that case,
I'm all for whatever you decide to do with CRCs :).  Until then, I'd
prefer that they stay.

josh
