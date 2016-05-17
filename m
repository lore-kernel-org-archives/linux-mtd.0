Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2gmL-0003Eh-Dc
 for linux-mtd@lists.infradead.org; Tue, 17 May 2016 15:19:26 +0000
Received: by mail-lf0-x241.google.com with SMTP id y84so1421585lfc.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 May 2016 08:19:04 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 17 May 2016 16:19:02 +0100
Message-ID: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
Subject: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
From: Martin Townsend <mtownsend1973@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've just seen the following UBIFS assert which relates to
ubifs_remount_fs in fs/ubifs/super.c
We have a read only root filesystem and it looks like this problem
occurs after rebooting the board when the root filesystem has been
remounted as as r/w, I use the following command to do this in case
I'm doing this incorrectly.
mount -o remount,rw /
The only way to stop it is to login and run
mount -o remount,rw /
mount -o remount,ro /
and then reboots do not assert.

I've tried a few times now and can happily reproduce it.

Any ideas on how to fix this?

Many Thanks,
Martin.

May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: UBIFS assert
failed in ubifs_remount_fs at 1869 (pid 108)
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: CPU: 0 PID: 108
Comm: mount Not tainted 4.1.18-g6b41ca0b94 #1
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: Hardware name:
Generic AM43 (Flattened Device Tree)
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: Backtrace:
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel:
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: [<c0013398>]
(dump_backtrace) from [<c00135b8>] (show_stack+0x18/0x1c)
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel:  r7:00000000
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel:  r6:ee327ee4
r5:00000000 r4:ee01a000
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: [<c00135a0>]
(show_stack) from [<c060006c>] (dump_stack+0x20/0x28)
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: [<c060004c>]
(dump_stack) from [<c029ba4c>] (ubifs_remount_fs+0x558/0x800)
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: [<c029b4f4>]
(ubifs_remount_fs) from [<c013e1e0>] (do_remount_sb+0x6c/0x1d8)
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel:  r9:ee0dfc40
r8:00000000 r7:00000000 r6:00000000 r5:00000000 r4:ee0dfc00
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: [<c013e174>]
(do_remount_sb) from [<c015d69c>] (do_mount+0x80c/0xcd0)
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel:  r8:00000021
r7:ee0dfc00 r6:ee0fe0d0 r5:00000060 r4:00000000
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: [<c015ce90>]
(do_mount) from [<c015dee4>] (SyS_mount+0x9c/0xc8)
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel:  r10:00000000
r9:ee326000 r8:c0ed0021 r7:7f62d700 r6:00000000 r5:ee31d280
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel:  r4:ee31d240
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel: [<c015de48>]
(SyS_mount) from [<c000f920>] (ret_fast_syscall+0x0/0x3c)
May 17 14:54:44 am43-controller-aquila-1bf6b1 kernel:  r8:c000fac4
r7:00000015 r6:7f62d6f0 r5:00000000 r4:00000000
