Received: from ivan.harhan.org ([208.221.139.1])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5o7f-0001mP-5T
 for linux-mtd@lists.infradead.org; Thu, 26 May 2016 05:46:20 +0000
Date: Thu, 26 May 2016 05:45:21 GMT
From: falcon@ivan.Harhan.ORG (Mychaela Falconia)
Message-Id: <1605260545.AA18874@ivan.Harhan.ORG>
To: linux-mtd@lists.infradead.org
Subject: Supporting high-level NAND controllers like FTNANDC024
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working with a very high-level NAND flash controller, too high-
level to fit comfortably into the abstraction model provided by the
current "generic" NAND code layer in Linux.  This generic NAND layer
assumes that the controller provides a more or less raw access to the
NAND chip, such that the generic NAND code can send arbitrary command
opcodes, do individual read_byte's and request buffer reads and writes.

But the controller I'm working with (Faraday FTNANDC024) provides a
much higher level of abstraction.  The level of abstraction provided
by this controller is more like the MTD interface in Linux than the
current "nand" interface.  This controller does not allow the user to
issue arbitrary opcodes to the NAND or to read/write bytes directly on
the NAND interface under CPU sequencing - instead it has high-level
read and write commands that are essentially like MTD's read and write
methods.  One can command the controller to read or write between 1
and 65535 "sectors" (their term for ECC unit) of 512 or 1024 bytes,
i.e., one can transfer almost 64 MiB of data in one operation.  One
"operation" means that you program the NAND and DMA controllers, give
it the command, and then wait for an interrupt - the controller will
automatically issue as many Read Page or Write Page commands to the
physical NAND as needed, transfer all data by DMA and do all ECC work.

I am currently working in the vendor's tree based on linux-3.3, but I
don't see any substantial changes in the current linux-mtd or l2-mtd
trees in this department.  Faraday made a heroic attempt at hammering
a square peg into a round hole by implementing a driver for their
controller that attaches to the generic NAND layer, but the code is
horrible.  So horrible that I am reimplementing my own FTNANDC024
driver from scratch.  Because the level of abstraction provided by
this controller is so at odds with the assumptions of the current
Linux "generic" NAND layer, I decided to forego this generic NAND
layer altogether and implement my driver as a self-contained MTD
device instead, attaching directly to the MTD layer.

The reason I am posting on this list is to see if any others have run
into similar issues, and to exchange ideas as to how such high-level
NAND flash controllers should be handled.  I have a difficult time
imagining that I am the only one with this problem: sure, Faraday's
SoCs and peripheral cores aren't nearly as popular as the bigger
vendors, so I may be the only one having to deal with FTNANDC024, but
surely this core from Faraday is not the only high-level NAND controller
in the world.  Instead my common sense suggests that as time marches
forward, controllers get smarter and smarter, and I have every reason
to suspect that super-high-level controllers like FTNANDC024 may very
well be the new norm.

Looking in the current code, I see that every currently supported NAND
controller is supported with a driver that attaches to the "generic"
NAND layer - I don't see anyone doing what I am doing, foregoing this
generic NAND layer and attaching directly to MTD instead.  Obviously I
am not familiar with the detailed workings of all those controllers,
but I reason that there must be some high-level ones in there, perhaps
as high-level as FTNANDC024.  If there are such high-level controllers
currently supported by drivers that attach to the generic NAND layer,
are they the result of heroic square peg in round hole hammering?  Or
am I just unlucky to be the first one trying to support a *really*
high-level NAND controller, more high-level than any of the currently
mainlined ones?

Of course foregoing the generic NAND layer entirely is not a perfect
solution either.  While most of it is inapplicable to high-level NAND
controllers, there are two useful functions in it which become very
painful to reimplement when foregoing it and attaching to MTD directly:
NAND chip type and geometry autodetection, and the on-flash bad block
table.

Autodetection: a high-level NAND controller still needs to be told via
register settings what the page and block sizes are, and of course the
upper layers need this info too.  Autodetection by way of NAND ID
bytes or the ONFI parameter page would still be quite useful, but the
way it is currently implemented in the generic NAND layer (at least in
linux-3.3) is too tied to the assumption of a low-level pass-through
controller, and cannot be made to work with FTNANDC024.  Faraday's
official driver (which does attach to the generic NAND layer) requires
hacking nand_ids.c so that the ONFI code will never execute, as it is
broken in the generic NAND layer + FTNANDC024 combo.

Bad block handling: FTNANDC024 rigidly imposes its own data format in
the physical flash, and the factory bad block mark location is smack
in the middle of a user data sector in this format.  The only workable
solution with such controllers is to scan the "virgin" blank flash on
the very first boot, find all factory marked bad blocks, then write an
on-flash BBT (letting the controller write it as it likes) and use
this BBT afterward.  There is perfectly good BBT code in the generic
NAND layer, but if I have to forego this generic NAND layer because of
mismatching abstraction levels, then I have to duplicate all this BBT
code in my "self-contained" driver that attaches directly to MTD.

So, what have other people's experiences been?  Is anyone already
working or planning to work on a generic framework for supporting
high-level NAND controllers, or will I have to be the first one?

TIA for reading my rant...

M~
