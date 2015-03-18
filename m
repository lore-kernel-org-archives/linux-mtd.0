Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYApI-0001v7-GE
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 10:03:49 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Marson <andrea.marson@dave.eu>
Subject: Re: RFC: detect and manage power cut on MLC NAND (linux-mtd Digest,
 Vol 144, Issue 70)
Message-ID: <20150318110325.3c5e2035@bbrezillon>
In-Reply-To: <55094BBF.7050009@dave.eu>
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>
 <mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>
 <0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>
 <55093B1E.2050805@dave.eu> <20150318100645.1babecfd@bbrezillon>
 <55094BBF.7050009@dave.eu>
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
Date: Wed, 18 Mar 2015 10:03:55 -0000

On Wed, 18 Mar 2015 10:56:15 +0100
Andrea Marson <andrea.marson@dave.eu> wrote:

> >
> > IIUC, you want to select SLC/MLC mode on a per-partition basis, that
> > should be feasible, and this would be particularly useful for bootloader
> > partitions (where UBI is not involved).
> That's exactly what I was thinking about.
> However it is still not clear to me how this should be implemented. I 
> have read a datasheet saying that "SLC mode" consists of halving block 
> addresses, that is higher bit of block address lines must be set to low. 
> I wonder if this strategy prevents paired page related issues. I think 
> one should work at page addressing level instead, in order to use pages 
> that are not paired only. Do you think it makes sense?

Yes, actually implementing the SLC mode in software is quite easy, the
only thing we need is a description of which pages are paired together
in a block.
Moreover, by doing that in SW we won't have to deal with each vendor
implementation of "SLC mode".



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
