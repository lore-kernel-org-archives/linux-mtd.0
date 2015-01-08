Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y93VB-00042y-2y
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 03:11:13 +0000
Received: by mail-ig0-f172.google.com with SMTP id hl2so840943igb.5
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 19:10:50 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 7 Jan 2015 19:10:50 -0800
Message-ID: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
Subject: NAND ECC capabilities
From: Steve deRosier <derosier@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So, doing further experiments and I wondered if someone could confirm
this finding.

With atmel_nand, we're setup for 4-bit ECC on 512 sectors with a 2k
page.  I was thinking about this a bit and realized that there's 4 of
these sectors per page, and this implies then that we can detect and
correct 4 bad bits _per_ each sector.  Assuming that they're evenly
spread, that's up to 16 bad bits per page.  Obviously in practice,
that assumption wouldn't hold...

So, is my understanding correct?

I took it further and decided to play with this experimentally. On my
UBIFS rootfs, I flipped 3 bits in the first sector of a page and then
3 more in the second sector.  From my kernel log I got this:

[   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 98, bit_pos: 3, 0x31 -> 0x39
[   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 98, bit_pos: 2, 0x39 -> 0x3d
[   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 98, bit_pos: 1, 0x3d -> 0x3f
[   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 530, bit_pos: 6, 0x8e -> 0xce
[   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 530, bit_pos: 5, 0xce -> 0xee
[   78.304687] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 530, bit_pos: 4, 0xee -> 0xfe
[   78.304687] UBI: fixable bit-flip detected at PEB 20
[   78.304687] UBI: schedule PEB 20 for scrubbing
[   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 98, bit_pos: 3, 0x31 -> 0x39
[   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 98, bit_pos: 2, 0x39 -> 0x3d
[   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 98, bit_pos: 1, 0x3d -> 0x3f
[   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 530, bit_pos: 6, 0x8e -> 0xce
[   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 530, bit_pos: 5, 0xce -> 0xee
[   78.328125] atmel_nand 40000000.nand: Bit flip in data area,
byte_pos: 530, bit_pos: 4, 0xee -> 0xfe
[   78.343750] UBI: fixable bit-flip detected at PEB 20
[   78.382812] UBI: scrubbed PEB 20 (LEB 0:18), data moved to PEB 250

So, my takeaway from this is a couple of things:

1. Yes, it can correct more than 4 bits per page as long as those are
on different sectors of the page.
2. My test of 6 bits hit the 4 bit threshold setting and at that point
UBI decided that maybe something is wrong with that PEB.
3. When it did, UBI corrected the data and copied it elsewhere
4. Then UBI scrubbed. I assume it then did the torture test. Since I
manually made a flip, it found it was fine once it erased it, so it
didn't mark it as bad.  I checked my BBT and it's not marked. So I
assume it's erased and ready for use again.

Is my general understanding correct?

Thanks,
- Steve
