Received: from wx-out-0506.google.com ([66.249.82.226])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IJVMA-00005o-A0
	for linux-mtd@lists.infradead.org; Fri, 10 Aug 2007 10:20:51 -0400
Received: by wx-out-0506.google.com with SMTP id s7so607222wxc
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Aug 2007 07:20:49 -0700 (PDT)
Message-ID: <ac921f990708100720g77641a19t20d161f72f5ceb56@mail.gmail.com>
Date: Fri, 10 Aug 2007 10:20:49 -0400
From: "James Olin Oden" <james.oden@gmail.com>
To: "Ralph Siemsen" <ralphs@netwinder.org>
Subject: Re: What is the correct way to make an mtdchar device available?
In-Reply-To: <20070810134527.GA31564@marvin.netwinder.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ac921f990708081050p3d71ea85kf30418f6aad88ce2@mail.gmail.com>
	<20070808192832.GA21249@marvin.netwinder.org>
	<ac921f990708091203s4199fc67w751bc0922f65be5c@mail.gmail.com>
	<20070810134527.GA31564@marvin.netwinder.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> When you have multiple chips arranged contiguously, then you just give
> it the beginning address of the block, and the total size.  The code
> does multiple probes in this region to identify the individual flash
> chips.  Interleaved devices (eg. two x16 devices on a 32-bit bus)
> are also handled the same way.
>
> Flash is often physically located at the very top, or very bottom, of
> the memory map.  So if you have say 16MiB of flash, chances are that it
> is mapped at address 0xff000000 with a size of 0x01000000.
>
So is there a way to tell physmap this information when you load it,
rather than have it hard coded in the kernel?  Or am I
misunderstanding things?

> In the drivers/mtd/maps directory you will see a large number of very
> similar mapping drivers for various boards.  They differ in how they
> get the address/size parameters-- some are hardcoded for specific boards,
> others read information dynamically from the bootloader, etc.  Many of
> them also handle partitioning of the flash -- splitting physical devices
> into multiple logical ones, much like you'd do on a hard disk.
So does this mean I would need to create one of these drivers for each
of my firmware hub types?

Also, what roll then does the code in jedec_probe play in all this?
My simple fantasy was that since there was "probe" info for my two
flash devices (i.e. the two I needed to support) I should only need to
load jedec_probe and mtdchar.  But that was not the case...so where is
my thinking wrong?

>
> > Also, is there anything that explains what one might need to do in the
> > context of simply making a flash chip available for reading and
> > writing through mtdchar mtdblock?
>
> I presume you've see the FAQ and the general documention on the
> www.linux-mtd.infradead.org web site?
Yeah your presumption is correct.  I think what the FAQ needs is some
question like:

   I have flash device X used for BIOS, what do I need to do to update my BIOS?

or even:

  How do I update my BIOS with MTD?

The crazy part is once I get the thing detected and the mtdchar device
up its, a very simple process.  If I get this going at some point I am
definately willing to provide the text for that part of the FAQ.   I
think the issue I am having is that though I'm comfortable in the
kernel and with programing in linux, I'm not an embedded developer and
most of the docs are geared towards "so you want to put a filesystem
on this flash device" or "so you want to boot from this flash device",
but the subsystem at least as much as I can understand is clearly
suitable for the "so you want to update your bios" users.

Thanks...james
