Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdc-0000PZ-Pm
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:40 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 11/31] crc32.txt: standardize document format
Date: Thu, 18 May 2017 22:22:16 -0300
Message-Id: <db09fac7d5ded217f2b41e8bb86519fdb1b629e1.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Add a title for the document;
- Mark literal blocks.

While here, replace a comma by a dot at the end of a paragraph.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/crc32.txt | 75 +++++++++++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 34 deletions(-)

diff --git a/Documentation/crc32.txt b/Documentation/crc32.txt
index a08a7dd9d625..8a6860f33b4e 100644
--- a/Documentation/crc32.txt
+++ b/Documentation/crc32.txt
@@ -1,4 +1,6 @@
-A brief CRC tutorial.
+=================================
+brief tutorial on CRC computation
+=================================
 
 A CRC is a long-division remainder.  You add the CRC to the message,
 and the whole thing (message+CRC) is a multiple of the given
@@ -8,7 +10,8 @@ remainder computed on the message+CRC is 0.  This latter approach
 is used by a lot of hardware implementations, and is why so many
 protocols put the end-of-frame flag after the CRC.
 
-It's actually the same long division you learned in school, except that
+It's actually the same long division you learned in school, except that:
+
 - We're working in binary, so the digits are only 0 and 1, and
 - When dividing polynomials, there are no carries.  Rather than add and
   subtract, we just xor.  Thus, we tend to get a bit sloppy about
@@ -40,11 +43,12 @@ throw the quotient bit away, but subtract the appropriate multiple of
 the polynomial from the remainder and we're back to where we started,
 ready to process the next bit.
 
-A big-endian CRC written this way would be coded like:
-for (i = 0; i < input_bits; i++) {
-	multiple = remainder & 0x80000000 ? CRCPOLY : 0;
-	remainder = (remainder << 1 | next_input_bit()) ^ multiple;
-}
+A big-endian CRC written this way would be coded like::
+
+	for (i = 0; i < input_bits; i++) {
+		multiple = remainder & 0x80000000 ? CRCPOLY : 0;
+		remainder = (remainder << 1 | next_input_bit()) ^ multiple;
+	}
 
 Notice how, to get at bit 32 of the shifted remainder, we look
 at bit 31 of the remainder *before* shifting it.
@@ -54,25 +58,26 @@ the remainder don't actually affect any decision-making until
 32 bits later.  Thus, the first 32 cycles of this are pretty boring.
 Also, to add the CRC to a message, we need a 32-bit-long hole for it at
 the end, so we have to add 32 extra cycles shifting in zeros at the
-end of every message,
+end of every message.
 
 These details lead to a standard trick: rearrange merging in the
 next_input_bit() until the moment it's needed.  Then the first 32 cycles
 can be precomputed, and merging in the final 32 zero bits to make room
-for the CRC can be skipped entirely.  This changes the code to:
+for the CRC can be skipped entirely.  This changes the code to::
 
-for (i = 0; i < input_bits; i++) {
-	remainder ^= next_input_bit() << 31;
-	multiple = (remainder & 0x80000000) ? CRCPOLY : 0;
-	remainder = (remainder << 1) ^ multiple;
-}
+	for (i = 0; i < input_bits; i++) {
+		remainder ^= next_input_bit() << 31;
+		multiple = (remainder & 0x80000000) ? CRCPOLY : 0;
+		remainder = (remainder << 1) ^ multiple;
+	}
 
-With this optimization, the little-endian code is particularly simple:
-for (i = 0; i < input_bits; i++) {
-	remainder ^= next_input_bit();
-	multiple = (remainder & 1) ? CRCPOLY : 0;
-	remainder = (remainder >> 1) ^ multiple;
-}
+With this optimization, the little-endian code is particularly simple::
+
+	for (i = 0; i < input_bits; i++) {
+		remainder ^= next_input_bit();
+		multiple = (remainder & 1) ? CRCPOLY : 0;
+		remainder = (remainder >> 1) ^ multiple;
+	}
 
 The most significant coefficient of the remainder polynomial is stored
 in the least significant bit of the binary "remainder" variable.
@@ -81,23 +86,25 @@ be bit-reversed) and next_input_bit().
 
 As long as next_input_bit is returning the bits in a sensible order, we don't
 *have* to wait until the last possible moment to merge in additional bits.
-We can do it 8 bits at a time rather than 1 bit at a time:
-for (i = 0; i < input_bytes; i++) {
-	remainder ^= next_input_byte() << 24;
-	for (j = 0; j < 8; j++) {
-		multiple = (remainder & 0x80000000) ? CRCPOLY : 0;
-		remainder = (remainder << 1) ^ multiple;
+We can do it 8 bits at a time rather than 1 bit at a time::
+
+	for (i = 0; i < input_bytes; i++) {
+		remainder ^= next_input_byte() << 24;
+		for (j = 0; j < 8; j++) {
+			multiple = (remainder & 0x80000000) ? CRCPOLY : 0;
+			remainder = (remainder << 1) ^ multiple;
+		}
 	}
-}
 
-Or in little-endian:
-for (i = 0; i < input_bytes; i++) {
-	remainder ^= next_input_byte();
-	for (j = 0; j < 8; j++) {
-		multiple = (remainder & 1) ? CRCPOLY : 0;
-		remainder = (remainder >> 1) ^ multiple;
+Or in little-endian::
+
+	for (i = 0; i < input_bytes; i++) {
+		remainder ^= next_input_byte();
+		for (j = 0; j < 8; j++) {
+			multiple = (remainder & 1) ? CRCPOLY : 0;
+			remainder = (remainder >> 1) ^ multiple;
+		}
 	}
-}
 
 If the input is a multiple of 32 bits, you can even XOR in a 32-bit
 word at a time and increase the inner loop count to 32.
-- 
2.9.4
