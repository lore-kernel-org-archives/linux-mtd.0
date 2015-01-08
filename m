Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9GrZ-0005Vx-I8
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 17:27:14 +0000
Received: by mail-ie0-f177.google.com with SMTP id rd18so10572210iec.8
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 09:26:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54AEB38D.4030403@vanguardiasur.com.ar>
References: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
 <alpine.DEB.2.02.1501080927090.27318@lnxricardw1.se.axis.com>
 <54AEB38D.4030403@vanguardiasur.com.ar>
Date: Thu, 8 Jan 2015 09:26:52 -0800
Message-ID: <CALupW3BVmLG_LDF=ZjMX-UvpiazbO+Z3ArPAGEuiRO=WMiA7cw@mail.gmail.com>
Subject: Re: NAND ECC capabilities
From: Steve deRosier <derosier@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>, Huang Shijie <shijie8@gmail.com>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 8, 2015 at 8:42 AM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> (Adding a few MTD folks)
>
> On 01/08/2015 05:32 AM, Ricard Wanderlof wrote:
>>
>> On Thu, 8 Jan 2015, Steve deRosier wrote:
>>
>>> So, doing further experiments and I wondered if someone could confirm
>>> this finding.
>>>
>>> With atmel_nand, we're setup for 4-bit ECC on 512 sectors with a 2k
>>> page.  I was thinking about this a bit and realized that there's 4 of
>>> these sectors per page, and this implies then that we can detect and
>>> correct 4 bad bits _per_ each sector.  Assuming that they're evenly
>>> spread, that's up to 16 bad bits per page.  Obviously in practice,
>>> that assumption wouldn't hold...
>>>
>>> So, is my understanding correct?
>>>
>>> I took it further and decided to play with this experimentally. On my
>>> UBIFS rootfs, I flipped 3 bits in the first sector of a page and then
>>> 3 more in the second sector.  From my kernel log I got this:
>>>
>>> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 98, bit_pos: 3, 0x31 -> 0x39
>>> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 98, bit_pos: 2, 0x39 -> 0x3d
>>> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 98, bit_pos: 1, 0x3d -> 0x3f
>>> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 530, bit_pos: 6, 0x8e -> 0xce
>>> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 530, bit_pos: 5, 0xce -> 0xee
>>> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 530, bit_pos: 4, 0xee -> 0xfe
>>> [   78.304687] UBI: fixable bit-flip detected at PEB 20
>>> [   78.304687] UBI: schedule PEB 20 for scrubbing
>>> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 98, bit_pos: 3, 0x31 -> 0x39
>>> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 98, bit_pos: 2, 0x39 -> 0x3d
>>> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 98, bit_pos: 1, 0x3d -> 0x3f
>>> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 530, bit_pos: 6, 0x8e -> 0xce
>>> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 530, bit_pos: 5, 0xce -> 0xee
>>> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
>>> byte_pos: 530, bit_pos: 4, 0xee -> 0xfe
>>> [   78.343750] UBI: fixable bit-flip detected at PEB 20
>>> [   78.382812] UBI: scrubbed PEB 20 (LEB 0:18), data moved to PEB 250
>>>
>>> So, my takeaway from this is a couple of things:
>>>
>>> 1. Yes, it can correct more than 4 bits per page as long as those are
>>> on different sectors of the page.
>>> 2. My test of 6 bits hit the 4 bit threshold setting and at that point
>>> UBI decided that maybe something is wrong with that PEB.
>>> 3. When it did, UBI corrected the data and copied it elsewhere
>>> 4. Then UBI scrubbed. I assume it then did the torture test. Since I
>>> manually made a flip, it found it was fine once it erased it, so it
>>> didn't mark it as bad.  I checked my BBT and it's not marked. So I
>>> assume it's erased and ready for use again.
>>>
>>> Is my general understanding correct?
>>
>> I'd say yes, but the ECC threshold should be per 512 byte ECC block (which
>> seems to be the correct term rather than 'sector'), rather than per page.
>> Are you sure that the threshold is set to 4 (see
>> /sys/devices/virtual/mtd/mtd<n>/bitflip_threshold )?
>>
>> Normally the threshold is set below the ECC correction capability, so that
>> bit scrubbing has a chance to occur before the bits rot too far. Say you
>> have the threshold set at 4 bits, and you have 3 bits that have flipped.
>> If another bit flips, the block would be scrubbed, but say that two bits
>> flipped before you read the data the next time. You would have lost your
>> chance of recovery, so it makes sense to have the threshold lower than the
>> ECC capability. I would say 3/4 of the ECC capability would be a
>> reasonable value.
>>
>
> This makes a lot of sense. However, do we have any way of telling if the
> bitflips where produced on the same ECC sector?
>
> From a cursory look to the code, I'd say there's no such feature with
> the current MTD/NAND design. So, if an mtd_read reports 3 bitflips you
> have no way of telling they happened on the same sector or not, so you
> can't implement your idea.

I'm not sure anyone proposed an idea, but to further an interesting
discussion, I wonder if we should implement a per-ECC-sector
threashold?  On devices where the sector size == the page size the two
parameters would be identical, but I'd be interested in my case of a
bitflip-sector-threshold == 3 and bitflip-page-threshold == 12. In my
basic logic, we'd trigger the same threashold event we currently do if
either total across the page is > 12 or any single sector is > 3.

I know it seems possible to detect in the atmel-nand code specifically
which sector the flip is in (otherwise it wouldn't be possible to
correct it), so it should be possible to pull that higher up and have
the dual threasholds work.  The problem I see is the ECC sector is a
lower level MTD device detail, and we'd want the higher level to deal
with an abstraction.  I don't have time in the next two weeks due to
travel, but I'd be willing to give it a try after that if anyone is
actually interested in such a feature.

>
> I'm curious about what ECC threshold is typically used in production.
> Obviously a too big or too small values have deadly consequences, so
> this doesn't seem like a minor issue.

In my experience with embedded Linux in general, most people usually
go into production with the defaults that are in place already unless
they've explicitly encountered a problem and have developed the domain
knowledge.  The default on my platform is 4.  Which is the max setting
also for the ECC, so by the time bit 5 flips in the same sector and we
notice and run the scrub, it's already too late for the data.  Ouch!

I'm thinking like Ricard, that I should set to 3 in my case.  I'm
wondering if all defaults across the board should be set to either
max-1 or 3/4 as Ricard suggests.

- Steve
