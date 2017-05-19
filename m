Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWh6-0005ss-68
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:27:06 +0000
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
Subject: [PATCH 22/29] unaligned-memory-access.txt: standardize document format
Date: Thu, 18 May 2017 22:26:06 -0300
Message-Id: <3d289e72adf12916d5934ff14490593108ca3925.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
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
- promote document title one level;
- use markups for authorship and put it at the beginning;
- mark literal blocks;
- adjust identation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/unaligned-memory-access.txt | 57 ++++++++++++++++---------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/Documentation/unaligned-memory-access.txt b/Documentation/unaligned-memory-access.txt
index 3f76c0c37920..51b4ff031586 100644
--- a/Documentation/unaligned-memory-access.txt
+++ b/Documentation/unaligned-memory-access.txt
@@ -1,6 +1,15 @@
+=========================
 UNALIGNED MEMORY ACCESSES
 =========================
 
+:Author: Daniel Drake <dsd@gentoo.org>,
+:Author: Johannes Berg <johannes@sipsolutions.net>
+
+:With help from: Alan Cox, Avuton Olrich, Heikki Orsila, Jan Engelhardt,
+  Kyle McMartin, Kyle Moffett, Randy Dunlap, Robert Hancock, Uli Kunitz,
+  Vadim Lobanov
+
+
 Linux runs on a wide variety of architectures which have varying behaviour
 when it comes to memory access. This document presents some details about
 unaligned accesses, why you need to write code that doesn't cause them,
@@ -73,7 +82,7 @@ memory addresses of certain variables, etc.
 
 Fortunately things are not too complex, as in most cases, the compiler
 ensures that things will work for you. For example, take the following
-structure:
+structure::
 
 	struct foo {
 		u16 field1;
@@ -106,7 +115,7 @@ On a related topic, with the above considerations in mind you may observe
 that you could reorder the fields in the structure in order to place fields
 where padding would otherwise be inserted, and hence reduce the overall
 resident memory size of structure instances. The optimal layout of the
-above example is:
+above example is::
 
 	struct foo {
 		u32 field2;
@@ -139,21 +148,21 @@ Code that causes unaligned access
 With the above in mind, let's move onto a real life example of a function
 that can cause an unaligned memory access. The following function taken
 from include/linux/etherdevice.h is an optimized routine to compare two
-ethernet MAC addresses for equality.
+ethernet MAC addresses for equality::
 
-bool ether_addr_equal(const u8 *addr1, const u8 *addr2)
-{
-#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+  bool ether_addr_equal(const u8 *addr1, const u8 *addr2)
+  {
+  #ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 	u32 fold = ((*(const u32 *)addr1) ^ (*(const u32 *)addr2)) |
 		   ((*(const u16 *)(addr1 + 4)) ^ (*(const u16 *)(addr2 + 4)));
 
 	return fold == 0;
-#else
+  #else
 	const u16 *a = (const u16 *)addr1;
 	const u16 *b = (const u16 *)addr2;
 	return ((a[0] ^ b[0]) | (a[1] ^ b[1]) | (a[2] ^ b[2])) == 0;
-#endif
-}
+  #endif
+  }
 
 In the above function, when the hardware has efficient unaligned access
 capability, there is no issue with this code.  But when the hardware isn't
@@ -171,7 +180,8 @@ as it is a decent optimization for the cases when you can ensure alignment,
 which is true almost all of the time in ethernet networking context.
 
 
-Here is another example of some code that could cause unaligned accesses:
+Here is another example of some code that could cause unaligned accesses::
+
 	void myfunc(u8 *data, u32 value)
 	{
 		[...]
@@ -184,6 +194,7 @@ to an address that is not evenly divisible by 4.
 
 In summary, the 2 main scenarios where you may run into unaligned access
 problems involve:
+
  1. Casting variables to types of different lengths
  2. Pointer arithmetic followed by access to at least 2 bytes of data
 
@@ -195,7 +206,7 @@ The easiest way to avoid unaligned access is to use the get_unaligned() and
 put_unaligned() macros provided by the <asm/unaligned.h> header file.
 
 Going back to an earlier example of code that potentially causes unaligned
-access:
+access::
 
 	void myfunc(u8 *data, u32 value)
 	{
@@ -204,7 +215,7 @@ access:
 		[...]
 	}
 
-To avoid the unaligned memory access, you would rewrite it as follows:
+To avoid the unaligned memory access, you would rewrite it as follows::
 
 	void myfunc(u8 *data, u32 value)
 	{
@@ -215,7 +226,7 @@ To avoid the unaligned memory access, you would rewrite it as follows:
 	}
 
 The get_unaligned() macro works similarly. Assuming 'data' is a pointer to
-memory and you wish to avoid unaligned access, its usage is as follows:
+memory and you wish to avoid unaligned access, its usage is as follows::
 
 	u32 value = get_unaligned((u32 *) data);
 
@@ -245,18 +256,10 @@ For some ethernet hardware that cannot DMA to unaligned addresses like
 4*n+2 or non-ethernet hardware, this can be a problem, and it is then
 required to copy the incoming frame into an aligned buffer. Because this is
 unnecessary on architectures that can do unaligned accesses, the code can be
-made dependent on CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS like so:
-
-#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
-	skb = original skb
-#else
-	skb = copy skb
-#endif
-
---
-Authors: Daniel Drake <dsd@gentoo.org>,
-         Johannes Berg <johannes@sipsolutions.net>
-With help from: Alan Cox, Avuton Olrich, Heikki Orsila, Jan Engelhardt,
-Kyle McMartin, Kyle Moffett, Randy Dunlap, Robert Hancock, Uli Kunitz,
-Vadim Lobanov
+made dependent on CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS like so::
 
+	#ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
+		skb = original skb
+	#else
+		skb = copy skb
+	#endif
-- 
2.9.4
