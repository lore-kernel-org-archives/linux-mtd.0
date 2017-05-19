Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWe6-0005dn-RE
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:59 +0000
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
Subject: [PATCH 24/31] highuid.txt: standardize document format
Date: Thu, 18 May 2017 22:22:29 -0300
Message-Id: <f77a30dc94c22dc0aeb5f58751ad5d6abea562f8.1495156488.git.mchehab@s-opensource.com>
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

- use a markup for the title;
- use :Author: and :Last updated: markups at the beginning with
  authorship info;
- use proper markups for the lists.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/highuid.txt | 46 ++++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/Documentation/highuid.txt b/Documentation/highuid.txt
index 6bad6f1d1cac..ae024b3fe4ef 100644
--- a/Documentation/highuid.txt
+++ b/Documentation/highuid.txt
@@ -1,4 +1,8 @@
-Notes on the change from 16-bit UIDs to 32-bit UIDs:
+Notes on the change from 16-bit UIDs to 32-bit UIDs
+===================================================
+
+:Author: Chris Wing <wingc@umich.edu>
+:Last updated: January 11, 2000
 
 - kernel code MUST take into account __kernel_uid_t and __kernel_uid32_t
   when communicating between user and kernel space in an ioctl or data
@@ -28,30 +32,34 @@ What's left to be done for 32-bit UIDs on all Linux architectures:
   uses the 32-bit UID system calls properly otherwise.
 
   This affects at least:
-	iBCS on Intel
 
-	sparc32 emulation on sparc64
-	(need to support whatever new 32-bit UID system calls are added to
-	sparc32)
+	- iBCS on Intel
+
+	- sparc32 emulation on sparc64
+	  (need to support whatever new 32-bit UID system calls are added to
+	  sparc32)
 
 - Validate that all filesystems behave properly.
 
   At present, 32-bit UIDs _should_ work for:
-	ext2
-	ufs
-	isofs
-	nfs
-	coda
-	udf
+
+	- ext2
+	- ufs
+	- isofs
+	- nfs
+	- coda
+	- udf
 
   Ioctl() fixups have been made for:
-	ncpfs
-	smbfs
+
+	- ncpfs
+	- smbfs
 
   Filesystems with simple fixups to prevent 16-bit UID wraparound:
-	minix
-	sysv
-	qnx4
+
+	- minix
+	- sysv
+	- qnx4
 
   Other filesystems have not been checked yet.
 
@@ -69,9 +77,3 @@ What's left to be done for 32-bit UIDs on all Linux architectures:
 - make sure that the UID mapping feature of AX25 networking works properly
   (it should be safe because it's always used a 32-bit integer to
   communicate between user and kernel)
-
-
-Chris Wing
-wingc@umich.edu
-
-last updated: January 11, 2000
-- 
2.9.4
