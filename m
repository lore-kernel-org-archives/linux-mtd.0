Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEgH8-0003CF-2H
 for linux-mtd@lists.infradead.org; Tue, 14 Nov 2017 18:49:37 +0000
Received: by mail-wm0-x236.google.com with SMTP id r68so19117153wmr.0
 for <linux-mtd@lists.infradead.org>; Tue, 14 Nov 2017 10:49:12 -0800 (PST)
Subject: Re: UBIFS does not mount after powerfail
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <5883680.7ftK6mdJzr@blindfold>
 <79c9281e-9622-7aec-b3a2-cf7cec1f1e3f@colorfullife.com>
 <2158047.TxtlGbeyNK@blindfold>
From: Manfred Spraul <manfred@colorfullife.com>
Message-ID: <f84e49bb-a870-c519-6224-cf15dce9ce24@colorfullife.com>
Date: Tue, 14 Nov 2017 19:49:09 +0100
MIME-Version: 1.0
In-Reply-To: <2158047.TxtlGbeyNK@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 11/13/2017 10:06 PM, Richard Weinberger wrote:
>
> No, the image that contains the first logical error.
> UBIFS can mount even if there are many problems with the structure.
> Therefore I need you to enable chk_fs.
Done - and I even found a 2nd instance where the image got bad:
https://sourceforge.net/projects/calculix-rpm/files/ubifs/chk_fs/

Note that the image file 17052.bin contains the operation 0...17051.
And, also probably obvious: I didn't check all images.

0: FUNC_WRITE_CHK(addr=0x8a3000, len=0x800, chk=0x3340ce3e21).
1: FUNC_WRITE_CHK(addr=0x8c3000, len=0x800, chk=0x333fa195e8).
2: FUNC_WRITE_CHK(addr=0x902000, len=0x800, chk=0x34341e02e8).
3: FUNC_WRITE_CHK(addr=0x902800, len=0x800, chk=0x342d493f65).
[...]
17049: FUNC_WRITE_CHK(addr=0xef6000, len=0x800, chk=0x3994208eb4).
17050: FUNC_WRITE_CHK(addr=0x13ec800, len=0x800, chk=0x341c792851).
17051: FUNC_WRITE_CHK(addr=0xef6800, len=0x800, chk=0x34f4bd0ddb).
<<< image-17052.bin: last good.

17052: FUNC_ERASE_CHK(addr=0xa80000, len=0x20000, chk=0x189a1de0000).
<<< image-17053.bin: first bad

[44220.724139] UBIFS (ubi0:0): recovery needed
[44220.734390] UBIFS (ubi0:0): recovery completed
[44220.755927] UBIFS error (ubi0:0 pid 28505): ubifs_read_node: bad node 
type (255 but expected 0)
[44220.757129] UBIFS error (ubi0:0 pid 28505): ubifs_read_node: bad node 
at LEB 142:82472, LEB mapping status 0
[44220.758325] Not a node, first 24 bytes:
[44220.758329] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ........................
[44220.760717] CPU: 3 PID: 28505 Comm: mount Not tainted 4.14.0-rc5+ #105
[44220.761923] Hardware name: Hewlett-Packard HP 350 G2/803A, BIOS F.13 
06/10/2015
[44220.763097] Call Trace:
[44220.764231]  ? dump_stack+0x67/0x8e
[44220.765362]  ? ubifs_read_node+0x240/0x250
[44220.766492]  ? ubifs_tnc_read_node+0x53/0x181
[44220.767623]  ? rcu_read_lock_sched_held+0x5d/0x63
[44220.768764]  ? __kmalloc+0x224/0x267
[44220.769902]  ? check_leaf+0x5a/0x322
[44220.771027]  ? check_leaf+0x74/0x322
[44220.772150]  ? dbg_check_key_order+0x2f1/0x2f1
[44220.773254]  ? dbg_walk_index+0x149/0x26a
[44220.774344]  ? dbg_check_filesystem+0x52/0x2bc
[44220.775430]  ? ubifs_mount+0x1195/0x1ad4


17053: FUNC_WRITE_CHK(addr=0x1440800, len=0x800, chk=0x3337f61989).
[...]
17074: FUNC_WRITE_CHK(addr=0x120b800, len=0x800, chk=0x350157ab97).
17075: FUNC_WRITE_CHK(addr=0x192d800, len=0x800, chk=0x3e964ae864).
<<< last bad: image-17076.bin
17076: FUNC_WRITE_CHK(addr=0x14ef000, len=0x800, chk=0x33520a41bd).
<<< first good: image-17077.bin
17077: FUNC_WRITE_CHK(addr=0x164f000, len=0x800, chk=0x3351c63d66).
[...]
168075: FUNC_WRITE_CHK(addr=0x1253800, len=0x800, chk=0x35d695d6fd).
168076: FUNC_WRITE_CHK(addr=0x1254000, len=0x800, chk=0x3545e92899).
<<< last good: image-168077.bin

168077: FUNC_ERASE_CHK(addr=0x1d00000, len=0x20000, chk=0x43f2cae0000).
<<< first bad: image-168078.bin
[44846.903651] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, 
PID 5106
[44846.903939] UBIFS (ubi0:0): recovery needed
[44846.919364] UBIFS (ubi0:0): recovery completed
[44847.097635] UBIFS error (ubi0:0 pid 5104): dbg_check_filesystem: 
inode 39012 nlink is 1, but calculated nlink is 0
[44847.098877] UBIFS (ubi0:0): dump of the inode 39012 sitting in LEB 
155:63104
[44847.100112]  magic          0x6101831
[44847.101304]  crc            0xbdf8574f
[44847.102470]  node_type      0 (inode node)
[44847.103616]  group_type     2 (last of node group)
[44847.104745]  sqnum          792243
[44847.105840]  len            257
[44847.106924]  key            (39012, inode)
[44847.108000]  creat_sqnum    783767
[44847.109077]  size           97
[44847.110147]  nlink          1
[44847.111215]  atime          1510332948.0
[44847.112277]  mtime          1510332948.0
[44847.113326]  ctime          1510332948.0
[44847.114349]  uid            0
[44847.115350]  gid            0
[44847.116345]  mode           33279
[44847.117310]  flags          0x20
[44847.118247]  xattr_cnt      0
[44847.119159]  xattr_size     0
[44847.120042]  xattr_names    0
[44847.120906]  compr_type     0x1
[44847.121746]  data len       97
[44847.122612] UBIFS error (ubi0:0 pid 5104): dbg_check_filesystem: 
file-system check failed with error -22


Anything else where I can support?

--
     Manfred
