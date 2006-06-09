Subject: Re: DiskOn Chip Millennium Plus 32MB + INFTL
From: David Woodhouse <dwmw2@infradead.org>
To: Husam <husamsenussi@gmail.com>
In-Reply-To: <200606090104.37756.husamsenussi@gmail.com>
References: <4488665D.5010908@kalikstein.com>
	<1149794376.18635.2.camel@shinybook.infradead.org>
	<200606090104.37756.husamsenussi@gmail.com>
Content-Type: text/plain
Date: Fri, 09 Jun 2006 01:18:03 +0100
Message-Id: <1149812283.18635.52.camel@shinybook.infradead.org>
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

On Fri, 2006-06-09 at 01:04 +0100, Husam wrote:
> I have device with  DiskOnChip Millennium Plus 64M "2x 32M", so I start making 
> changes to nand based driver using the old one but I found the following 
> problems:
> 
> 1. The NAND layer use lookup table to set the size of the page, erase block ..  
> etc, but this does work will 32/64M because of interleave.

I thought the 64MiB device was two separate 'floors' of 32MiB? So it's
two chips of the same size... what exactly is the problem?

> 2. When I set bus width to 16 in diskonchip level nand_scan return an error 
> because that doesn't match with table.

Doesn't match with which table? What chip ID is detected?

> 3. Reading and writing has to be done in 16 bit otherwise you lose data, 
> because MDOC+ 32/64M moves the pointer 2 bytes even if you read one byte.

That's OK though, isn't it? Writing has to be done in chunks much larger
than that anyway, and for ECC reasons so does reading.

> 4. I found that read_buff terminate the read each time, and because of that 
> nand_read_ecc skip bytes when read across sections.

I think the new code probably fixed this, didn't it? If not, we can make
sure it does.

> 5. Layout of the data on the page is different form 16M, but I'm not sure if 
> this is specific  to INTFL.  

I _think_ it's specific to INFTL -- it's weird, though. I don't actually
know why M-Systems did that interleaving. There are guys from M-Systems
on the list though -- perhaps they can enlighten us?

> I had look at the changes you guys made recently and I found that some of 
> these change would fix some of the above problems but not all of them,.

Now is a good time to get the remaining issues fixed. I'd very much like
to have the 32MiB and 64MiB DiskOnChip Millennium Plus devices working.

-- 
dwmw2
