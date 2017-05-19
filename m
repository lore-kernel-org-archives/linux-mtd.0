Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdt-0000Ov-M8
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:10 +0000
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
Subject: [PATCH 29/31] io-mapping.txt: standardize document format
Date: Thu, 18 May 2017 22:22:34 -0300
Message-Id: <6d06bddd1574ff5e0e860f4b09cffb11ff3d11e4.1495156488.git.mchehab@s-opensource.com>
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

- Add a title for the document and for API chapter;
- mark literal blocks;
- Adjust whitespacing.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/io-mapping.txt | 67 +++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 26 deletions(-)

diff --git a/Documentation/io-mapping.txt b/Documentation/io-mapping.txt
index 5ca78426f54c..a966239f04e4 100644
--- a/Documentation/io-mapping.txt
+++ b/Documentation/io-mapping.txt
@@ -1,66 +1,81 @@
+========================
+The io_mapping functions
+========================
+
+API
+===
+
 The io_mapping functions in linux/io-mapping.h provide an abstraction for
 efficiently mapping small regions of an I/O device to the CPU. The initial
 usage is to support the large graphics aperture on 32-bit processors where
 ioremap_wc cannot be used to statically map the entire aperture to the CPU
 as it would consume too much of the kernel address space.
 
-A mapping object is created during driver initialization using
+A mapping object is created during driver initialization using::
 
 	struct io_mapping *io_mapping_create_wc(unsigned long base,
 						unsigned long size)
 
-		'base' is the bus address of the region to be made
-		mappable, while 'size' indicates how large a mapping region to
-		enable. Both are in bytes.
+'base' is the bus address of the region to be made
+mappable, while 'size' indicates how large a mapping region to
+enable. Both are in bytes.
 
-		This _wc variant provides a mapping which may only be used
-		with the io_mapping_map_atomic_wc or io_mapping_map_wc.
+This _wc variant provides a mapping which may only be used
+with the io_mapping_map_atomic_wc or io_mapping_map_wc.
 
 With this mapping object, individual pages can be mapped either atomically
 or not, depending on the necessary scheduling environment. Of course, atomic
-maps are more efficient:
+maps are more efficient::
 
 	void *io_mapping_map_atomic_wc(struct io_mapping *mapping,
 				       unsigned long offset)
 
-		'offset' is the offset within the defined mapping region.
-		Accessing addresses beyond the region specified in the
-		creation function yields undefined results. Using an offset
-		which is not page aligned yields an undefined result. The
-		return value points to a single page in CPU address space.
+'offset' is the offset within the defined mapping region.
+Accessing addresses beyond the region specified in the
+creation function yields undefined results. Using an offset
+which is not page aligned yields an undefined result. The
+return value points to a single page in CPU address space.
 
-		This _wc variant returns a write-combining map to the
-		page and may only be used with mappings created by
-		io_mapping_create_wc
+This _wc variant returns a write-combining map to the
+page and may only be used with mappings created by
+io_mapping_create_wc
 
-		Note that the task may not sleep while holding this page
-		mapped.
+Note that the task may not sleep while holding this page
+mapped.
+
+::
 
 	void io_mapping_unmap_atomic(void *vaddr)
 
-		'vaddr' must be the value returned by the last
-		io_mapping_map_atomic_wc call. This unmaps the specified
-		page and allows the task to sleep once again.
+'vaddr' must be the value returned by the last
+io_mapping_map_atomic_wc call. This unmaps the specified
+page and allows the task to sleep once again.
 
 If you need to sleep while holding the lock, you can use the non-atomic
 variant, although they may be significantly slower.
 
+::
+
 	void *io_mapping_map_wc(struct io_mapping *mapping,
 				unsigned long offset)
 
-		This works like io_mapping_map_atomic_wc except it allows
-		the task to sleep while holding the page mapped.
+This works like io_mapping_map_atomic_wc except it allows
+the task to sleep while holding the page mapped.
+
+
+::
 
 	void io_mapping_unmap(void *vaddr)
 
-		This works like io_mapping_unmap_atomic, except it is used
-		for pages mapped with io_mapping_map_wc.
+This works like io_mapping_unmap_atomic, except it is used
+for pages mapped with io_mapping_map_wc.
 
-At driver close time, the io_mapping object must be freed:
+At driver close time, the io_mapping object must be freed::
 
 	void io_mapping_free(struct io_mapping *mapping)
 
-Current Implementation:
+Current Implementation
+======================
 
 The initial implementation of these functions uses existing mapping
 mechanisms and so provides only an abstraction layer and no new
-- 
2.9.4
