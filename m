Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ADImw-00085R-Os
	for <linux-mtd@lists.infradead.org>; Sat, 25 Oct 2003 08:24:43 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: Alice Hennessy <ahennessy@mvista.com>,
	linux-mtd@lists.infradead.org
Date: Sat, 25 Oct 2003 20:29:25 +1300
References: <3F984931.E6409ED7@mvista.com>
In-Reply-To: <3F984931.E6409ED7@mvista.com>
MIME-Version: 1.0
Message-Id: <20031025072323.378625DF3@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Different nand interface
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 24 October 2003 10:33, Alice Hennessy wrote:
> Hi,
>
> I need some advice on how to support a board that has a hardware state
> machine
> that creates a parallel bus style interface to the NAND chip.  It is
> totally
> different from the standard 8 IO signal controls.   It can do write_byte
> and read_byte
> put requires the offset into the flash as a parameter.    nand.c is
> fairly modular, allowing
> several functions to be coded in the hardware file but there is no
> current method of
> passing an offset into, say, read_byte and write_byte unless the
> nand_chip priv field
> can be used (via mtd->priv).   Do you think the standard nand.c can be
> used in this
> case or should I create a specific one for this board?
>
> Any advice would be appreciated.

I would expect the existing nand.c can be used though you might have to do 
some clever stuff to hide your flash behind it.

This is definitely the prefered way to get going in the beginning because it 
will help comparmentalise things that inevitably go wrong when bringing up 
new hardware.

Once your system is up and running you might find that you want to replace 
nand.c for efficiency reasons or whatever, but quite likely this won't be 
required (and at least you'll have a way better understanding of where you 
need to go).

G'luck

-- CHarles
