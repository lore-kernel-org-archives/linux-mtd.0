Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rrkt3-00009q-Gx
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2012 06:38:46 +0000
Message-ID: <4F263AD8.7030809@newsguy.com>
Date: Sun, 29 Jan 2012 22:38:16 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
 <1327673847.29385.4.camel@sauron.fi.intel.com>
In-Reply-To: <1327673847.29385.4.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, robert.jarzmik@free.fr
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/27/2012 06:17 AM, Artem Bityutskiy wrote:
> Hi Mike,
>
> On Tue, 2012-01-03 at 16:05 -0800, Mike Dunn wrote:
>> +config MTD_NAND_DOCG4
>> +	tristate "Support for DiskOnChip G4 (EXPERIMENTAL)"
>> +	depends on EXPERIMENTAL
>> +	select BCH
>> +	select BITREVERSE
>> +	help
>> +	  Support for diskonchip G4 nand flash, found in various smartphones and
>> +	  PDAs, among them the Palm Treo680, HTC Prophet and Wizard, Toshiba
>> +	  Portege G900, Asus P526, and O2 XDA Zinc.
>> +
>> +	  With this driver you will be able to use UBI and create a ubifs on the
>> +	  device, so you may wish to consider enabling UBI and UBIFS as well.
>> +
>> +	  These devices ship with the Mys/Sandisk SAFTL formatting, for which
>> +	  there is currently no mtd parser, so you may want to use command line
>> +	  partitioning to segregate write-protected blocks.  On the Treo680, the
>> +	  first five erase blocks (256K each) are write-protected, followed by
>> +	  the block containing the saftl partition table.  This is probably
>> +	  typical.
> Why do add this to drivers/mtd/nand/Kconfig instead of
> drivers/mtd/devices/Kconfig lige DOCG3 does?


Because the driver uses the mtd/nand interface (unlike the docg3).  It is on top
of the nand infrastructure code.  Specifically, nand_base.c and nand_bbt.c.

I questioned my initial decision to use the nand interface when I saw that
Robert did not do that for the docg3.  Although both devices are MLC nand, they
don't conform very well with the typical nand device behavior because they are
wrapped in a proprietary controller.  My initial decision was driven by the fact
that the legacy diskonchip drivers (doc2000, etc) were re-implemented (and
consolidated) some time ago to use the nand interface.  But I think Robert's
decision might have been the better one.  The nand infrastructure only provided
me with code that breaks up read/write operations into single-page chunks, and
also I was able to use some of the nand bbt management code.  The price for that
is integration with the messy nand code.  But the nand code is sufficiently
flexible that most of the default methods can be replaced, which is what I did. 
It might be best if both drivers used the same interface, and I thought about
reworking the driver to interface with the mtd code directly - as the docg3 does
- but I don't have the time.

BTW, most of the drivers in mtd/nand use the nand interface, but there is one
exception: drivers/mtd/nand/alauda.c is a nand flash, but it is actually a usb
device that does not use the nand interface.  But all drivers that *do* use the
nand interface are in this directory.

Hope this makes sense.  Let me know if not.

Thanks,
Mike
