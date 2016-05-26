Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5pWB-0003kq-1b
 for linux-mtd@lists.infradead.org; Thu, 26 May 2016 07:15:44 +0000
Date: Thu, 26 May 2016 09:15:21 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: falcon@ivan.Harhan.ORG (Mychaela Falconia)
Cc: linux-mtd@lists.infradead.org, Peter Pan <peterpansjtu@gmail.com>
Subject: Re: Supporting high-level NAND controllers like FTNANDC024
Message-ID: <20160526091521.722a573e@bbrezillon>
In-Reply-To: <1605260545.AA18874@ivan.Harhan.ORG>
References: <1605260545.AA18874@ivan.Harhan.ORG>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mychaela,

On Thu, 26 May 2016 05:45:21 GMT
falcon@ivan.Harhan.ORG (Mychaela Falconia) wrote:

> I am working with a very high-level NAND flash controller, too high-
> level to fit comfortably into the abstraction model provided by the
> current "generic" NAND code layer in Linux.  This generic NAND layer
> assumes that the controller provides a more or less raw access to the
> NAND chip, such that the generic NAND code can send arbitrary command
> opcodes, do individual read_byte's and request buffer reads and writes.
> 
> But the controller I'm working with (Faraday FTNANDC024) provides a
> much higher level of abstraction.  The level of abstraction provided
> by this controller is more like the MTD interface in Linux than the
> current "nand" interface.  This controller does not allow the user to
> issue arbitrary opcodes to the NAND or to read/write bytes directly on
> the NAND interface under CPU sequencing - instead it has high-level
> read and write commands that are essentially like MTD's read and write
> methods.  One can command the controller to read or write between 1
> and 65535 "sectors" (their term for ECC unit) of 512 or 1024 bytes,
> i.e., one can transfer almost 64 MiB of data in one operation.  One
> "operation" means that you program the NAND and DMA controllers, give
> it the command, and then wait for an interrupt - the controller will
> automatically issue as many Read Page or Write Page commands to the
> physical NAND as needed, transfer all data by DMA and do all ECC work.
> 
> I am currently working in the vendor's tree based on linux-3.3, but I
> don't see any substantial changes in the current linux-mtd or l2-mtd
> trees in this department.  Faraday made a heroic attempt at hammering
> a square peg into a round hole by implementing a driver for their
> controller that attaches to the generic NAND layer, but the code is
> horrible.  So horrible that I am reimplementing my own FTNANDC024
> driver from scratch.  Because the level of abstraction provided by
> this controller is so at odds with the assumptions of the current
> Linux "generic" NAND layer, I decided to forego this generic NAND
> layer altogether and implement my driver as a self-contained MTD
> device instead, attaching directly to the MTD layer

Actually that's a good approach IMO.

> 
> The reason I am posting on this list is to see if any others have run
> into similar issues, and to exchange ideas as to how such high-level
> NAND flash controllers should be handled.  I have a difficult time
> imagining that I am the only one with this problem: sure, Faraday's
> SoCs and peripheral cores aren't nearly as popular as the bigger
> vendors, so I may be the only one having to deal with FTNANDC024, but
> surely this core from Faraday is not the only high-level NAND controller
> in the world.  Instead my common sense suggests that as time marches
> forward, controllers get smarter and smarter, and I have every reason
> to suspect that super-high-level controllers like FTNANDC024 may very
> well be the new norm.

Actually, even quite recent controllers provides 'raw modes' allowing
one to send raw commands if needed, but they usually do optimize
specific operations like 'read-full page with pipelined ECC correction"
or "sequential page accesses" (and probably other optimizations I'm not
aware of).

As you mentioned, this kind of optimizations are not really supported in
the current design, but I'm working on improving things in this regard.

Now your problem is a bit different, since what I'm working on is a
generic solution, but it would still involve knowledge of how to
interact with a raw NAND chip (chip detection cmds, read/write cmds,
cached access cmds, ...).

> 
> Looking in the current code, I see that every currently supported NAND
> controller is supported with a driver that attaches to the "generic"
> NAND layer - I don't see anyone doing what I am doing, foregoing this
> generic NAND layer and attaching directly to MTD instead.  Obviously I
> am not familiar with the detailed workings of all those controllers,
> but I reason that there must be some high-level ones in there, perhaps
> as high-level as FTNANDC024.  If there are such high-level controllers
> currently supported by drivers that attach to the generic NAND layer,
> are they the result of heroic square peg in round hole hammering?  Or
> am I just unlucky to be the first one trying to support a *really*
> high-level NAND controller, more high-level than any of the currently
> mainlined ones?

Don't know if you're the first one ever trying to support this kind of
NAND controller, but there's definitely a need for that, and I'd prefer
to see them supported through a proper interface than adding more hacks
to the current NAND core code.

> 
> Of course foregoing the generic NAND layer entirely is not a perfect
> solution either.  While most of it is inapplicable to high-level NAND
> controllers, there are two useful functions in it which become very
> painful to reimplement when foregoing it and attaching to MTD directly:
> NAND chip type and geometry autodetection, and the on-flash bad block
> table.

Cool, that's exactly the kind of things I was going to ask. Actually
I'm working with Peter to add an intermediate abstraction layer hiding
the interface type to avoid duplicating common code. As you may know we
already 3 kinds of NAND based devices out there:
- raw NANDs (the one using the 'standard' NAND interface)
- OneNAND NANDs
- SPI NANDs

So far we've only shared 'memory organization' information and BBT code
(the changes are available here if you want to have a look [1]).

What else would you need that is already implemented by the NAND
framework?

> 
> Autodetection: a high-level NAND controller still needs to be told via
> register settings what the page and block sizes are, and of course the
> upper layers need this info too.  Autodetection by way of NAND ID
> bytes or the ONFI parameter page would still be quite useful, but the
> way it is currently implemented in the generic NAND layer (at least in
> linux-3.3) is too tied to the assumption of a low-level pass-through
> controller, and cannot be made to work with FTNANDC024.  Faraday's
> official driver (which does attach to the generic NAND layer) requires
> hacking nand_ids.c so that the ONFI code will never execute, as it is
> broken in the generic NAND layer + FTNANDC024 combo.

Could you detail a bit more how your controller is retrieving NAND ID,
ONFI or JEDEC parameter pages, and why the generic layer + FTNANDC024
combo is broken?

> 
> Bad block handling: FTNANDC024 rigidly imposes its own data format in
> the physical flash, and the factory bad block mark location is smack
> in the middle of a user data sector in this format.  The only workable
> solution with such controllers is to scan the "virgin" blank flash on
> the very first boot, find all factory marked bad blocks, then write an
> on-flash BBT (letting the controller write it as it likes) and use
> this BBT afterward.

Well, that is a real problem in my opinion: what happens if the
on-flash BBT is corrupted? You have no way to recover from that since
you've screwed all the BBM on the blocks you've programmed.
NAND/ECC controllers usually provide a way to swap the data and BBM
bytes before/after actually transferring data to/from the NAND.
When that's not the case, drivers manually swap those bytes if that's
possible. Other implementation are just broken in my opinion, but I
guess that's your problem not mine ;-).

> There is perfectly good BBT code in the generic
> NAND layer, but if I have to forego this generic NAND layer because of
> mismatching abstraction levels, then I have to duplicate all this BBT
> code in my "self-contained" driver that attaches directly to MTD.

Yep, as I said, this should be addressed soon.

> 
> So, what have other people's experiences been?  Is anyone already
> working or planning to work on a generic framework for supporting
> high-level NAND controllers, or will I have to be the first one?

I guess for the generic framework it's a bit to early to even consider
that. Let's first finish the "interface-agnostic NAND layer", and then
we'll see what we can do for your "high-level NAND controller".

I'll finish with a side note regarding the approach taken by Faraday
for its NAND controller: it's risky. I've seen a lot of NAND devices
and modern ones are so tricky to interface with that providing an high
level interface is just not enough, you need to tweak a lot of things
(using private vendor commands) to be able to recover from corner cases.
Are you sure Farady don't provide an hidden feature allowing one to send
raw commands when needed?

BTW, can you share the code you have (both the existing version and
your rework) so I can have a look.

Best Regards,

Boris

[1]https://github.com/bbrezillon/linux-0day/commits/nand/generic


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
