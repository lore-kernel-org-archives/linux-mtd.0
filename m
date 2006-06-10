Received: from ug-out-1314.google.com ([66.249.92.173])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fp2Sy-0000FZ-Ea
	for linux-mtd@lists.infradead.org; Sat, 10 Jun 2006 08:21:35 -0400
Received: by ug-out-1314.google.com with SMTP id u40so1224103ugc
	for <linux-mtd@lists.infradead.org>;
	Sat, 10 Jun 2006 05:21:20 -0700 (PDT)
From: Husam <husamsenussi@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Subject: Re: DiskOn Chip Millennium Plus 32MB + INFTL
Date: Sat, 10 Jun 2006 13:21:37 +0100
References: <4488665D.5010908@kalikstein.com>
	<200606090104.37756.husamsenussi@gmail.com>
	<1149812283.18635.52.camel@shinybook.infradead.org>
In-Reply-To: <1149812283.18635.52.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200606101321.37502.husamsenussi@gmail.com>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 09 June 2006 01:18, you wrote:
> On Fri, 2006-06-09 at 01:04 +0100, Husam wrote:
> > I have device with  DiskOnChip Millennium Plus 64M "2x 32M", so I start
> > making changes to nand based driver using the old one but I found the
> > following problems:
> >
> > 1. The NAND layer use lookup table to set the size of the page, erase
> > block .. etc, but this does work will 32/64M because of interleave.
>
> I thought the 64MiB device was two separate 'floors' of 32MiB? So it's
> two chips of the same size... what exactly is the problem?
>
Yes thats correct but the 32MiB consist of two "NAND 16MiB, 8-bit" Chip, 
providing 16 bit access using interleave, and that double size the page "Page 
= 1024 + 32 OOB".

But does NAND layer need to be abee to handle Multi floor device?

> > 2. When I set bus width to 16 in diskonchip level nand_scan return an
> > error because that doesn't match with table.
>
> Doesn't match with which table? What chip ID is detected?
>
Yes the ID exist on the table "mfr = 0x98 (Toshiba) , id = 0x75" which match 
the id I get from trueffs driver for wince, so I would expect "NAND 16MiB, 
8-bit". However as I said before the driver should double the size of the 
page because of interleave.

> > 3. Reading and writing has to be done in 16 bit otherwise you lose data,
> > because MDOC+ 32/64M moves the pointer 2 bytes even if you read one byte.
>
> That's OK though, isn't it? Writing has to be done in chunks much larger
> than that anyway, and for ECC reasons so does reading.
>
> > 4. I found that read_buff terminate the read each time, and because of
> > that nand_read_ecc skip bytes when read across sections.
>
> I think the new code probably fixed this, didn't it? If not, we can make
> sure it does.
No  you are still terminating the read at the end of read_buf function, you 
wold need to

1. Send READ command
2. Read date "e.g. 512 bytes" 
3. Read ECC 6 bytes
4. terminate read stream

My be diskonchip layer should implement read_page !!!

>
> > 5. Layout of the data on the page is different form 16M, but I'm not sure
> > if this is specific  to INTFL.
>
> I _think_ it's specific to INFTL -- it's weird, though. I don't actually
> know why M-Systems did that interleaving. There are guys from M-Systems
> on the list though -- perhaps they can enlighten us?
>
But would be able to use the same layout with jffs?

> > I had look at the changes you guys made recently and I found that some of
> > these change would fix some of the above problems but not all of them,.
>
> Now is a good time to get the remaining issues fixed. I'd very much like
> to have the 32MiB and 64MiB DiskOnChip Millennium Plus devices working.

Thats good ... because from what I see 64MiB is not even supported by INTFL 
layer, in 64MiB each device has separate boot records but information for 
some of the partitions into the two boot records.

e.g

Partition 1

DISK 1

PARTITION[1] ->
        virtualUnits    = 1184
        firstUnit       = 17
        lastUnit        = 0 				====> Disk 2
        flags           = 0x4000000d
        spareUnits      = 2
        Reserved0       = 16
        Reserved1       = 0

Disk 2

PARTITION[1] ->
        virtualUnits    = 1184
        firstUnit       = 0					===> in Disk 1
        lastUnit        = 1224
        flags           = 0x4000000d
        spareUnits      = 2
        Reserved0       = 0
        Reserved1       = 0
