Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrrDg-0004pE-5Y
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 17:42:37 +0000
Received: by pasz6 with SMTP id z6so46826383pas.2
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2015 10:42:15 -0700 (PDT)
Date: Fri, 30 Oct 2015 00:36:33 +0800
From: Wang YanQing <udknight@gmail.com>
To: dwmw2@infradead.org
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 fransmeulenbroeks@gmail.com, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: mtd: improve nand_ecc.txt for readability and
 correctness
Message-ID: <20151029163632.GA2175@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch correct some representation errors, add a little
clarification in some places, and fix indentation problems
for pseudo code.

It also delete one more white space for one place.

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 Documentation/mtd/nand_ecc.txt | 56 +++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/Documentation/mtd/nand_ecc.txt b/Documentation/mtd/nand_ecc.txt
index e129b24..ccb1f26 100644
--- a/Documentation/mtd/nand_ecc.txt
+++ b/Documentation/mtd/nand_ecc.txt
@@ -107,7 +107,7 @@ for (i = 0; i < 256; i++)
     if (i & 0x01)
        rp1 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp1;
     else
-       rp0 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp1;
+       rp0 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp0;
     if (i & 0x02)
        rp3 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp3;
     else
@@ -127,7 +127,7 @@ for (i = 0; i < 256; i++)
     if (i & 0x20)
       rp11 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp11;
     else
-    rp10 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp10;
+      rp10 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp10;
     if (i & 0x40)
       rp13 = bit7 ^ bit6 ^ bit5 ^ bit4 ^ bit3 ^ bit2 ^ bit1 ^ bit0 ^ rp13;
     else
@@ -158,7 +158,7 @@ the values in any order. So instead of calculating all the bits
 individually, let us try to rearrange things.
 For the column parity this is easy. We can just xor the bytes and in the
 end filter out the relevant bits. This is pretty nice as it will bring
-all cp calculation out of the if loop.
+all cp calculation out of the for loop.
 
 Similarly we can first xor the bytes for the various rows.
 This leads to:
@@ -271,11 +271,11 @@ to write our code in such a way that we process data in 32 bit chunks.
 Of course this means some modification as the row parity is byte by
 byte. A quick analysis:
 for the column parity we use the par variable. When extending to 32 bits
-we can in the end easily calculate p0 and p1 from it.
+we can in the end easily calculate rp0 and rp1 from it.
 (because par now consists of 4 bytes, contributing to rp1, rp0, rp1, rp0
-respectively)
+respectively, from MSB to LSB in little endian mode)
 also rp2 and rp3 can be easily retrieved from par as rp3 covers the
-first two bytes and rp2 the last two bytes.
+first two MSBs and rp2 covers the last two LSBs in little endian mode.
 
 Note that of course now the loop is executed only 64 times (256/4).
 And note that care must taken wrt byte ordering. The way bytes are
@@ -391,7 +391,7 @@ THere is more to be gained.
 If we look at e.g. rp14 and rp15 we see that we either xor our data with
 rp14 or with rp15. However we also have par which goes over all data.
 This means there is no need to calculate rp14 as it can be calculated from
-rp15 through rp14 = par ^ rp15;
+rp15 through rp14 = par ^ rp15, because par = rp14 ^ rp15;
 (or if desired we can avoid calculating rp15 and calculate it from
 rp14).  That is why some places refer to inverse parity.
 Of course the same thing holds for rp4/5, rp6/7, rp8/9, rp10/11 and rp12/13.
@@ -419,12 +419,12 @@ with
         if (i & 0x20) rp15 ^= cur;
 
         and outside the loop added:
-    rp4  = par ^ rp5;
-    rp6  = par ^ rp7;
-    rp8  = par ^ rp9;
-    rp10  = par ^ rp11;
-    rp12  = par ^ rp13;
-    rp14  = par ^ rp15;
+        rp4  = par ^ rp5;
+        rp6  = par ^ rp7;
+        rp8  = par ^ rp9;
+        rp10  = par ^ rp11;
+        rp12  = par ^ rp13;
+        rp14  = par ^ rp15;
 
 And after that the code takes about 30% more time, although the number of
 statements is reduced. This is also reflected in the assembly code.
@@ -524,12 +524,12 @@ THe code within the for loop was changed to:
 
         cur = *bp++; tmppar ^= cur; rp4 ^= cur; rp6 ^= cur;
         cur = *bp++; tmppar ^= cur; rp6 ^= cur;
-	    cur = *bp++; tmppar ^= cur; rp4 ^= cur;
-	    cur = *bp++; tmppar ^= cur; rp10 ^= tmppar;
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp10 ^= tmppar;
 
-	    cur = *bp++; tmppar ^= cur; rp4 ^= cur; rp6 ^= cur; rp8 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur; rp6 ^= cur; rp8 ^= cur;
         cur = *bp++; tmppar ^= cur; rp6 ^= cur; rp8 ^= cur;
-	    cur = *bp++; tmppar ^= cur; rp4 ^= cur; rp8 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur; rp8 ^= cur;
         cur = *bp++; tmppar ^= cur; rp8 ^= cur;
 
         cur = *bp++; tmppar ^= cur; rp4 ^= cur; rp6 ^= cur;
@@ -537,7 +537,7 @@ THe code within the for loop was changed to:
         cur = *bp++; tmppar ^= cur; rp4 ^= cur;
         cur = *bp++; tmppar ^= cur;
 
-	    par ^= tmppar;
+        par ^= tmppar;
         if ((i & 0x1) == 0) rp12 ^= tmppar;
         if ((i & 0x2) == 0) rp14 ^= tmppar;
     }
@@ -548,8 +548,8 @@ to rp12 and rp14.
 
 While making the changes I also found that I could exploit that tmppar
 contains the running parity for this iteration. So instead of having:
-rp4 ^= cur; rp6 = cur;
-I removed the rp6 = cur; statement and did rp6 ^= tmppar; on next
+rp4 ^= cur; rp6 ^= cur;
+I removed the rp6 ^= cur; statement and did rp6 ^= tmppar; on next
 statement. A similar change was done for rp8 and rp10
 
 
@@ -593,22 +593,22 @@ The new code now looks like:
 
         cur = *bp++; tmppar ^= cur; rp4_6 ^= cur;
         cur = *bp++; tmppar ^= cur; rp6 ^= cur;
-	    cur = *bp++; tmppar ^= cur; rp4 ^= cur;
-	    cur = *bp++; tmppar ^= cur; rp10 ^= tmppar;
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp10 ^= tmppar;
 
-	    notrp8 = tmppar;
-	    cur = *bp++; tmppar ^= cur; rp4_6 ^= cur;
+        notrp8 = tmppar;
+        cur = *bp++; tmppar ^= cur; rp4_6 ^= cur;
         cur = *bp++; tmppar ^= cur; rp6 ^= cur;
-	    cur = *bp++; tmppar ^= cur; rp4 ^= cur;
+        cur = *bp++; tmppar ^= cur; rp4 ^= cur;
         cur = *bp++; tmppar ^= cur;
-	    rp8 = rp8 ^ tmppar ^ notrp8;
+        rp8 = rp8 ^ tmppar ^ notrp8;
 
         cur = *bp++; tmppar ^= cur; rp4_6 ^= cur;
         cur = *bp++; tmppar ^= cur; rp6 ^= cur;
         cur = *bp++; tmppar ^= cur; rp4 ^= cur;
         cur = *bp++; tmppar ^= cur;
 
-	    par ^= tmppar;
+        par ^= tmppar;
         if ((i & 0x1) == 0) rp12 ^= tmppar;
         if ((i & 0x2) == 0) rp14 ^= tmppar;
     }
@@ -700,7 +700,7 @@ Conclusion
 The gain when calculating the ecc is tremendous. Om my development hardware
 a speedup of a factor of 18 for ecc calculation was achieved. On a test on an
 embedded system with a MIPS core a factor 7 was obtained.
-On  a test with a Linksys NSLU2 (ARMv5TE processor) the speedup was a factor
+On a test with a Linksys NSLU2 (ARMv5TE processor) the speedup was a factor
 5 (big endian mode, gcc 4.1.2, -O3)
 For correction not much gain could be obtained (as bitflips are rare). Then
 again there are also much less cycles spent there.
-- 
1.8.5.6.2.g3d8a54e.dirty
