Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0nwi-0005NI-Fp
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2014 07:53:01 +0000
Received: by mail-pd0-f177.google.com with SMTP id q10so1447442pdj.36
 for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2014 23:52:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140108053816.GA28424@shlinux2.ap.freescale.net>
References: <1389123873-30663-1-git-send-email-eliedebrauwer@gmail.com>
 <20140108053816.GA28424@shlinux2.ap.freescale.net>
Date: Wed, 8 Jan 2014 08:52:35 +0100
Message-ID: <CAGWqfigWXs+0nJzxQMh6umhrm1bA5YUWbZmXmj7=aut3HsaAcA@mail.gmail.com>
Subject: Re: [PATCH v0] mtd: gpmi: Use cached syndromes to speedup erased
 region bitflip detection.
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <shijie8@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 8, 2014 at 6:38 AM, Huang Shijie <b32955@freescale.com> wrote:
> On Tue, Jan 07, 2014 at 08:44:32PM +0100, Elie De Brauwer wrote:
>> Hello all,
>>
>> This patch is incremental with respect to 'mtd: gpmi: Deal with bitflips in
>> erased regions' currently in its 7th version, which I consider more or less
>> stable.
>> The 7th version of that patch removed however a fast path option which
>> resulted in a flash throughput decrease. Everytime an erased block is read,
>> each individual byte has its hamming weight calculated and bitflips corrected
>> in software. I'm testing this on a poor old i.mx28 which isn't an powerful
>> beast.
>>
>> Hence I've been looking for a way to regain some of the performance which
>> was lost (at the cost of making ubifs more reliable). And I've been a bit
>> insipired by Pekon Gupta's work on omap (where I stole the first hamming
>> weight approach).
>>
>> Apparently the BCH block has the possibility to write the syndrome data
>> to auxiliary memory (where also the status bytes are stored) when setting
>> the HW_BCH_CTRL:DEBUGSYNDROME). Hence I followed the approach where the
>> first time a correctly erase block is found these syndromes are cached
>> and future reads of likely-to-be--erased blocks can be identified based
>> on the comparison of these syndroms as opposed to checking each individual
>> bytes. For example on my 2k chip I would normally get the hamming weight
>> of 4 (chunks) of 512 bytes aka 2k bytes. But with an ecc8 I can replace
>> this by a memcmp() of 4x32 bytes. (4 sets of syndromes). The result is
>> obviously that the processor is more eager to do this resulting in a
>> regaining some of the lost speed.
>>
>> I did some benchmarking on the following 2k and 4k nand chips:
>> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micron MT29F4G08ABAEAH4), 512MiB, page size: 4096, OOB size: 224
>> NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (Micron MT29F2G08ABAEAH4), 256MiB, page size: 2048, OOB size: 64
>>
>> By simply doing time dd if=/dev/mtd8 of=/dev/null bs=1M and calculating
>> the throughput (in megabyte/s). This gave the following results:
>>
>> 2k  |4k
>> ========
>> 7.0 |11.3 <- v6 of the bitflips correction path (broken fast path)
>> 4.7 |5.9  <- v7 of the bitflip correction patch (no fast path)
>> 5.9 |8.4  <- with this patch applied.
>>
> thanks for the new patch.
>
> I suddenly think out a new solution about this issue:
>   [1] when the bitflip occurs, the BCH will tells up the uncorrectable,
>   [2] if we catch a uncorrectable error, we could check the whole buffer, and
>       count the number of the bitflips. Assume we get the bitflips is N.
>
>   [3] if N is < (gf_len ), we could think this is a erased page, and call the
>       memset to the whole buffer, and tell the upper layer that this is a good
>       empty page.
>
>   [4] since the [1] is very rare, i think this method is much faster then the
>       current solution.
>
> the patch is something like this:

What you suggest will obviously be able to reach the maximum speed,
I've been playing with a similar idea too but always bumped into the issue
that you cannot know whether or not a page is actually an erased page or
not. In your solution for example you cannot distinguish between:
- an erased page which suffers from bitflips
- a genuine uncorrectable page whose original contents may be close to
all 0xff's, but only has a handful of bits set to 0.

The risk of this approach is that if you bump into an erased page, which the
system should mark as uncorrectable, (and deal with accordingly)  is returned
as a valid all 0xff's page which the system will consider as valid data.

I agree this may sound a bit theoretical, and the risk (uncorrectable on a page
with very few 0 bits) is small, but I'm not able to judge whether or not it
can/should be neglected.

What do you think ?


-- 
Elie De Brauwer
