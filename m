Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEC8K-0007GA-53
	for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2003 18:30:29 +0000
Sender: ahennessy@mvista.com
Message-ID: <3F9D6328.547A39A6@mvista.com>
Date: Mon, 27 Oct 2003 10:25:44 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3F984931.E6409ED7@mvista.com>
	<1066981292.29915.584.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Different nand interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

> On Thu, 2003-10-23 at 14:33 -0700, Alice Hennessy wrote:
> > Hi,
> >
> > I need some advice on how to support a board that has a hardware state
> > machine that creates a parallel bus style interface to the NAND chip.
> > It is totally different from the standard 8 IO signal controls.   It
> > can do write_byte and read_byte put requires the offset into the flash
> > as a parameter.    nand.c is fairly modular, allowing several
> > functions to be coded in the hardware file but there is no current
> > method of passing an offset into, say, read_byte and write_byte unless
> > the nand_chip priv field
> > can be used (via mtd->priv).   Do you think the standard nand.c can be
> > used in this case or should I create a specific one for this board?
>
> S'difficult to say without knowing more details of the hardware in
> question. What does it _do_ with the address lines in question? Are you
> at least looking at the current code which has read_buf() functions?
>
> Even the DiskOnChip isn't this bizarre :)
>
> --
> dwmw2

Yes, I am looking at the current code which is more modular so it gives me
hope.
There are 2 nand chips on the board.  If you want to read from the 0x100th
byte
on chip 1 you need to do readb(chip1_base + 0x100);  if you want to write
the 0x10000th byte on chip 2 you need to do writeb(chip2_base +
0x10000,bytedata).
The chips are 16M X 8 bit and  are mapped in a contiguous 32 M byte memory
space
with 0-16M for chip1 and 16-32M for chip2.

Alice
