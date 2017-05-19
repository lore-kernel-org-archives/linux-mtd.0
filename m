Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdc-0000Ov-Pk
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:45 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Doug Warzecha <Douglas_Warzecha@dell.com>,
 Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: [PATCH 12/31] dcdbas.txt: standardize document format
Date: Thu, 18 May 2017 22:22:17 -0300
Message-Id: <8b14c0380301e2161e5de8294a707e7db3542b3c.1495156488.git.mchehab@s-opensource.com>
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

From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Mark titles;
- Mark literal blocks;
- Mark table.

Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/dcdbas.txt | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/dcdbas.txt b/Documentation/dcdbas.txt
index e1c52e2dc361..309cc57a7c1c 100644
--- a/Documentation/dcdbas.txt
+++ b/Documentation/dcdbas.txt
@@ -1,4 +1,9 @@
+===================================
+Dell Systems Management Base Driver
+===================================
+
 Overview
+========
 
 The Dell Systems Management Base Driver provides a sysfs interface for
 systems management software such as Dell OpenManage to perform system
@@ -17,6 +22,7 @@ more information about the libsmbios project.
 
 
 System Management Interrupt
+===========================
 
 On some Dell systems, systems management software must access certain
 management information via a system management interrupt (SMI).  The SMI data
@@ -24,12 +30,12 @@ buffer must reside in 32-bit address space, and the physical address of the
 buffer is required for the SMI.  The driver maintains the memory required for
 the SMI and provides a way for the application to generate the SMI.
 The driver creates the following sysfs entries for systems management
-software to perform these system management interrupts:
+software to perform these system management interrupts::
 
-/sys/devices/platform/dcdbas/smi_data
-/sys/devices/platform/dcdbas/smi_data_buf_phys_addr
-/sys/devices/platform/dcdbas/smi_data_buf_size
-/sys/devices/platform/dcdbas/smi_request
+	/sys/devices/platform/dcdbas/smi_data
+	/sys/devices/platform/dcdbas/smi_data_buf_phys_addr
+	/sys/devices/platform/dcdbas/smi_data_buf_size
+	/sys/devices/platform/dcdbas/smi_request
 
 Systems management software must perform the following steps to execute
 a SMI using this driver:
@@ -43,6 +49,7 @@ a SMI using this driver:
 
 
 Host Control Action
+===================
 
 Dell OpenManage supports a host control feature that allows the administrator
 to perform a power cycle or power off of the system after the OS has finished
@@ -69,12 +76,14 @@ power off host control action using this driver:
 
 
 Host Control SMI Type
+=====================
 
 The following table shows the value to write to host_control_smi_type to
 perform a power cycle or power off host control action:
 
+=================== =====================
 PowerEdge System    Host Control SMI Type
-----------------    ---------------------
+=================== =====================
       300             HC_SMITYPE_TYPE1
      1300             HC_SMITYPE_TYPE1
      1400             HC_SMITYPE_TYPE2
@@ -87,5 +96,4 @@ PowerEdge System    Host Control SMI Type
      1655MC           HC_SMITYPE_TYPE2
       700             HC_SMITYPE_TYPE3
       750             HC_SMITYPE_TYPE3
-
-
+=================== =====================
-- 
2.9.4
