Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdc-0000Ou-Qe
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:37 +0000
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
Subject: [PATCH 16/31] DMA-attributes.txt: standardize document format
Date: Thu, 18 May 2017 22:22:21 -0300
Message-Id: <adce8bc30c80646981f8fe4ae01d2eb188c1a22b.1495156488.git.mchehab@s-opensource.com>
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

This file is almost on the standard format. All it needs
to be parsed by Sphinx is to fix its main title and add
a few blank lines.

Yet, it is worth to replace NOTE: by the corresponding
ReST markup.

While here, remove the extra "---" from a subtitle.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/DMA-attributes.txt | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/DMA-attributes.txt b/Documentation/DMA-attributes.txt
index 44c6bc496eee..8f8d97f65d73 100644
--- a/Documentation/DMA-attributes.txt
+++ b/Documentation/DMA-attributes.txt
@@ -1,5 +1,6 @@
-			DMA attributes
-			==============
+==============
+DMA attributes
+==============
 
 This document describes the semantics of the DMA attributes that are
 defined in linux/dma-mapping.h.
@@ -108,6 +109,7 @@ This is a hint to the DMA-mapping subsystem that it's probably not worth
 the time to try to allocate memory to in a way that gives better TLB
 efficiency (AKA it's not worth trying to build the mapping out of larger
 pages).  You might want to specify this if:
+
 - You know that the accesses to this memory won't thrash the TLB.
   You might know that the accesses are likely to be sequential or
   that they aren't sequential but it's unlikely you'll ping-pong
@@ -121,11 +123,12 @@ pages).  You might want to specify this if:
   the mapping to have a short lifetime then it may be worth it to
   optimize allocation (avoid coming up with large pages) instead of
   getting the slight performance win of larger pages.
+
 Setting this hint doesn't guarantee that you won't get huge pages, but it
 means that we won't try quite as hard to get them.
 
-NOTE: At the moment DMA_ATTR_ALLOC_SINGLE_PAGES is only implemented on ARM,
-though ARM64 patches will likely be posted soon.
+.. note:: At the moment DMA_ATTR_ALLOC_SINGLE_PAGES is only implemented on ARM,
+	  though ARM64 patches will likely be posted soon.
 
 DMA_ATTR_NO_WARN
 ----------------
@@ -142,10 +145,10 @@ problem at all, depending on the implementation of the retry mechanism.
 So, this provides a way for drivers to avoid those error messages on calls
 where allocation failures are not a problem, and shouldn't bother the logs.
 
-NOTE: At the moment DMA_ATTR_NO_WARN is only implemented on PowerPC.
+.. note:: At the moment DMA_ATTR_NO_WARN is only implemented on PowerPC.
 
 DMA_ATTR_PRIVILEGED
-------------------------------
+-------------------
 
 Some advanced peripherals such as remote processors and GPUs perform
 accesses to DMA buffers in both privileged "supervisor" and unprivileged
-- 
2.9.4
