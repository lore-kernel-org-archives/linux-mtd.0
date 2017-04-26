Received: from mail.aswsp.com ([193.34.35.150])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3Her-000570-0v
 for linux-mtd@lists.infradead.org; Wed, 26 Apr 2017 07:46:43 +0000
From: Jimmy Perchet <jimmy.perchet@parrot.com>
Subject: Mount empty UBI volume attached via fastmap may not work
To: <linux-mtd@lists.infradead.org>, <richard@nod.at>
Message-ID: <d3e236cf-fb7b-af59-b4ed-0eb59739da23@parrot.com>
Date: Wed, 26 Apr 2017 09:46:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I ran into a problem I'd like to share. If Fastmap is used and if an
unclean shutdown happens after a volume has been truncated, the
subsequent mounts will fail, even though the status is 'OK'.
In this case, UBIFS does not seem to see the volume as empty
and fails with the following log :

UBIFS error (ubi0:0 pid 9258): ubifs_read_node [ubifs]: bad node type 
(255 but expected 6)
UBIFS error (ubi0:0 pid 9258): ubifs_read_node [ubifs]: bad node at LEB 
0:0, LEB mapping status 1
Not a node, first 24 bytes:
00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ........................
CPU: 0 PID: 9258 Comm: mount Tainted: G           OE 4.9.0-2-amd64 #1 
Debian 4.9.13-1
Hardware name: Hewlett-Packard HP Compaq 8200 Elite SFF PC/1495, BIOS 
J01 v02.06 06/09/2011
  0000000000000000 ffffffff9d928594 0000000000000000 ffff8abc0e07c000
  ffffffffc0d18686 ffff8abc85800300 ffffffff9d7dd937 ffff8abbba252000
  ffff8abc0e07c000 ffff8abb53b5c4c0 ffff8abc0e07c008 0000000000000000
Call Trace:
  [<ffffffff9d928594>] ? dump_stack+0x5c/0x78
  [<ffffffffc0d18686>] ? ubifs_read_node+0x256/0x2e0 [ubifs]
  [<ffffffff9d7dd937>] ? cache_grow_end+0xa7/0xc0
  [<ffffffffc0d15492>] ? ubifs_read_sb_node+0x52/0x70 [ubifs]
  [<ffffffffc0d15b5e>] ? ubifs_read_superblock+0x66e/0xe50 [ubifs]
  [<ffffffffc0d13ffb>] ? ubifs_mount+0xb2b/0x1d10 [ubifs]
  [<ffffffff9d7a32ee>] ? pcpu_alloc+0x38e/0x660
  [<ffffffff9d805fd6>] ? mount_fs+0x36/0x150
  [<ffffffff9d822f62>] ? vfs_kern_mount+0x62/0x100
  [<ffffffff9d82564f>] ? do_mount+0x1cf/0xc80
  [<ffffffff9d804001>] ? __fput+0x131/0x1e0
  [<ffffffff9d79dcea>] ? memdup_user+0x4a/0x70
  [<ffffffff9d82642e>] ? SyS_mount+0x7e/0xd0
  [<ffffffff9d603b1c>] ? do_syscall_64+0x7c/0xf0
  [<ffffffff9dbfaf6f>] ? entry_SYSCALL64_slow_path+0x25/0x25

This can be reproduced with nandsim on kernel 4.9.

I think the main explanation is close to the one in this patch :
http://www.spinics.net/lists/stable/msg130317.html
" When attaching via Fastmap [...] UBI can learn the LEB still as
mapped and accessing it returns only 0xFF bytes."

Is my assumption correct ?

Maybe user space should not rely on "auto-create" feature and
always use mkfs.ubifs and update with an empty image ?

Best Regards
Jimmy Perchet
