Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAgxR-0003do-O2
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 18:12:32 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 50/53] fs: fix the location of the kernel-api book
Date: Tue, 16 May 2017 15:11:57 -0300
Message-Id: <e1511a840a33f84bfbcfa00029fa841c211d32bf.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <dca1e58e3f1c82a840abaafb9328f84ae69a9926.1494935649.git.mchehab@s-opensource.com>
References: <dca1e58e3f1c82a840abaafb9328f84ae69a9926.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The kernel-api book is now part of the core-api. Update its
location.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 fs/debugfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index e892ae7d89f8..77440e4aa9d4 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -9,7 +9,7 @@
  *	2 as published by the Free Software Foundation.
  *
  *  debugfs is for people to use instead of /proc or /sys.
- *  See Documentation/DocBook/kernel-api for more details.
+ *  See ./Documentation/core-api/kernel-api.rst for more details.
  *
  */
 
-- 
2.9.3
