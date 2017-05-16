Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbPy-0001MI-CV
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:17:39 +0000
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
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 22/53] fs: eventfd: fix identation on kernel-doc
Date: Tue, 16 May 2017 09:16:14 -0300
Message-Id: <f16df9f76582fc306d62a4518e78f2cf3227707f.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
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

Sphinx require explicit tags in order to use a list of possible
values, otherwise it produces this error:

	./fs/eventfd.c:219: WARNING: Option list ends without a blank line; unexpected unindent.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 fs/eventfd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/eventfd.c b/fs/eventfd.c
index 68b9fffcb2c8..beac8175de19 100644
--- a/fs/eventfd.c
+++ b/fs/eventfd.c
@@ -215,8 +215,8 @@ EXPORT_SYMBOL_GPL(eventfd_ctx_remove_wait_queue);
  *
  * Returns %0 if successful, or the following error codes:
  *
- * -EAGAIN      : The operation would have blocked but @no_wait was non-zero.
- * -ERESTARTSYS : A signal interrupted the wait operation.
+ *  - -EAGAIN      : The operation would have blocked but @no_wait was non-zero.
+ *  - -ERESTARTSYS : A signal interrupted the wait operation.
  *
  * If @no_wait is zero, the function might sleep until the eventfd internal
  * counter becomes greater than zero.
-- 
2.9.3
