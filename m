Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bp7Zg-000661-Ne
	for linux-mtd@lists.infradead.org; Mon, 26 Jul 2004 11:39:38 -0400
From: Andy Hawkins <a.hawkins@cabletime.com>
To: D.A.Fedorov@inp.nsk.su
In-Reply-To: <Pine.SGI.4.10.10407262153220.569820-100000@Sky.inp.nsk.su>
References: <Pine.SGI.4.10.10407262153220.569820-100000@Sky.inp.nsk.su>
Content-Type: text/plain
Message-Id: <1090856360.2220.63.camel@adh>
Mime-Version: 1.0
Date: 26 Jul 2004 16:39:20 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem writing to NOR flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2004-07-26 at 16:00, Dmitry A. Fedorov wrote:
> I have use the same cmdset (exactly) but single (interleave 1) 16 bit
> wide chip Am29LV640. No problems yet with backported code.

I've been doing a bit of digging now. The chip in question is an ST
M29W320DB (32MBit)

do_xxlock_oneblock is called, with an address of 0. However, this is
translated in the function to an address of ffc00002. This address is
then (eventually) passed into map_write16, which adds the virtual
address of the flash onto this address...

This to me appears to be invalid, but I'm not entirely sure what
*should* be happening here. The chip's start address is added on to the
address inside do_xxlock_oneblock (although this is zero), and then the
virtual address is added on again. However, the translation doesn't
appear correct to me:

adr = ((adr & ~0xffff) | 0x2) + ~0x3fffff;

As you can probably tell, I don't fully understand how the code is
*supposed* to work, so it's difficult to know exactly what is going
wrong here.

Thanks.

Andy
