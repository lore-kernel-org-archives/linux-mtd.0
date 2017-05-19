Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWlR-0002CY-4t
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:32:00 +0000
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
Subject: [PATCH 16/30] lzo.txt: standardize document format
Date: Thu, 18 May 2017 22:24:08 -0300
Message-Id: <09f3c0db7ba32f5523cb0fb0a44becc35c7d53ae.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
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

- Add markups for section titles;
- mark literal blocks;
- use ".. important::" for an important note.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/lzo.txt | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/Documentation/lzo.txt b/Documentation/lzo.txt
index 285c54f66779..6fa6a93d0949 100644
--- a/Documentation/lzo.txt
+++ b/Documentation/lzo.txt
@@ -1,8 +1,9 @@
-
+===========================================================
 LZO stream format as understood by Linux's LZO decompressor
 ===========================================================
 
 Introduction
+============
 
   This is not a specification. No specification seems to be publicly available
   for the LZO stream format. This document describes what input format the LZO
@@ -14,12 +15,13 @@ Introduction
   for future bug reports.
 
 Description
+===========
 
   The stream is composed of a series of instructions, operands, and data. The
   instructions consist in a few bits representing an opcode, and bits forming
   the operands for the instruction, whose size and position depend on the
   opcode and on the number of literals copied by previous instruction. The
-  operands are used to indicate :
+  operands are used to indicate:
 
     - a distance when copying data from the dictionary (past output buffer)
     - a length (number of bytes to copy from dictionary)
@@ -38,7 +40,7 @@ Description
   of bits in the operand. If the number of bits isn't enough to represent the
   length, up to 255 may be added in increments by consuming more bytes with a
   rate of at most 255 per extra byte (thus the compression ratio cannot exceed
-  around 255:1). The variable length encoding using #bits is always the same :
+  around 255:1). The variable length encoding using #bits is always the same::
 
        length = byte & ((1 << #bits) - 1)
        if (!length) {
@@ -67,15 +69,19 @@ Description
   instruction may encode this distance (0001HLLL), it takes one LE16 operand
   for the distance, thus requiring 3 bytes.
 
-  IMPORTANT NOTE : in the code some length checks are missing because certain
-  instructions are called under the assumption that a certain number of bytes
-  follow because it has already been guaranteed before parsing the instructions.
-  They just have to "refill" this credit if they consume extra bytes. This is
-  an implementation design choice independent on the algorithm or encoding.
+  .. important::
+
+     In the code some length checks are missing because certain instructions
+     are called under the assumption that a certain number of bytes follow
+     because it has already been guaranteed before parsing the instructions.
+     They just have to "refill" this credit if they consume extra bytes. This
+     is an implementation design choice independent on the algorithm or
+     encoding.
 
 Byte sequences
+==============
 
-  First byte encoding :
+  First byte encoding::
 
       0..17   : follow regular instruction encoding, see below. It is worth
                 noting that codes 16 and 17 will represent a block copy from
@@ -91,7 +97,7 @@ Byte sequences
                 state = 4 [ don't copy extra literals ]
                 skip byte
 
-  Instruction encoding :
+  Instruction encoding::
 
       0 0 0 0 X X X X  (0..15)
         Depends on the number of literals copied by the last instruction.
@@ -156,6 +162,7 @@ Byte sequences
            distance = (H << 3) + D + 1
 
 Authors
+=======
 
   This document was written by Willy Tarreau <w@1wt.eu> on 2014/07/19 during an
   analysis of the decompression code available in Linux 3.16-rc5. The code is
-- 
2.9.4
