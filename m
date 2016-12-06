Received: from mail-yb0-x236.google.com ([2607:f8b0:4002:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cE9wN-0004T7-98
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 07:13:32 +0000
Received: by mail-yb0-x236.google.com with SMTP id v78so64813048ybe.3
 for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2016 23:13:06 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?5p2O56OK?= <rockdotlee@gmail.com>
Date: Tue, 6 Dec 2016 15:13:05 +0800
Message-ID: <CAL-1w2vQHnuDmo-5bsE=Lc-uPpVy4vPU7tNmwkcEasB9uvAZ3A@mail.gmail.com>
Subject: UBIFS crash in power cutting test
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

Hi, there:
    I'm doing a random power cutting test(just copy and delete files),
but got ubifs crash frequently, the rate is about 20%,
is anyone has any hint about this? BTW, the kernel is 3.18.31, here is the log.

[   25.854498] UBIFS DBG lp (pid 349): LEB 50, free 0, dirty 238488, flags 1
[   25.861248] UBIFS DBG lp (pid 349): LEB 50, free -2147483647, dirty
238568, flags 1
[   25.868868] UBIFS DBG lp (pid 349): LEB 50, free 0, dirty 238488, flags 1
[   25.875661] UBIFS DBG tnc (pid 349): ino 75997
[   25.880082] UBIFS DBG tnc (pid 349): (lowest) (75997, xentry, 0x000000)
[   25.886576] UBIFS DBG tnc (pid 349): search key (75997, xentry, 0x000000)
[   25.893281] UBIFS DBG tnc (pid 349): found 0, lvl 0, n 0
[   25.898559] UBIFS DBG io (pid 349): LEB 50:196608, xentry node,
length 73, jhead 1 (base)
[   25.906734] UBIFS DBG io (pid 349): LEB 50:196608, xentry node, length 73
[   25.919996] UBIFS error (ubi3:0 pid 349): ubifs_read_node: bad node
type (2 but expected 3)
[   25.928350] UBIFS error (ubi3:0 pid 349): ubifs_read_node: bad node
at LEB 50:196608, LEB mapping status 1
[   25.937979] magic          0x6101831
[   25.941625] crc            0xc1c19beb
[   25.945341] node_type      2 (direntry node)
[   25.949681] group_type     1 (in node group)
[   25.954041] sqnum          676362
[   25.957406] len            75
[   25.960465] key            (75729, direntry, 0x1feecdb6)
[   25.965826] inum           0
[   25.968777] type           2
[   25.971758] nlen           18
[   25.974765] name           SecureTrust_CA.peR
[   25.979334] CPU: 0 PID: 349 Comm: mount Not tainted 3.18.31 #2
[   25.985403] [<c0014b68>] (unwind_backtrace) from [<c0012014>]
(show_stack+0x10/0x14)
[   25.992856] [<c0012014>] (show_stack) from [<c02015d8>]
(ubifs_read_node+0x2c0/0x2f8)
[   26.000672] [<c02015d8>] (ubifs_read_node) from [<c021d744>]
(ubifs_tnc_read_node+0x58/0x1c0)
[   26.009151] [<c021d744>] (ubifs_tnc_read_node) from [<c0202448>]
(tnc_read_node_nm+0xb4/0x1b8)
[   26.017767] [<c0202448>] (tnc_read_node_nm) from [<c02057ec>]
(ubifs_tnc_next_ent+0x1b4/0x220)
[   26.026361] [<c02057ec>] (ubifs_tnc_next_ent) from [<c02058c4>]
(ubifs_tnc_remove_ino+0x6c/0x17c)
[   26.035216] [<c02058c4>] (ubifs_tnc_remove_ino) from [<c020854c>]
(ubifs_replay_journal+0xe74/0x1540)
[   26.044532] [<c020854c>] (ubifs_replay_journal) from [<c01fd794>]
(ubifs_mount+0xbe8/0x15dc)
[   26.052840] [<c01fd794>] (ubifs_mount) from [<c00fa410>]
(mount_fs+0x6c/0x164)
[   26.060018] [<c00fa410>] (mount_fs) from [<c010ff90>]
(vfs_kern_mount+0x4c/0xe0)
[   26.067437] [<c010ff90>] (vfs_kern_mount) from [<c0112f34>]
(do_mount+0x934/0xa38)
[   26.074910] [<c0112f34>] (do_mount) from [<c0113258>] (SyS_mount+0x70/0x9c)
[   26.081826] [<c0113258>] (SyS_mount) from [<c000e740>]
(ret_fast_syscall+0x0/0x38)
[   26.089541] UBIFS DBG tnc (pid 349): key (75997, xentry, 0x5edc87e)
[   26.096045] UBIFS (ubi3:0): background thread "ubifs_bgt3_0" stops
mount: mounting /dev/ubi3_0 on /mnt/flash failed: Invalid argument
