Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWet-0005gZ-Dl
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:48 +0000
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
Subject: [PATCH 05/30] irqflags-tracing.txt: standardize document format
Date: Thu, 18 May 2017 22:23:57 -0300
Message-Id: <44fcd0f46c9d510b58e3dc4ce163bf4a083c3040.1495156975.git.mchehab@s-opensource.com>
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

There isn't much to be done here: just mark the document
title as such and add a :Author:.

While here, use upper case at the beginning of a few paragraphs
that start with lower case.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/irqflags-tracing.txt | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/irqflags-tracing.txt b/Documentation/irqflags-tracing.txt
index f6da05670e16..bdd208259fb3 100644
--- a/Documentation/irqflags-tracing.txt
+++ b/Documentation/irqflags-tracing.txt
@@ -1,8 +1,10 @@
+=======================
 IRQ-flags state tracing
+=======================
 
-started by Ingo Molnar <mingo@redhat.com>
+:Author: started by Ingo Molnar <mingo@redhat.com>
 
-the "irq-flags tracing" feature "traces" hardirq and softirq state, in
+The "irq-flags tracing" feature "traces" hardirq and softirq state, in
 that it gives interested subsystems an opportunity to be notified of
 every hardirqs-off/hardirqs-on, softirqs-off/softirqs-on event that
 happens in the kernel.
@@ -14,7 +16,7 @@ CONFIG_PROVE_RWSEM_LOCKING will be offered on an architecture - these
 are locking APIs that are not used in IRQ context. (the one exception
 for rwsems is worked around)
 
-architecture support for this is certainly not in the "trivial"
+Architecture support for this is certainly not in the "trivial"
 category, because lots of lowlevel assembly code deal with irq-flags
 state changes. But an architecture can be irq-flags-tracing enabled in a
 rather straightforward and risk-free manner.
@@ -41,7 +43,7 @@ irq-flags-tracing support:
   excluded from the irq-tracing [and lock validation] mechanism via
   lockdep_off()/lockdep_on().
 
-in general there is no risk from having an incomplete irq-flags-tracing
+In general there is no risk from having an incomplete irq-flags-tracing
 implementation in an architecture: lockdep will detect that and will
 turn itself off. I.e. the lock validator will still be reliable. There
 should be no crashes due to irq-tracing bugs. (except if the assembly
-- 
2.9.4
