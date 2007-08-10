Date: Fri, 10 Aug 2007 11:53:53 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
To: James Olin Oden <james.oden@gmail.com>
Subject: Re: What is the correct way to make an mtdchar device available?
Message-ID: <20070810155353.GA4326@marvin.netwinder.org>
References: <ac921f990708081050p3d71ea85kf30418f6aad88ce2@mail.gmail.com>
	<20070808192832.GA21249@marvin.netwinder.org>
	<ac921f990708091203s4199fc67w751bc0922f65be5c@mail.gmail.com>
	<20070810134527.GA31564@marvin.netwinder.org>
	<ac921f990708100720g77641a19t20d161f72f5ceb56@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac921f990708100720g77641a19t20d161f72f5ceb56@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 10, 2007 at 10:20:49AM -0400, James Olin Oden wrote:
>
> So is there a way to tell physmap this information when you load it,
> rather than have it hard coded in the kernel?  Or am I
> misunderstanding things?

Some of the physmap variants obtain the information from (say) the
BIOS or OpenFirmware.  It would be fairly trivial to make physmap
take module parameters that you pass at modprobe/insmod time.  The
reason this isn't done is because most users are trying to boot off
the flash chip (on embedded systems), so its too late... you have to
provide the address at compile time, or query the firmware.

> Also, what roll then does the code in jedec_probe play in all this?
> My simple fantasy was that since there was "probe" info for my two
> flash devices (i.e. the two I needed to support) I should only need to
> load jedec_probe and mtdchar.  But that was not the case...so where is
> my thinking wrong?

You've got an address space of 2^32 bytes, not counting larger 36/64 bit
possibilities, extra memory spaces hiding behind bridges, etc.  It is 
just not feasible to proble them all for flash devices.  And there is
no other way to enumerate flash chips on a bus (unlike say PCI or USB,
where you can walk through each device in turn).

So the kernel must be told where to go looking for flash chips.  It will
then use the code in jedec_probe (or cfi_probe for CFI-compliant chips)
to identify any chip at the specified address.  It will do so once at
the beginning of the address/size you specified.  If a device is found,
but is smaller than the size you specified, then the kernel will try to
probe a second time right after the first device ends.  This way it will
find numerous chips that are contiguous in the memory space.

> Yeah your presumption is correct.  I think what the FAQ needs is some
> question like:
> 
>    I have flash device X used for BIOS, what do I need to do to update my BIOS?
> 
> or even:
> 
>   How do I update my BIOS with MTD?

I think this is (currently) a fairly uncommon situation.  Most of the
MTD users are working in embedded systems where the entire operating
system (kernel, userspace and all) lives in the flash.  They have to
get MTD running really early on in their development cycle, eg. as 
part of bringing up the kernel on the board, while adjusting IRQs and
such things.  Relatively few people have a fully-working PC that boots
where they later decide they want to access some on-board flash.

> The crazy part is once I get the thing detected and the mtdchar device
> up its, a very simple process.  If I get this going at some point I am
> definately willing to provide the text for that part of the FAQ.   I
> think the issue I am having is that though I'm comfortable in the
> kernel and with programing in linux, I'm not an embedded developer and
> most of the docs are geared towards "so you want to put a filesystem
> on this flash device" or "so you want to boot from this flash device",
> but the subsystem at least as much as I can understand is clearly
> suitable for the "so you want to update your bios" users.

I think you hit the nail on the hammer there.  I should probably mention
that commodity PC hardware may have some additional locking to prevent
users from accidentally erasing their BIOS.  It could come in the form of
a GPIO signal that has to be toggled, etc.  If such hardware is present,
it will likely be motherboard-specific, and it would need to be handled
in a customized variant of the mapping driver.  Another issue could be
the "window size", eg. you might only see 64kB of the flash chip even
when the device is larger due to how the southbridge is setup.

I am guessing the LinuxBIOS folks have dealt with these sorts of issues,
perhaps worth a look to see what they've come up with.

-R
