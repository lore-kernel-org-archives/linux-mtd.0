Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4eSq-0002P2-PB
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 08:53:21 -0400
Date: Mon, 15 Aug 2005 14:52:54 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Message-ID: <20050815125254.GA32209@wohnheim.fh-wedel.de>
References: <20050801104343.GB32464@wohnheim.fh-wedel.de>
	<42EE2B78.70500@inf.u-szeged.hu>
	<20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<20050815115943.GD27229@wohnheim.fh-wedel.de>
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43008CD5.1000006@yandex.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 August 2005 16:38:45 +0400, Artem B. Bityuckiy wrote:
> Ferenc Havasi wrote:
> >I only say that for a user the size of the virtual erase block may not 
> >be evident. They know about the real erase block size. Maybe we should 
> >write a tool for calculating it.
> Why not to just copy the algorithm from JFFS2 (it is in 
> jffs2_do_fill_super())?

Because it's not good enough.

> >It is not too relevant problem without summary. For example if the erase 
> >block size is 32K, and the virtual is 64K, and you generates JFFS2 
> >image  for 32K it will work (maybe with some warning but will work). If 
> >you generates summary for that image for 32K and use it on 64K virtual 
> >erase block size that will not work.
> I think, this is better if you solve this inconsistency in general.

Yes.  The cumulation of erase blocks is an ugly ugly hack.  The fact
that vmalloc() of more than 128M will always fail doesn't imply that
vmalloc() of less will always succeed.  On i386 with 1GiB of ram and a
single kernel module loaded, the chance has already dropped to 0.

Now, "calculating" the erase block size such that we only vmalloc() a
bit less than 128M is an exquisitely bad idea.  It may work on some
machines, but will utterly fail on others.

The more I think about it, the more I believe that we have to remove
the vmalloc completely.  Anything else will still break at random,
depending on hardware, code like summary, moonphase and the taste of
your coffee this morning.

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
