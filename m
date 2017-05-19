Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWh3-0005sr-Uc
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:27:03 +0000
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
Subject: [PATCH 13/29] SAK.txt: standardize document format
Date: Thu, 18 May 2017 22:25:57 -0300
Message-Id: <27d8707dc19fd02aac9808967d2b4f3f44efa87a.1495157082.git.mchehab@s-opensource.com>
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

- mark document title;
- use :Author: and :Date: for authorship;
- adjust notation for literals and bold;
- mark literal blocks;
- adjust identation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/SAK.txt | 65 +++++++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/Documentation/SAK.txt b/Documentation/SAK.txt
index 74be14679ed8..260e1d3687bd 100644
--- a/Documentation/SAK.txt
+++ b/Documentation/SAK.txt
@@ -1,5 +1,9 @@
-Linux 2.4.2 Secure Attention Key (SAK) handling
-18 March 2001, Andrew Morton
+=========================================
+Linux Secure Attention Key (SAK) handling
+=========================================
+
+:Date: 18 March 2001
+:Author: Andrew Morton
 
 An operating system's Secure Attention Key is a security tool which is
 provided as protection against trojan password capturing programs.  It
@@ -13,7 +17,7 @@ this sequence.  It is only available if the kernel was compiled with
 sysrq support.
 
 The proper way of generating a SAK is to define the key sequence using
-`loadkeys'.  This will work whether or not sysrq support is compiled
+``loadkeys``.  This will work whether or not sysrq support is compiled
 into the kernel.
 
 SAK works correctly when the keyboard is in raw mode.  This means that
@@ -25,64 +29,63 @@ What key sequence should you use? Well, CTRL-ALT-DEL is used to reboot
 the machine.  CTRL-ALT-BACKSPACE is magical to the X server.  We'll
 choose CTRL-ALT-PAUSE.
 
-In your rc.sysinit (or rc.local) file, add the command
+In your rc.sysinit (or rc.local) file, add the command::
 
 	echo "control alt keycode 101 = SAK" | /bin/loadkeys
 
 And that's it!  Only the superuser may reprogram the SAK key.
 
 
-NOTES
-=====
+.. note::
 
-1: Linux SAK is said to be not a "true SAK" as is required by
-   systems which implement C2 level security.  This author does not
-   know why.
+  1. Linux SAK is said to be not a "true SAK" as is required by
+     systems which implement C2 level security.  This author does not
+     know why.
 
 
-2: On the PC keyboard, SAK kills all applications which have
-   /dev/console opened.
+  2. On the PC keyboard, SAK kills all applications which have
+     /dev/console opened.
 
-   Unfortunately this includes a number of things which you don't
-   actually want killed.  This is because these applications are
-   incorrectly holding /dev/console open.  Be sure to complain to your
-   Linux distributor about this!
+     Unfortunately this includes a number of things which you don't
+     actually want killed.  This is because these applications are
+     incorrectly holding /dev/console open.  Be sure to complain to your
+     Linux distributor about this!
 
-   You can identify processes which will be killed by SAK with the
-   command
+     You can identify processes which will be killed by SAK with the
+     command::
 
 	# ls -l /proc/[0-9]*/fd/* | grep console
 	l-wx------    1 root     root           64 Mar 18 00:46 /proc/579/fd/0 -> /dev/console
 
-   Then:
+     Then::
 
 	# ps aux|grep 579
 	root       579  0.0  0.1  1088  436 ?        S    00:43   0:00 gpm -t ps/2
 
-   So `gpm' will be killed by SAK.  This is a bug in gpm.  It should
-   be closing standard input.  You can work around this by finding the
-   initscript which launches gpm and changing it thusly:
+     So ``gpm`` will be killed by SAK.  This is a bug in gpm.  It should
+     be closing standard input.  You can work around this by finding the
+     initscript which launches gpm and changing it thusly:
 
-   Old:
+     Old::
 
 	daemon gpm
 
-   New:
+     New::
 
 	daemon gpm < /dev/null
 
-   Vixie cron also seems to have this problem, and needs the same treatment.
+     Vixie cron also seems to have this problem, and needs the same treatment.
 
-   Also, one prominent Linux distribution has the following three
-   lines in its rc.sysinit and rc scripts:
+     Also, one prominent Linux distribution has the following three
+     lines in its rc.sysinit and rc scripts::
 
 	exec 3<&0
 	exec 4>&1
 	exec 5>&2
 
-   These commands cause *all* daemons which are launched by the
-   initscripts to have file descriptors 3, 4 and 5 attached to
-   /dev/console.  So SAK kills them all.  A workaround is to simply
-   delete these lines, but this may cause system management
-   applications to malfunction - test everything well.
+     These commands cause **all** daemons which are launched by the
+     initscripts to have file descriptors 3, 4 and 5 attached to
+     /dev/console.  So SAK kills them all.  A workaround is to simply
+     delete these lines, but this may cause system management
+     applications to malfunction - test everything well.
 
-- 
2.9.4
