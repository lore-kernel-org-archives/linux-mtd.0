Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWh3-0005sr-0Q
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:27:01 +0000
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
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>
Subject: [PATCH 10/29] robust-futexes.txt: standardize document format
Date: Thu, 18 May 2017 22:25:54 -0300
Message-Id: <8c952717d193d4084221fd4b6522a77d49aec40b.1495157082.git.mchehab@s-opensource.com>
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

- add a title for the document;
- mark literal blocks;

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/robust-futexes.txt | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/robust-futexes.txt b/Documentation/robust-futexes.txt
index 61c22d608759..6c42c75103eb 100644
--- a/Documentation/robust-futexes.txt
+++ b/Documentation/robust-futexes.txt
@@ -1,4 +1,8 @@
-Started by: Ingo Molnar <mingo@redhat.com>
+========================================
+A description of what robust futexes are
+========================================
+
+:Started by: Ingo Molnar <mingo@redhat.com>
 
 Background
 ----------
@@ -163,7 +167,7 @@ Implementation details
 ----------------------
 
 The patch adds two new syscalls: one to register the userspace list, and
-one to query the registered list pointer:
+one to query the registered list pointer::
 
  asmlinkage long
  sys_set_robust_list(struct robust_list_head __user *head,
@@ -185,7 +189,7 @@ straightforward. The kernel doesn't have any internal distinction between
 robust and normal futexes.
 
 If a futex is found to be held at exit time, the kernel sets the
-following bit of the futex word:
+following bit of the futex word::
 
 	#define FUTEX_OWNER_DIED        0x40000000
 
@@ -193,7 +197,7 @@ and wakes up the next futex waiter (if any). User-space does the rest of
 the cleanup.
 
 Otherwise, robust futexes are acquired by glibc by putting the TID into
-the futex field atomically. Waiters set the FUTEX_WAITERS bit:
+the futex field atomically. Waiters set the FUTEX_WAITERS bit::
 
 	#define FUTEX_WAITERS           0x80000000
 
-- 
2.9.4
