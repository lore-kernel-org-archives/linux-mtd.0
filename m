Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWpu-00078G-Uw
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:36:15 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH 20/29] sync_file.txt: standardize document format
Date: Thu, 18 May 2017 22:26:04 -0300
Message-Id: <e781f61e582e7c7eb5de456608043aff9fe2b2b5.1495157082.git.mchehab@s-opensource.com>
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
- Use markup for document title and authorship;
- Mark literal blocks;
- Use a numbered list for references.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/sync_file.txt | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/Documentation/sync_file.txt b/Documentation/sync_file.txt
index c3d033a06e8d..496fb2c3b3e6 100644
--- a/Documentation/sync_file.txt
+++ b/Documentation/sync_file.txt
@@ -1,8 +1,8 @@
-			      Sync File API Guide
-			      ~~~~~~~~~~~~~~~~~~~
+===================
+Sync File API Guide
+===================
 
-				Gustavo Padovan
-			  <gustavo at padovan dot org>
+:Author: Gustavo Padovan <gustavo at padovan dot org>
 
 This document serves as a guide for device drivers writers on what the
 sync_file API is, and how drivers can support it. Sync file is the carrier of
@@ -46,16 +46,17 @@ Creating Sync Files
 
 When a driver needs to send an out-fence userspace it creates a sync_file.
 
-Interface:
+Interface::
+
 	struct sync_file *sync_file_create(struct dma_fence *fence);
 
 The caller pass the out-fence and gets back the sync_file. That is just the
 first step, next it needs to install an fd on sync_file->file. So it gets an
-fd:
+fd::
 
 	fd = get_unused_fd_flags(O_CLOEXEC);
 
-and installs it on sync_file->file:
+and installs it on sync_file->file::
 
 	fd_install(fd, sync_file->file);
 
@@ -71,7 +72,8 @@ When userspace needs to send an in-fence to the driver it passes file descriptor
 of the Sync File to the kernel. The kernel can then retrieve the fences
 from it.
 
-Interface:
+Interface::
+
 	struct dma_fence *sync_file_get_fence(int fd);
 
 
@@ -79,5 +81,6 @@ The returned reference is owned by the caller and must be disposed of
 afterwards using dma_fence_put(). In case of error, a NULL is returned instead.
 
 References:
-[1] struct sync_file in include/linux/sync_file.h
-[2] All interfaces mentioned above defined in include/linux/sync_file.h
+
+1. struct sync_file in include/linux/sync_file.h
+2. All interfaces mentioned above defined in include/linux/sync_file.h
-- 
2.9.4
