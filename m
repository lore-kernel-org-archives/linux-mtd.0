Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CoW2C-00043b-80
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2005 19:06:51 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050111215102.GA6289@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
Content-Type: text/plain
Date: Wed, 12 Jan 2005 01:06:40 +0100
Message-Id: <1105488400.17853.179.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Claim: No mtd has problems with lost data due to bad blocks.  This is
> a complete non-issue and jffs[23] doesn't care.

NAK 

NAND and ECC'ed NOR FLASH have a implicit property of occasional
bitflips, which are related to various causes. The ECC addon in the
chip/technology driver takes care of that and may even be able to
recover the resulting data loss. 

ACK

NOR is significantly less prone to data loss and bit flips, so I agree
here to the extent of the following paragraph

A flash aware filesystem has to be aware of failure sensitivity of the
devices they are dealing with. An additional constraint is that FLASH
filesystems are normally used in systems which have totally different
environments and constraints than a desktop system.


> "No" means that less than .001% (add or remove some digits, depending
> on your needs) of all devices have this problem.  In those cases, the
> system just won't work and will be replaced.  Business as usual.
> 
> Now, if any particular flash doesn't match this requirement, the mtd
> driver is supposed to mirror all blocks.  If either copy rots away,
> the data can still be read back from the other block.  After GC, the
> block can be marked as bad and everyone lives on happily ever after.

Mirroring is not a complete solution to address the various
requirements. It's one out of many mechanisms which you might be able to
sell to some of your audience.
Moving the responsibility to a different layer is a real bad idea, as it
restricts the implementation of other filesystems on top of the same MTD
technology. e.g. YAFFS deals nice with NAND oddities and I totaly refuse
to restrict the usage to a subset of capabilities. If your
implementation decision is to use mirroring then provide is as a
seperate feature/layer, which can be used on request.

Facts: 

- FLASH devices are error prone. The grade of proneness is depending on
the FLASH technology
- Devices have partially standardized mechanisms of error correction

Problem:

- Develop a filesystem aware of the above constraints
- Do not overemphasize error correction/protection/ in favor of
performance and depending on FLASH technology
- Make it DAU (For non native german speakers: Dumbest Assumed User)
safe 

Incomplete solution requirements:

- Be aware of the error proneness you are dealing with
- Utilize the error correction / detection mechanisms and deal with the
information they provide. 
- Provide additional userspace fallback mechanisms and design patterns
which help to improve the failsafe goal

> Capacity is half the original, but that's better than losing
> /sbin/init now and then, right?  And maybe the flash is cheap enough
> that noone cares.
> 
> Sane?

Especially high volume systems are very sensitive to the price aspect.
For them it is cheaper to invest in software development than adding an
additional 1$ to the hardware.

tglx
