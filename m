Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYWVs-0007tL-Eo
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 09:13:13 +0000
Date: Thu, 19 Mar 2015 10:12:46 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Marson <andrea.marson@dave.eu>
Subject: Re: RFC: detect and manage power cut on MLC NAND
Message-ID: <20150319101246.26806e95@bbrezillon>
In-Reply-To: <550A8D19.90404@dave.eu>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu>
 <0D23F1ECC880A74392D56535BCADD7354973E995@NTXBOIMBX03.micron.com>
 <550A8D19.90404@dave.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Andrea Scian <rnd4@dave-tech.it>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 19 Mar 2015 09:47:21 +0100
Andrea Marson <andrea.marson@dave.eu> wrote:

> > Disturb is a block level affect, as long as partition A and B are in different blocks there will be no disturb between them.   Disturbs, does not damage cells; ERASE returns cells to undisturbed levels.
> I think there are two options here: MTD partitioning and UBI 
> partitioning. AFAIK one should prefer UBI partitioning to preserve 
> device-wide wear leveling. Boris, am I right?

Both of them act at block level, meaning that your the partition size
must be a multiple of the block size (logical block size in case of UBI
volume and physical block size in case of MTD partition).
IOW, you shouldn't bother whether you're using UBI on top of MTD or
directly using MTD partitions, both are immune to cross partition/volume
read/write disturbance.


> 
> > Officially I would say don't use SLC emulation, but technically I know what your doing.   The reason I say no is because we have very precise recipes designed to create very tight distibutions, and although the first pass distributions might look like an SLC, they are really designed with the expectation of the upper page being programmed.  Not a true SLC.
> > With MLC lithography of 25 nm and less  the difference between each level (L0, L1, L2 and L3) is just a few 10's of electrons.  The distribution have to be very tight, in order to meet retention requirements.
> This is quite interesting, however I'm afraid I have not fully 
> understood it.

Me neither :-/.

> Let me try to rephrase it. Please correct me if I'm wrong.
> 
> 1) Technically speaking, it is possible to use an MLC memory in SLC 
> mode, even if this is not recommended because MLC is not designed for 
> this usage.

That's what I understood, but I'm not sure to understand the
constraints brought by SLC mode (only programming one of the paired
pages).
Jeff, Are you trying to explain what's described here [1] in slide 8
(BTW I'm not sure to understand this diagram).
If that's the case, could you explain us, how the NAND chip knows which
threshold should be used (does it somehow store the information of
which page has already been programmed)

[1]http://www.bswd.com/FMS09/FMS09-T2A-Grunzke.pdf

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
