Received: from calvin.codito.com ([203.199.140.162]
	helo=magrathea.codito.co.in)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bl6sC-0004h8-4u
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2004 10:06:09 -0400
From: Amit Shah <amitshah@gmx.net>
To: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 15 Jul 2004 19:33:10 +0530
References: <cd5p23$dfj$1@sea.gmane.org>
	<1089896566.14567.1306.camel@hades.cambridge.redhat.com>
In-Reply-To: <1089896566.14567.1306.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200407151933.10369.amitshah@gmx.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: PCI flash: found no device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Thursday 15 Jul 2004 18:32, David Woodhouse wrote:
> On Thu, 2004-07-15 at 16:43 +0530, Amit Shah wrote:
> > Hi all,
> >
> > I've added support for flash memory for a PCI card in
> > drivers/mtd/maps/pci.c, based on the two existing drivers. The flash type
> > is Intel 28F series and supports CFI probes.
>
> The message you saw means that we didn't recognise any flash chips. Are
> you sure your 'bankwidth' was set correctly? What type and width of
> flash chips? How many are interleaved?

This is the text on the manual:

Intel Advanced+ Boot Block Flash Memory (C3)
28F800C3, 28F160C3, 28F320C3, 28F640C3 (x16)
< http://www.intel.com/design/flcomp/datashts/290645.htm >

and the flash on the board is 28F160C3B(8?)C70.

I've set the buswidth to 2, since it's 16Mbit memory, the flash size is 2MB.

However, I've not defined any partitions on the memory (yet); how to do it for 
PCI flash devices? A separate driver?

Thanks,
Amit.
-- 
Amit Shah
http://amitshah.nav.to/
