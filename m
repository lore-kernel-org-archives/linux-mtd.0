Subject: Re: DiskOn Chip Millennium Plus 32MB + INFTL
From: David Woodhouse <dwmw2@infradead.org>
To: Husam <husamsenussi@gmail.com>
In-Reply-To: <200606101321.37502.husamsenussi@gmail.com>
References: <4488665D.5010908@kalikstein.com>
	<200606090104.37756.husamsenussi@gmail.com>
	<1149812283.18635.52.camel@shinybook.infradead.org>
	<200606101321.37502.husamsenussi@gmail.com>
Content-Type: text/plain
Date: Sat, 10 Jun 2006 23:05:14 +0100
Message-Id: <1149977115.18635.158.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-06-10 at 13:21 +0100, Husam wrote:
> Yes thats correct but the 32MiB consist of two "NAND 16MiB, 8-bit" Chip, 
> providing 16 bit access using interleave, and that double size the page "Page 
> = 1024 + 32 OOB".
> 
> But does NAND layer need to be abee to handle Multi floor device?

Hm, no -- it's two separate device, isn't it? So don't we just have to
probe them separately and then perhaps use something like mtdconcat?

> > > 2. When I set bus width to 16 in diskonchip level nand_scan return an
> > > error because that doesn't match with table.
> >
> > Doesn't match with which table? What chip ID is detected?
> >
> Yes the ID exist on the table "mfr = 0x98 (Toshiba) , id = 0x75" which match 
> the id I get from trueffs driver for wince, so I would expect "NAND 16MiB, 
> 8-bit". However as I said before the driver should double the size of the 
> page because of interleave.

Hm, is it actually two 8-bit chips, rather than a single 16-bit chip?

In that case, we might have to do a bit more to make it work.

> > > 4. I found that read_buff terminate the read each time, and because of
> > > that nand_read_ecc skip bytes when read across sections.
> >
> > I think the new code probably fixed this, didn't it? If not, we can make
> > sure it does.
> No  you are still terminating the read at the end of read_buf function, you 
> wold need to
> 
> 1. Send READ command
> 2. Read date "e.g. 512 bytes" 
> 3. Read ECC 6 bytes
> 4. terminate read stream
> 
> My be diskonchip layer should implement read_page !!!

Yeah, I think that's probably a sane plan.

> >
> > > 5. Layout of the data on the page is different form 16M, but I'm not sure
> > > if this is specific  to INTFL.
> >
> > I _think_ it's specific to INFTL -- it's weird, though. I don't actually
> > know why M-Systems did that interleaving. There are guys from M-Systems
> > on the list though -- perhaps they can enlighten us?
> >
> But would be able to use the same layout with jffs?

I see no reason why not.

> > Now is a good time to get the remaining issues fixed. I'd very much like
> > to have the 32MiB and 64MiB DiskOnChip Millennium Plus devices working.
> 
> Thats good ... because from what I see 64MiB is not even supported by INTFL 
> layer, in 64MiB each device has separate boot records but information for 
> some of the partitions into the two boot records.

Hm, OK -- we'll need to work on that too.

Let's forget INFTL for now -- can we work on getting basic read/write
operations on the 32MiB unit working first? We can do 64MiB next, then
INFTL (for 32MiB and then 64MiB).

-- 
dwmw2
