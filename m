Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DlE9N-00034g-UC
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 18:56:57 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DlE2w-0000ac-H7
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2005 00:50:14 +0200
Received: from s01060004e28f4900.du.shawcable.net ([70.67.196.121])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jun 2005 00:50:14 +0200
Received: from andre by s01060004e28f4900.du.shawcable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 Jun 2005 00:50:14 +0200
To: linux-mtd@lists.infradead.org
From: "Andre" <andre@rocklandocean.com>
Date: Wed, 22 Jun 2005 15:59:36 -0700
Message-ID: <d9cpun$1co$1@sea.gmane.org>
References: <006301c576ad$70547490$6702a8c0@niro>
Sender: news <news@sea.gmane.org>
Subject: Re: kernel messages from INFTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> INFTL: inftlcore.c $Revision: 1.18 $, inftlmount.c $Revision: 1.16 $
> INFTL: corrupt block 10588 in chain 10588, chain length 0, erase mark
> 0x0? INFTL: formatting chain at block 10588
> INFTL: formatting block 10588
> INFTL: error while formatting block 10588
> INFTL: corrupt block 15274 in chain 15274, chain length 0, erase mark
> 0x0? INFTL: formatting chain at block 15274
> INFTL: formatting block 15274
> INFTL: error while formatting block 15274
> INFTL: corrupt block 21286 in chain 21286, chain length 0, erase mark
> 0x0? INFTL: formatting chain at block 21286
> INFTL: formatting block 21286
> INFTL: error while formatting block 21286
> INFTL: corrupt block 24574 in chain 24574, chain length 0, erase mark
> 0xffff?
> INFTL: formatting chain at block 24574
> INFTL: formatting block 24574
> INFTL: corrupt block 24575 in chain 24575, chain length 0, erase mark
> 0xffff?
> INFTL: formatting chain at block 24575
> INFTL: formatting block 24575
>  inftla: inftla1

Turns out that I can't boot my system anymore with the diskonchip memory
range enabled in the BIOS. Somehow mtd did something to the boot sector on
the doc2000. Upon inspecting the diskonchip2000 with m-sys dos utilities it
turns out that the bad block table info cannot be found anymore, and all
this time I assumed that the inftl mount operation would be non-destructive.
Can one of you guru's please advise how to proceed from here? Is my doc now
hosed?

Andre
