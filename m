From: samoutin@hotbox.ru (Alex Samoutin)
Date: Fri, 14 Feb 2003 17:05:46 -0800
Subject: A couple of bugs in nand_write_ecc()
References: <001301c2d450$aa1a07a0$1a00a8c0@itc.intrinsyc.com> <200302150001.23072.tglx@linutronix.de>
Message-ID: <006801c2d48e$626313a0$1a00a8c0@itc.intrinsyc.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

From: "Thomas Gleixner" <tglx@linutronix.de>
> But it's no more relevant. I removed the possiblibity to write not page 
> aligned data to NAND. 


Ok, But what I have to do with this, 
 JFFS2 still trying to write not sector alligned data:
debian:~# rm /mnt/nand/a*
nand_read_ecc: from = 0x0000c800, len = 16
nand_read_ecc: from = 0x0000c834, len = 16
nand_read_ecc: from = 0x0000c868, len = 16
nand_read_ecc: from = 0x0000c89c, len = 16
nand_read_ecc: from = 0x0000c8d8, len = 16
nand_read_ecc: from = 0x0000c910, len = 16
nand_read_ecc: from = 0x00198000, len = 1052
nand_write_ecc: to = 0x0000c940, len = 1052
nand_write_ecc: Attempt to write not page aligned data
				nand_write_ecc()
				nand_write()
				part_write()
    call satck 			jffs2_flash_write()
        			jffs2_garbage_collect_pristine()
				jffs2_garbage_collect_live()
				jffs2_garbage_collect_pass()
				jffs2_garbage_collect_thread ()
							
Write of 1052 bytes at 0x0000c940 failed. returned -22, retlen 1052
nand_read_ecc: from = 0x00198000, len = 1052
nand_write_ecc: to = 0x0000cd5c, len = 1052
nand_write_ecc: Attempt to write not page aligned data
Write of 1052 bytes at 0x0000cd5c failed. returned -22, retlen 1052
nand_read_ecc: from = 0x0000d178, len = 16
jffs2_flash_writev(): Non-contiguous write to 0000d178
wbuf was previously 0000c800-0000c93f
kernel BUG at wbuf.c:282!
Oops: Exception in kernel mode, sig: 4

Call backtrace:

jffs2_flash_writev
jffs2_write_dirent
jffs2_do_unlink
jffs2_unlink
vfs_unlink
ret_from_syscall_1

Alex
