Received: from [2002:d4ee:c952::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D3b4c-0005f7-Oz
	for linux-mtd@lists.infradead.org; Tue, 22 Feb 2005 09:31:40 -0500
Date: Tue, 22 Feb 2005 15:31:37 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: "Mialkowski, Andrzej" <Andrzej.Mialkowski@intel.com>
Message-ID: <20050222143137.GC4481@xi.wantstofly.org>
References: <A11645C193F77D429D800AED92117422016A1F76@swsmsx404>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A11645C193F77D429D800AED92117422016A1F76@swsmsx404>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH,
	RFC] remove slowport mode setting from ixp2000 map driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 22, 2005 at 01:05:12PM -0000, Mialkowski, Andrzej wrote:

> Lennert,

Hi Andrzej,

First of all, thanks for your reply.  (I'll still get back to you on
the erratum #66 issue, I've been doing some testing for that but it's
all pretty involved.)


> 	It seems that you get confused FRM (Flash Read Mode) with ADC
> register settings. FRM controls only logical behavior of read from
> flash. Setting FRM=1 causes that reads from flash are ~4 times faster.
> FRM=0 is required only for code execution from flash.

That is what I said here, isn't it?

	http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=2493/1


My understanding of SP_FRM/SP_ADC is as follows.  SP_ADC controls how
many address and data cycles will be done for each slowport access.  The
slowport is 8 bit wide, and you can choose between one (8 bit), two
(16 bit), three (24 bit) or four (32 bit) address cycles, and the same
for data cycles.  Sort of like what single/dual address cycle does for
PCI.

About SP_FRM my copy of the Programmer's Reference Manual (p405) says
this:

	SP_FRM

	Flash Read More Register.  The SP_FRM is used to configure the
	SlowPort flash memory read mode, 8-bit read mode and 32-bit read
	mode.  For the 8-bit read mode, one read cycle is involved.  No
	packing process is needed.  The data will be directly placed onto
	the lower order byte, [7:0] of the APB bus.  For the 32-bit read
	mode, it needs 4 read cycles.  All 4 bytes are packed into a
	32-bit data and passed to the APB bus.  By default, it is
	configured to 32-bit mode.  The programmer should leave it to
	be 32-bit read mode most of the time unless they need to
	program the flash memory and access register inside the flash
	memory.

	[31:1]	RESERVED
	[0]	FRM		Configure flash memory read mode
				0 - Use 32-bit data
				1 - Use 8-bit data


So.  "8-bit flash read mode" (SP_FRM) doesn't mean the same thing as
"single data cycle (i.e. 8 bit slowport data bus width.)

FRM=0 (32-bit flash read mode) is required for code execution from
flash because the flash is always burned in little-endian, and this
way, the xscale will always read the instruction stream in the right
byte order no matter whether that is big or little endian.  It is
useless for slowport peripheral accesses because it always does 32-bit
slowport reads (which might not be what you want), and it's always in
little endian, which means that on big endian you get to swap everything
by hand.

FRM=1 (8-bit flash read mode) makes flash reads go four times faster
because it will do a single 8-bit slowport access for each slowport byte
access, whereas with FRM=0 (32-bit flash read mode), it will do a 32-bit
slowport read for each byte read and then return only 8 of those 32 bits
to the user, effectively requiring a 32-bit read for every 8-bit read.

So, SP_ADC="general slowport address/data bus width", SP_FRM="translate
access into a byte (FRM=1) or word (FRM=0) access".

Are we in agreement? :)

I submitted a patch to remove setting FRM=1 because it is now done in
the generic IXP2000 code.


cheers,
Lennert
