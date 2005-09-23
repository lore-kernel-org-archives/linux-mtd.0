Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIjS9-00007W-EZ
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 05:02:49 -0400
Date: Fri, 23 Sep 2005 11:02:48 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050923090248.GC7522@wohnheim.fh-wedel.de>
References: <BAY17-F2907FD1D0C39129EF734BAE8960@phx.gbl>
	<4333B867.4050801@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4333B867.4050801@inf.u-szeged.hu>
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: 1:1 mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 September 2005 10:10:15 +0200, Ferenc Havasi wrote:
> zhao forrest wrote:
> 
> > Your patch may have problem.
> > In fact this "reject to mount when cross-boundary" has been in my
> > patch, it's quite simple. This code segment is extracted from my patch:
> >
> > @@ -570,10 +584,8 @@ scan_more:
> >              /* Eep. Node goes over the end of the erase block. */
> >         printk(KERN_WARNING "Node at 0x%08x with length 0x%08x would
> > run over the end of the erase block\n",
> >                               ofs, je32_to_cpu(node->totlen));
> > -        printk(KERN_WARNING "Perhaps the file system was created
> >           with the wrong erase size?\n");
> > -                       DIRTY_SPACE(4);
> > -                       ofs += 4;
> > -                       continue;
> > +                       printk(KERN_NOTICE "Perhaps the file system
> >       was created with the wrong erase size? Reject to mount.\n");
> > +                       return -EINVAL;
> >                }
> 
> My patch has one more part: detecting that case, if the node header is
> also cross-boundary. But that case we cannot say: it is absolutely sure
> that it is a cross-boundary node, just can say: it is likely.
> 
> Forutnatelly the node header is small enough to say that if someone uses
> bad (larger) erase block size, there will be a cross-boundary node which
> have a correct node header at the end of the erase block, and only the
> body is cross-boundary.
> 
> So If everyone agrees we can commit this small part of Zhao's patch.

Actually, I preferred your patch:
o -EIO makes slightly more sense than -EINVAL.
o Detecting nodes with headers crossing the boundary also makes sense.

The shorter string constant of Zhao's patch, on the other hand,
reduces binary size and should be enough.  People will report problem
to the mailing list and get pointed in the right direction.

I'll try to have a better look over the weekend.

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
