Received: from clix-jaquesmartin-nz.cpe.clix.net.nz ([203.97.0.186]
	helo=firstline.co.nz)
	by pentafluge.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GQbb8-0003xP-1V
	for linux-mtd@lists.infradead.org; Fri, 22 Sep 2006 04:21:07 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: Multiple writes to NAND OOB...
Date: Fri, 22 Sep 2006 15:18:46 +1200
References: <Pine.GSO.4.58.0609201121180.26525@sun>
In-Reply-To: <Pine.GSO.4.58.0609201121180.26525@sun>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200609221518.46412.manningc2@actrix.gen.nz>
Cc: Siddharth Choudhuri <choudhri@cs.tamu.edu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 21 September 2006 04:30, Siddharth Choudhuri wrote:
> Hi,
>
> I have the following question regarding multiple writes to OOB data:
>
> Is it possible to write to the OOB data of the same page multiple times ?
Yes it is **possible**, but be be careful. If you do too many writes without 
an erase you can cause corruptions due to "write disturb".

> If so, does it mean that the bytes being written are to different
> locations(offsets) of the OOB because a byte cannot be rewritten in NAND
> unless its block is erased ?

If you write to NAND, then what you get is the ANDing of the pattern you write 
against what was already there.

If a byte had 0011-0101 and you program 1101-0011 nto it you'll end up with 
0001-0001.

Thus, if you want to program a new pattern into some bytes, you use 0xff for 
any bytes you don't want to change.

You need to do an erase to change bits back to 1.

Note a subtle difference. Most NOR writes will fail if you write a pattern 
that tries to set a bit from 0 to a 1.  On NAND, the bit will not change, but 
it is not an error to try to do this.

-- CHarles
