Received: from lrts1.demon.co.uk ([158.152.10.39])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16JWZX-0000Jk-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Dec 2001 09:11:31 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Gareth Davies <grmd@lotwillow.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Re: FAQ? How do I use slram?
Date: Thu, 27 Dec 2001 09:11:20 +0000
References: <NFBBLCEFBCFEPMJJKOIKGEAHCBAA.cfowler@outpostsentinel.com>
In-Reply-To: <NFBBLCEFBCFEPMJJKOIKGEAHCBAA.cfowler@outpostsentinel.com>
Cc: "Chris Fowler" <cfowler@outpostsentinel.com>
MIME-Version: 1.0
Message-Id: <01122709112000.02532@tomsk.lotwillow.ltd>
Content-Transfer-Encoding: 8bit
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

On Thursday 27 December 2001 00:07 am, Chris Fowler wrote:
>Is slram hardware?
>

Yes and no ...

On older pentium motherboards that use Intel's FX, VX and TX chipsets,
only the first 64 Mbytes of on-board RAM is cached. Such boards often
support more that 64 Mbytes, typically 128 or 256 Mbytes, but the extra
is uncached. Adding more than 64 Mbytes really hurts the performance of
operating systems such as Linux and Windows-95 that load themselves to
the top of memory.

One solution to this is to restrict the operating system to the cached
part of memory, and use the extra RAM for something else. Ideally, the
operating system would be able to use it directly for buffers, but Linux
cannot do this. An alternative that many people have suggested is to use
the additional memory as a ramdisk, then use it as the highest priority
swap area.

This is what I am trying to achieve. My systems typically use up to 40
Mbytes of swap, so if the slower memory was used instead of the disk,
there ought to be a significant performance increase.

I have searched for drivers that provide this functionality. There was
an older slram patch provided by Brad Keryan but this doesn't seem to be
available anymore. In August 1999, David Woodhouse posted on a Linux
kernel mailing list that there was an alternative driver that is part of
the MTD codebase. Since slram.c is included as part of current kernel
distributions, in the drivers/mtd/devices directory, I am trying to make
use of it ... but without success as yet!

Gareth.

-- 
Gareth Davies, Lotwillow Ltd.     'Always' and 'never' are two words you
Tel. +44 1344 294900               should always remember never to use.
Fax. +44 1344 294902                                         - M. Kendig
