Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWpu-00078E-Ux
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:36:15 +0000
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
Subject: [PATCH 25/29] video-output.txt: standardize document format
Date: Thu, 18 May 2017 22:26:09 -0300
Message-Id: <5246c4bd9a1c527be35490d3e6e034dd9f8595a4.1495157082.git.mchehab@s-opensource.com>
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
- mark the title;
- mark the authorship;
- mark literal block.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/video-output.txt | 54 +++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/video-output.txt b/Documentation/video-output.txt
index e517011be4f9..1f7d8cf7209b 100644
--- a/Documentation/video-output.txt
+++ b/Documentation/video-output.txt
@@ -1,34 +1,34 @@
+=============================
+Video Output Switcher Control
+=============================
 
-		Video Output Switcher Control
-		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-		2006 luming.yu@intel.com
+:Author: 2006 luming.yu@intel.com
 
 The output sysfs class driver provides an abstract video output layer that
 can be used to hook platform specific methods to enable/disable video output
 device through common sysfs interface. For example, on my IBM ThinkPad T42
 laptop, The ACPI video driver registered its output devices and read/write
-method for 'state' with output sysfs class. The user interface under sysfs is:
-
-linux:/sys/class/video_output # tree .
-.
-|-- CRT0
-|   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
-|   |-- state
-|   |-- subsystem -> ../../../class/video_output
-|   `-- uevent
-|-- DVI0
-|   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
-|   |-- state
-|   |-- subsystem -> ../../../class/video_output
-|   `-- uevent
-|-- LCD0
-|   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
-|   |-- state
-|   |-- subsystem -> ../../../class/video_output
-|   `-- uevent
-`-- TV0
-   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
-   |-- state
-   |-- subsystem -> ../../../class/video_output
-   `-- uevent
+method for 'state' with output sysfs class. The user interface under sysfs is::
 
+	linux:/sys/class/video_output # tree .
+	.
+	|-- CRT0
+	|   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
+	|   |-- state
+	|   |-- subsystem -> ../../../class/video_output
+	|   `-- uevent
+	|-- DVI0
+	|   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
+	|   |-- state
+	|   |-- subsystem -> ../../../class/video_output
+	|   `-- uevent
+	|-- LCD0
+	|   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
+	|   |-- state
+	|   |-- subsystem -> ../../../class/video_output
+	|   `-- uevent
+	`-- TV0
+	   |-- device -> ../../../devices/pci0000:00/0000:00:01.0
+	   |-- state
+	   |-- subsystem -> ../../../class/video_output
+	   `-- uevent
-- 
2.9.4
