Received: from pmac.infradead.org ([81.187.2.168])
	by canuck.infradead.org with esmtpsa (Exim 4.54 #1 (Red Hat Linux))
	id 1Eo2GD-00041i-66
	for linux-mtd@lists.infradead.org; Sun, 18 Dec 2005 12:23:57 -0500
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Message-ID: <02DAE179D5CEED4C992055C823ED90FF8ACE8B@ex1>
From: "Vijay Sampath" <Vijay.Sampath@aktino.com>
To: <linux-kernel@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Date: Sun, 18 Dec 2005 17:23:47 +0000
Content-Transfer-Encoding: 7bit
Cc: 
Subject: [PATCH] MTD (kernel 2.4.32): kernel stuck in tight loop
	occasionally on flash access
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are running a Timesys modified version of the 2.4 kernel.
Occasionally we see board lockups on heavy file system and direct MTD
flash accesses. I have traced this down to a bug in the 2.4 MTD code
(chip driver to be specific) and see this problem even in the latest 2.4
kernel (2.4.32). I realize that this problem may not be seen by others
using the stock kernel, but I think it needs to be fixed anyway for
correctness.

The problem is in cfi_cmdset_0001.c, and is present in drivers for other
chips as well. In the function cfi_intelext_sync() function before
calling schedule(), the current process needs to be put to sleep by
calling set_current_state(TASK_INTERRUPTIBLE). If it is not put to
sleep, the task remains in the run queue of the kernel and if its
priority is high enough, the kernel will constantly keep scheduling this
process, the state of the chip will never change.

Adding this one line seems to make our lockups go away.

I am not subscribed to the mailing list, so please CC me on any replies.

Signed-off-by: Vijay Sampath <vijay.sampath@aktino.com>

---

diff -uprN -X linux-2.4.32/Documentation/dontdiff
linux-2.4.32/Documentation/dontdiff
/home/vsampath/my-linux-2.4.32/Documentation/dontdiff
--- linux-2.4.32/Documentation/dontdiff	2005-12-17 15:00:14.000000000
-0800
+++ /home/vsampath/my-linux-2.4.32/Documentation/dontdiff
1969-12-31 16:00:00.000000000 -0800
@@ -1,140 +0,0 @@
-*.a
-*.aux
-*.bin
-*.cpio
-*.css
-*.dvi
-*.eps
-*.gif
-*.grep
-*.grp
-*.gz
-*.html
-*.jpeg
-*.ko
-*.log
-*.lst
-*.mod.c
-*.o
-*.orig
-*.out
-*.pdf
-*.png
-*.ps
-*.rej
-*.s
-*.sgml
-*.so
-*.tex
-*.ver
-*.xml
-*_MODULES
-*_vga16.c
-*cscope*
-*~
-.*
-.cscope
-53c700_d.h
-53c8xx_d.h*
-BitKeeper
-COPYING
-CREDITS
-CVS
-ChangeSet
-Kerntypes
-MODS.txt
-Module.symvers
-PENDING
-SCCS
-System.map*
-TAGS
-aic7*reg.h*
-aic7*reg_print.c*
-aic7*seq.h*
-aicasm
-aicdb.h*
-asm
-asm_offsets.*
-autoconf.h*
-bbootsect
-bin2c
-binkernel.spec
-bootsect
-bsetup
-btfixupprep
-build
-bvmlinux
-bzImage*
-classlist.h*
-comp*.log
-compile.h*
-config
-config-*
-config_data.h*
-conmakehash
-consolemap_deftbl.c*
-crc32table.h*
-cscope.*
-defkeymap.c*
-devlist.h*
-docproc
-dummy_sym.c*
-elfconfig.h*
-filelist
-fixdep
-fore200e_mkfirm
-fore200e_pca_fw.c*
-gen-devlist
-gen-kdb_cmds.c*
-gen_crc32table
-gen_init_cpio
-genksyms
-gentbl
-ikconfig.h*
-initramfs_list
-kallsyms
-kconfig
-kconfig.tk
-keywords.c*
-ksym.c*
-ksym.h*
-lex.c*
-logo_*.c
-logo_*_clut224.c
-logo_*_mono.c
-lxdialog
-make_times_h
-map
-maui_boot.h
-mk_elfconfig
-mkdep
-mktables
-modpost
-modversions.h*
-offsets.h
-oui.c*
-parse.c*
-parse.h*
-pnmtologo
-ppc_defs.h*
-promcon_tbl.c*
-pss_boot.h
-raid6altivec*.c
-raid6int*.c
-raid6tables.c
-setup
-sim710_d.h*
-sm_tbl*
-split-include
-tags
-times.h*
-tkparse
-trix_boot.h
-version.h*
-vmlinux
-vmlinux-*
-vmlinux.lds
-vsyscall.lds
-wanxlfw.inc
-uImage
-zImage
diff -uprN -X linux-2.4.32/Documentation/dontdiff
linux-2.4.32/drivers/mtd/chips/amd_flash.c
/home/vsampath/my-linux-2.4.32/drivers/mtd/chips/amd_flash.c
--- linux-2.4.32/drivers/mtd/chips/amd_flash.c	2003-06-13
07:51:34.000000000 -0700
+++ /home/vsampath/my-linux-2.4.32/drivers/mtd/chips/amd_flash.c
2005-12-17 14:55:20.000000000 -0800
@@ -1350,6 +1350,7 @@ static void amd_flash_sync(struct mtd_in
 
 		default:
 			/* Not an idle state */
+			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 			
 			spin_unlock_bh(chip->mutex);
diff -uprN -X linux-2.4.32/Documentation/dontdiff
linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0001.c
/home/vsampath/my-linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0001.c	2004-11-17
03:54:21.000000000 -0800
+++ /home/vsampath/my-linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0001.c
2005-12-17 14:53:42.000000000 -0800
@@ -1687,6 +1687,7 @@ static void cfi_intelext_sync (struct mt
 
 		default:
 			/* Not an idle state */
+			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 			
 			spin_unlock(chip->mutex);
diff -uprN -X linux-2.4.32/Documentation/dontdiff
linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0002.c
/home/vsampath/my-linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0002.c
--- linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0002.c	2004-11-17
03:54:21.000000000 -0800
+++ /home/vsampath/my-linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0002.c
2005-12-17 14:53:58.000000000 -0800
@@ -1172,6 +1172,7 @@ static void cfi_amdstd_sync (struct mtd_
 
 		default:
 			/* Not an idle state */
+			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 			
 			cfi_spin_unlock(chip->mutex);
diff -uprN -X linux-2.4.32/Documentation/dontdiff
linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0020.c
/home/vsampath/my-linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0020.c
--- linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0020.c	2004-11-17
03:54:21.000000000 -0800
+++ /home/vsampath/my-linux-2.4.32/drivers/mtd/chips/cfi_cmdset_0020.c
2005-12-17 14:54:09.000000000 -0800
@@ -1036,6 +1036,7 @@ static void cfi_staa_sync (struct mtd_in
 
 		default:
 			/* Not an idle state */
+			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
 			
 			spin_unlock_bh(chip->mutex);

