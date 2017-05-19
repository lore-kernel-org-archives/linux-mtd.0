Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWet-0007Fo-OL
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:53 +0000
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
 "Richard Russon (FlatCap)" <ldm@flatcap.org>,
 linux-ntfs-dev@lists.sourceforge.net
Subject: [PATCH 14/30] ldm.txt: standardize document format
Date: Thu, 18 May 2017 22:24:06 -0300
Message-Id: <4406fba0eda07bde7d505b34ac3303fb2e48332d.1495156975.git.mchehab@s-opensource.com>
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

- Reformat its title;
- Use :Author: and :Last Updated: for authorship
- Use note markup;
- Reformat table to match ReST standard;
- Use bulleted lists where needed.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/ldm.txt | 54 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/Documentation/ldm.txt b/Documentation/ldm.txt
index 4f80edd14d0a..12c571368e73 100644
--- a/Documentation/ldm.txt
+++ b/Documentation/ldm.txt
@@ -1,9 +1,9 @@
+==========================================
+LDM - Logical Disk Manager (Dynamic Disks)
+==========================================
 
-            LDM - Logical Disk Manager (Dynamic Disks)
-            ------------------------------------------
-
-Originally Written by FlatCap - Richard Russon <ldm@flatcap.org>.
-Last Updated by Anton Altaparmakov on 30 March 2007 for Windows Vista.
+:Author: Originally Written by FlatCap - Richard Russon <ldm@flatcap.org>.
+:Last Updated: Anton Altaparmakov on 30 March 2007 for Windows Vista.
 
 Overview
 --------
@@ -37,24 +37,36 @@ Example
 -------
 
 Below we have a 50MiB disk, divided into seven partitions.
-N.B.  The missing 1MiB at the end of the disk is where the LDM database is
-      stored.
 
-  Device | Offset Bytes  Sectors  MiB | Size   Bytes  Sectors  MiB
-  -------+----------------------------+---------------------------
-  hda    |            0        0    0 |     52428800   102400   50
-  hda1   |     51380224   100352   49 |      1048576     2048    1
-  hda2   |        16384       32    0 |      6979584    13632    6
-  hda3   |      6995968    13664    6 |     10485760    20480   10
-  hda4   |     17481728    34144   16 |      4194304     8192    4
-  hda5   |     21676032    42336   20 |      5242880    10240    5
-  hda6   |     26918912    52576   25 |     10485760    20480   10
-  hda7   |     37404672    73056   35 |     13959168    27264   13
+.. note::
+
+   The missing 1MiB at the end of the disk is where the LDM database is
+   stored.
+
++-------++--------------+---------+-----++--------------+---------+----+
+|Device || Offset Bytes | Sectors | MiB || Size   Bytes | Sectors | MiB|
++=======++==============+=========+=====++==============+=========+====+
+|hda    ||            0 |       0 |   0 ||     52428800 |  102400 |  50|
++-------++--------------+---------+-----++--------------+---------+----+
+|hda1   ||     51380224 |  100352 |  49 ||      1048576 |    2048 |   1|
++-------++--------------+---------+-----++--------------+---------+----+
+|hda2   ||        16384 |      32 |   0 ||      6979584 |   13632 |   6|
++-------++--------------+---------+-----++--------------+---------+----+
+|hda3   ||      6995968 |   13664 |   6 ||     10485760 |   20480 |  10|
++-------++--------------+---------+-----++--------------+---------+----+
+|hda4   ||     17481728 |   34144 |  16 ||      4194304 |    8192 |   4|
++-------++--------------+---------+-----++--------------+---------+----+
+|hda5   ||     21676032 |   42336 |  20 ||      5242880 |   10240 |   5|
++-------++--------------+---------+-----++--------------+---------+----+
+|hda6   ||     26918912 |   52576 |  25 ||     10485760 |   20480 |  10|
++-------++--------------+---------+-----++--------------+---------+----+
+|hda7   ||     37404672 |   73056 |  35 ||     13959168 |   27264 |  13|
++-------++--------------+---------+-----++--------------+---------+----+
 
 The LDM Database may not store the partitions in the order that they appear on
 disk, but the driver will sort them.
 
-When Linux boots, you will see something like:
+When Linux boots, you will see something like::
 
   hda: 102400 sectors w/32KiB Cache, CHS=50/64/32
   hda: [LDM] hda1 hda2 hda3 hda4 hda5 hda6 hda7
@@ -65,13 +77,13 @@ Compiling LDM Support
 
 To enable LDM, choose the following two options: 
 
-  "Advanced partition selection" CONFIG_PARTITION_ADVANCED
-  "Windows Logical Disk Manager (Dynamic Disk) support" CONFIG_LDM_PARTITION
+  - "Advanced partition selection" CONFIG_PARTITION_ADVANCED
+  - "Windows Logical Disk Manager (Dynamic Disk) support" CONFIG_LDM_PARTITION
 
 If you believe the driver isn't working as it should, you can enable the extra
 debugging code.  This will produce a LOT of output.  The option is:
 
-  "Windows LDM extra logging" CONFIG_LDM_DEBUG
+  - "Windows LDM extra logging" CONFIG_LDM_DEBUG
 
 N.B. The partition code cannot be compiled as a module.
 
-- 
2.9.4
