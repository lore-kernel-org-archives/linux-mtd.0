Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YY9wz-0004H5-Ue
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 09:07:42 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Marson <andrea.marson@dave.eu>
Subject: Re: RFC: detect and manage power cut on MLC NAND (linux-mtd Digest,
 Vol 144, Issue 70)
Message-ID: <20150318100645.1babecfd@bbrezillon>
In-Reply-To: <55093B1E.2050805@dave.eu>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Andrea Scian <rnd4@dave-tech.it>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 linux-mtd@lists.infradead.org, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 18 Mar 2015 09:07:43 -0000

Hi Andrea,

On Wed, 18 Mar 2015 09:45:18 +0100
Andrea Marson <andrea.marson@dave.eu> wrote:

> Hello,
> 
> I would like to discuss about another couple of topics: partitioning and 
> SLC emulation.
> 
> 1) IIUC read/program disturb effects exhibit at block level.
> In a typical embedded linux systems there are software parts - 
> bootloader, kernel image etc. - that virtually are never changed (almost 
> ...) but are read many times. Other parts - application libraries, log 
> files etc. - are read and wrote many times instead.
> If these two kinds of software are stored in different MTD partitions - 
> ket's say partition A for bootloader, kernel etc. and partition B for 
> application libraries, log files etc. - can we say that read/write 
> operations performed on partition B have no disturb effects on partition A?

AFAIK, read/write disturb effects only occur on pages of the same
block, so we shouldn't see bitflips on partition A caused by read/write
on partition B.

> 
> 2) IIUC Boris has worked on SLC emulation too.

No I didn't. What makes you think I did ?

> This seems to be a 
> promising feature because it would allow to partition NAND flash and to 
> create higher reliability partition (at the cost of halving the size). 
> Is it possibile to implement such functionality in software stack 
> only(MTD/UBI) or is it necessary that NAND memory supports specific 
> features?

I guess you're talking about the slides for my ELC talk.
Note that I'm just talking about hypothetical changes, and no
development has been started on this topic yet.

IIUC, you want to select SLC/MLC mode on a per-partition basis, that
should be feasible, and this would be particularly useful for bootloader
partitions (where UBI is not involved).

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
