Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEEHg-0007xS-KD
	for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2003 20:48:16 +0000
Sender: ahennessy@mvista.com
Message-ID: <3F9D8384.ABC9FD4@mvista.com>
Date: Mon, 27 Oct 2003 12:43:48 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3F984931.E6409ED7@mvista.com>
	<1066981292.29915.584.camel@hades.cambridge.redhat.com>
	<1067284806.16241.2.camel@imladris.demon.co.uk>
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

> On Mon, 2003-10-27 at 10:25 -0800, Alice Hennessy wrote (modulo newlines):
> > Yes, I am looking at the current code which is more modular so it
> > gives me hope.
> > There are 2 nand chips on the board.  If you want to read from the
> > 0x100th byte on chip 1 you need to do readb(chip1_base + 0x100);  if
> > you want to write the 0x10000th byte on chip 2 you need to do
> > writeb(chip2_base + 0x10000,bytedata).
> > The chips are 16M X 8 bit and  are mapped in a contiguous 32 M byte
> > memory space with 0-16M for chip1 and 16-32M for chip2.
>
> That's weird. How are the out-of-band areas accessed? How do you send
> commands like READ_ID and ERASE?
>
> --
> dwmw2

The hardware logic uses register access for special commands.   Readid,
status does
2 writes to a register, one for address (to distinquish which flash), one for
command and one more
to read.  Erase takes 2 writes to a register, address then command.   The
out-of-band access
uses a register to give a command and then the out-of-band data is read using

readb with  offset.

Alice
