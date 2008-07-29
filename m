Date: Tue, 29 Jul 2008 10:54:51 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: 2nd problem with read_subpage() ?
In-Reply-To: <1217324707.3124.29.camel@sauron>
Message-ID: <alpine.LFD.1.10.0807291052280.17391@casper.infradead.org>
References: <1217314432.3124.9.camel@sauron> <1217323810.3124.19.camel@sauron>
	<1217324707.3124.29.camel@sauron>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="1985284609-456692116-1217325292=:17391"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1985284609-456692116-1217325292=:17391
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

Hi,

Oh thanks for explanation. 
Now I understand what has puzzled you. 

Nothing wrong is here. 
Driver reads one subpage - then it needs to check ECC for the subpage -
it jumps to position of ECC for that region and reads it. 
Then it checks if it is correct. 
> 
> On Tue, 2008-07-29 at 12:30 +0300, Artem Bityutskiy wrote:
> > On Tue, 2008-07-29 at 09:53 +0300, Artem Bityutskiy wrote:
> > > Glance at nand_do_read_ops():
> > > 
> > > 
> > > if (likely(sndcmd)) {
> > >         chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
> > >         sndcmd = 0;
> > > }
> > 
> > Alexey,
> > 
> > my investigation showed that this "random output" command is not
> > supported by all flashes. ST-micro NANDs seems to support it
> > (I checked 2 manuals), while Sumsung NANDs do not (checked manual
> > for K9XXG08UXA). This means your implementation will break many
> > systems and should be either fixed or reverted.
> 
> I tried to implement this command in nandsim and test it with your
> patch and found that there is something wring with how you use it.
> 
> What I do is dd if=/dev/mtd0 of=file bs=512 count=1 - just read one
> sub-page. And in nandsim I see the following:
> 
> 1. NAND_CMD_READ0 command, - read from eraseblock 0, column 0. This is
> fine and seems to be called from nand_do_read_ops():
> 
> if (likely(sndcmd)) {
> 	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>         sndcmd = 0;
> }
> 
> 2. Then NAND_CMD_RNDREAD command is issued with column address
> 0x828, which is completely weird. It is called from nand_read_subpage():
> 
> ...
> if (eccpos[(start_step + num_steps) * chip->ecc.bytes] & (busw - 1))
> 	aligned_len++;
> 
> chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize + aligned_pos, -1);
> chip->read_buf(mtd, &chip->oob_poi[aligned_pos], aligned_len);
> ....
> 
> I do not understand what is going on.
> 
> -- 
> Best regards,
> Artem Bityutskiy (Битюцкий Артём)
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
--1985284609-456692116-1217325292=:17391--
