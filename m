Received: from tolkor.sgi.com ([192.48.180.13])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eHmX-0004bl-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 17:11:01 +0100
Message-ID: <3D57DE0C.9EF20FF@sgi.com>
Date: Mon, 12 Aug 2002 11:10:52 -0500
From: Steven Hein <ssh@sgi.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
CC: linux-mtd@lists.infradead.org
Subject: Re: Hardware ECC in NAND flash driver
References: <3D511B55.6ADABE4D@sgi.com>
	 <1028726139.19447.255.camel@thomas.tec.linutronix.de>
	 <3D527739.5B19816C@sgi.com>
	 <1028975588.9592.167.camel@thomas.tec.linutronix.de> <1029020732.9668.344.camel@thomas.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Thomas Gleixner wrote:
> 
> On Sat, 2002-08-10 at 12:33, Thomas Gleixner wrote:
> > More comments later today.
> Hi Steven,
> 
> back again. I tried several possibilities to deal with all aspects. I
> picked up most of your ideas and worked them into the existing code. My
> final conclusion is as follows:
> 
> struct nand_chip got following extensions:
> 
> calculate_ecc - function for ecc calculation or readback from ecc
> hardware, defaults to nand_calculate_ecc for software ecc
> correct_data - function for ecc correction, matching to ecc generator
> (sw/hw), defaults to nand_correct_data for software ecc
> enable_hwecc - function to enable (reset) hardware ecc generator
> eccmod - mode of ecc: see constants
> eccsize - databytes used per ecc-calculation, set by nand.c depending on
> eccmod value
> 
> following eccmodes are defined at the moment
> 
> #define NAND_ECC_NONE           0
> is forced, if CONFIG_MTD_NAND_ECC is not set
> #define NAND_ECC_SOFT           1
> is forced, if CONFIG_MTD_NAND_ECC is set and no hardware ecc is selected
> #define NAND_ECC_HW3_256        2
> user selectable, if your ecc hardware supports 3 byte ecc for 256 byte
> of data (DOC or passive SmartMedia adaptors)
> #define NAND_ECC_HW3_512        3
> user selectable, if your ecc hardware supports 3 byte ecc for 512 byte
> of data (Samsung S3C2410)
> 
> If you select hardware ecc in your driver, you have to take care, that
> calculate_ecc, correct_data and enable_hwecc are filled with the
> relevant function pointers and eccmod is set to the appropriate type,
> before you call nand_scan.

This all looks great!

> 
> I'm still not willing to write already written data to the device for a
> second time. So I decided to skip hardware ecc for that case. If you use
> a NAND aware filesystem e.g. JFFS2 this should not happen, otherwise you
> will get in trouble anyway.

Sounds good.

> 
> The funtion, which does correct_data calculations for the specfic
> hardware ecc should be implemented as a general function in nand_ecc.c
> to make it usable for similar hardware drivers and to avoid duplicated
> code in these drivers.

Dumb question--is ECC calculation "generic" enough to be applicable from
one hardware ECC generator to the next, even if they do the same number
of ECC bytes for the same block size?  Is it very likely that the
algorithm
is actually going to be the same between platforms?


> 
> Get code from CVS and enjoy. Thanks for your suggestions. The standard
> software ecc mode runs on my machine without complains. I tested HW3_256
> mode with software ecc routines and a dummy enable_hwecc and found no
> problems. Any suggestions and improvements are welcome.
> Happy testing.
> 
THANKS for adding this!!  I'll try it today/tomorrow.

Another question--how do you typically handle adding new HW drivers
to the NAND flash code?  I know that in my case, the HW implementation
uses access to specific S3C2410 processor registers, and those
register definitions live in include/asm-arm/arch-s3c2410 directory
in the Linux kernel tree.  I would expect that these arch-specific
files would not live in the MTD tree.  Let me know--I'd like to get
this HW driver incorporated into the standard tree as soon as I
get it working!


Thanks again,
Steve

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Steve Hein (ssh@sgi.com)              Engineering Diagnostics/Software
Silicon Graphics, Inc.                          
1168 Industrial Blvd.                 Phone: (715) 726-8410
Chippewa Falls, WI 54729              Fax:   (715) 726-6715
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
