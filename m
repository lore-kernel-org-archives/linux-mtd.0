Received: from imladris.demon.co.uk ([193.237.130.41] ident=[aV1luUrNmLo0HVN25oYkupKu0P6W1u8+])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15x15d-0007EU-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Oct 2001 08:07:38 +0100
Date: Fri, 26 Oct 2001 08:16:46 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: "Kim, Sanghun" <shkim@fdma.snu.ac.kr>
cc: Linux Mtd <linux-mtd@lists.infradead.org>
Subject: Re: NAND-MTD (Please help me.....)
In-Reply-To: <AEECKHHDHJAAFPKILIGNIELJCAAA.shkim@fdma.snu.ac.kr>
Message-ID: <Pine.LNX.4.33.0110260815020.12271-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 26 Oct 2001, Kim, Sanghun wrote:

> 
> I have changed "spia.c" to my own "spia.c"
> (later spia.c is ported to our board..)
> 
> but at boot process, following messages returned.
> "Could not find valid boot record"
> "Could not mount NFTL device"
> ....
> 
> so, according to "MTD_Howto",
> 
> we do "nftl_format .....". But our NAND Flash's erase size is 0x4000.
> so nftl_format returned with reporting "not 8kb, i'm confused"....
> 
> Please tell me SOLUTION...!!!...

You can't use NFTL on devices other than a DiskOnChip. Use JFFS, or I 
believe people might be looking at writing a SmartMedia translation layer 
which does much the same as NFTL but without requiring ECC hardware. 

--
dwmw2
