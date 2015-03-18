Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYAi4-00045j-W8
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 09:56:21 +0000
Message-ID: <55094BBF.7050009@dave.eu>
From: Andrea Marson <andrea.marson@dave.eu>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND (linux-mtd Digest,
 Vol 144, Issue 70)
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>	<mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>	<0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>	<55093B1E.2050805@dave.eu>
 <20150318100645.1babecfd@bbrezillon>
In-Reply-To: <20150318100645.1babecfd@bbrezillon>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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
Date: Wed, 18 Mar 2015 09:56:22 -0000


>> 2) IIUC Boris has worked on SLC emulation too.
> No I didn't. What makes you think I did ?
My bad. I misunderstood a sentence in your slides for ELC talk :(

>
>> This seems to be a
>> promising feature because it would allow to partition NAND flash and to
>> create higher reliability partition (at the cost of halving the size).
>> Is it possibile to implement such functionality in software stack
>> only(MTD/UBI) or is it necessary that NAND memory supports specific
>> features?
> I guess you're talking about the slides for my ELC talk.
> Note that I'm just talking about hypothetical changes, and no
> development has been started on this topic yet.
I see.


>
> IIUC, you want to select SLC/MLC mode on a per-partition basis, that
> should be feasible, and this would be particularly useful for bootloader
> partitions (where UBI is not involved).
That's exactly what I was thinking about.
However it is still not clear to me how this should be implemented. I 
have read a datasheet saying that "SLC mode" consists of halving block 
addresses, that is higher bit of block address lines must be set to low. 
I wonder if this strategy prevents paired page related issues. I think 
one should work at page addressing level instead, in order to use pages 
that are not paired only. Do you think it makes sense?

Andrea
