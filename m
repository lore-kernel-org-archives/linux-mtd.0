Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdc-0000P2-Q4
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:32 +0000
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
Subject: [PATCH 19/31] efi-stub.txt: standardize document format
Date: Thu, 18 May 2017 22:22:24 -0300
Message-Id: <db4f9b1f261c4a96d4eef071f232033c02a9b8fd.1495156488.git.mchehab@s-opensource.com>
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

- use proper markups for titles;
- identify literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/efi-stub.txt | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/Documentation/efi-stub.txt b/Documentation/efi-stub.txt
index e15746988261..41df801f9a50 100644
--- a/Documentation/efi-stub.txt
+++ b/Documentation/efi-stub.txt
@@ -1,5 +1,6 @@
-			  The EFI Boot Stub
-		     ---------------------------
+=================
+The EFI Boot Stub
+=================
 
 On the x86 and ARM platforms, a kernel zImage/bzImage can masquerade
 as a PE/COFF image, thereby convincing EFI firmware loaders to load
@@ -25,7 +26,8 @@ a certain sense it *IS* the boot loader.
 The EFI boot stub is enabled with the CONFIG_EFI_STUB kernel option.
 
 
-**** How to install bzImage.efi
+How to install bzImage.efi
+--------------------------
 
 The bzImage located in arch/x86/boot/bzImage must be copied to the EFI
 System Partition (ESP) and renamed with the extension ".efi". Without
@@ -37,14 +39,16 @@ may not need to be renamed. Similarly for arm64, arch/arm64/boot/Image
 should be copied but not necessarily renamed.
 
 
-**** Passing kernel parameters from the EFI shell
+Passing kernel parameters from the EFI shell
+--------------------------------------------
 
-Arguments to the kernel can be passed after bzImage.efi, e.g.
+Arguments to the kernel can be passed after bzImage.efi, e.g.::
 
 	fs0:> bzImage.efi console=ttyS0 root=/dev/sda4
 
 
-**** The "initrd=" option
+The "initrd=" option
+--------------------
 
 Like most boot loaders, the EFI stub allows the user to specify
 multiple initrd files using the "initrd=" option. This is the only EFI
@@ -54,9 +58,9 @@ kernel when it boots.
 The path to the initrd file must be an absolute path from the
 beginning of the ESP, relative path names do not work. Also, the path
 is an EFI-style path and directory elements must be separated with
-backslashes (\). For example, given the following directory layout,
+backslashes (\). For example, given the following directory layout::
 
-fs0:>
+  fs0:>
 	Kernels\
 			bzImage.efi
 			initrd-large.img
@@ -66,7 +70,7 @@ fs0:>
 			initrd-medium.img
 
 to boot with the initrd-large.img file if the current working
-directory is fs0:\Kernels, the following command must be used,
+directory is fs0:\Kernels, the following command must be used::
 
 	fs0:\Kernels> bzImage.efi initrd=\Kernels\initrd-large.img
 
@@ -76,7 +80,8 @@ which understands relative paths, whereas the rest of the command line
 is passed to bzImage.efi.
 
 
-**** The "dtb=" option
+The "dtb=" option
+-----------------
 
 For the ARM and arm64 architectures, we also need to be able to provide a
 device tree to the kernel. This is done with the "dtb=" command line option,
-- 
2.9.4
