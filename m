Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWet-0007Fc-OS
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:56 +0000
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
Subject: [PATCH 03/30] IRQ-affinity.txt: standardize document format
Date: Thu, 18 May 2017 22:23:55 -0300
Message-Id: <a4d8c886e288841234fe4deeac9b84631e6e9782.1495156975.git.mchehab@s-opensource.com>
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

- Add a title for the document;
- mark literal blocks as such;
- use a bulleted list for changelog.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/IRQ-affinity.txt | 77 ++++++++++++++++++++++--------------------
 1 file changed, 41 insertions(+), 36 deletions(-)

diff --git a/Documentation/IRQ-affinity.txt b/Documentation/IRQ-affinity.txt
index 01a675175a36..29da5000836a 100644
--- a/Documentation/IRQ-affinity.txt
+++ b/Documentation/IRQ-affinity.txt
@@ -1,8 +1,11 @@
-ChangeLog:
-	Started by Ingo Molnar <mingo@redhat.com>
-	Update by Max Krasnyansky <maxk@qualcomm.com>
-
+================
 SMP IRQ affinity
+================
+
+ChangeLog:
+	- Started by Ingo Molnar <mingo@redhat.com>
+	- Update by Max Krasnyansky <maxk@qualcomm.com>
+
 
 /proc/irq/IRQ#/smp_affinity and /proc/irq/IRQ#/smp_affinity_list specify
 which target CPUs are permitted for a given IRQ source.  It's a bitmask
@@ -16,50 +19,52 @@ will be set to the default mask. It can then be changed as described above.
 Default mask is 0xffffffff.
 
 Here is an example of restricting IRQ44 (eth1) to CPU0-3 then restricting
-it to CPU4-7 (this is an 8-CPU SMP box):
+it to CPU4-7 (this is an 8-CPU SMP box)::
 
-[root@moon 44]# cd /proc/irq/44
-[root@moon 44]# cat smp_affinity
-ffffffff
+	[root@moon 44]# cd /proc/irq/44
+	[root@moon 44]# cat smp_affinity
+	ffffffff
 
-[root@moon 44]# echo 0f > smp_affinity
-[root@moon 44]# cat smp_affinity
-0000000f
-[root@moon 44]# ping -f h
-PING hell (195.4.7.3): 56 data bytes
-...
---- hell ping statistics ---
-6029 packets transmitted, 6027 packets received, 0% packet loss
-round-trip min/avg/max = 0.1/0.1/0.4 ms
-[root@moon 44]# cat /proc/interrupts | grep 'CPU\|44:'
-           CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
- 44:       1068       1785       1785       1783         0          0           0         0    IO-APIC-level  eth1
+	[root@moon 44]# echo 0f > smp_affinity
+	[root@moon 44]# cat smp_affinity
+	0000000f
+	[root@moon 44]# ping -f h
+	PING hell (195.4.7.3): 56 data bytes
+	...
+	--- hell ping statistics ---
+	6029 packets transmitted, 6027 packets received, 0% packet loss
+	round-trip min/avg/max = 0.1/0.1/0.4 ms
+	[root@moon 44]# cat /proc/interrupts | grep 'CPU\|44:'
+		CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
+	44:       1068       1785       1785       1783         0          0           0         0    IO-APIC-level  eth1
 
 As can be seen from the line above IRQ44 was delivered only to the first four
 processors (0-3).
 Now lets restrict that IRQ to CPU(4-7).
 
-[root@moon 44]# echo f0 > smp_affinity
-[root@moon 44]# cat smp_affinity
-000000f0
-[root@moon 44]# ping -f h
-PING hell (195.4.7.3): 56 data bytes
-..
---- hell ping statistics ---
-2779 packets transmitted, 2777 packets received, 0% packet loss
-round-trip min/avg/max = 0.1/0.5/585.4 ms
-[root@moon 44]# cat /proc/interrupts |  'CPU\|44:'
-           CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
- 44:       1068       1785       1785       1783      1784       1069        1070       1069   IO-APIC-level  eth1
+::
+
+	[root@moon 44]# echo f0 > smp_affinity
+	[root@moon 44]# cat smp_affinity
+	000000f0
+	[root@moon 44]# ping -f h
+	PING hell (195.4.7.3): 56 data bytes
+	..
+	--- hell ping statistics ---
+	2779 packets transmitted, 2777 packets received, 0% packet loss
+	round-trip min/avg/max = 0.1/0.5/585.4 ms
+	[root@moon 44]# cat /proc/interrupts |  'CPU\|44:'
+		CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
+	44:       1068       1785       1785       1783      1784       1069        1070       1069   IO-APIC-level  eth1
 
 This time around IRQ44 was delivered only to the last four processors.
 i.e counters for the CPU0-3 did not change.
 
-Here is an example of limiting that same irq (44) to cpus 1024 to 1031:
+Here is an example of limiting that same irq (44) to cpus 1024 to 1031::
 
-[root@moon 44]# echo 1024-1031 > smp_affinity_list
-[root@moon 44]# cat smp_affinity_list
-1024-1031
+	[root@moon 44]# echo 1024-1031 > smp_affinity_list
+	[root@moon 44]# cat smp_affinity_list
+	1024-1031
 
 Note that to do this with a bitmask would require 32 bitmasks of zero
 to follow the pertinent one.
-- 
2.9.4
