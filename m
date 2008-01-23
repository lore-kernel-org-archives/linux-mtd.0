Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHbqt-0005Cu-P7
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 09:25:06 +0000
Date: Wed, 23 Jan 2008 10:23:55 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
In-Reply-To: <20080122150514.GD18884@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0801231014540.25733@lnxricardw.se.axis.com>
References: <4790D11E.6060201@parrot.com>
	<20080118115531.2deef9fb@zod.rchland.ibm.com>
	<20080118181744.GA15039@lazybastard.org> <4794C107.7070600@parrot.com>
	<20080121212555.GA14472@lazybastard.org>
	<20080121161612.3ca2f093@zod.rchland.ibm.com>
	<20080121222952.GC14472@lazybastard.org> <4795AFE3.506@parrot.com>
	<20080122120300.GA18884@lazybastard.org>
	<Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
	<20080122150514.GD18884@lazybastard.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 22 Jan 2008, J=F6rn Engel wrote:

> - Moderate: one block continuously spews -EUCLEAN, then becomes
>  terminally bad.
>  If those are just random bitflips, garbage collection will move the
>  data sooner or later.  Logfs does not force GC to happen soon when
>  encountering -EUCLEAN, which it should.  Are correctable errors an
>  indication of block going bad in the near future?  If yes, I should do
>  something about it.

I would say that correctable errors occurring "soon" after writing are an=
=20
indication that the block is going bad. My experience has been that=20
extensive reading can cause bitflips (and it probably happens over time=20
too), but that for fresh blocks, billions of read operations need to be=20
done before a bit flips. For blocks that are nearing their best before=20
date, a couple of hundred thousand reads can cause a bit to flip. So if I=
=20
was implementing some sort of 'when is this block considered=20
bad'-algorithm, I'd try to keep tabs on how often the block has been=20
(read-) accessed in relation to when it was last writen. If this number is=
=20
"low", the block should be considered bad and not used again.

I'm also think that when (if) logfs decides a block is bad, it should mark=
=20
it bad using mtd->block_markbad(). That way, if the flash is rewritten by=
=20
something else than logfs (say during a firmware upgrade), bad blocks can=
=20
be handled in a consistent and startad way.

>The list probably goes on and on.  And I am sure that I would miss at
>least half the interesting cases if I had to create it on my own.  But
>if Matthieu or you or anyone else is willing to compose an extensive
>list of such failure cases, I will walk through it and try to handle
>them one by one.

We ran some tests here on a particular flash chip type to try and=20
determine at least some of the failure modes that are related to block=20
wear (due to write/erase) and bit decay (due to reading). The end result=20
was basically what I tried to describe above, but I can go into more=20
detail if you're interested.

/Ricard
