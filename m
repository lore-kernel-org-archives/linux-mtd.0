Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HaJWI-0002V7-R2
	for linux-mtd@lists.infradead.org; Sat, 07 Apr 2007 18:36:32 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: mtd_info/mtd_info_user>size wrong type
Date: Sun, 8 Apr 2007 10:42:56 +1200
References: <200704070849.38048.manningc2@actrix.gen.nz>
	<625fc13d0704061826o6abfc33pd4c11173121561d5@mail.gmail.com>
In-Reply-To: <625fc13d0704061826o6abfc33pd4c11173121561d5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200704081042.57089.manningc2@actrix.gen.nz>
Cc: Josh Boyer <jwboyer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 07 April 2007 13:26, Josh Boyer wrote:
> On 4/6/07, Charles Manning <manningc2@actrix.gen.nz> wrote:
> > Folks
> > As people are starting to use larger NAND partitions (4GB+), an
> > inconsistency in the size field has become apparent.
> >
> > This is a unint32_t which is clearly too small for modern NAND arrays.
>
> Yes, known issue.
>
> > The read/write funcions use loff_t which is correct.
> >
> > It would seem that size needs to be increated to loff_t too.
>
> Have you tried doing that?  I seem to recall hearing that it was a bit
> more involved than just changing the size member to be 64 bit.

I have not tried this though someone is aty present. I do know that someone 
has used YAFFS with Linux on a 6G or so partition.However they wanted a 
really fast nand driver and wrote a custom nand driver.

There definitely are some downstream problems too. It is not just a matter of 
changing the type.

eg using do_div() instead of divides and making sure that the right values 
flow through the whole  mtd subsystem fron nand_base..c right through 
mtdpart, mtdcat, the tools etc.

-- Charles
