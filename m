Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbPc-0001IF-1U
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:17:14 +0000
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
Subject: [PATCH v2 06/53] locking.rst: add captions to two tables
Date: Tue, 16 May 2017 09:15:58 -0300
Message-Id: <475c5ef83d26c399a55b106398e9dcb38e6d888b.1494935649.git.mchehab@s-opensource.com>
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

Those tables have a "caption" at the end, but ReST
actually expects it on a different way.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/kernel-hacking/locking.rst | 66 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index 17774b1f7587..b70c2c4eb147 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -29,43 +29,45 @@ In a normal program, you can increment a counter like so:
 
 This is what they would expect to happen:
 
-+------------------------------------+------------------------------------+
-| Instance 1                         | Instance 2                         |
-+====================================+====================================+
-| read very_important_count (5)      |                                    |
-+------------------------------------+------------------------------------+
-| add 1 (6)                          |                                    |
-+------------------------------------+------------------------------------+
-| write very_important_count (6)     |                                    |
-+------------------------------------+------------------------------------+
-|                                    | read very_important_count (6)      |
-+------------------------------------+------------------------------------+
-|                                    | add 1 (7)                          |
-+------------------------------------+------------------------------------+
-|                                    | write very_important_count (7)     |
-+------------------------------------+------------------------------------+
 
-Table: Expected Results
+.. table:: Expected Results
+
+  +------------------------------------+------------------------------------+
+  | Instance 1                         | Instance 2                         |
+  +====================================+====================================+
+  | read very_important_count (5)      |                                    |
+  +------------------------------------+------------------------------------+
+  | add 1 (6)                          |                                    |
+  +------------------------------------+------------------------------------+
+  | write very_important_count (6)     |                                    |
+  +------------------------------------+------------------------------------+
+  |                                    | read very_important_count (6)      |
+  +------------------------------------+------------------------------------+
+  |                                    | add 1 (7)                          |
+  +------------------------------------+------------------------------------+
+  |                                    | write very_important_count (7)     |
+  +------------------------------------+------------------------------------+
 
 This is what might happen:
 
-+------------------------------------+------------------------------------+
-| Instance 1                         | Instance 2                         |
-+====================================+====================================+
-| read very_important_count (5)      |                                    |
-+------------------------------------+------------------------------------+
-|                                    | read very_important_count (5)      |
-+------------------------------------+------------------------------------+
-| add 1 (6)                          |                                    |
-+------------------------------------+------------------------------------+
-|                                    | add 1 (6)                          |
-+------------------------------------+------------------------------------+
-| write very_important_count (6)     |                                    |
-+------------------------------------+------------------------------------+
-|                                    | write very_important_count (6)     |
-+------------------------------------+------------------------------------+
+.. table:: Possible Results
+
+  +------------------------------------+------------------------------------+
+  | Instance 1                         | Instance 2                         |
+  +====================================+====================================+
+  | read very_important_count (5)      |                                    |
+  +------------------------------------+------------------------------------+
+  |                                    | read very_important_count (5)      |
+  +------------------------------------+------------------------------------+
+  | add 1 (6)                          |                                    |
+  +------------------------------------+------------------------------------+
+  |                                    | add 1 (6)                          |
+  +------------------------------------+------------------------------------+
+  | write very_important_count (6)     |                                    |
+  +------------------------------------+------------------------------------+
+  |                                    | write very_important_count (6)     |
+  +------------------------------------+------------------------------------+
 
-Table: Possible Results
 
 Race Conditions and Critical Regions
 ------------------------------------
-- 
2.9.3
