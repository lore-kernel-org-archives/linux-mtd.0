Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FY1LK-0002lz-OO
	for linux-mtd@lists.infradead.org; Mon, 24 Apr 2006 09:43:37 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IY800HZHBFTE520@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 24 Apr 2006 09:43:05 -0400 (EDT)
Date: Mon, 24 Apr 2006 09:43:05 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <625fc13d0604240550x2bdcf5e0p179a25ae25483551@mail.gmail.com>
To: Josh Boyer <jwboyer@gmail.com>
Message-id: <Pine.LNX.4.64.0604240932340.18520@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <625fc13d0604240550x2bdcf5e0p179a25ae25483551@mail.gmail.com>
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Sibley and wbuf fixups
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 24 Apr 2006, Josh Boyer wrote:

> Howdy,
> 
> Joern and I were discussing a patch in his tree that merges some of
> the ECC'd NOR code in JFFS2 with the code for Sibley flashes that was
> put in recently.  The patch can be found here:
> 
> http://git.infradead.org/?p=users/joern/mtd-2.6.git;a=commitdiff;h=af97d29fbcc5c4fffdb39f617730e73ad4ce2863
> 
> A question came up because the patch removes a fixup for the wbuf that
> is needed on ECC'd NOR chips in regards to the cleanmarker size.  The
> cleanmarkers on ECC'd NOR chips have to be 16 bytes in length.  This
> is because the minimum write size on those chips is 8 bytes.  The
> structure is too small to fit in 8 bytes and we need to prevent JFFS2
> from trying to write to the last 4 bytes of the second write region,
> since those chips prevent writes to a section that has already been
> written.  Hence, 16 bytes for a cleanmarker size.
> 
> The fixup looks for this and corrects the wbuf offset and length so
> that JFFS2 does not throw a non-contiguous write error a bit further
> down in the code.  As it stands now, the patch is broken for the ECC'd
> NOR chips.  However, our main question is does Sibley need a similar
> fixup for the wbuf?  If not, why?

Sibley has two write modes.  "object" and "control" modes if I remember 
the names correctly.  The mode that behaves like traditional NOR may 
only use half the flash size since 16 out of 32 flash words are then 
unusable (16 writable words are followed by 16 unusable words and so 
on).

The other mode can use the full flash size but it must write a full 1KB 
block at once and it can be written only once.  To be able to write 
again you must erase the whole flash sector.

Therefore JFFS2 on Sibley currently uses the 1KB block write mode with 
the help of CONFIG_JFFS2_FS_WRITEBUFFER.  This also means, 
unfortunately, that the JFFS2 clean marker must waste a whole 1KB block 
per erase sector.


Nicolas
