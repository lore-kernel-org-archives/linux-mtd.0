Received: from stone.tmok.com ([204.17.163.2] ident=pla)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WNFj-0001JZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 20:19:55 +0100
Received: (from pla@localhost)
	by stone.tmok.com (8.9.3/8.9.3) id PAA19680
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2001 15:25:47 -0400 (EDT)
Date: Mon, 13 Aug 2001 15:25:47 -0400 (EDT)
From: pla <pla@tmok.com>
Message-Id: <200108131925.PAA19680@stone.tmok.com>
To: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 erase size of 16k? 
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> Er, that code is older than the 20010807 snapshot you said you were using. 
> I meant the latest code from my CVS. I'm slightly concerned that the older 
> code works when the newer code doesn't - it's supposed to work the other 
> way round. Can you check the latest code and make sure it works there too?

Hmm, yes, the 20010812 snapshot works correctly.  I just diff'd the two
snapshots, and would have to say that the problems I experienced did not
result from anything in the MTD code, so don't trouble yourself with
what went wrong.  I must have accidentally whacked something without
noticing.  My apologies for wasting your time.
 

> It doesn't work perfectly yet, although it shouldn't take much to fix it.
> To make it fit, you have to use nftl_format to make the NFTL start further 
> in to the device.

Ah!  Now I see how this all fits together.  Many thanks, and I will
certainly write up my experiences for the HowTo.  Incidentally, for
anyone else trying this, it would serve them well to back up the
bad blocks section of their DOC before doing *anything*.  I seem
to have killed my DOC by overwriting it, without a backup (fortunately,
I can just get another from work, but not everyone has that
luxury).
 
 
 
                              - Ben
