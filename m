Received: from firewall1.cammail.net ([193.115.249.1] helo=smtp.camcom.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BDDb-0003JU-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 12:26:47 +0100
Date: Fri, 24 May 2002 12:25:26 +0100 (BST)
From: Chris Wilson <chris@netservers.co.uk>
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: Getting big flash onto motherboards. Will CF work? what will 
In-Reply-To: <25366.1022237734@redhat.com>
Message-ID: <Pine.LNX.4.44.0205241221580.31555-100000@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi David,

> chris@netservers.co.uk said:
> >  I would guess that these are IDE-compatible then? So I guess I would
> > have  to use the mtdblock driver to drive it? 
> 
> No. The mtdblock driver is a vary simplistic 'translation layer' that 
> doesn't actually do any wear levelling or translation, just lets you use a 
> real flash device as if it were a block device.

Sorry, I meant mtdblkdev. Silly me =)

> that it must have different reliability characteristics. But there's no real
> reason for _everyone_ who makes CF to have implemented it so unreliably in
> the first place -- so maybe M-Systems have managed to do it properly -- they
> generally do seem to have sufficient clue. You'd have to test it.

Thanks for your answer, even though it's not encouraging news. I guess we 
will have to thrash some CFs to death to find out what's going wrong =( 
It's a shame because they are so expensive.

> The DiskOnChip is a different matter. That allows the system to deal with 
> real flash, so if there are problems you can fix them. Although in 
> practice, nobody _does_ seem to be dealing with the problems which 
> occasionally crop up with the DiskOnChip drivers. I still keep trying to 
> get our salespeople to find a customer who wants to pay for me to spend 
> some real time on them, but it hasn't happened yet :)

We'll consider it if I can persuade my boss that we shouldn't be using CF 
=)

Incidentally, do you or anyone know why there is such a big price 
different between CF, DoM and DoC for the same capacity?

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |
