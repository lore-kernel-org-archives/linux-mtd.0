Received: from stone.tmok.com ([204.17.163.2] ident=pla)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15W6SG-0000G8-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 02:23:45 +0100
Received: (from pla@localhost)
	by stone.tmok.com (8.9.3/8.9.3) id VAA14974
	for linux-mtd@lists.infradead.org; Sun, 12 Aug 2001 21:29:35 -0400 (EDT)
Date: Sun, 12 Aug 2001 21:29:35 -0400 (EDT)
From: pla <pla@tmok.com>
Message-Id: <200108130129.VAA14974@stone.tmok.com>
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

> Use the latest code. It may fix it.

Ah, many thanks.  the 2.4.8 kernel made all my problems magically go
away, how wonderful!  (Guess I should have paid more attention to
the kernel changelogs, my bad).
 
Now on to the fun of getting GRUB to work as the DOC firmware (I don't
suppose anyone's written a more detailed guide than the 4-step README
in mtd/grub?  Such as, where does an 80k stage2 go when the DOC
firmware region only holds 48k?  <G>)
 
 
 
                                  - Ben
