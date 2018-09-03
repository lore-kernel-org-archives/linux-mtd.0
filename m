Received: from mail-io0-f200.google.com ([209.85.223.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fwvLX-0003IL-1W
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2018 20:21:17 +0000
Received: by mail-io0-f200.google.com with SMTP id r206-v6so1289573iod.2
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2018 13:21:03 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 03 Sep 2018 13:21:02 -0700
Message-ID: <000000000000b9d0190574fd4752@google.com>
Subject: general protection fault in ubifs_mount
From: syzbot <syzbot+38bd0f7865e5c6379280@syzkaller.appspotmail.com>
To: adrian.hunter@intel.com, dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, richard@nod.at,
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

syzbot found the following crash on:

HEAD commit:    3d18c2437944 Add linux-next specific files for 20180830
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1318892e400000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a059d319ef7d83f6
dashboard link: https://syzkaller.appspot.com/bug?extid=38bd0f7865e5c6379280
compiler:       gcc (GCC) 8.0.1 20180413 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1720651e400000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=109f4cb2400000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+38bd0f7865e5c6379280@syzkaller.appspotmail.com

random: sshd: uninitialized urandom read (32 bytes read)
random: sshd: uninitialized urandom read (32 bytes read)
random: sshd: uninitialized urandom read (32 bytes read)
kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 0 PID: 4750 Comm: syz-executor794 Not tainted  
4.19.0-rc1-next-20180830+ #52
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:open_ubi fs/ubifs/super.c:1964 [inline]
RIP: 0010:ubifs_mount+0x1a0/0x66f0 fs/ubifs/super.c:2152
Code: 49 89 c7 48 89 c6 e8 5f 10 0f ff 49 81 ff 00 f0 ff ff 0f 86 91 03 00  
00 e8 1d 0f 0f ff 48 89 d8 48 89 da 48 c1 e8 03 83 e2 07 <42> 0f b6 04 28  
38 d0 7f 08 84 c0 0f 85 1e 19 00 00 44 0f b6 2b bf
RSP: 0018:ffff8801d8637660 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff826db8c1
RDX: 0000000000000000 RSI: ffffffff826db8d3 RDI: 0000000000000007
RBP: ffff8801d8637b88 R08: ffff8801d876c680 R09: ffffed003b6046de
R10: ffffed003b6046de R11: ffff8801db0236f3 R12: ffff8801d8637b60
R13: dffffc0000000000 R14: ffff8801cae55948 R15: ffffffffffffffea
FS:  00000000016fa880(0000) GS:ffff8801db000000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000040 CR3: 00000001b4516000 CR4: 00000000001406f0
Call Trace:
  legacy_get_tree+0x131/0x460 fs/fs_context.c:732
  vfs_get_tree+0x1cb/0x5c0 fs/super.c:1746
  do_new_mount fs/namespace.c:2627 [inline]
  do_mount+0x6f9/0x1e30 fs/namespace.c:2951
  ksys_mount+0x12d/0x140 fs/namespace.c:3167
  __do_sys_mount fs/namespace.c:3181 [inline]
  __se_sys_mount fs/namespace.c:3178 [inline]
  __x64_sys_mount+0xbe/0x150 fs/namespace.c:3178
  do_syscall_64+0x1b9/0x820 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x440029
Code: 18 89 d0 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 fb 13 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fff912a7cb8 EFLAGS: 00000207 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 0000000000440029
RDX: 0000000020000040 RSI: 0000000020d78000 RDI: 0000000020fb6000
RBP: 00000000006ca018 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000207 R12: 00000000004018b0
R13: 0000000000401940 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
Dumping ftrace buffer:
    (ftrace buffer empty)
---[ end trace 9dcb736f966f3063 ]---
RIP: 0010:open_ubi fs/ubifs/super.c:1964 [inline]
RIP: 0010:ubifs_mount+0x1a0/0x66f0 fs/ubifs/super.c:2152
Code: 49 89 c7 48 89 c6 e8 5f 10 0f ff 49 81 ff 00 f0 ff ff 0f 86 91 03 00  
00 e8 1d 0f 0f ff 48 89 d8 48 89 da 48 c1 e8 03 83 e2 07 <42> 0f b6 04 28  
38 d0 7f 08 84 c0 0f 85 1e 19 00 00 44 0f b6 2b bf
RSP: 0018:ffff8801d8637660 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff826db8c1
RDX: 0000000000000000 RSI: ffffffff826db8d3 RDI: 0000000000000007
RBP: ffff8801d8637b88 R08: ffff8801d876c680 R09: ffffed003b6046de
R10: ffffed003b6046de R11: ffff8801db0236f3 R12: ffff8801d8637b60
R13: dffffc0000000000 R14: ffff8801cae55948 R15: ffffffffffffffea
FS:  00000000016fa880(0000) GS:ffff8801db000000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000040 CR3: 00000001b4516000 CR4: 00000000001406f0


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#bug-status-tracking for how to communicate with  
syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
