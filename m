Received: from mail-wi0-f182.google.com ([209.85.212.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y94Zy-0005ei-HL
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 04:20:15 +0000
Received: by mail-wi0-f182.google.com with SMTP id h11so800030wiw.3
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 20:19:52 -0800 (PST)
Message-ID: <54AE04ED.8080002@vanguardiasur.com.ar>
Date: Thu, 08 Jan 2015 01:17:49 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Steve deRosier <derosier@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: NAND ECC capabilities
References: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
In-Reply-To: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/08/2015 12:10 AM, Steve deRosier wrote:
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

Not sure why you say that woulnd't hold.

> So, is my understanding correct?
> 

I'm not familiar with atmel-nand, but as far as I know, you are right. A
4-bit ECC strength over 512 byte sectors, means exactly that.

Most likely your ECC hardware stores four ECC values (one for each
512-byte sector in your 2048-byte page) in the OOB of the page. Each ECC
value is used to correct up to 4-bit on each sector, so that's why you
can correct as much as that.

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

Correct. It can correct as much as advertised: 4-bits per 512-byte sector.

> 2. My test of 6 bits hit the 4 bit threshold setting and at that point
> UBI decided that maybe something is wrong with that PEB.

Correct. Read/program disturb accumulates and that produces bitflips.
Given these bitflip can be eliminated by erasing the block, UBI will do
that before the block get worse.

> 3. When it did, UBI corrected the data and copied it elsewhere

Actually, your NAND controller (or MTD software ECC) corrected the data
and reported the number of bitflips to UBI.

> 4. Then UBI scrubbed. I assume it then did the torture test. Since I
> manually made a flip, it found it was fine once it erased it, so it
> didn't mark it as bad.  I checked my BBT and it's not marked. So I
> assume it's erased and ready for use again.
> 

Yes, UBI tortures the PEB on occassions. However, this does happen only
under certain circumstances (you'll have to dig the code for details). I
don't think it was tortured in your case (the block just had a few
artifitial bitflips, but other than that it was healthy).

Torture comes with a noisy message "run torture test for PEB %d", so you
would notice.

> Is my general understanding correct?
> 

I think so, yes.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
