Received: from orion.tskgv.org.tr ([195.142.233.59]
	helo=orion.havelsan.intranet)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19At8o-0002qW-M9
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2003 16:05:03 +0100
Message-ID: <002a01c30f29$ca04e4e0$3064000a@nur>
From: "nur" <nurpinar@e-kolay.net>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
References: <001b01c30f27$a168d890$3064000a@nur>
Date: Wed, 30 Apr 2003 18:04:25 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: unknown chip id FF
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok I found the reason still not understanding why
dinfo tells that window adress is d0000
I don't know how it changes or what it depends.
Anyway sorry to bother



----- Original Message -----
From: "nur" <nurpinar@e-kolay.net>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Sent: Wednesday, April 30, 2003 5:48 PM
Subject: unknown chip id FF


> First of all, i searched my problem through google.com
> Infradead archive refers to wrong pages for a specific subject
> I mean, i m clicking on "DOC 2000 driver (NFTL) in kernel 2.4.7" link but
it
> goes to "Porting FFS2 on MIPS subject"
> So that, I couldn't find any comment about my problem.
>
> I can boot my diskonchip millennium on a platform without any problem.
DoCs
> window address is e8000
> The problem is that, I can't boot the same chip on another platform even
> though I changed window address to e8000 from bios settings
> If I boot from romdos, i can see the content of diskonchip. When I boot
from
> DoC it says, using configured probe address e8000... possible diskonchip
> with unknown chip id FF found at E8000. So can't mount from DoC.
> Any idea would be appreciated. Thanks in advance
>
>
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
