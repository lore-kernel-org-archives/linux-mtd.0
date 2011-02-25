Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PsvzP-0003GE-Vm
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 11:37:40 +0000
Date: Fri, 25 Feb 2011 12:36:09 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
Message-ID: <20110225113609.GB21841@parrot.com>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
	<Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
	<AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
	<Pine.LNX.4.64.1102171013090.2784@lnxricardw.se.axis.com>
	<1298623342.2798.9.camel@localhost>
	<Pine.LNX.4.64.1102250956200.2784@lnxricardw.se.axis.com>
	<1298629762.2798.38.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1298629762.2798.38.camel@localhost>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Peverley <pev@sketchymonkey.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 25, 2011 at 10:29:22AM +0000, Artem Bityutskiy wrote:
(...)
> Currently the mechanism to mark a block is bad is the torture function
> failure: we write a pattern, read it back, compare, and do this several
> times with different patterns. In case of any error in any step, or if
> we read back something we did not write, or even if we get a bit-flip
> when we read back the data, we bark the eraseblock as bad. Otherwise it
> is returned to the pull of free eraseblocks.
> 
> See torture_peb() in drivers/mtd/ubi/io.c
> 
> This procedure is not ideal, and could be improved:
> 
> a) we could store amount of times the eraseblock was tortured. Since we
> torture only if there was a write error, too many torture session would
> indicate that the eraseblock is unstable.
> b) we could take into account the erase count somehow.
> 
> But yes, the threshold would probably set up by the system designer at
> the end.

The fact that a bitflip detected during torture is enough to decide that a
block is bad causes problems on some 4-bit ecc devices we are using. If we
stick to this policy, we end up with a _lot_ of blocks being marked as bad
(i.e. way too many).

Our NAND manufacturer tells us that, as long as a block erase operation
completes without a failure reported by the device, it should not be classified
as bad, even if it has bitflips (which sounds risky at best).

Right now, we implement a bitflip threshold, below which we correct ecc errors
without reporting them. When the bitflip threshold is reached, we report the
amount of corrected errors, triggering block scrubbing, etc.
This is not ideal, but it prevents UBI from torturing and marking too many
blocks as bad.
Regards,

Ivan
