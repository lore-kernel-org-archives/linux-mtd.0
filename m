Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9HfE-0005p2-Ay
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2011 14:00:25 +0000
Date: Mon, 11 Apr 2011 16:00:19 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Ardelean, Andrei" <Andrei.Ardelean@idt.com>
Subject: Re: After writing successfully a NAND block is this reliable ar
	reading	as a NOR sector?
In-Reply-To: <AEA634773855ED4CAD999FBB1A66D0760190B688@CORPEXCH1.na.ads.idt.com>
Message-ID: <Pine.LNX.4.64.1104111552240.5186@lnxricardw.se.axis.com>
References: <AEA634773855ED4CAD999FBB1A66D0760190B688@CORPEXCH1.na.ads.idt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 11 Apr 2011, Ardelean, Andrei wrote:

> Hi,
>
> Am interested in using MT29F2G08AABWP NAND Flash memory for a new
> embedded design and I couldn't find a clear specification regarding how
> reliable is the NAND flash vs. NOR for reading operation.
>
> If I program successfully a NAND block, read back and verify
> successfully the information and never erase or program that particular
> block again, can I assume that block will remain a good block and the
> information written there is safe for READING, roughly as safe as a NOR
> sector?

In general, no. NAND flashes exhibit a phenomenon known as 'read disturb'=
=20
which means that the data degrades every time it is written. It is also a=
=20
process that happens over time even if no reads are performed.

It is a very slow process though, so for your particular application it=20
may not be a problem.

Normally error correcting codes (ECC) are used when NAND flash is used as=
=20
a medium to at least handle the odd bit flipping here and there, and to=20
signal that it may be prudent to rewrite the data if the bits are=20
decaying.

> Is it any reason to keep in NAND copies of Kernel, bootloader or RFS? Is
> it a standard practice in the industry to keep copies in NAND even
> though we do not erase/program those during the normal operation?

I don't know if there's a standard practice or even a recommended=20
practice. One issue is that as chip geometries shrink with the=20
introduction of new technologies, the bit error probabilities go up, so=20
it really is a moving target, and it depends on your application too.

It is usually very difficult to get any form of reliability data from the=
=20
manufacturers. Chips from different manufacturers can behave differently=20
too even if their specs look identical.

The following document does a pretty good job of summing up NAND flash=20
error modes:

http://download.micron.com/pdf/presentations/events/flash_mem_summit_jcooke=
_inconvenient_truths_nand.pdf

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
