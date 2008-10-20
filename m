Received: from smtp115.sbc.mail.sp1.yahoo.com ([69.147.64.88])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KrqA8-0000n4-NW
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 08:30:53 +0000
From: David Brownell <david-b@pacbell.net>
To: "Chen Gong-B11801" <G.Chen@freescale.com>
Subject: Re: goofy mtd m25p80 patches in GIT ...
Date: Mon, 20 Oct 2008 01:30:49 -0700
References: <200810191535.05617.david-b@pacbell.net>
	<1224489768.6770.1527.camel@macbook.infradead.org>
	<C3C4D3116BA1F84989E53FCF1F505187166DE0@zch01exm21.fsl.freescale.net>
In-Reply-To: <C3C4D3116BA1F84989E53FCF1F505187166DE0@zch01exm21.fsl.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200810200130.50054.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 20 October 2008, Chen Gong-B11801 wrote:
> I prefer to the first opinion -- renaming 'erase_block' to 'erase_chip',
> it looks more straightforward

*AND* fixing the name of the operation.

The pre-existing erase operations were:

 #define OPCODE_BE_4K            0x20    /* Erase 4KiB block */
 #define OPCODE_BE_32K           0x52    /* Erase 32KiB block */
 #define OPCODE_SE               0xd8    /* Sector erase (usually 64KiB) */

So I'm quite puzzled why you would call the chip erase
opcode a "block erase" opcode ... it's not a 4K block,
not a 32K block, not a sector (of, usually, 64K).

It's more typically something like multiple MBytes.

Having read or skimmed several dozen SPI flash specs,
none of them called chip erase a "block erase" operation.
