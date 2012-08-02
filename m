Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Swxjg-0001wf-An
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 15:54:52 +0000
Received: by yhjj52 with SMTP id j52so9239623yhj.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Aug 2012 08:54:50 -0700 (PDT)
Message-ID: <501AA31D.9000402@gmail.com>
Date: Thu, 02 Aug 2012 11:56:13 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: expect bit flip within endurance if ECC is required?
References: <CAFV5biAp8__BZQmBHd8EpHD2amrycy59CR2kweEtsu2xtQ4ucA@mail.gmail.com>
In-Reply-To: <CAFV5biAp8__BZQmBHd8EpHD2amrycy59CR2kweEtsu2xtQ4ucA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/02/2012 11:24 AM, peterlingoal wrote:
> Hi all,
>
> I have some questions about minimum ECC and NAND endurance, please help me here:
>
> My understanding of endurance is that a NAND and survive the number of
> cycles of erase/write/read before any error occurs. But I am not clear
> about the definition of error, is it correctable error (bit flip less
> than minimum ECC) or uncorrectable error (more than minimum ECC)? For
> e.g. if a NAND with endurance of 100,000 cycles and requires minimum
> 4bit ECC, shall I expect bit flipping (but less than 4 bits) within
> the 100,000 cycles?
>
> If my understand is correct, does it mean that the chip with same
> endurance but higher minimum ECC requirement is more likely to have
> bit flipping faster than the chip with same endurance but less minimum
> ECC?
Yes.  the number of bits of ECC implies the rate of correctable errors -
more bits of ECC imply more bits per read that can flip (and are
corrected by the ECC).  Older large-geometry SCL nand parts wouldn't
show a single bit flip until that block is near its end of life whereas
newer small-geometry SLC/MLC show bit flips much more often - the CBER
(correctable bit error rate) is much higher with newer NAND devices.

The strength of the ECC is such that the UBER (uncorrectable bit error)
can be held low - 10E-15 or so over the life of the device.  Note that
to maintain retention and usable UBER, chip manufacturers define
temperature ranges, and not only retiring blocks after a maximum number
of erasures, but also require "refreshing" blocks (garbage collect valid
data from the block into another) after a set number of reads from a
block - across power cycles.

-- 
Peter Barada
peter.barada@gmail.com
