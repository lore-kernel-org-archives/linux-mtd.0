Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6ktd-0003EZ-Ak
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 14:36:53 +0000
Received: by wwb39 with SMTP id 39so4792078wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 07:36:47 -0700 (PDT)
Subject: Re: I meet a problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Caizhiyong <caizhiyong@huawei.com>
In-Reply-To: <C3050A4DBA34F345975765E43127F10F02CDC9@SZXEML506-MBS.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F02CDC9@SZXEML506-MBS.china.huawei.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 17:34:14 +0300
Message-ID: <1301927654.2760.92.camel@localhost>
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

On Sat, 2011-04-02 at 02:20 +0000, Caizhiyong wrote:
> write disk 15091695 file 40023umount: tmpfs busy - remounted read-only
> write disk 15131718 file 40076UBIFS error (pid 11300):
> dbg_check_space_info: free space changed from 424404213 to 424396165

Too bad you did not send the dmesg output, as it is described in the
"how to send UBIFS bug report" here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport

Anyway, yes, I confirm that this very first error in
'dbg_check_space_info()' is false alarm. I'll send a fix for this soon.
But my fix is against the current ubifs-2.6.git tree, although you
should be able to port it to 2.6.38 tree.

> UBIFS: saved lprops statistics dump
> UBIFS: current lprops statistics dump
> UBIFS assert failed in dbg_dump_budg at 613 (pid 11300)

However this is _very_ strange. This assertion is:

ubifs_assert(spin_is_locked(&c->space_lock));

and if I look at 'dbg_check_space_info()' I see that it must be locked:

spin_lock(&c->space_lock);
dbg_dump_budg(c);
spin_unlock(&c->space_lock);

So the second assertion and the subsequent oopses are really really
strange. Could you try to emulate the error case in
'dbg_check_space_info()' and check how the subsequent assertion may
happen?

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

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
