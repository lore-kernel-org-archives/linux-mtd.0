Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3j6A-0006KE-P0
 for linux-mtd@lists.infradead.org; Thu, 27 Apr 2017 13:04:45 +0000
Date: Thu, 27 Apr 2017 15:04:16 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: Problem with NAND memory data retention
Message-ID: <20170427150416.2c6bba07@jawa>
In-Reply-To: <alpine.DEB.2.11.1704271246210.6882@lnxricardw1>
References: <20170427122502.285d16ba@jawa>
 <alpine.DEB.2.11.1704271246210.6882@lnxricardw1>
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

Hi Ricard,

> 
> On Thu, 27 Apr 2017, Lukasz Majewski wrote:
> 
> > I'd like to ask you for sharing your experience with NAND Flash
> > devices
> > - which may be older that their data retention time.
> > 
> > I've a problem with Flash NAND memory (Samsung 128Mx8).
> > 
> > In the data sheet [1] the manufacturer claims that it has 10 years
> > for data retention. The device equipped with it is a bit older than
> > 10 years.
> > 
> > 
> > How one can diagnose that data retention time for NAND Flash has
> > been exceeded?
> > 
> > Is that:
> > 
> > - The number of bit flip errors on a RW page so large that ECC
> > cannot fix it?
> > 
> > - Or are whole RW pages erased (0xFF)/corrupted/cleared (0x00)?
> > 
> > - Or any other evidence?
> > 
> > Thanks in advance for your help.
> 
> I think the interpretation is that the manufacturer guarantees that
> under the circumstances specified (temperature, supply voltage, erase
> cycles etc) that the data will be retained for at least ten years,
> beyond that it's just not specified. It doesn't mean that something
> catastrophic will happen after ten years, i.e. ten years is not a
> hard limit beyond which things start going haywire.

Thanks for your explanation.

> 
> I can't say I have experience with old NAND flashes loosing their
> data, but technically I would expect that what happens is that
> eventually the charge leaks away from the bit cells, causing bit
> flips, quite simply, so it's the same mechanism that requires the
> flash to be 'scrubbed' periodically to check if the data needs to be
> rewritten.
> 
> I.e. it's the first case in your list, the number of bit flips
> increases.

Unfortunately with my device I do experience the second scenario.

I do observe pages read as zeros.

For example in the middle of a file - page sized (2K) data is read as
zero. And this file is RO (no modification). And such zero read is
persistent - happens all the time. The only way is to replace the whole
file (erase it and write again).

We use yaffs file system.

And such errors pop up in random places.

> 
> The fewer erase cycles that a given flash block has seen, the less
> wear there has been on the insulation, and the better the retention
> would be. The ten year spec is under the worst case condition of the
> maximum number of erase cycles having been performed on the flash.
> 
> /Ricard




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
