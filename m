Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLApr-0006gn-EI
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 13:58:56 +0000
Date: Fri, 31 Jul 2015 15:58:31 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Scian <rnd4@dave-tech.it>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] mtd: nand: add nand_check_erased helper functions
Message-ID: <20150731155831.43d5bfa9@bbrezillon>
In-Reply-To: <55BB7831.7040407@dave-tech.it>
References: <mailman.4514.1438332781.1758.linux-mtd@lists.infradead.org>
 <mailman.4514.1438332781.1758.linux-mtd.{54f18e14-0058-4822-8ce0-2e36468ada80}.0@lists.infradead.org>
 <20150731091037.09c7ee57@bbrezillon>
 <55BB48A8.1060204@dave-tech.it>
 <20150731122157.78bad539@bbrezillon>
 <55BB7831.7040407@dave-tech.it>
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

On Fri, 31 Jul 2015 15:29:21 +0200
Andrea Scian <rnd4@dave-tech.it> wrote:

> >>>> +int nand_check_erased_buf(void *buf, int len, int bitflips_threshold)
> >>>> +{
> >>>> +	const unsigned char *bitmap = buf;
> >>>> +	int bitflips = 0;
> >>>> +	int weight;
> >>>> +	int longs;
> >>>> +
> >>>> +	for (; len && ((unsigned long)bitmap) % sizeof(long);
> >>>> +	     len--, bitmap++) {
> >>>> +		weight = hweight8(*bitmap);
> >>>> +
> >>>> +		bitflips += sizeof(u8) - weight;
> >>>> +		if (bitflips > bitflips_threshold)
> >>>> +			return -EINVAL;
> >>
> >> I think it's better to do something like:
> >>
> >> if (UNLIKELY(bitflips > bitflips_threshold))
> >> 	return -EINVAL;
> >>
> >> isn't it? :-)
> >> (the same for the other if)
> >
> > Maybe, or maybe not. It depends on whether you expect to have a lot of
> > corrupted pages or a lot of blank pages with bitflips ;-).
> > Anyway, I'm not opposed to this change.
> 
> I think that everything implemented inside the MTD stack 
> (NAND/MTD/UBI/UBIFS) should lead to a "working" solid state device, that 
> do not show any uncorrectable bitflips.
> Uncorrectable pages, IMO, should happens, on stable systems, only in 
> some rare case, because it means that you loss some data (or power 
> during erase/write. Any other case?).
> 
> What is more frequent is that bitflips > mtd->bitflip_threshold (by 
> default DIV_ROUND_UP(mtd->ecc_strength * 3, 4)), which should avoid 
> bitflips > ecc_strength

Yes, you're probably right. I'll add the unlikely keyword in the next
version.


> >>
> >> As additional optimization you may also check if the lower layer already
> >> did the check for you (e.g. if you have an iMXQP as we saw in latest
> >> days), but I think it's a minor one, because you'll face this situation
> >> very very unlikely.
> >
> > If the hardware is capable of doing such test (I mean counting the
> > number of bits to one and considering the page as erased under a given
> > limit of bitflips), there's a lot of chance it will implement its own
> > ecc_read_page function, and will never use this helper.
> >
> 
> Ops.. I misunderstand your patch. I think it was something similar to 
> what Brian already proposed some time ago [1].
> IIUC Brial solution works, out of the box, even with the ones that 
> override read_page callback, as I think most of current nand controller 
> do (please correct me if I'm wrong).
> If we want to add erased block check to omap2.c, atmel_nand.c, 
> sh_flctl.c we have to modify them all.
> 
> I'm really not the right one to make such a decision ;-) but I think you 
> already thought about it and can tell me the pros and cons of your patch 
> vs the Brian's one.
> 
> What I understand up until now, is that Brian solution does not fit into 
> all weird stuff that we find in single NAND controller implementation 
> and this is where your solution come in handy. Am I wrong?

That's exactly why I'm proposing it as helper functions instead of
trying to apply the erased page check for everybody.
Here are a few missing things to make the test applicable to everybody:
- some controllers are not implementing the read_page_raw function and
  thus checking ECC bytes is impossible
- some of them are not able to retrieve OOB bytes (or are only able to
  retrieve a small portion of it)
- some controllers do not properly define the ECC layout, which makes
  it impossible to check which ECC byte is assigned to which ECC chunk.
- some ECC controllers (like the GPMI one) do not align ECC data on a
  byte, which renders the erased check even more complicated

The other reason to not enforce this test for everybody is that some
controllers generate 0xff ECC bytes for 0xff data (the sama5d4 NAND
controller does), which means they are fully capable of correcting
bitflips in erased pages by their own, and if they report a read
failure, there's no need to check for an empty page, this is a real
failure.

By only providing helper functions, we let the NAND controller
drivers decide how to check it, but we're still providing common
functions instead of duplicating the same code in all drivers.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
