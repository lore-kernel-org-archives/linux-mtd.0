Received: from hex.linuxgrrls.org
	([212.18.228.73] helo=mail.linuxgrrls.org ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gP7B-0005xl-Bu
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 14:29:37 +0100
Date: Sat, 26 Jul 2003 14:29:37 +0100 (BST)
From: jasmine@regolith.co.uk
To: Andrew Victor <andrew@sanpeople.com>
In-Reply-To: <1059144299.3544.129.camel@fuzzie.sanpeople.com>
Message-ID: <Pine.LNX.4.56.0307261428210.6903@hex.linuxgrrls.org>
References: <1059144299.3544.129.camel@fuzzie.sanpeople.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: DataFlash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Fri, 25 Jul 2003, Andrew Victor wrote:

> hi,
> 
> The attached patch adds support for Atmel DataFlash devices.
> (http://www.atmel.com/products/DataFlash/)
> DataFlash differs from standard NOR flash in that the page sizes are 528
> or 1056 bytes (depending on capacity).  [And no, it's not NAND flash]

No, but the smaller featuresize on those chips means that you must treat 
it like NAND Flash and use ECC on it.  It also has NAND-like restrictions 
on read/write/erase cycles.

My recommendation is to avoid DataFlash in new designs.

-Jas.
