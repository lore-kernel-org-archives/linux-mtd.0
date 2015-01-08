Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y98WR-000637-QO
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 08:32:53 +0000
Date: Thu, 8 Jan 2015 09:32:27 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Steve deRosier <derosier@gmail.com>
Subject: Re: NAND ECC capabilities
In-Reply-To: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1501080927090.27318@lnxricardw1.se.axis.com>
References: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 8 Jan 2015, Steve deRosier wrote:

> So, doing further experiments and I wondered if someone could confirm
> this finding.
> 
> With atmel_nand, we're setup for 4-bit ECC on 512 sectors with a 2k
> page.  I was thinking about this a bit and realized that there's 4 of
> these sectors per page, and this implies then that we can detect and
> correct 4 bad bits _per_ each sector.  Assuming that they're evenly
> spread, that's up to 16 bad bits per page.  Obviously in practice,
> that assumption wouldn't hold...
> 
> So, is my understanding correct?
> 
> I took it further and decided to play with this experimentally. On my
> UBIFS rootfs, I flipped 3 bits in the first sector of a page and then
> 3 more in the second sector.  From my kernel log I got this:
> 
> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 98, bit_pos: 3, 0x31 -> 0x39
> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 98, bit_pos: 2, 0x39 -> 0x3d
> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 98, bit_pos: 1, 0x3d -> 0x3f
> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 530, bit_pos: 6, 0x8e -> 0xce
> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 530, bit_pos: 5, 0xce -> 0xee
> [   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 530, bit_pos: 4, 0xee -> 0xfe
> [   78.304687] UBI: fixable bit-flip detected at PEB 20
> [   78.304687] UBI: schedule PEB 20 for scrubbing
> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 98, bit_pos: 3, 0x31 -> 0x39
> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 98, bit_pos: 2, 0x39 -> 0x3d
> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 98, bit_pos: 1, 0x3d -> 0x3f
> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 530, bit_pos: 6, 0x8e -> 0xce
> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 530, bit_pos: 5, 0xce -> 0xee
> [   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
> byte_pos: 530, bit_pos: 4, 0xee -> 0xfe
> [   78.343750] UBI: fixable bit-flip detected at PEB 20
> [   78.382812] UBI: scrubbed PEB 20 (LEB 0:18), data moved to PEB 250
> 
> So, my takeaway from this is a couple of things:
> 
> 1. Yes, it can correct more than 4 bits per page as long as those are
> on different sectors of the page.
> 2. My test of 6 bits hit the 4 bit threshold setting and at that point
> UBI decided that maybe something is wrong with that PEB.
> 3. When it did, UBI corrected the data and copied it elsewhere
> 4. Then UBI scrubbed. I assume it then did the torture test. Since I
> manually made a flip, it found it was fine once it erased it, so it
> didn't mark it as bad.  I checked my BBT and it's not marked. So I
> assume it's erased and ready for use again.
> 
> Is my general understanding correct?

I'd say yes, but the ECC threshold should be per 512 byte ECC block (which 
seems to be the correct term rather than 'sector'), rather than per page. 
Are you sure that the threshold is set to 4 (see 
/sys/devices/virtual/mtd/mtd<n>/bitflip_threshold )?

Normally the threshold is set below the ECC correction capability, so that 
bit scrubbing has a chance to occur before the bits rot too far. Say you 
have the threshold set at 4 bits, and you have 3 bits that have flipped. 
If another bit flips, the block would be scrubbed, but say that two bits 
flipped before you read the data the next time. You would have lost your 
chance of recovery, so it makes sense to have the threshold lower than the 
ECC capability. I would say 3/4 of the ECC capability would be a 
reasonable value.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
