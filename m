Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WTfR-0001kt-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 03:10:53 +0100
Message-Id: <5.1.0.14.0.20010813212346.00a6e8d0@mail.spewey.com>
Date: Mon, 13 Aug 2001 21:30:23 -0500
To: Luke <luke_epsilon@yahoo.com>,linux-mtd@lists.infradead.org
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: Am29LV065D woes -- ZFMicro MachZ help?
In-Reply-To: <20010814003549.61100.qmail@web13602.mail.yahoo.com>
References: <5.1.0.14.0.20010812085950.00ace380@mail.spewey.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 05:35 PM 8/13/2001 -0700, Luke wrote:
>The flash is going directly to the processor.

Well in that case, you have on board programmable chip select's.
There must be registers that are associated with each chip select that define
the base physical address, the databus width, the wait states, what type of 
memory
is located there (read only or read/write) etc.

You must look for these registers and program them to an address that you 
will be happy with.
Of course if the flash chips are already booting your bios etc. you 
probably want to dump the contents
and decode what the base address is and just use that.

This is exactly like the AMD SC520 processor, except I doubt that the 
registers to program the
chip selects are in the same location :)


>ps.  Is the prefered setup to have an initrd (with the root fs) or to have
>a root jffs2 on a mtd device?  Is this always possible?

Really your call. You can do both. The initrd will get you a pristine root 
fs each time.
The root JFFS2 is more "direct" that you can make permanent changes to the 
root fs
just by writing to the root fs.
