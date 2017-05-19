Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdt-0000P0-Mo
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:18 +0000
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
 Ning Sun <ning.sun@intel.com>, tboot-devel@lists.sourceforge.net
Subject: [PATCH 27/31] intel_txt.txt: standardize document format
Date: Thu, 18 May 2017 22:22:32 -0300
Message-Id: <26b37c05456ea2c92e3afb285a6aa0caa8ded8c3.1495156488.git.mchehab@s-opensource.com>
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

- promote main title one level;
- fix the bulleted list markup;
- use bulletted list markup where needed;
- add whitespaces where needed;
- mark literal blocks;
- remove extra ":" after section titles.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/intel_txt.txt | 63 ++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/Documentation/intel_txt.txt b/Documentation/intel_txt.txt
index 91d89c540709..d83c1a2122c9 100644
--- a/Documentation/intel_txt.txt
+++ b/Documentation/intel_txt.txt
@@ -1,4 +1,5 @@
-Intel(R) TXT Overview:
+=====================
+Intel(R) TXT Overview
 =====================
 
 Intel's technology for safer computing, Intel(R) Trusted Execution
@@ -8,9 +9,10 @@ provide the building blocks for creating trusted platforms.
 Intel TXT was formerly known by the code name LaGrande Technology (LT).
 
 Intel TXT in Brief:
-o  Provides dynamic root of trust for measurement (DRTM)
-o  Data protection in case of improper shutdown
-o  Measurement and verification of launched environment
+
+-  Provides dynamic root of trust for measurement (DRTM)
+-  Data protection in case of improper shutdown
+-  Measurement and verification of launched environment
 
 Intel TXT is part of the vPro(TM) brand and is also available some
 non-vPro systems.  It is currently available on desktop systems
@@ -24,16 +26,21 @@ which has been updated for the new released platforms.
 
 Intel TXT has been presented at various events over the past few
 years, some of which are:
-      LinuxTAG 2008:
+
+      - LinuxTAG 2008:
           http://www.linuxtag.org/2008/en/conf/events/vp-donnerstag.html
-      TRUST2008:
+
+      - TRUST2008:
           http://www.trust-conference.eu/downloads/Keynote-Speakers/
           3_David-Grawrock_The-Front-Door-of-Trusted-Computing.pdf
-      IDF, Shanghai:
+
+      - IDF, Shanghai:
           http://www.prcidf.com.cn/index_en.html
-      IDFs 2006, 2007 (I'm not sure if/where they are online)
 
-Trusted Boot Project Overview:
+      - IDFs 2006, 2007
+	  (I'm not sure if/where they are online)
+
+Trusted Boot Project Overview
 =============================
 
 Trusted Boot (tboot) is an open source, pre-kernel/VMM module that
@@ -87,11 +94,12 @@ Intel-provided firmware).
 How Does it Work?
 =================
 
-o  Tboot is an executable that is launched by the bootloader as
+-  Tboot is an executable that is launched by the bootloader as
    the "kernel" (the binary the bootloader executes).
-o  It performs all of the work necessary to determine if the
+-  It performs all of the work necessary to determine if the
    platform supports Intel TXT and, if so, executes the GETSEC[SENTER]
    processor instruction that initiates the dynamic root of trust.
+
    -  If tboot determines that the system does not support Intel TXT
       or is not configured correctly (e.g. the SINIT AC Module was
       incorrect), it will directly launch the kernel with no changes
@@ -99,12 +107,14 @@ o  It performs all of the work necessary to determine if the
    -  Tboot will output various information about its progress to the
       terminal, serial port, and/or an in-memory log; the output
       locations can be configured with a command line switch.
-o  The GETSEC[SENTER] instruction will return control to tboot and
+
+-  The GETSEC[SENTER] instruction will return control to tboot and
    tboot then verifies certain aspects of the environment (e.g. TPM NV
    lock, e820 table does not have invalid entries, etc.).
-o  It will wake the APs from the special sleep state the GETSEC[SENTER]
+-  It will wake the APs from the special sleep state the GETSEC[SENTER]
    instruction had put them in and place them into a wait-for-SIPI
    state.
+
    -  Because the processors will not respond to an INIT or SIPI when
       in the TXT environment, it is necessary to create a small VT-x
       guest for the APs.  When they run in this guest, they will
@@ -112,8 +122,10 @@ o  It will wake the APs from the special sleep state the GETSEC[SENTER]
       VMEXITs, and then disable VT and jump to the SIPI vector.  This
       approach seemed like a better choice than having to insert
       special code into the kernel's MP wakeup sequence.
-o  Tboot then applies an (optional) user-defined launch policy to
+
+-  Tboot then applies an (optional) user-defined launch policy to
    verify the kernel and initrd.
+
    -  This policy is rooted in TPM NV and is described in the tboot
       project.  The tboot project also contains code for tools to
       create and provision the policy.
@@ -121,30 +133,34 @@ o  Tboot then applies an (optional) user-defined launch policy to
       then any kernel will be launched.
    -  Policy action is flexible and can include halting on failures
       or simply logging them and continuing.
-o  Tboot adjusts the e820 table provided by the bootloader to reserve
+
+-  Tboot adjusts the e820 table provided by the bootloader to reserve
    its own location in memory as well as to reserve certain other
    TXT-related regions.
-o  As part of its launch, tboot DMA protects all of RAM (using the
+-  As part of its launch, tboot DMA protects all of RAM (using the
    VT-d PMRs).  Thus, the kernel must be booted with 'intel_iommu=on'
    in order to remove this blanket protection and use VT-d's
    page-level protection.
-o  Tboot will populate a shared page with some data about itself and
+-  Tboot will populate a shared page with some data about itself and
    pass this to the Linux kernel as it transfers control.
+
    -  The location of the shared page is passed via the boot_params
       struct as a physical address.
-o  The kernel will look for the tboot shared page address and, if it
+
+-  The kernel will look for the tboot shared page address and, if it
    exists, map it.
-o  As one of the checks/protections provided by TXT, it makes a copy
+-  As one of the checks/protections provided by TXT, it makes a copy
    of the VT-d DMARs in a DMA-protected region of memory and verifies
    them for correctness.  The VT-d code will detect if the kernel was
    launched with tboot and use this copy instead of the one in the
    ACPI table.
-o  At this point, tboot and TXT are out of the picture until a
+-  At this point, tboot and TXT are out of the picture until a
    shutdown (S<n>)
-o  In order to put a system into any of the sleep states after a TXT
+-  In order to put a system into any of the sleep states after a TXT
    launch, TXT must first be exited.  This is to prevent attacks that
    attempt to crash the system to gain control on reboot and steal
    data left in memory.
+
    -  The kernel will perform all of its sleep preparation and
       populate the shared page with the ACPI data needed to put the
       platform in the desired sleep state.
@@ -172,7 +188,7 @@ o  In order to put a system into any of the sleep states after a TXT
 That's pretty much it for TXT support.
 
 
-Configuring the System:
+Configuring the System
 ======================
 
 This code works with 32bit, 32bit PAE, and 64bit (x86_64) kernels.
@@ -181,7 +197,8 @@ In BIOS, the user must enable:  TPM, TXT, VT-x, VT-d.  Not all BIOSes
 allow these to be individually enabled/disabled and the screens in
 which to find them are BIOS-specific.
 
-grub.conf needs to be modified as follows:
+grub.conf needs to be modified as follows::
+
         title Linux 2.6.29-tip w/ tboot
           root (hd0,0)
                 kernel /tboot.gz logging=serial,vga,memory
-- 
2.9.4
