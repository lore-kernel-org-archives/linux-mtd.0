Received: from d-106.linux2002.uq.net.au ([203.15.37.106] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YzDN-000284-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 00:48:33 +0000
Date: Fri, 8 Feb 2002 10:58:58 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: raja <mahadoc@rediffmail.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: DOC firmware problems
In-Reply-To: <20020207121316.8917.qmail@mailweb21.rediffmail.com>
Message-ID: <Pine.LNX.4.44.0202081054280.25850-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On 7 Feb 2002, raja wrote:

>  i have a DiskOnChip 2000 and i have the firmware doc504.exb loaded in it.
>   i am new to this and I have a few elementary doubts.
> 
> 1. Actually what does this firmware do inside the DOC ?

The firmware provides a BIOS extension, which allocates lots of sub-640K 
memory and installs an extra handler for the INT 13h disc service 
interrupt. Using this, it pretends to be a hard drive for the benefit of 
anything which uses the standard BIOS interfaces (i.e. DOS and 
bootloaders).

> 2. Can this firmware be replaced with some other one (i.e. can i format
> the DOC with some other open source firmwares )

Yes. You can install the Grub bootloader in place of the M-Systems BIOS 
extension. Rather than installing an INT 13h handler and continuing to let 
the machine boot as normal, it hooks the INT 18h bootstrap handler to 
start Grub instead of trying to boot from floppy or INT 13h device as 
normal. Grub can drive the DiskOnChip directly, without the assistance of 
the original firmware extension, and hence boot a kernel from it.

> 3. How does the BIOS recognize the DOC (is BIOS recognition related to
> firmware ) ?

The DiskOnChip is mapped into the host memory in the Upper Memory Blocks 
used for BIOS extensions - the first few bytes of it have the BIOS 
extension signature that has been defined since the first IBM BIOS to 
persuade the BIOS to run extra stuff at startup.

> I will be grateful if you could clarify my intial doubts ( cause i am
> stuck up with a DOC which has BIOS and firmware problems)

-- 
dwmw2
