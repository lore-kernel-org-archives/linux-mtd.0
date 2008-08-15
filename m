Received: from yw-out-1718.google.com ([74.125.46.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KU6d4-0006k3-F7
	for linux-mtd@lists.infradead.org; Fri, 15 Aug 2008 21:14:40 +0000
Received: by yw-out-1718.google.com with SMTP id 5so170245ywm.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Aug 2008 14:14:37 -0700 (PDT)
Date: Fri, 15 Aug 2008 23:14:31 +0200 (CEST)
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
In-Reply-To: <48A5D154.2000409@boundarydevices.com>
Message-ID: <alpine.DEB.0.99.0808152300300.9220@frans-desktop>
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
	<1218472202.2977.12.camel@pmac.infradead.org>
	<ac9c93b10808120153m7435424ci3e49a70d3599cc06@mail.gmail.com>
	<1218535872.2977.133.camel@pmac.infradead.org>
	<alpine.DEB.0.99.0808142007340.6572@frans-desktop>
	<48A48330.70105@boundarydevices.com>
	<ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>
	<1218789997.3184.64.camel@pmac.infradead.org>
	<ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>
	<1218793271.3184.77.camel@pmac.infradead.org>
	<ac9c93b10808150304k14f054faw402a7f67e868d2a@mail.gmail.com>
	<1218795140.3184.84.camel@pmac.infradead.org>
	<48A5D154.2000409@boundarydevices.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1371688547-1218834872=:9220"
From: frans <fransmeulenbroeks@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1371688547-1218834872=:9220
Content-Type: TEXT/PLAIN; charset=us-ascii



On Fri, 15 Aug 2008, Troy Kisky wrote:
>
> You might also test it on a big endian system to be safe.
>
> Troy
>
Good remark!
I should have mentioned this more explicitly. As mentioned before I did test
on Linksys NSLU2. This is an ARM and standard Linksys software (as well as
the std unslung one from nslu2-linux.org) is big endian (and yes, that
is the part I did not mention).

Wrt the patch: I've performed the git commands as given by David. Before
doing so I created an empty Documentation/nand/ecc.txt file and did a local 
commit. After that I've added the two files and did a git diff (didn't know 
another way to add a new file, hope that does not break things).

Wrt the previous patch failing. No idea what happened. The patch file on my system is sound, but the file in the sent folder of alpine is already bad. Did a test post to myself and now it is good. No idea what went wrong. Probably I did something clumsy in the alpine editor when inserting the file. (ok, I'll admit it, I am an alpine n00 <blush> )

Anyway, here is the patch again.
I hope it is ok this time, but I'll also attach a .tgz file with diff and
complete source files.
And again apologies that this is not a first-time-right job (but I am 
learning quickly).

Frans.

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

diff --git a/Documentation/nand/ecc.txt b/Documentation/nand/ecc.txt
index e69de29..bdf93b7 100644
--- a/Documentation/nand/ecc.txt
+++ b/Documentation/nand/ecc.txt
@@ -0,0 +1,714 @@
+Introduction
+============
+
+Having looked at the linux mtd/nand driver and more specific at nand_ecc.c
+I felt there was room for optimisation. I bashed the code for a few hours
+performing tricks like table lookup removing superfluous code etc.
+After that the speed was increased by 35-40%.
+Still I was not too happy as I felt there was additional room for improvement.
+
+Bad! I was hooked.
+I decided to annotate my steps in this file. Perhaps it is useful to someone
+or someone learns something from it.
+
+
+The problem
+===========
+
+NAND flash (at least SLC one) typically has sectors of 256 bytes.
+However NAND flash is not extremely reliable so some error detection
+(and sometimes correction) is needed.
+
+This is done by means of a Hamming code. I'll try to explain it in
+laymans terms (and apologies to all the pro's in the field in case I do
+not use the right terminology, my coding theory class was almost 30
+years ago, and I must admit it was not one of my favourites).
+
+As I said before the ecc calculation is performed on sectors of 256
+bytes. This is done by calculating several parity bits over the rows and
+columns. The parity used is even parity which means that the parity bit = 1
+if the data over which the parity is calculated is 1 and the parity bit = 0
+if the data over which the parity is calculated is 0. So the total
+number of bits over the data over which the parity is calculated + the
+parity bit is even. (see wikipedia if you can't follow this).
+Parity is often calculated by means of an exclusive or operation,
+sometimes also referred to as xor. In C the operator for xor is ^
+
+Back to ecc.
+Let's give a small figure:
+
+byte   0:  bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0   rp0 rp2 rp4 ... rp14
+byte   1:  bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0   rp1 rp2 rp4 ... rp14
+byte   2:  bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0   rp0 rp3 rp4 ... rp14
+byte   3:  bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0   rp1 rp3 rp4 ... rp14
+byte   4:  bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0   rp0 rp2 rp5 ... rp14
+....
+byte 254:  bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0   rp0 rp3 rp5 ... rp15
+byte 255:  bit7 bit6 bit5 bit4 bit3 bit2 bit1 bit0   rp1 rp3 rp5 ... rp15
+           cp1  cp0  cp1  cp0  cp1  cp0  cp1  cp0
+           cp3  cp3  cp2  cp2  cp3  cp3  cp2  cp2
+           cp5  cp5  cp5  cp5  cp4  cp4  cp4  cp4
+
+This figure represents a sector of 256 bytes.
+cp is my abbreviaton for column parity, rp for row parity.
+
+Let's start to explain column parity.
+cp0 is the parity that belongs to all bit0, bit2, bit4, bit6.
+so the sum of all bit0, bit2, bit4 and bit6 values + cp0 itself is even.
+Similarly cp1 is the sum of all bit1, bit3, bit5 and bit7.
+cp2 is the parity over bit0, bit1, bit4 and bit5
+cp3 is the parity over bit2, bit3, bit6 and bit7.
+cp4 is the parity over bit0, bit1, bit2 and bit3.
+cp5 is the parity over bit4, bit5, bit6 and bit7.
+Note that each of cp0 .. cp5 is exactly one bit.
+
+Row parity actually works almost the same.
+rp0 is the parity of all even bytes (0, 2, 4, 6, ... 252, 254)
+rp1 is the parity of all odd bytes (1, 3, 5, 7, ..., 253, 255)
+rp2 is the parity of all bytes 0, 1, 4, 5, 8, 9, ...
+(so handle two bytes, then skip 2 bytes).
+rp3 is covers the half rp2 does not cover (bytes 2, 3, 6, 7, 10, 11, ...)
+for rp4 the rule is cover 4 bytes, skip 4 bytes, cover 4 bytes, skip 4 etc.
+so rp4 calculates parity over bytes 0, 1, 2, 3, 8, 9, 10, 11, 16, ...)
+and rp5 covers the other half, so bytes 4, 5, 6, 7, 12, 13, 14, 15, 20, ..
+The story now becomes quite boring. I guess you get the idea.
+rp6 covers 8 bytes then skips 8 etc
+rp7 skips 8 bytes then covers 8 etc
+rp8 covers 16 bytes then skips 16 etc
+rp9 skips 16 bytes then covers 16 etc
+rp10 covers 32 bytes then skips 32 etc
+rp11 skips 32 bytes then covers 32 etc
+rp12 covers 64 bytes then skips 64 etc
+rp13 skips 64 bytes then covers 64 etc
+rp14 covers 128 bytes then skips 128
+rp15 skips 128 bytes then covers 128
+
+In the end the parity bits are grouped together in three bytes as
+follows:
+ECC    Bit 7 Bit 6 Bit 5 Bit 4 Bit 3 Bit 2 Bit 1 Bit 0
+ECC 0   rp07  rp06  rp05  rp04  rp03  rp02  rp01  rp00
+ECC 1   rp15  rp14  rp13  rp12  rp11  rp10  rp09  rp08
+ECC 2   cp5   cp4   cp3   cp2   cp1   cp0      1     1
+
+I detected after writing this that ST application note AN1823
+(http://www.st.com/stonline/books/pdf/docs/10123.pdf) gives a much
+nicer picture.(but they use line parity as term where I use row parity)
+Oh well, I'm graphically challenged, so suffer with me for a moment :-)
+And I could not reuse the ST picture anyway for copyright reasons.
+
+
+Attempt 0
+=========
+
+Implementing the parity calculation is pretty simple.
+In C pseudocode:
+for (i = 0; i < 256; i++)
+{
+    if (i & 0x01)
+       rp1 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp1;
+    else
+       rp0 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp1;
+    if (i & 0x02)
+       rp3 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp3;
+    else
+       rp2 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp2;
+    if (i & 0x04)
+      rp5 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp5;
+    else
+      rp4 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp4;
+    if (i & 0x08)
+      rp7 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp7;
+    else
+      rp6 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp6;
+    if (i & 0x10)
+      rp9 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp9;
+    else
+      rp8 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp8;
+    if (i & 0x20)
+      rp11 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp11;
+    else
+    rp10 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp10;
+    if (i & 0x40)
+      rp13 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp13;
+    else
+      rp12 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp12;
+    if (i & 0x80)
+      rp15 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp15;
+    else
+      rp14 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp14;
+    cp0 = bit6 ^ bit4 ^ bit2 ^ bit0 ^ cp0;
+    cp1 = bit7 ^ bit5 ^ bit3 ^ bit1 ^ cp1;
+    cp2 = bit5 ^ bit4 ^ bit1 ^ bit0 ^ cp2;
+    cp3 = bit7 ^ bit6 ^ bit3 ^ bit2 ^ cp3
+    cp4 = bit3 ^ bit2 ^ bit1 ^ bit0 ^ cp4
+    cp5 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ cp5
+}
+
+
+Analysis 0
+==========
+
+C does have bitwise operators but not really operators to do the above
+efficiently (and most hardware has no such instructions either).
+Therefore without implementing this it was clear that the code above was
+not going to bring me a Nobel prize :-)
+
+Fortunately the exclusive or operation is commutative, so we can combine
+the values in any order. So instead of calculating all the bits
+individually, let us try to rearrange things.
+For the column parity this is easy. We can just xor the bytes and in the
+end filter out the relevant bits. This is pretty nice as it will bring
+all cp calculation out of the if loop.
+
+Similarly we can first xor the bytes for the various rows.
+This leads to:
+
+
+Attempt 1
+=========
+
+const char parity[256] = {
+    0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+    1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+    1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+    0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+    1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+    0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+    0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+    1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+    1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+    0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+    0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+    1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+    0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+    1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+    1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+    0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0
+};
+
+void ecc1(const unsigned char *buf, unsigned char *code)
+{
+    int i;
+    const unsigned char *bp = buf;
+    unsigned char cur;
+    unsigned char rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
+    unsigned char rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15;
+    unsigned char par;
+
+    par = 0;
+    rp0 = 0; rp1 = 0; rp2 = 0; rp3 = 0;
+    rp4 = 0; rp5 = 0; rp6 = 0; rp7 = 0;
+    rp8 = 0; rp9 = 0; rp10 = 0; rp11 = 0;
+    rp12 = 0; rp13 = 0; rp14 = 0; rp15 = 0;
+
+    for (i = 0; i < 256; i++)
+    {
+        cur = *bp++;
+        par ^= cur;
+        if (i & 0x01) rp1 ^= cur; else rp0 ^= cur;
+        if (i & 0x02) rp3 ^= cur; else rp2 ^= cur;
+        if (i & 0x04) rp5 ^= cur; else rp4 ^= cur;
+        if (i & 0x08) rp7 ^= cur; else rp6 ^= cur;
+        if (i & 0x10) rp9 ^= cur; else rp8 ^= cur;
+        if (i & 0x20) rp11 ^= cur; else rp10 ^= cur;
+        if (i & 0x40) rp13 ^= cur; else rp12 ^= cur;
+        if (i & 0x80) rp15 ^= cur; else rp14 ^= cur;
+    }
+    code[0] =
+        (parity[rp7] << 7) |
+        (parity[rp6] << 6) |
+        (parity[rp5] << 5) |
+        (parity[rp4] << 4) |
+        (parity[rp3] << 3) |
+        (parity[rp2] << 2) |
+        (parity[rp1] << 1) |
+        (parity[rp0]);
+    code[1] =
+        (parity[rp15] << 7) |
+        (parity[rp14] << 6) |
+        (parity[rp13] << 5) |
+        (parity[rp12] << 4) |
+        (parity[rp11] << 3) |
+        (parity[rp10] << 2) |
+        (parity[rp9]  << 1) |
+        (parity[rp8]);
+    code[2] =
+        (parity[par & 0xf0] << 7) |
+        (parity[par & 0x0f] << 6) |
+        (parity[par & 0xcc] << 5) |
+        (parity[par & 0x33] << 4) |
+        (parity[par & 0xaa] << 3) |
+        (parity[par & 0x55] << 2);
+    code[0] = ~code[0];
+    code[1] = ~code[1];
+    code[2] = ~code[2];
+}
+
+Still pretty straightforward. The last three invert statements are there to
+give a checksum of 0xff 0xff 0xff for an empty flash. In an empty flash
+all data is 0xff, so the checksum then matches.
+
+I also introduced the parity lookup. I expected this to be the fastest
+way to calculate the parity, but I will investigate alternatives later
+on.
+
+
+Analysis 1
+==========
+
+The code works, but is not terribly efficient. On my system it took
+almost 4 times as much time as the linux driver code. But hey, if it was
+*that* easy this would have been done long before.
+No pain. no gain.
+
+Fortunately there is plenty of room for improvement.
+
+In step 1 we moved from bit-wise calculation to byte-wise calculation.
+However in C we can also use the unsigned long data type and virtually
+every modern microprocessor supports 32 bit operations, so why not try
+to write our code in such a way that we process data in 32 bit chunks.
+
+Of course this means some modification as the row parity is byte by
+byte. A quick analysis:
+for the column parity we use the par variable. When extending to 32 bits
+we can in the end easily calculate p0 and p1 from it.
+(because par now consists of 4 bytes, contributing to rp1, rp0, rp1, rp0
+respectively)
+also rp2 and rp3 can be easily retrieved from par as rp3 covers the
+first two bytes and rp2 the last two bytes.
+
+Note that of course now the loop is executed only 64 times (256/4).
+And note that care must taken wrt byte ordering. The way bytes are
+ordered in a long is machine dependent, and might affect us.
+Anyway, if there is an issue: this code is developed on x86 (to be
+precise: a DELL PC with a D920 Intel CPU)
+
+And of course the performance might depend on alignment, but I expect
+that the I/O buffers in the nand driver are aligned properly (and
+otherwise that should be fixed to get maximum performance).
+
+Let's give it a try...
+
+
+Attempt 2
+=========
+
+extern const char parity[256];
+
+void ecc2(const unsigned char *buf, unsigned char *code)
+{
+    int i;
+    const unsigned long *bp = (unsigned long *)buf;
+    unsigned long cur;
+    unsigned long rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
+    unsigned long rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15;
+    unsigned long par;
+
+    par = 0;
+    rp0 = 0; rp1 = 0; rp2 = 0; rp3 = 0;
+    rp4 = 0; rp5 = 0; rp6 = 0; rp7 = 0;
+    rp8 = 0; rp9 = 0; rp10 = 0; rp11 = 0;
+    rp12 = 0; rp13 = 0; rp14 = 0; rp15 = 0;
+
+    for (i = 0; i < 64; i++)
+    {
+        cur = *bp++;
+        par ^= cur;
+        if (i & 0x01) rp5 ^= cur; else rp4 ^= cur;
+        if (i & 0x02) rp7 ^= cur; else rp6 ^= cur;
+        if (i & 0x04) rp9 ^= cur; else rp8 ^= cur;
+        if (i & 0x08) rp11 ^= cur; else rp10 ^= cur;
+        if (i & 0x10) rp13 ^= cur; else rp12 ^= cur;
+        if (i & 0x20) rp15 ^= cur; else rp14 ^= cur;
+    }
+    /*
+       we need to adapt the code generation for the fact that rp vars are now
+       long; also the column parity calculation needs to be changed.
+       we'll bring rp4 to 15 back to single byte entities by shifting and
+       xoring
+    */
+    rp4 ^= (rp4 >> 16); rp4 ^= (rp4 >> 8); rp4 &= 0xff;
+    rp5 ^= (rp5 >> 16); rp5 ^= (rp5 >> 8); rp5 &= 0xff;
+    rp6 ^= (rp6 >> 16); rp6 ^= (rp6 >> 8); rp6 &= 0xff;
+    rp7 ^= (rp7 >> 16); rp7 ^= (rp7 >> 8); rp7 &= 0xff;
+    rp8 ^= (rp8 >> 16); rp8 ^= (rp8 >> 8); rp8 &= 0xff;
+    rp9 ^= (rp9 >> 16); rp9 ^= (rp9 >> 8); rp9 &= 0xff;
+    rp10 ^= (rp10 >> 16); rp10 ^= (rp10 >> 8); rp10 &= 0xff;
+    rp11 ^= (rp11 >> 16); rp11 ^= (rp11 >> 8); rp11 &= 0xff;
+    rp12 ^= (rp12 >> 16); rp12 ^= (rp12 >> 8); rp12 &= 0xff;
+    rp13 ^= (rp13 >> 16); rp13 ^= (rp13 >> 8); rp13 &= 0xff;
+    rp14 ^= (rp14 >> 16); rp14 ^= (rp14 >> 8); rp14 &= 0xff;
+    rp15 ^= (rp15 >> 16); rp15 ^= (rp15 >> 8); rp15 &= 0xff;
+    rp3 = (par >> 16); rp3 ^= (rp3 >> 8); rp3 &= 0xff;
+    rp2 = par & 0xffff; rp2 ^= (rp2 >> 8); rp2 &= 0xff;
+    par ^= (par >> 16);
+    rp1 = (par >> 8); rp1 &= 0xff;
+    rp0 = (par & 0xff);
+    par ^= (par >> 8); par &= 0xff;
+
+    code[0] =
+        (parity[rp7] << 7) |
+        (parity[rp6] << 6) |
+        (parity[rp5] << 5) |
+        (parity[rp4] << 4) |
+        (parity[rp3] << 3) |
+        (parity[rp2] << 2) |
+        (parity[rp1] << 1) |
+        (parity[rp0]);
+    code[1] =
+        (parity[rp15] << 7) |
+        (parity[rp14] << 6) |
+        (parity[rp13] << 5) |
+        (parity[rp12] << 4) |
+        (parity[rp11] << 3) |
+        (parity[rp10] << 2) |
+        (parity[rp9]  << 1) |
+        (parity[rp8]);
+    code[2] =
+        (parity[par & 0xf0] << 7) |
+        (parity[par & 0x0f] << 6) |
+        (parity[par & 0xcc] << 5) |
+        (parity[par & 0x33] << 4) |
+        (parity[par & 0xaa] << 3) |
+        (parity[par & 0x55] << 2);
+    code[0] = ~code[0];
+    code[1] = ~code[1];
+    code[2] = ~code[2];
+}
+
+The parity array is not shown any more. Note also that for these
+examples I kinda deviated from my regular programming style by allowing
+multiple statements on a line, not using { } in then and else blocks
+with only a single statement and by using operators like ^=
+
+
+Analysis 2
+==========
+
+The code (of course) works, and hurray: we are a little bit faster than
+the linux driver code (about 15%). But wait, don't cheer too quickly.
+THere is more to be gained.
+If we look at e.g. rp14 and rp15 we see that we either xor our data with
+rp14 or with rp15. However we also have par which goes over all data.
+This means there is no need to calculate rp14 as it can be calculated from
+rp15 through rp14 = par ^ rp15;
+(or if desired we can avoid calculating rp15 and calculate it from
+rp14).  That is why some places refer to inverse parity.
+Of course the same thing holds for rp4/5, rp6/7, rp8/9, rp10/11 and rp12/13.
+Effectively this means we can eliminate the else clause from the if
+statements. Also we can optimise the calculation in the end a little bit
+by going from long to byte first. Actually we can even avoid the table
+lookups
+
+Attempt 3
+=========
+
+Odd replaced:
+        if (i & 0x01) rp5 ^= cur; else rp4 ^= cur;
+        if (i & 0x02) rp7 ^= cur; else rp6 ^= cur;
+        if (i & 0x04) rp9 ^= cur; else rp8 ^= cur;
+        if (i & 0x08) rp11 ^= cur; else rp10 ^= cur;
+        if (i & 0x10) rp13 ^= cur; else rp12 ^= cur;
+        if (i & 0x20) rp15 ^= cur; else rp14 ^= cur;
+with
+        if (i & 0x01) rp5 ^= cur;
+        if (i & 0x02) rp7 ^= cur;
+        if (i & 0x04) rp9 ^= cur;
+        if (i & 0x08) rp11 ^= cur;
+        if (i & 0x10) rp13 ^= cur;
+        if (i & 0x20) rp15 ^= cur;
+
+        and outside the loop added:
+    rp4  = par ^ rp5;
+    rp6  = par ^ rp7;
+    rp8  = par ^ rp9;
+    rp10  = par ^ rp11;
+    rp12  = par ^ rp13;
+    rp14  = par ^ rp15;
+
+And after that the code takes about 30% more time, although the number of
+statements is reduced. This is also reflected in the assembly code.
+
+
+Analysis 3
+==========
+
+Very weird. Guess it has to do with caching or instruction parallellism
+or so. I also tried on an eeePC (Celeron, clocked at 900 Mhz). Interesting
+observation was that this one is only 30% slower (according to time)
+executing the code as my 3Ghz D920 processor.
+
+Well, it was expected not to be easy so maybe instead move to a
+different track: let's move back to the code from attempt2 and do some
+loop unrolling. This will eliminate a few if statements. I'll try
+different amounts of unrolling to see what works best.
+
+
+Attempt 4
+=========
+
+Unrolled the loop 1, 2, 3 and 4 times.
+For 4 the code starts with:
+
+    for (i = 0; i < 4; i++)
+    {
+        cur = *bp++;
+        par ^= cur;
+        rp4 ^= cur;
+        rp6 ^= cur;
+        rp8 ^= cur;
+        rp10 ^= cur;
+        if (i & 0x1) rp13 ^= cur; else rp12 ^= cur;
+        if (i & 0x2) rp15 ^= cur; else rp14 ^= cur;
+        cur = *bp++;
+        par ^= cur;
+        rp5 ^= cur;
+        rp6 ^= cur;
+        ...
+
+
+Analysis 4
+==========
+
+Unrolling once gains about 15%
+Unrolling twice keeps the gain at about 15%
+Unrolling three times gives a gain of 30% compared to attempt 2.
+Unrolling four times gives a marginal improvement compared to unrolling
+three times.
+
+I decided to proceed with a four time unrolled loop anyway. It was my gut
+feeling that in the next steps I would obtain additional gain from it.
+
+The next step was triggered by the fact that par contains the xor of all
+bytes and rp4 and rp5 each contain the xor of half of the bytes.
+So in effect par = rp4 ^ rp5. But as xor is commutative we can also say
+that rp5 = par ^ rp4. So no need to keep both rp4 and rp5 around. We can
+eliminate rp5 (or rp4, but I already foresaw another optimisation).
+The same holds for rp6/7, rp8/9, rp10/11 rp12/13 and rp14/15.
+
+
+Attempt 5
+=========
+
+Effectively so all odd digit rp assignments in the loop were removed.
+This included the else clause of the if statements.
+Of course after the loop we need to correct things by adding code like:
+    rp5 = par ^ rp4;
+Also the initial assignments (rp5 = 0; etc) could be removed.
+Along the line I also removed the initialisation of rp0/1/2/3.
+
+
+Analysis 5
+==========
+
+Measurements showed this was a good move. The run-time roughly halved
+compared with attempt 4 with 4 times unrolled, and we only require 1/3rd
+of the processor time compared to the current code in the linux kernel.
+
+However, still I thought there was more. I didn't like all the if
+statements. Why not keep a running parity and only keep the last if
+statement. Time for yet another version!
+
+
+Attempt 6
+=========
+
+THe code within the for loop was changed to:
+
+    for (i = 0; i < 4; i++)
+    {
+        cur = *bp++; tmppar  = cur; rp4 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp6 ^= tmppar;
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp8 ^= tmppar;
+
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur; rp6 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp6 ^= cur;
+	    cur = *bp++; tmppar ^= cur; rp4 ^= cur;
+	    cur = *bp++; tmppar ^= cur; rp10 ^= tmppar;
+
+	    cur = *bp++; tmppar ^= cur; rp4 ^= cur; rp6 ^= cur; rp8 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp6 ^= cur; rp8 ^= cur;
+	    cur = *bp++; tmppar ^= cur; rp4 ^= cur; rp8 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp8 ^= cur;
+
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur; rp6 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp6 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur;
+        cur = *bp++; tmppar ^= cur;
+
+	    par ^= tmppar;
+        if ((i & 0x1) == 0) rp12 ^= tmppar;
+        if ((i & 0x2) == 0) rp14 ^= tmppar;
+    }
+
+As you can see tmppar is used to accumulate the parity within a for
+iteration. In the last 3 statements is is added to par and, if needed,
+to rp12 and rp14.
+
+While making the changes I also found that I could exploit that tmppar
+contains the running parity for this iteration. So instead of having:
+rp4 ^= cur; rp6 = cur;
+I removed the rp6 = cur; statement and did rp6 ^= tmppar; on next
+statement. A similar change was done for rp8 and rp10
+
+
+Analysis 6
+==========
+
+Measuring this code again showed big gain. When executing the original
+linux code 1 million times, this took about 1 second on my system.
+(using time to measure the performance). After this iteration I was back
+to 0.075 sec. Actually I had to decide to start measuring over 10
+million interations in order not to loose too much accuracy. This one
+definitely seemed to be the jackpot!
+
+There is a little bit more room for improvement though. There are three
+places with statements:
+rp4 ^= cur; rp6 ^= cur;
+It seems more efficient to also maintain a variable rp4_6 in the while
+loop; This eliminates 3 statements per loop. Of course after the loop we
+need to correct by adding:
+    rp4 ^= rp4_6;
+    rp6 ^= rp4_6
+Furthermore there are 4 sequential assingments to rp8. This can be
+encoded slightly more efficient by saving tmppar before those 4 lines
+and later do rp8 = rp8 ^ tmppar ^ notrp8;
+(where notrp8 is the value of rp8 before those 4 lines).
+Again a use of the commutative property of xor.
+Time for a new test!
+
+
+Attempt 7
+=========
+
+The new code now looks like:
+
+    for (i = 0; i < 4; i++)
+    {
+        cur = *bp++; tmppar  = cur; rp4 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp6 ^= tmppar;
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp8 ^= tmppar;
+
+        cur = *bp++; tmppar ^= cur; rp4_6 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp6 ^= cur;
+	    cur = *bp++; tmppar ^= cur; rp4 ^= cur;
+	    cur = *bp++; tmppar ^= cur; rp10 ^= tmppar;
+
+	    notrp8 = tmppar;
+	    cur = *bp++; tmppar ^= cur; rp4_6 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp6 ^= cur;
+	    cur = *bp++; tmppar ^= cur; rp4 ^= cur;
+        cur = *bp++; tmppar ^= cur;
+	    rp8 = rp8 ^ tmppar ^ notrp8;
+
+        cur = *bp++; tmppar ^= cur; rp4_6 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp6 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur;
+        cur = *bp++; tmppar ^= cur;
+
+	    par ^= tmppar;
+        if ((i & 0x1) == 0) rp12 ^= tmppar;
+        if ((i & 0x2) == 0) rp14 ^= tmppar;
+    }
+    rp4 ^= rp4_6;
+    rp6 ^= rp4_6;
+
+
+Not a big change, but every penny counts :-)
+
+
+Analysis 7
+==========
+
+Acutally this made things worse. Not very much, but I don't want to move
+into the wrong direction. Maybe something to investigate later. Could
+have to do with caching again.
+
+Guess that is what there is to win within the loop. Maybe unrolling one
+more time will help. I'll keep the optimisations from 7 for now.
+
+
+Attempt 8
+=========
+
+Unrolled the loop one more time.
+
+
+Analysis 8
+==========
+
+This makes things worse. Let's stick with attempt 6 and continue from there.
+Although it seems that the code within the loop cannot be optimised
+further there is still room to optimize the generation of the ecc codes.
+We can simply calcualate the total parity. If this is 0 then rp4 = rp5
+etc. If the parity is 1, then rp4 = !rp5;
+But if rp4 = rp5 we do not need rp5 etc. We can just write the even bits
+in the result byte and then do something like
+    code[0] |= (code[0] << 1);
+Lets test this.
+
+
+Attempt 9
+=========
+
+Changed the code but again this slightly degrades performance. Tried all
+kind of other things, like having dedicated parity arrays to avoid the
+shift after parity[rp7] << 7; No gain.
+Change the lookup using the parity array by using shift operators (e.g.
+replace parity[rp7] << 7 with:
+rp7 ^= (rp7 << 4);
+rp7 ^= (rp7 << 2);
+rp7 ^= (rp7 << 1);
+rp7 &= 0x80;
+No gain.
+
+The only marginal change was inverting the parity bits, so we can remove
+the last three invert statements.
+
+Ah well, pity this does not deliver more. Then again 10 million
+iterations using the linux driver code takes between 13 and 13.5
+seconds, whereas my code now takes about 0.73 seconds for those 10
+million iterations. So basically I've improved the performance by a
+factor 18 on my system. Not that bad. Of course on different hardware
+you will get different results. No warranties!
+
+But of course there is no such thing as a free lunch. The codesize almost
+tripled (from 562 bytes to 1434 bytes). Then again, it is not that much.
+
+
+Correcting errors
+=================
+
+For correcting errors I again used the ST application note as a starter,
+but I also peeked at the existing code.
+The algorithm itself is pretty straightforward. Just xor the given and
+the calculated ecc. If all bytes are 0 there is no problem. If 11 bits
+are 1 we have one correctable bit error. If there is 1 bit 1, we have an
+error in the given ecc code.
+It proved to be fastest to do some table lookups. Performance gain
+introduced by this is about a factor 2 on my system when a repair had to
+be done, and 1% or so if no repair had to be done.
+Code size increased from 330 bytes to 686 bytes for this function.
+(gcc 4.2, -O3)
+
+
+Conclusion
+==========
+
+The gain when calculating the ecc is tremendous. Om my development hardware
+a speedup of a factor of 18 for ecc calculation was achieved. On a test on an
+embedded system with a MIPS core a factor 7 was obtained.
+On  a test with a Linksys NSLU2 (ARMv5TE processor) the speedup was a factor
+5 (big endian mode, gcc 4.1.2, -O3)
+For correction not much gain could be obtained (as bitflips are rare). Then
+again there are also much less cycles spent there.
+
+It seems there is not much more gain possible in this, at least when
+programmed in C. Of course it might be possible to squeeze something more
+out of it with an assembler program, but due to pipeline behaviour etc
+this is very tricky (at least for intel hw).
+
+Author: Frans Meulenbroeks
+Copyright (C) 2008 Koninklijke Philips Electronics NV.
diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index 918a806..7129da5 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -1,13 +1,18 @@
 /*
- * This file contains an ECC algorithm from Toshiba that detects and
- * corrects 1 bit errors in a 256 byte block of data.
+ * This file contains an ECC algorithm that detects and corrects 1 bit
+ * errors in a 256 byte block of data.
  *
  * drivers/mtd/nand/nand_ecc.c
  *
- * Copyright (C) 2000-2004 Steven J. Hill (sjhill@realitydiluted.com)
- *                         Toshiba America Electronics Components, Inc.
+ * Copyright (C) 2008 Koninklijke Philips Electronics NV.
+ *                    Author: Frans Meulenbroeks
  *
- * Copyright (C) 2006 Thomas Gleixner <tglx@linutronix.de>
+ * Completely replaces the previous ECC implementation which was written by:
+ *   Steven J. Hill (sjhill@realitydiluted.com)
+ *   Thomas Gleixner (tglx@linutronix.de)
+ *
+ * Information on how this algorithm works and how it was developed
+ * can be found in Documentation/nand/ecc.txt
  *
  * This file is free software; you can redistribute it and/or modify it
  * under the terms of the GNU General Public License as published by the
@@ -23,174 +28,417 @@
  * with this file; if not, write to the Free Software Foundation, Inc.,
  * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
  *
- * As a special exception, if other files instantiate templates or use
- * macros or inline functions from these files, or you compile these
- * files and link them with other works to produce a work based on these
- * files, these files do not by themselves cause the resulting work to be
- * covered by the GNU General Public License. However the source code for
- * these files must still be made available in accordance with section (3)
- * of the GNU General Public License.
- *
- * This exception does not invalidate any other reasons why a work based on
- * this file might be covered by the GNU General Public License.
  */

+/*
+ * The STANDALONE macro is useful when running the code outside the kernel
+ * e.g. when running the code in a testbed or a benchmark program.
+ * When STANDALONE is used, the module related macros are commented out
+ * as well as the linux include files.
+ * Instead a private definition of mtd_into is given to satisfy the compiler
+ * (the code does not use mtd_info, so the code does not care)
+ */
+#ifndef STANDALONE
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mtd/nand_ecc.h>
+#else
+typedef uint32_t unsigned long
+struct mtd_info {
+	int dummy;
+};
+#define EXPORT_SYMBOL(x)  /* x */
+
+#define MODULE_LICENSE(x)	/* x */
+#define MODULE_AUTHOR(x)	/* x */
+#define MODULE_DESCRIPTION(x)	/* x */
+#endif
+
+/*
+ * invparity is a 256 byte table that contains the odd parity
+ * for each byte. So if the number of bits in a byte is even,
+ * the array element is 1, and when the number of bits is odd
+ * the array eleemnt is 0.
+ */
+static const char invparity[256] = {
+	1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+	0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+	0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+	1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+	0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+	1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+	1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+	0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+	0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+	1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+	1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+	0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+	1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1,
+	0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+	0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 1, 0,
+	1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1
+};

 /*
- * Pre-calculated 256-way 1 byte column parity
+ * bitsperbyte contains the number of bits per byte
+ * this is only used for testing and repairing parity
+ * (a precalculated value slightly improves performance)
  */
-static const u_char nand_ecc_precalc_table[] = {
-	0x00, 0x55, 0x56, 0x03, 0x59, 0x0c, 0x0f, 0x5a, 0x5a, 0x0f, 0x0c, 0x59, 0x03, 0x56, 0x55, 0x00,
-	0x65, 0x30, 0x33, 0x66, 0x3c, 0x69, 0x6a, 0x3f, 0x3f, 0x6a, 0x69, 0x3c, 0x66, 0x33, 0x30, 0x65,
-	0x66, 0x33, 0x30, 0x65, 0x3f, 0x6a, 0x69, 0x3c, 0x3c, 0x69, 0x6a, 0x3f, 0x65, 0x30, 0x33, 0x66,
-	0x03, 0x56, 0x55, 0x00, 0x5a, 0x0f, 0x0c, 0x59, 0x59, 0x0c, 0x0f, 0x5a, 0x00, 0x55, 0x56, 0x03,
-	0x69, 0x3c, 0x3f, 0x6a, 0x30, 0x65, 0x66, 0x33, 0x33, 0x66, 0x65, 0x30, 0x6a, 0x3f, 0x3c, 0x69,
-	0x0c, 0x59, 0x5a, 0x0f, 0x55, 0x00, 0x03, 0x56, 0x56, 0x03, 0x00, 0x55, 0x0f, 0x5a, 0x59, 0x0c,
-	0x0f, 0x5a, 0x59, 0x0c, 0x56, 0x03, 0x00, 0x55, 0x55, 0x00, 0x03, 0x56, 0x0c, 0x59, 0x5a, 0x0f,
-	0x6a, 0x3f, 0x3c, 0x69, 0x33, 0x66, 0x65, 0x30, 0x30, 0x65, 0x66, 0x33, 0x69, 0x3c, 0x3f, 0x6a,
-	0x6a, 0x3f, 0x3c, 0x69, 0x33, 0x66, 0x65, 0x30, 0x30, 0x65, 0x66, 0x33, 0x69, 0x3c, 0x3f, 0x6a,
-	0x0f, 0x5a, 0x59, 0x0c, 0x56, 0x03, 0x00, 0x55, 0x55, 0x00, 0x03, 0x56, 0x0c, 0x59, 0x5a, 0x0f,
-	0x0c, 0x59, 0x5a, 0x0f, 0x55, 0x00, 0x03, 0x56, 0x56, 0x03, 0x00, 0x55, 0x0f, 0x5a, 0x59, 0x0c,
-	0x69, 0x3c, 0x3f, 0x6a, 0x30, 0x65, 0x66, 0x33, 0x33, 0x66, 0x65, 0x30, 0x6a, 0x3f, 0x3c, 0x69,
-	0x03, 0x56, 0x55, 0x00, 0x5a, 0x0f, 0x0c, 0x59, 0x59, 0x0c, 0x0f, 0x5a, 0x00, 0x55, 0x56, 0x03,
-	0x66, 0x33, 0x30, 0x65, 0x3f, 0x6a, 0x69, 0x3c, 0x3c, 0x69, 0x6a, 0x3f, 0x65, 0x30, 0x33, 0x66,
-	0x65, 0x30, 0x33, 0x66, 0x3c, 0x69, 0x6a, 0x3f, 0x3f, 0x6a, 0x69, 0x3c, 0x66, 0x33, 0x30, 0x65,
-	0x00, 0x55, 0x56, 0x03, 0x59, 0x0c, 0x0f, 0x5a, 0x5a, 0x0f, 0x0c, 0x59, 0x03, 0x56, 0x55, 0x00
+static const char bitsperbyte[256] = {
+	0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
+	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
+	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
+	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
+	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
+	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
+	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
+	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
+	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
+	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
+	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
+	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
+	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
+	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
+	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
+	4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8,
+};
+
+/*
+ * addressbits is a lookup table to filter out the bits from the xor-ed
+ * ecc data that identify the faulty location.
+ * this is only used for repairing parity
+ * see the comments in nand_correct_data for more details
+ */
+static const char addressbits[256] = {
+	0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,
+	0x02, 0x02, 0x03, 0x03, 0x02, 0x02, 0x03, 0x03,
+	0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,
+	0x02, 0x02, 0x03, 0x03, 0x02, 0x02, 0x03, 0x03,
+	0x04, 0x04, 0x05, 0x05, 0x04, 0x04, 0x05, 0x05,
+	0x06, 0x06, 0x07, 0x07, 0x06, 0x06, 0x07, 0x07,
+	0x04, 0x04, 0x05, 0x05, 0x04, 0x04, 0x05, 0x05,
+	0x06, 0x06, 0x07, 0x07, 0x06, 0x06, 0x07, 0x07,
+	0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,
+	0x02, 0x02, 0x03, 0x03, 0x02, 0x02, 0x03, 0x03,
+	0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01,
+	0x02, 0x02, 0x03, 0x03, 0x02, 0x02, 0x03, 0x03,
+	0x04, 0x04, 0x05, 0x05, 0x04, 0x04, 0x05, 0x05,
+	0x06, 0x06, 0x07, 0x07, 0x06, 0x06, 0x07, 0x07,
+	0x04, 0x04, 0x05, 0x05, 0x04, 0x04, 0x05, 0x05,
+	0x06, 0x06, 0x07, 0x07, 0x06, 0x06, 0x07, 0x07,
+	0x08, 0x08, 0x09, 0x09, 0x08, 0x08, 0x09, 0x09,
+	0x0a, 0x0a, 0x0b, 0x0b, 0x0a, 0x0a, 0x0b, 0x0b,
+	0x08, 0x08, 0x09, 0x09, 0x08, 0x08, 0x09, 0x09,
+	0x0a, 0x0a, 0x0b, 0x0b, 0x0a, 0x0a, 0x0b, 0x0b,
+	0x0c, 0x0c, 0x0d, 0x0d, 0x0c, 0x0c, 0x0d, 0x0d,
+	0x0e, 0x0e, 0x0f, 0x0f, 0x0e, 0x0e, 0x0f, 0x0f,
+	0x0c, 0x0c, 0x0d, 0x0d, 0x0c, 0x0c, 0x0d, 0x0d,
+	0x0e, 0x0e, 0x0f, 0x0f, 0x0e, 0x0e, 0x0f, 0x0f,
+	0x08, 0x08, 0x09, 0x09, 0x08, 0x08, 0x09, 0x09,
+	0x0a, 0x0a, 0x0b, 0x0b, 0x0a, 0x0a, 0x0b, 0x0b,
+	0x08, 0x08, 0x09, 0x09, 0x08, 0x08, 0x09, 0x09,
+	0x0a, 0x0a, 0x0b, 0x0b, 0x0a, 0x0a, 0x0b, 0x0b,
+	0x0c, 0x0c, 0x0d, 0x0d, 0x0c, 0x0c, 0x0d, 0x0d,
+	0x0e, 0x0e, 0x0f, 0x0f, 0x0e, 0x0e, 0x0f, 0x0f,
+	0x0c, 0x0c, 0x0d, 0x0d, 0x0c, 0x0c, 0x0d, 0x0d,
+	0x0e, 0x0e, 0x0f, 0x0f, 0x0e, 0x0e, 0x0f, 0x0f
 };

 /**
  * nand_calculate_ecc - [NAND Interface] Calculate 3-byte ECC for 256-byte block
- * @mtd:	MTD block structure
+ * @mtd:	MTD block structure (unused)
  * @dat:	raw data
  * @ecc_code:	buffer for ECC
  */
-int nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
-		       u_char *ecc_code)
+int nand_calculate_ecc(struct mtd_info *mtd, const unsigned char *buf,
+		       unsigned char *code)
 {
-	uint8_t idx, reg1, reg2, reg3, tmp1, tmp2;
 	int i;
+	const uint32_t *bp = (uint32_t *)buf;
+	uint32_t cur;		/* current value in buffer */
+	/* rp0..rp15 are the various accumulated parities (per byte) */
+	uint32_t rp0, rp1, rp2, rp3, rp4, rp5, rp6, rp7;
+	uint32_t rp8, rp9, rp10, rp11, rp12, rp13, rp14, rp15;
+	uint32_t par;		/* the cumulative parity for all data */
+	uint32_t tmppar;	/* the cumulative parity for this iteration;
+				   for rp12 and rp14 at the end of the loop */
+
+	par = 0;
+	rp4 = 0;
+	rp6 = 0;
+	rp8 = 0;
+	rp10 = 0;
+	rp12 = 0;
+	rp14 = 0;
+
+	/*
+	 * The loop is unrolled a number of times;
+	 * This avoids if statements to decide on which rp value to update
+	 * Also we process the data by longwords.
+	 * Note: passing unaligned data might give a performance penalty.
+	 * It is assumed that the buffers are aligned.
+	 * tmppar is the cumulative sum of this iteration.
+	 * needed for calculating rp12, rp14 and par
+	 * also used as a performance improvement for rp6, rp8 and rp10
+	 */
+	for (i = 0; i < 4; i++) {
+		cur = *bp++;
+		tmppar = cur;
+		rp4 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp6 ^= tmppar;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp4 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp8 ^= tmppar;

-	/* Initialize variables */
-	reg1 = reg2 = reg3 = 0;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp4 ^= cur;
+		rp6 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp6 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp4 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp10 ^= tmppar;

-	/* Build up column parity */
-	for(i = 0; i < 256; i++) {
-		/* Get CP0 - CP5 from table */
-		idx = nand_ecc_precalc_table[*dat++];
-		reg1 ^= (idx & 0x3f);
+		cur = *bp++;
+		tmppar ^= cur;
+		rp4 ^= cur;
+		rp6 ^= cur;
+		rp8 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp6 ^= cur;
+		rp8 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp4 ^= cur;
+		rp8 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp8 ^= cur;

-		/* All bit XOR = 1 ? */
-		if (idx & 0x40) {
-			reg3 ^= (uint8_t) i;
-			reg2 ^= ~((uint8_t) i);
-		}
+		cur = *bp++;
+		tmppar ^= cur;
+		rp4 ^= cur;
+		rp6 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp6 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+		rp4 ^= cur;
+		cur = *bp++;
+		tmppar ^= cur;
+
+		par ^= tmppar;
+		if ((i & 0x1) == 0)
+			rp12 ^= tmppar;
+		if ((i & 0x2) == 0)
+			rp14 ^= tmppar;
 	}

-	/* Create non-inverted ECC code from line parity */
-	tmp1  = (reg3 & 0x80) >> 0; /* B7 -> B7 */
-	tmp1 |= (reg2 & 0x80) >> 1; /* B7 -> B6 */
-	tmp1 |= (reg3 & 0x40) >> 1; /* B6 -> B5 */
-	tmp1 |= (reg2 & 0x40) >> 2; /* B6 -> B4 */
-	tmp1 |= (reg3 & 0x20) >> 2; /* B5 -> B3 */
-	tmp1 |= (reg2 & 0x20) >> 3; /* B5 -> B2 */
-	tmp1 |= (reg3 & 0x10) >> 3; /* B4 -> B1 */
-	tmp1 |= (reg2 & 0x10) >> 4; /* B4 -> B0 */
-
-	tmp2  = (reg3 & 0x08) << 4; /* B3 -> B7 */
-	tmp2 |= (reg2 & 0x08) << 3; /* B3 -> B6 */
-	tmp2 |= (reg3 & 0x04) << 3; /* B2 -> B5 */
-	tmp2 |= (reg2 & 0x04) << 2; /* B2 -> B4 */
-	tmp2 |= (reg3 & 0x02) << 2; /* B1 -> B3 */
-	tmp2 |= (reg2 & 0x02) << 1; /* B1 -> B2 */
-	tmp2 |= (reg3 & 0x01) << 1; /* B0 -> B1 */
-	tmp2 |= (reg2 & 0x01) << 0; /* B7 -> B0 */
-
-	/* Calculate final ECC code */
+	/*
+	 * handle the fact that we use longword operations
+	 * we'll bring rp4..rp14 back to single byte entities by shifting and
+	 * xoring first fold the upper and lower 16 bits,
+	 * then the upper and lower 8 bits.
+	 */
+	rp4 ^= (rp4 >> 16);
+	rp4 ^= (rp4 >> 8);
+	rp4 &= 0xff;
+	rp6 ^= (rp6 >> 16);
+	rp6 ^= (rp6 >> 8);
+	rp6 &= 0xff;
+	rp8 ^= (rp8 >> 16);
+	rp8 ^= (rp8 >> 8);
+	rp8 &= 0xff;
+	rp10 ^= (rp10 >> 16);
+	rp10 ^= (rp10 >> 8);
+	rp10 &= 0xff;
+	rp12 ^= (rp12 >> 16);
+	rp12 ^= (rp12 >> 8);
+	rp12 &= 0xff;
+	rp14 ^= (rp14 >> 16);
+	rp14 ^= (rp14 >> 8);
+	rp14 &= 0xff;
+
+	/*
+	 * we also need to calculate the row parity for rp0..rp3
+	 * This is present in par, because par is now
+	 * rp3 rp3 rp2 rp2
+	 * as well as
+	 * rp1 rp0 rp1 rp0
+	 * First calculate rp2 and rp3
+	 * (and yes: rp2 = (par ^ rp3) & 0xff; but doing that did not
+	 * give a performance improvement)
+	 */
+	rp3 = (par >> 16);
+	rp3 ^= (rp3 >> 8);
+	rp3 &= 0xff;
+	rp2 = par & 0xffff;
+	rp2 ^= (rp2 >> 8);
+	rp2 &= 0xff;
+
+	/* reduce par to 16 bits then calculate rp1 and rp0 */
+	par ^= (par >> 16);
+	rp1 = (par >> 8) & 0xff;
+	rp0 = (par & 0xff);
+
+	/* finally reduce par to 8 bits */
+	par ^= (par >> 8);
+	par &= 0xff;
+
+	/*
+	 * and calculate rp5..rp15
+	 * note that par = rp4 ^ rp5 and due to the commutative property
+	 * of the ^ operator we can say:
+	 * rp5 = (par ^ rp4);
+	 * The & 0xff seems superfluous, but benchmarking learned that
+	 * leaving it out gives slightly worse results. No idea why, probably
+	 * it has to do with the way the pipeline in pentium is organized.
+	 */
+	rp5 = (par ^ rp4) & 0xff;
+	rp7 = (par ^ rp6) & 0xff;
+	rp9 = (par ^ rp8) & 0xff;
+	rp11 = (par ^ rp10) & 0xff;
+	rp13 = (par ^ rp12) & 0xff;
+	rp15 = (par ^ rp14) & 0xff;
+
+	/*
+	 * Finally calculate the ecc bits.
+	 * Again here it might seem that there are performance optimisations
+	 * possible, but benchmarks showed that on the system this is developed
+	 * the code below is the fastest
+	 */
 #ifdef CONFIG_MTD_NAND_ECC_SMC
-	ecc_code[0] = ~tmp2;
-	ecc_code[1] = ~tmp1;
+	code[0] =
+	    (invparity[rp7] << 7) |
+	    (invparity[rp6] << 6) |
+	    (invparity[rp5] << 5) |
+	    (invparity[rp4] << 4) |
+	    (invparity[rp3] << 3) |
+	    (invparity[rp2] << 2) |
+	    (invparity[rp1] << 1) |
+	    (invparity[rp0]);
+	code[1] =
+	    (invparity[rp15] << 7) |
+	    (invparity[rp14] << 6) |
+	    (invparity[rp13] << 5) |
+	    (invparity[rp12] << 4) |
+	    (invparity[rp11] << 3) |
+	    (invparity[rp10] << 2) |
+	    (invparity[rp9] << 1)  |
+	    (invparity[rp8]);
 #else
-	ecc_code[0] = ~tmp1;
-	ecc_code[1] = ~tmp2;
+	code[1] =
+	    (invparity[rp7] << 7) |
+	    (invparity[rp6] << 6) |
+	    (invparity[rp5] << 5) |
+	    (invparity[rp4] << 4) |
+	    (invparity[rp3] << 3) |
+	    (invparity[rp2] << 2) |
+	    (invparity[rp1] << 1) |
+	    (invparity[rp0]);
+	code[0] =
+	    (invparity[rp15] << 7) |
+	    (invparity[rp14] << 6) |
+	    (invparity[rp13] << 5) |
+	    (invparity[rp12] << 4) |
+	    (invparity[rp11] << 3) |
+	    (invparity[rp10] << 2) |
+	    (invparity[rp9] << 1)  |
+	    (invparity[rp8]);
 #endif
-	ecc_code[2] = ((~reg1) << 2) | 0x03;
-
+	code[2] =
+	    (invparity[par & 0xf0] << 7) |
+	    (invparity[par & 0x0f] << 6) |
+	    (invparity[par & 0xcc] << 5) |
+	    (invparity[par & 0x33] << 4) |
+	    (invparity[par & 0xaa] << 3) |
+	    (invparity[par & 0x55] << 2) |
+	    3;
 	return 0;
 }
 EXPORT_SYMBOL(nand_calculate_ecc);

-static inline int countbits(uint32_t byte)
-{
-	int res = 0;
-
-	for (;byte; byte >>= 1)
-		res += byte & 0x01;
-	return res;
-}
-
 /**
  * nand_correct_data - [NAND Interface] Detect and correct bit error(s)
- * @mtd:	MTD block structure
+ * @mtd:	MTD block structure (unused)
  * @dat:	raw data read from the chip
  * @read_ecc:	ECC from the chip
  * @calc_ecc:	the ECC calculated from raw data
  *
  * Detect and correct a 1 bit error for 256 byte block
  */
-int nand_correct_data(struct mtd_info *mtd, u_char *dat,
-		      u_char *read_ecc, u_char *calc_ecc)
+int nand_correct_data(struct mtd_info *mtd, unsigned char *buf,
+		      unsigned char *read_ecc, unsigned char *calc_ecc)
 {
-	uint8_t s0, s1, s2;
+	int nr_bits;
+	unsigned char b0, b1, b2;
+	unsigned char byte_addr, bit_addr;

+	/*
+	 * b0 to b2 indicate which bit is faulty (if any)
+	 * we might need the xor result  more than once,
+	 * so keep them in a local var
+	*/
 #ifdef CONFIG_MTD_NAND_ECC_SMC
-	s0 = calc_ecc[0] ^ read_ecc[0];
-	s1 = calc_ecc[1] ^ read_ecc[1];
-	s2 = calc_ecc[2] ^ read_ecc[2];
+	b0 = read_ecc[0] ^ calc_ecc[0];
+	b1 = read_ecc[1] ^ calc_ecc[1];
 #else
-	s1 = calc_ecc[0] ^ read_ecc[0];
-	s0 = calc_ecc[1] ^ read_ecc[1];
-	s2 = calc_ecc[2] ^ read_ecc[2];
+	b0 = read_ecc[1] ^ calc_ecc[1];
+	b1 = read_ecc[0] ^ calc_ecc[0];
 #endif
-	if ((s0 | s1 | s2) == 0)
-		return 0;
-
-	/* Check for a single bit error */
-	if( ((s0 ^ (s0 >> 1)) & 0x55) == 0x55 &&
-	    ((s1 ^ (s1 >> 1)) & 0x55) == 0x55 &&
-	    ((s2 ^ (s2 >> 1)) & 0x54) == 0x54) {
-
-		uint32_t byteoffs, bitnum;
+	b2 = read_ecc[2] ^ calc_ecc[2];

-		byteoffs = (s1 << 0) & 0x80;
-		byteoffs |= (s1 << 1) & 0x40;
-		byteoffs |= (s1 << 2) & 0x20;
-		byteoffs |= (s1 << 3) & 0x10;
+	/* check if there are any bitfaults */

-		byteoffs |= (s0 >> 4) & 0x08;
-		byteoffs |= (s0 >> 3) & 0x04;
-		byteoffs |= (s0 >> 2) & 0x02;
-		byteoffs |= (s0 >> 1) & 0x01;
+	/* count nr of bits; use table lookup, faster than calculating it */
+	nr_bits = bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2];

-		bitnum = (s2 >> 5) & 0x04;
-		bitnum |= (s2 >> 4) & 0x02;
-		bitnum |= (s2 >> 3) & 0x01;
-
-		dat[byteoffs] ^= (1 << bitnum);
-
-		return 1;
+	/* repeated if statements are slightly more efficient than switch ... */
+	/* ordered in order of likelihood */
+	if (nr_bits == 0)
+		return (0);	/* no error */
+	if (nr_bits == 11) {	/* correctable error */
+		/*
+		 * rp15/13/11/9/7/5/3/1 indicate which byte is the faulty byte
+		 * cp 5/3/1 indicate the faulty bit.
+		 * A lookup table (called addressbits) is used to filter
+		 * the bits from the byte they are in.
+		 * A marginal optimisation is possible by having three
+		 * different lookup tables.
+		 * One as we have now (for b0), one for b2
+		 * (that would avoid the >> 1), and one for b1 (with all values
+		 * << 4). However it was felt that introducing two more tables
+		 * hardly justify the gain.
+		 *
+		 * The b2 shift is there to get rid of the lowest two bits.
+		 * We could also do addressbits[b2] >> 1 but for the
+		 * performace it does not make any difference
+		 */
+		byte_addr = (addressbits[b1] << 4) + addressbits[b0];
+		bit_addr = addressbits[b2 >> 2];
+		/* flip the bit */
+		buf[byte_addr] ^= (1 << bit_addr);
+		return (1);
 	}
-
-	if(countbits(s0 | ((uint32_t)s1 << 8) | ((uint32_t)s2 <<16)) == 1)
-		return 1;
-
-	return -EBADMSG;
+	if (nr_bits == 1)
+		return (1);	/* error in ecc data; no action needed */
+	return -1;
 }
 EXPORT_SYMBOL(nand_correct_data);

 MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
+MODULE_AUTHOR("Frans Meulenbroeks <fransmeulenbroeks@gmail.com>");
 MODULE_DESCRIPTION("Generic NAND ECC support");
--8323329-1371688547-1218834872=:9220
Content-Type: APPLICATION/x-gtar; name=ecc.tgz
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.0.99.0808152314310.9220@frans-desktop>
Content-Description: 
Content-Disposition: attachment; filename=ecc.tgz

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
AQA=

--8323329-1371688547-1218834872=:9220--
