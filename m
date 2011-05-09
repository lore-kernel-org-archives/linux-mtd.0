Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QJUTS-0004FV-Hy
	for linux-mtd@lists.infradead.org; Mon, 09 May 2011 17:42:27 +0000
Message-ID: <4DC8264C.5080204@wi.rr.com>
Date: Mon, 09 May 2011 12:37:16 -0500
From: Rick Johnson <rick22@wi.rr.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: fsl_elbc_nand.c reading address -1
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm posting this for a co-worker:


we have a problem where the bad block table is becoming corrupted on our 
nand.
it is happening in linux.
while looking for places to put in debug I came across this:

         /* Read back the page in order to fill in the ECC for the
          * caller.  Is this really needed?
          */
         if (full_page && elbc_fcm_ctrl->oob_poi) {
             if(page_addr > 0x7FF00 || page_addr < 0) {
                 printk(KERN_ERR "HI MIKE PAGEPROG2 %x\n", page_addr);
                 BUG();
             }
             out_be32(&lbc->fbcr, 3);
             set_addr(mtd, 6, page_addr, 1);

             elbc_fcm_ctrl->read_bytes = mtd->writesize + 9;



that BUG of mine goes off. pageaddr = -1 at that point
this actually happens a LOT if I remove the BUG.

if I comment out that block of code whose necessity was questioned the 
corruption SEEMS to stop, and everything works fine.
BUT: it takes quite a while to happen, so it takes even longer to 
determine that it isn't happening. Seems gone.

my question is:
a) am I correct that reading a -1 address is wrong.
b) IS that code (the return ECC) really needed? i.e. is this worth 
figuring out a fix for.

Thanks,
Mike.

HI MIKE PAGEPROG2 ffffffff
------------[ cut here ]------------
kernel BUG at drivers/mtd/nand/fsl_elbc_nand.c:473!
Oops: Exception in kernel mode, sig: 5 [#1]
MPC831x RDB
last sysfs file:
NIP: c01c3f20 LR: c01c3f20 CTR: c019422c
REGS: c782db90 TRAP: 0700   Not tainted  (2.6.37)
MSR: 00029032 <EE,ME,CE,IR,DR>  CR: 22044082  XER: 20000000
TASK = c782a000[1] 'swapper' THREAD: c782c000
GPR00: c01c3f20 c782dc40 c782a000 00000021 00002228 ffffffff c0194d08 
00000000
GPR08: c03b1f98 c03a7358 c03b2440 00000000 0000437d 1008e248 00000002 
c795f800
GPR16: 00000000 00000000 00032e45 0000003f ffffffff 00000000 00000000 
00000040
GPR24: c795f800 00032e45 00000800 c9014000 c7863990 00000001 c7863800 
c78b8c60
NIP [c01c3f20] fsl_elbc_cmdfunc+0x390/0x520
LR [c01c3f20] fsl_elbc_cmdfunc+0x390/0x520
Call Trace:
[c782dc40] [c01c3f20] fsl_elbc_cmdfunc+0x390/0x520 (unreliable)
[c782dc70] [c01bd934] nand_write_page+0x90/0x108
[c782dc90] [c01be018] nand_do_write_ops+0x2f0/0x3b8
[c782dce0] [c01be29c] nand_write+0xc0/0x108
[c782dd10] [c01a7014] part_write+0xa0/0xb8
[c782dd20] [c01cc460] ubi_io_write+0x94/0xf4
[c782dd50] [c01cb598] ubi_eba_write_leb+0xcc/0x650
[c782ddb0] [c01c9f04] ubi_leb_write+0xe8/0x10c
[c782ddc0] [c0111aec] ubifs_write_node+0x80/0xe0
[c782ddf0] [c0115d00] ubifs_write_master+0xcc/0x164
[c782de10] [c010efa0] ubifs_mount+0xc84/0x115c
[c782dea0] [c0087220] vfs_kern_mount+0x78/0x150
[c782ded0] [c0087354] do_kern_mount+0x4c/0x114
[c782df00] [c00a13e4] do_mount+0x6d8/0x75c
[c782df50] [c00a1508] sys_mount+0xa0/0xf8
[c782df80] [c0342ef4] mount_block_root+0x130/0x2dc
[c782dfd0] [c03431c0] prepare_namespace+0xb0/0x1e8
[c782dfe0] [c0342464] kernel_init+0x150/0x170
[c782dff0] [c000f0f0] kernel_thread+0x4c/0x68
Instruction dump:
419e00d8 801f0054 2f800000 419e00cc 3c000007 6000ff00 7f850040 40bd001c
3c60c033 7ca42b78 3863c71d 4810a06d <0fe00000> 48000000 38000003 7c0004ac
---[ end trace 3cd434cd9d66adcc ]---
Kernel panic - not syncing: Attempted to kill init!
Call Trace:
[c782d990] [c00086c0] show_stack+0x7c/0x194 (unreliable)
[c782d9d0] [c02cde58] panic+0xb8/0x1e8
[c782da20] [c00218f4] do_exit+0x88/0x5a8
[c782da70] [c000d294] kernel_bad_stack+0x0/0x4c
[c782da90] [c000d440] _exception+0x68/0x128
[c782db80] [c000f918] ret_from_except_full+0x0/0x4c
--- Exception: 700 at fsl_elbc_cmdfunc+0x390/0x520
     LR = fsl_elbc_cmdfunc+0x390/0x520
[c782dc70] [c01bd934] nand_write_page+0x90/0x108
[c782dc90] [c01be018] nand_do_write_ops+0x2f0/0x3b8
[c782dce0] [c01be29c] nand_write+0xc0/0x108
[c782dd10] [c01a7014] part_write+0xa0/0xb8
[c782dd20] [c01cc460] ubi_io_write+0x94/0xf4
[c782dd50] [c01cb598] ubi_eba_write_leb+0xcc/0x650
[c782ddb0] [c01c9f04] ubi_leb_write+0xe8/0x10c
[c782ddc0] [c0111aec] ubifs_write_node+0x80/0xe0
[c782ddf0] [c0115d00] ubifs_write_master+0xcc/0x164
[c782de10] [c010efa0] ubifs_mount+0xc84/0x115c
[c782dea0] [c0087220] vfs_kern_mount+0x78/0x150
[c782ded0] [c0087354] do_kern_mount+0x4c/0x114
[c782df00] [c00a13e4] do_mount+0x6d8/0x75c
[c782df50] [c00a1508] sys_mount+0xa0/0xf8
[c782df80] [c0342ef4] mount_block_root+0x130/0x2dc
[c782dfd0] [c03431c0] prepare_namespace+0xb0/0x1e8
[c782dfe0] [c0342464] kernel_init+0x150/0x170
[c782dff0] [c000f0f0] kernel_thread+0x4c/0x68
Rebooting in 180 seconds..
