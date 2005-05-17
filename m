Received: from mgw-ext01.nokia.com ([131.228.20.93])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DXzUo-0004fc-Q1
	for linux-mtd@lists.infradead.org; Tue, 17 May 2005 06:40:19 -0400
Date: Tue, 17 May 2005 13:38:06 +0300
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: jeanwelly <jeanwelly@gmail.com>
Message-ID: <20050517103806.GA14992@angel.research.nokia.com>
References: <c2bc1f40505161946b00566e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2bc1f40505161946b00566e@mail.gmail.com>
Cc: Balloon@balloonboard.org, linux-mtd@lists.infradead.org,
	yaffs@stoneboat.aleph1.co.uk
Subject: Re: Real bad blocks of nand flash?
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 17, 2005 at 10:46:52AM +0800, ext jeanwelly wrote:
> Why occured so many bad blocks of nand. Are these blocks real bad? How
> can I take a test in another way?

I have seen few test boards with JFFS2 partitions and more bad blcoks
than there should be.  More than the manyfactures suggests the should
be at maximum.

When investigating one board I found something had been write garbage
to OOB. I found for example word "driv" at the end of one OOB and "er"
at the beginning of next. It looked just as if somebody had written
kernel memory at random point to flash. This is not reproducinle but
now I have garbage check in nand_base.c:write_oob() to hopefully catch
this if it ever repeats.

With one boatd with with lots of presumably incorrectly marked bad
blocks board I broke the rules and simply disabled the bad block check
from nand_base.c and from flash_eraseall.c. I ran flash_eraseall and
the flash erased nicely except for few, obviously real bad blocks
which refused ot be erased. I wouldn't recommed the procedure because
one end up with no bad blocks at all but in my case it worked nice and
test board has performed flawlessly since then.

I think we would need a simple test program that would be similar to
badblocks program, writing patterns of 0x00, 0x55, 0xAA etc. to flash
and trying to find if some block fails when erasing, writing or in
verify read.

Jarkko Lavinen
