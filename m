Received: from chello062178007137.3.11.vie.surfer.at ([62.178.7.137] helo=quake.thinstuff.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 152FET-00052l-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 May 2001 17:42:06 +0100
Received: from quake.thinstuff.com ([192.168.2.2])
	by quake.thinstuff.com with esmtp (Exim 3.12 #1 (Debian))
	id 152FGg-0005qQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 May 2001 18:44:22 +0200
Date: Tue, 22 May 2001 18:44:22 +0200 (CEST)
From: nob@thinstuff.com
To: linux-mtd@lists.infradead.org
Subject: 16M doc2000 and pcmcia
Message-ID: <Pine.LNX.4.21.0105221818160.22269-100000@quake.thinstuff.com>
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

in our wavelan-router project we are using ... 
 - doc2000/8M
 - mtdcvs20010522(today)
 - nftl 
 - kernel 2.4.3 with pcmcia
 - wavelan/orinoco card in an isa pcmcia adapter

well, this combination works really great!


now when i try a 16M doc pcmcia doesn't work anymore,
cannot map card memory and things like that ...

the other way around (with a linux boot disk):
step1: activating pcmcia: everything fine
step2: inserting mtd modules, mounting nftla1: system hangs, no msgs


the 16Mdoc is found at 0xd0000

once again: there is no problem with the 8M doc2000 and pcmcia!

any ideas?

regards,
norbert
