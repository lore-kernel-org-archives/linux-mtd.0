Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdc-0000PY-Q0
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:44 +0000
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
Subject: [PATCH 21/31] flexible-arrays.txt: standardize document format
Date: Thu, 18 May 2017 22:22:26 -0300
Message-Id: <75d1829cdf946a5dd9618491d8ac39310c81aae0.1495156488.git.mchehab@s-opensource.com>
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

- use :Author: and :Updated: markups;
- use proper markup for the document title;
- mark the literal-blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/flexible-arrays.txt | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/flexible-arrays.txt b/Documentation/flexible-arrays.txt
index df904aec9904..45aec4d354f7 100644
--- a/Documentation/flexible-arrays.txt
+++ b/Documentation/flexible-arrays.txt
@@ -1,6 +1,8 @@
 Using flexible arrays in the kernel
-Last updated for 2.6.32
-Jonathan Corbet <corbet@lwn.net>
+===================================
+
+:Updated: Last updated for 2.6.32
+:Author: Jonathan Corbet <corbet@lwn.net>
 
 Large contiguous memory allocations can be unreliable in the Linux kernel.
 Kernel programmers will sometimes respond to this problem by allocating
@@ -26,7 +28,7 @@ operation.  It's also worth noting that flexible arrays do no internal
 locking at all; if concurrent access to an array is possible, then the
 caller must arrange for appropriate mutual exclusion.
 
-The creation of a flexible array is done with:
+The creation of a flexible array is done with::
 
     #include <linux/flex_array.h>
 
@@ -40,14 +42,14 @@ argument is passed directly to the internal memory allocation calls.  With
 the current code, using flags to ask for high memory is likely to lead to
 notably unpleasant side effects.
 
-It is also possible to define flexible arrays at compile time with:
+It is also possible to define flexible arrays at compile time with::
 
     DEFINE_FLEX_ARRAY(name, element_size, total);
 
 This macro will result in a definition of an array with the given name; the
 element size and total will be checked for validity at compile time.
 
-Storing data into a flexible array is accomplished with a call to:
+Storing data into a flexible array is accomplished with a call to::
 
     int flex_array_put(struct flex_array *array, unsigned int element_nr,
     		       void *src, gfp_t flags);
@@ -63,7 +65,7 @@ running in some sort of atomic context; in this situation, sleeping in the
 memory allocator would be a bad thing.  That can be avoided by using
 GFP_ATOMIC for the flags value, but, often, there is a better way.  The
 trick is to ensure that any needed memory allocations are done before
-entering atomic context, using:
+entering atomic context, using::
 
     int flex_array_prealloc(struct flex_array *array, unsigned int start,
 			    unsigned int nr_elements, gfp_t flags);
@@ -73,7 +75,7 @@ defined by start and nr_elements has been allocated.  Thereafter, a
 flex_array_put() call on an element in that range is guaranteed not to
 block.
 
-Getting data back out of the array is done with:
+Getting data back out of the array is done with::
 
     void *flex_array_get(struct flex_array *fa, unsigned int element_nr);
 
@@ -89,7 +91,7 @@ involving that number probably result from use of unstored array entries.
 Note that, if array elements are allocated with __GFP_ZERO, they will be
 initialized to zero and this poisoning will not happen.
 
-Individual elements in the array can be cleared with:
+Individual elements in the array can be cleared with::
 
     int flex_array_clear(struct flex_array *array, unsigned int element_nr);
 
@@ -97,7 +99,7 @@ This function will set the given element to FLEX_ARRAY_FREE and return
 zero.  If storage for the indicated element is not allocated for the array,
 flex_array_clear() will return -EINVAL instead.  Note that clearing an
 element does not release the storage associated with it; to reduce the
-allocated size of an array, call:
+allocated size of an array, call::
 
     int flex_array_shrink(struct flex_array *array);
 
@@ -106,12 +108,12 @@ This function works by scanning the array for pages containing nothing but
 FLEX_ARRAY_FREE bytes, so (1) it can be expensive, and (2) it will not work
 if the array's pages are allocated with __GFP_ZERO.
 
-It is possible to remove all elements of an array with a call to:
+It is possible to remove all elements of an array with a call to::
 
     void flex_array_free_parts(struct flex_array *array);
 
 This call frees all elements, but leaves the array itself in place.
-Freeing the entire array is done with:
+Freeing the entire array is done with::
 
     void flex_array_free(struct flex_array *array);
 
-- 
2.9.4
