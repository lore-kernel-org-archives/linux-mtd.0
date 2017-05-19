Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdG-0000LK-BI
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:10 +0000
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
Subject: [PATCH 07/31] circular-buffers.txt: standardize document format
Date: Thu, 18 May 2017 22:22:12 -0300
Message-Id: <eeefe78d3c424db72b3180ad7e2788813e397f48.1495156488.git.mchehab@s-opensource.com>
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

- Mark titles with ReST notation;
- comment the contents table;
- Use :Author: tag for authorship;
- mark literal blocks as such;
- use valid numbered list markups;
- Don't capitalize titles.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/circular-buffers.txt | 51 +++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/Documentation/circular-buffers.txt b/Documentation/circular-buffers.txt
index 4a824d232472..d4628174b7c5 100644
--- a/Documentation/circular-buffers.txt
+++ b/Documentation/circular-buffers.txt
@@ -1,9 +1,9 @@
-			       ================
-			       CIRCULAR BUFFERS
-			       ================
+================
+Circular Buffers
+================
 
-By: David Howells <dhowells@redhat.com>
-    Paul E. McKenney <paulmck@linux.vnet.ibm.com>
+:Author: David Howells <dhowells@redhat.com>
+:Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
 
 
 Linux provides a number of features that can be used to implement circular
@@ -20,7 +20,7 @@ producer and just one consumer.  It is possible to handle multiple producers by
 serialising them, and to handle multiple consumers by serialising them.
 
 
-Contents:
+.. Contents:
 
  (*) What is a circular buffer?
 
@@ -31,8 +31,8 @@ Contents:
      - The consumer.
 
 
-==========================
-WHAT IS A CIRCULAR BUFFER?
+
+What is a circular buffer?
 ==========================
 
 First of all, what is a circular buffer?  A circular buffer is a buffer of
@@ -60,9 +60,7 @@ buffer, provided that neither index overtakes the other.  The implementer must
 be careful, however, as a region more than one unit in size may wrap the end of
 the buffer and be broken into two segments.
 
-
-============================
-MEASURING POWER-OF-2 BUFFERS
+Measuring power-of-2 buffers
 ============================
 
 Calculation of the occupancy or the remaining capacity of an arbitrarily sized
@@ -71,13 +69,13 @@ modulus (divide) instruction.  However, if the buffer is of a power-of-2 size,
 then a much quicker bitwise-AND instruction can be used instead.
 
 Linux provides a set of macros for handling power-of-2 circular buffers.  These
-can be made use of by:
+can be made use of by::
 
 	#include <linux/circ_buf.h>
 
 The macros are:
 
- (*) Measure the remaining capacity of a buffer:
+ (#) Measure the remaining capacity of a buffer::
 
 	CIRC_SPACE(head_index, tail_index, buffer_size);
 
@@ -85,7 +83,7 @@ The macros are:
      can be inserted.
 
 
- (*) Measure the maximum consecutive immediate space in a buffer:
+ (#) Measure the maximum consecutive immediate space in a buffer::
 
 	CIRC_SPACE_TO_END(head_index, tail_index, buffer_size);
 
@@ -94,14 +92,14 @@ The macros are:
      beginning of the buffer.
 
 
- (*) Measure the occupancy of a buffer:
+ (#) Measure the occupancy of a buffer::
 
 	CIRC_CNT(head_index, tail_index, buffer_size);
 
      This returns the number of items currently occupying a buffer[2].
 
 
- (*) Measure the non-wrapping occupancy of a buffer:
+ (#) Measure the non-wrapping occupancy of a buffer::
 
 	CIRC_CNT_TO_END(head_index, tail_index, buffer_size);
 
@@ -112,7 +110,7 @@ The macros are:
 Each of these macros will nominally return a value between 0 and buffer_size-1,
 however:
 
- [1] CIRC_SPACE*() are intended to be used in the producer.  To the producer
+ (1) CIRC_SPACE*() are intended to be used in the producer.  To the producer
      they will return a lower bound as the producer controls the head index,
      but the consumer may still be depleting the buffer on another CPU and
      moving the tail index.
@@ -120,7 +118,7 @@ however:
      To the consumer it will show an upper bound as the producer may be busy
      depleting the space.
 
- [2] CIRC_CNT*() are intended to be used in the consumer.  To the consumer they
+ (2) CIRC_CNT*() are intended to be used in the consumer.  To the consumer they
      will return a lower bound as the consumer controls the tail index, but the
      producer may still be filling the buffer on another CPU and moving the
      head index.
@@ -128,14 +126,12 @@ however:
      To the producer it will show an upper bound as the consumer may be busy
      emptying the buffer.
 
- [3] To a third party, the order in which the writes to the indices by the
+ (3) To a third party, the order in which the writes to the indices by the
      producer and consumer become visible cannot be guaranteed as they are
      independent and may be made on different CPUs - so the result in such a
      situation will merely be a guess, and may even be negative.
 
-
-===========================================
-USING MEMORY BARRIERS WITH CIRCULAR BUFFERS
+Using memory barriers with circular buffers
 ===========================================
 
 By using memory barriers in conjunction with circular buffers, you can avoid
@@ -152,10 +148,10 @@ time, and only one thing should be emptying a buffer at any one time, but the
 two sides can operate simultaneously.
 
 
-THE PRODUCER
+The producer
 ------------
 
-The producer will look something like this:
+The producer will look something like this::
 
 	spin_lock(&producer_lock);
 
@@ -193,10 +189,10 @@ ordering between the read of the index indicating that the consumer has
 vacated a given element and the write by the producer to that same element.
 
 
-THE CONSUMER
+The Consumer
 ------------
 
-The consumer will look something like this:
+The consumer will look something like this::
 
 	spin_lock(&consumer_lock);
 
@@ -235,8 +231,7 @@ prevents the compiler from tearing the store, and enforces ordering
 against previous accesses.
 
 
-===============
-FURTHER READING
+Further reading
 ===============
 
 See also Documentation/memory-barriers.txt for a description of Linux's memory
-- 
2.9.4
