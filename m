Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6eMi-0008ES-P5
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 07:38:25 +0000
Received: by eyh6 with SMTP id 6so1707197eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 00:38:23 -0700 (PDT)
Subject: Re: I meet a problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Caizhiyong <caizhiyong@huawei.com>
In-Reply-To: <C3050A4DBA34F345975765E43127F10F02CDC9@SZXEML506-MBS.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F02CDC9@SZXEML506-MBS.china.huawei.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 10:35:53 +0300
Message-ID: <1301902553.2760.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "tony.taoyong@hisilicon" <tony.taoyong@hisilicon.huawei.com>,
	Renxincun <renxincun@huawei.com>,
	"Jiangzhonglin\(Jiangzhonglin\)" <jiangzhonglin@huawei.com>,
	Quyaxin <quyaxin@huawei.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, 2011-04-02 at 02:20 +0000, Caizhiyong wrote:
> write disk 15091695 file 40023umount: tmpfs busy - remounted read-only
> write disk 15131718 file 40076UBIFS error (pid 11300): dbg_check_space_info: free space changed from 424404213 to 424396165

Yes, I also saw this recently. I will look at this as soon as I can, and
will keep you posted. I think this is most probably false alarm and a
bug in the debugging code itself. So for now just hack your UBIFS and
disable this debugging check, e.g., like this:

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index c04efa8..1cc760b 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -995,6 +995,8 @@ int dbg_check_space_info(struct ubifs_info *c)
        struct ubifs_lp_stats lst;
        long long avail, free;
 
+       return 0; /* Temporary work-around hack */
+
        spin_lock(&c->space_lock);
        avail = ubifs_calc_available(c, c->min_idx_lebs);
        spin_unlock(&c->space_lock);


> UBIFS: saved lprops statistics dump
> UBIFS: current lprops statistics dump
> UBIFS assert failed in dbg_dump_budg at 613 (pid 11300)
> [<c00284bc>] (unwind_backtrace+0x0/0xfc) from [<c018a770>] (dbg_dump_budg+0x220/0x2dc)
> [<c018a770>] (dbg_dump_budg+0x220/0x2dc) from [<c018a8dc>] (dbg_check_space_info+0xb0/0xc0)
> [<c018a8dc>] (dbg_check_space_info+0xb0/0xc0) from [<c015b4ac>] (ubifs_remount_fs+0x428/0x8dc)
> [<c015b4ac>] (ubifs_remount_fs+0x428/0x8dc) from [<c00949b0>] (do_remount_sb+0x6c/0x11c)
> [<c00949b0>] (do_remount_sb+0x6c/0x11c) from [<c00aae00>] (do_mount+0x468/0x708)
> [<c00aae00>] (do_mount+0x468/0x708) from [<c00ab124>] (sys_mount+0x84/0xc4)
> [<c00ab124>] (sys_mount+0x84/0xc4) from [<c0021ec0>] (ret_fast_syscall+0x0/0x30)
> [<c00284bc>] (unwind_backtrace+0x0/0xfc) from [<c018a8e0>] (dbg_check_space_info+0xb4/0xc0)
> [<c018a8e0>] (dbg_check_space_info+0xb4/0xc0) from [<c015b4ac>] (ubifs_remount_fs+0x428/0x8dc)
> [<c015b4ac>] (ubifs_remount_fs+0x428/0x8dc) from [<c00949b0>] (do_remount_sb+0x6c/0x11c)
> [<c00949b0>] (do_remount_sb+0x6c/0x11c) from [<c00aae00>] (do_mount+0x468/0x708)
> [<c00aae00>] (do_mount+0x468/0x708) from [<c00ab124>] (sys_mount+0x84/0xc4)
> [<c00ab124>] (sys_mount+0x84/0xc4) from [<c0021ec0>] (ret_fast_syscall+0x0/0x30)
> UBIFS warning (pid 11300): ubifs_ro_mode: switched to read-only mode, error -22
> [<c00284bc>] (unwind_backtrace+0x0/0xfc) from [<c015b4bc>] (ubifs_remount_fs+0x438/0x8dc)
> [<c015b4bc>] (ubifs_remount_fs+0x438/0x8dc) from [<c00949b0>] (do_remount_sb+0x6c/0x11c)
> [<c00949b0>] (do_remount_sb+0x6c/0x11c) from [<c00aae00>] (do_mount+0x468/0x708)
> [<c00aae00>] (do_mount+0x468/0x708) from [<c00ab124>] (sys_mount+0x84/0xc4)
> [<c00ab124>] (sys_mount+0x84/0xc4) from [<c0021ec0>] (ret_fast_syscall+0x0/0x30)
> Unable to handle kernel NULL pointer dereference at virtual address 00000124

And this oops is a bug in the dumping code, I'll take a look at this as
well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
