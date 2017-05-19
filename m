Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWh2-0005gr-Qa
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:27:30 +0000
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
Subject: [PATCH 09/29] robust-futex-ABI.txt: standardize document format
Date: Thu, 18 May 2017 22:25:53 -0300
Message-Id: <047e44d5c5d227ba389d18f47a8f5d71edeaa521.1495157082.git.mchehab@s-opensource.com>
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

- promote document title;
- use :Author: for authorship;
- mark literal blocks;
- add blank lines.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/robust-futex-ABI.txt | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/robust-futex-ABI.txt b/Documentation/robust-futex-ABI.txt
index 16eb314f56cc..8a5d34abf726 100644
--- a/Documentation/robust-futex-ABI.txt
+++ b/Documentation/robust-futex-ABI.txt
@@ -1,7 +1,9 @@
-Started by Paul Jackson <pj@sgi.com>
-
+====================
 The robust futex ABI
---------------------
+====================
+
+:Author: Started by Paul Jackson <pj@sgi.com>
+
 
 Robust_futexes provide a mechanism that is used in addition to normal
 futexes, for kernel assist of cleanup of held locks on task exit.
@@ -32,7 +34,7 @@ probably causing deadlock or other such failure of the other threads
 waiting on the same locks.
 
 A thread that anticipates possibly using robust_futexes should first
-issue the system call:
+issue the system call::
 
     asmlinkage long
     sys_set_robust_list(struct robust_list_head __user *head, size_t len);
@@ -91,7 +93,7 @@ that lock using the futex mechanism.
 When a thread has invoked the above system call to indicate it
 anticipates using robust_futexes, the kernel stores the passed in 'head'
 pointer for that task.  The task may retrieve that value later on by
-using the system call:
+using the system call::
 
     asmlinkage long
     sys_get_robust_list(int pid, struct robust_list_head __user **head_ptr,
@@ -135,6 +137,7 @@ manipulating this list), the user code must observe the following
 protocol on 'lock entry' insertion and removal:
 
 On insertion:
+
  1) set the 'list_op_pending' word to the address of the 'lock entry'
     to be inserted,
  2) acquire the futex lock,
@@ -143,6 +146,7 @@ On insertion:
  4) clear the 'list_op_pending' word.
 
 On removal:
+
  1) set the 'list_op_pending' word to the address of the 'lock entry'
     to be removed,
  2) remove the lock entry for this lock from the 'head' list,
-- 
2.9.4
