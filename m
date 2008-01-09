Date: Wed, 9 Jan 2008 15:37:14 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: dedekind@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH][UBIFS] Fix mount oops with wrong name
Message-ID: <20080109063714.GA28810@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: ext-adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Also remove white space

/ # mount -t ubifs ubiubifs /tmp
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c783c000
[00000000] *pgd=8786d031, *pte=00000000, *ppte=00000000
Internal error: Oops: 17 [#1]
Modules linked in: ubifs ubi
CPU: 0    Not tainted  (2.6.23 #15)
PC is at ubi_get_volume_info+0xc/0x84 [ubi]
LR is at ubifs_get_sb+0x4c0/0xfe4 [ubifs]
pc : [<bf0038c8>]    lr : [<bf017f58>]    psr: 60000013
sp : c783bcfc  ip : c783bd10  fp : c783bd0c
r10: bf03dc70  r9 : c7e1d000  r8 : c7e1d37c
r7 : c7e1d374  r6 : c7e1d0a0  r5 : c02b0534  r4 : 00000000
r3 : 00000002  r2 : 00000075  r1 : c7e1d330  r0 : 00000000
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
Control: 00c5387f  Table: 8783c000  DAC: 00000015
Process mount (pid: 283, stack limit = 0xc783a258)
Stack: (0xc783bcfc to 0xc783c000)
Backtrace:
[<bf0038bc>] (ubi_get_volume_info+0x0/0x84 [ubi]) from [<bf017f58>] (ubifs_get_)
 r4:00000000
[<bf017a98>] (ubifs_get_sb+0x0/0xfe4 [ubifs]) from [<c0083c10>] (vfs_kern_mount)
[<c0083bb0>] (vfs_kern_mount+0x0/0xc0) from [<c0083cb8>] (do_kern_mount+0x48/0x)
 r8:c7f4b000 r7:bf03d66c r6:c7899000 r5:c78ee000 r4:00000000
[<c0083c70>] (do_kern_mount+0x0/0xf4) from [<c0099d24>] (do_mount+0x604/0x640)
 r8:00000000 r7:00000000 r6:c7f97000 r5:c78ee000 r4:00000000
[<c0099720>] (do_mount+0x0/0x640) from [<c009a078>] (sys_mount+0xa4/0xec)
[<c0099fd4>] (sys_mount+0x0/0xec) from [<c001ee40>] (ret_fast_syscall+0x0/0x2c)
 r7:00000015 r6:00000000 r5:c0ed0000 r4:00084050
Code: bf012734 e1a0c00d e92dd810 e24cb004 (e5900000)

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/fs/ubifs/build.c b/fs/ubifs/build.c
index 6609e49..82b8f70 100644
--- a/fs/ubifs/build.c
+++ b/fs/ubifs/build.c
@@ -323,7 +323,7 @@ static int alloc_wbufs(struct ubifs_info *c)
 		if (err)
 			return err;
 
-		c->jheads[i].wbuf.sync_callback =  &bud_wbuf_callback;
+		c->jheads[i].wbuf.sync_callback = &bud_wbuf_callback;
 		c->jheads[i].wbuf.jhead = i;
 	}
 
@@ -962,10 +962,12 @@ static int open_ubi(struct ubifs_info *c, const char *name, int mode)
 			c->ubi = ubi_open_volume_nm(dev, ++endptr, mode);
 			if (IS_ERR(c->ubi))
 				return PTR_ERR(c->ubi);
-		} else
-			return -EINVAL;
+		}
 	}
 
+	if (!c->ubi)
+		return -EINVAL;
+
 	ubi_get_volume_info(c->ubi, &c->vi);
 	ubi_get_device_info(c->vi.ubi_num, &c->di);
 	return 0;
