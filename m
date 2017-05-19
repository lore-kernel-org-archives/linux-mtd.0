Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWew-0005ge-Bd
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:51 +0000
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
Subject: [PATCH 25/30] numastat.txt: standardize document format
Date: Thu, 18 May 2017 22:24:17 -0300
Message-Id: <42e66db80b3c0be10500ae83e0b947bff72c1833.1495156975.git.mchehab@s-opensource.com>
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

- mark the document title;
- mark the table as such.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/numastat.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/numastat.txt b/Documentation/numastat.txt
index 520327790d54..aaf1667489f8 100644
--- a/Documentation/numastat.txt
+++ b/Documentation/numastat.txt
@@ -1,10 +1,12 @@
-
+===============================
 Numa policy hit/miss statistics
+===============================
 
 /sys/devices/system/node/node*/numastat
 
 All units are pages. Hugepages have separate counters.
 
+=============== ============================================================
 numa_hit	A process wanted to allocate memory from this node,
 		and succeeded.
 
@@ -20,6 +22,7 @@ other_node	A process ran on this node and got memory from another node.
 
 interleave_hit 	Interleaving wanted to allocate from this node
 		and succeeded.
+=============== ============================================================
 
 For easier reading you can use the numastat utility from the numactl package
 (http://oss.sgi.com/projects/libnuma/). Note that it only works
-- 
2.9.4
