Received: from mailgate5.web.de ([217.72.192.165])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE1kz-0006rs-Kz
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 08:57:57 +0100
Received: by mailgate5.web.de (8.11.6p2/8.11.2/SuSE Linux 8.11.0-0.4) with
	SMTP id i3F7vu413773
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 09:57:56 +0200
Date: Thu, 15 Apr 2004 09:57:54 +0200
Message-Id: <1193074139@web.de>
MIME-Version: 1.0
From: "Tobias Arp" <tobiasarp@web.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: patch kernel 2.4.21 (including the arm-linux patch rmk2) with the
	latest CVS snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Hi 
 
i tried to patch my arm linux kernel 2.4.21 (rmk2 patch) with the latest CVS snapshot. I had 
follwing errors: 
 
1. While making xconfig after patching the kernel (Options: Copy files, update fs) i had a 
problem making xconfig. This kernel release seems not to support elif in Config-files. I 
comment these lines out because they don't affect my configuration. After this it works. 
 
2. I get some warnings and errors messages while make zImage: 
 
cfi_cmdset_0002.c: In function `do_write_oneword': 
cfi_cmdset_0002.c:848: warning: label `op_failed' defined but not used 
cfi_cmdset_0002.c: In function `do_erase_chip': 
cfi_cmdset_0002.c:1385: warning: label `op_failed' defined but not used 
cfi_cmdset_0002.c: In function `do_erase_oneblock': 
cfi_cmdset_0002.c:1575: warning: label `op_failed' defined but not used 
physmap.c: In function `init_physmap': 
physmap.c:68: warning: passing arg 2 of `parse_mtd_partitions' from incompatible pointer type 
debug.c:147: warning: `page_info_op' defined but not used 
nodelist.c: In function `jffs2_get_inode_nodes': 
nodelist.c:283: warning: unknown conversion type character `z' in format 
nodelist.c:283: warning: too many arguments for format 
read.c: In function `jffs2_read_dnode': 
read.c:44: warning: unknown conversion type character `z' in format 
read.c:44: warning: unknown conversion type character `z' in format 
read.c:44: warning: too many arguments for format 
nodemgmt.c: In function `jffs2_mark_node_obsolete': 
nodemgmt.c:530: warning: unknown conversion type character `z' in format 
nodemgmt.c:530: warning: too many arguments for format 
nodemgmt.c:549: warning: unknown conversion type character `z' in format 
nodemgmt.c:549: warning: too many arguments for format 
readinode.c: In function `jffs2_do_read_inode_internal': 
readinode.c:587: warning: unknown conversion type character `z' in format 
readinode.c:587: warning: unknown conversion type character `z' in format 
readinode.c:587: warning: too many arguments for format 
write.c: In function `writecheck': 
write.c:66: warning: unknown conversion type character `z' in format 
write.c:66: warning: too many arguments for format 
write.c: In function `jffs2_write_dnode': 
write.c:112: warning: unknown conversion type character `z' in format 
write.c:112: warning: too many arguments for format 
write.c:143: warning: unknown conversion type character `z' in format 
write.c:143: warning: unknown conversion type character `z' in format 
write.c:143: warning: too many arguments for format 
write.c: In function `jffs2_write_dirent': 
write.c:284: warning: unknown conversion type character `z' in format 
write.c:284: warning: unknown conversion type character `z' in format 
write.c:284: warning: too many arguments for format 
scan.c: In function `jffs2_scan_medium': 
scan.c:91: warning: unknown conversion type character `z' in format 
scan.c:91: warning: too many arguments for format 
scan.c: In function `jffs2_fill_scan_buf': 
scan.c:271: warning: unknown conversion type character `z' in format 
scan.c:271: warning: too many arguments for format 
scan.c: In function `jffs2_scan_eraseblock': 
scan.c:383: warning: unknown conversion type character `z' in format 
scan.c:383: warning: unknown conversion type character `z' in format 
scan.c:383: warning: too many arguments for format 
scan.c:391: warning: unknown conversion type character `z' in format 
scan.c:391: warning: too many arguments for format 
scan.c:509: warning: unknown conversion type character `z' in format 
scan.c:509: warning: too many arguments for format 
gc.c: In function `jffs2_garbage_collect_pristine': 
gc.c:588: warning: unknown conversion type character `z' in format 
gc.c:588: warning: too many arguments for format 
gc.c: In function `jffs2_garbage_collect_metadata': 
gc.c:690: warning: unknown conversion type character `z' in format 
gc.c:690: warning: too many arguments for format 
gc.c: In function `jffs2_garbage_collect_dirent': 
gc.c:757: warning: unknown conversion type character `z' in format 
gc.c:757: warning: too many arguments for format 
gc.c: In function `jffs2_garbage_collect_deletion_dirent': 
gc.c:827: warning: unknown conversion type character `z' in format 
gc.c:827: warning: unknown conversion type character `z' in format 
gc.c:827: warning: too many arguments for format 
gc.c: In function `jffs2_garbage_collect_hole': 
gc.c:901: warning: unknown conversion type character `z' in format 
gc.c:901: warning: too many arguments for format 
gc.c:913: warning: unknown conversion type character `z' in format 
gc.c:913: warning: too many arguments for format 
gc.c:959: warning: unknown conversion type character `z' in format 
gc.c:959: warning: too many arguments for format 
gc.c: In function `jffs2_garbage_collect_dnode': 
gc.c:1185: warning: unknown conversion type character `z' in format 
gc.c:1185: warning: too many arguments for format 
erase.c: In function `jffs2_mark_erased_block': 
erase.c:322: warning: unknown conversion type character `z' in format 
erase.c:322: warning: too many arguments for format 
erase.c:385: warning: unknown conversion type character `z' in format 
erase.c:385: warning: too many arguments for format 
fs.c: In function `jffs2_gc_fetch_inode': 
fs.c:550: warning: implicit declaration of function `ilookup' 
fs.c:550: warning: assignment makes pointer from integer without a cast 
fs/fs.o: In function `jffs2_gc_fetch_inode': 
fs/fs.o(.text+0x61f10): undefined reference to `ilookup' 
make: *** [vmlinux] Fehler 1 
 
Has someone made the same experience ? 
 
I have another question: Before i made the patch i have configured my flash partitions in 
physmap.c where do i configure it now (after applying the patch) ? 
 
Regards 
 
Tobias Arp 
 
_______________________________________________________________________
... and the winner is... WEB.DE FreeMail! - Deutschlands beste E-Mail
ist zum 39. Mal Testsieger (PC Praxis 03/04) http://f.web.de/?mc=021191
