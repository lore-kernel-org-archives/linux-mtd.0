Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvKUB-0006HK-1k
 for linux-mtd@lists.infradead.org; Mon, 01 Dec 2014 06:29:28 +0000
From: <chenjie6@huawei.com>
To: <linux-mtd@lists.infradead.org>, <David.Woodhouse@intel.com>
Subject: | [PATCH] jffs2: bug fix of rename when jffs2_do_unlink failed
Date: Mon, 1 Dec 2014 22:25:07 +0800
Message-ID: <1417443907-25150-1-git-send-email-chenjie6@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: lizefan@huawei.com, zengweilin@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: chenjie <chenjie6@huawei.com>

when jffs2_do_unlink return error will lead the jffs2 panic 
Testcase 
"touch a b; mv a b" when jffs2_do_unlink return error

jffs2_rename(): Link succeeded, unlink failed (err -4). You now have a hard link
------------[ cut here ]------------
kernel BUG at fs/dcache.c:1018!
Oops: Exception in kernel mode, sig: 5 [#1]
PREEMPT SMP NR_CPUS=4 LTT NESTING LEVEL : 0 
P2041 RDB
last sysfs file: /sys/devices/virtual/kbox/kbox/dev
Modules linked in: xt_tcpudp x_tables ip_tables ipt_REJECT iptable_filter 
i2c_mpc rtc_lib rtc_core rtc_ds3232 xgmac_mdio(P) 
fsl_mac fsl_oh fsl_dpaa cpld wdt kbox ddrramdriver rtos_kbox_panic rsm [last unloaded: hello]
NIP: c0132b8c LR: c02051ec CTR: 0000001e
REGS: ca4d9d10 TRAP: 0700   Tainted: P            (2.6.34.13)
MSR: 00029002 <EE,ME,CE>  CR: 28828428  XER: 20000000
TASK = cb48c380[19475] 'rename14' THREAD: ca4d8000 CPU: 2
GPR00: 00000001 ca4d9dc0 cb48c380 c8aea360 c8969078 c0680ee8 ebc01dcc 61206861 
GPR08: 00021002 c8968e40 cb48c380 0129f000 28828424 1001915c 100cf6e0 100cf7bc 
GPR16: 00000000 10131d08 00000000 00000000 10151f08 10157c08 c5eb1518 10151f08 
GPR24: fffffffc cbcfae00 000d8e52 c5eb1518 c8968de0 c8aea360 c8969078 c8aea360 
NIP [c0132b8c] d_instantiate+0x2c/0x80
LR [c02051ec] jffs2_rename+0x29c/0x2e0
Call Trace:
[ca4d9dc0] [cb48c380] 0xcb48c380 (unreliable)
[ca4d9de0] [c02051ec] jffs2_rename+0x29c/0x2e0
[ca4d9e10] [c0128908] vfs_rename+0x488/0x4f0
[ca4d9e50] [c012ad48] sys_renameat+0x1f8/0x210
[ca4d9f40] [c0010b70] ret_from_syscall+0x0/0x4
--- Exception: c01 at 0xfe95d5c
    LR = 0x1000088c
Instruction dump:
60000000 9421ffe0 7c0802a6 bfa10014 7c7f1b78 90010024 3803004c 7c9e2378 
8123004c 7f890000 38000001 7c00079e <0f000000> 3fa0c06b 3bbd4ac0 7fa3eb78 
Kernel panic - not syncing: Fatal exception
Call Trace:
[ca4d9b10] [c0007970] show_stack+0x50/0x160 (unreliable)
[ca4d9b40] [c04f4db4] panic+0x12c/0x1ac
[ca4d9b90] [c000e65c] die+0x14c/0x230
[ca4d9bc0] [c000ea10] _exception+0x150/0x270
[ca4d9cd0] [c04ee800] program_check_exception+0xb0/0x660
[ca4d9d00] [c0011174] ret_from_except_full+0x0/0x4c
--- Exception: 700 at d_instantiate+0x2c/0x80
    LR = jffs2_rename+0x29c/0x2e0
[ca4d9dc0] [cb48c380] 0xcb48c380 (unreliable)
[ca4d9de0] [c02051ec] jffs2_rename+0x29c/0x2e0
[ca4d9e10] [c0128908] vfs_rename+0x488/0x4f0
[ca4d9e50] [c012ad48] sys_renameat+0x1f8/0x210
[ca4d9f40] [c0010b70] ret_from_syscall+0x0/0x4

Cc: <stable@vger.kernel.org> 
Signed-off-by: Chen Jie <chenjie6@huawei.com>

---
 fs/jffs2/dir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 9385560..feb0213 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -846,7 +846,8 @@ static int jffs2_rename (struct inode *old_dir_i, struct dentry *old_dentry,
 		pr_notice("%s(): Link succeeded, unlink failed (err %d). You now have a hard link\n",
 			  __func__, ret);
 		/* Might as well let the VFS know */
-		d_instantiate(new_dentry, old_dentry->d_inode);
+		if (list_empty(&new_dentry->d_alias))
+			d_instantiate(new_dentry, old_dentry->d_inode);
 		ihold(old_dentry->d_inode);
 		new_dir_i->i_mtime = new_dir_i->i_ctime = ITIME(now);
 		return ret;
-- 
1.8.0
