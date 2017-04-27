Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d3h4J-0001C6-1y
 for linux-mtd@lists.infradead.org; Thu, 27 Apr 2017 10:54:41 +0000
Date: Thu, 27 Apr 2017 12:54:02 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Lukasz Majewski <lukma@denx.de>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: Problem with NAND memory data retention
In-Reply-To: <20170427122502.285d16ba@jawa>
Message-ID: <alpine.DEB.2.11.1704271246210.6882@lnxricardw1>
References: <20170427122502.285d16ba@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 27 Apr 2017, Lukasz Majewski wrote:

> I'd like to ask you for sharing your experience with NAND Flash devices
> - which may be older that their data retention time.
> 
> I've a problem with Flash NAND memory (Samsung 128Mx8).
> 
> In the data sheet [1] the manufacturer claims that it has 10 years for
> data retention. The device equipped with it is a bit older than 10
> years.
> 
> 
> How one can diagnose that data retention time for NAND Flash has been
> exceeded?
> 
> Is that:
> 
> - The number of bit flip errors on a RW page so large that ECC cannot
>   fix it?
> 
> - Or are whole RW pages erased (0xFF)/corrupted/cleared (0x00)?
> 
> - Or any other evidence?
> 
> Thanks in advance for your help.

I think the interpretation is that the manufacturer guarantees that under 
the circumstances specified (temperature, supply voltage, erase cycles 
etc) that the data will be retained for at least ten years, beyond that 
it's just not specified. It doesn't mean that something catastrophic will 
happen after ten years, i.e. ten years is not a hard limit beyond which 
things start going haywire.

I can't say I have experience with old NAND flashes loosing their data, 
but technically I would expect that what happens is that eventually the 
charge leaks away from the bit cells, causing bit flips, quite simply, so 
it's the same mechanism that requires the flash to be 'scrubbed' 
periodically to check if the data needs to be rewritten.

I.e. it's the first case in your list, the number of bit flips increases.

The fewer erase cycles that a given flash block has seen, the less wear 
there has been on the insulation, and the better the retention would be. 
The ten year spec is under the worst case condition of the maximum number 
of erase cycles having been performed on the flash.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
