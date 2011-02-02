Received: from mail-out.m-online.net ([212.18.0.10])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pkc7D-0006wq-Hj
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 12:47:21 +0000
Date: Wed, 2 Feb 2011 13:48:12 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 0/7] UBIFS: fix recovery on CFI NOR
Message-ID: <20110202134812.6c8cc619@wker>
In-Reply-To: <1296634917-19335-1-git-send-email-dedekind1@gmail.com>
References: <1296634917-19335-1-git-send-email-dedekind1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Holger Brunck <holger.brunck@keymile.com>, Detlev Zundel <dzu@denx.de>,
	Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed,  2 Feb 2011 10:21:51 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> Hi,
> 
> here is the patch-set against the latest Linux kernel (e.g. 2.6.38-rc3)
> which should fix CFI NOR flash recovery.

Great! Thanks!

> The previous attempt was not entirely successful - it broke backward
> compatibility and was reverted:
> 
> http://marc.info/?l=linux-kernel&m=129631939419818&w=2
> 
> This patch-set goes the following way:
> 1. Incorporates the notion of 'writebufsize' into UBI and UBIFS as
>    'max_write_size', because using term write-buffer would be confusing, as
>    UBIFS has its own write-buffers.
> 2. Changes UBIFS write-buffer and makes it of 'max_write_size', instead of
>    'min_io_size'. This presumably leads to better performance because we
>    accumulate more data and write them in larger chunks and faster.
>    And we do not waste space when synchronizing UBIFS write-buffers because we
>    write only the used amount of bytes aligned to 'min_io_size'. So this is an
>    improvement.
> 3. Tweak UBIFS recovery and make it aware of the fact that we can write in
>    chunks larger than 'min_io_size'. Namely, we can write in 'max_write_size'
>    chunks.
> 
> Could you guys please test this WRT power cuts and let me know if it solves the
> issues?

I'm going to test these patches next days. When using write buffer
size as min_io_size for UBI we still have some issues with UBIFS
recovery while running power cut tests on S29GL512P NOR flash.
Mounting an UBIFS partition fails as there are CRC errors in the
UBIFS data node. A few data bytes following the UBIFS data node
header are corrupted. Sometimes the data node header itself is
corrupted:
...
UBIFS DBG (pid 1416): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1416): ubifs_recover_leb: look at LEB 139:111944 (150072 bytes left)
UBIFS DBG (pid 1416): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1416): ubifs_recover_leb: look at LEB 139:116088 (145928 bytes left)
UBIFS DBG (pid 1416): ubifs_scan_a_node: scanning unknown node
UBIFS DBG (pid 1416): no_more_nodes: unexpected bad common header at 139:116088
UBIFS DBG (pid 1416): ubifs_recover_leb: look at LEB 139:116088 (145928 bytes left)
UBIFS DBG (pid 1416): ubifs_scan_a_node: scanning unknown node
UBIFS error (pid 1416): ubifs_check_node: bad node type 255
UBIFS error (pid 1416): ubifs_check_node: bad node at LEB 139:116088
        magic          0x6101831
        crc            0x46a2df3b
        node_type      255 (unknown node)
        group_type     255 (unknown)
        sqnum          18446744073709551615
        len            4294967295
node type 255 was not recognized
Call Trace:
[df7f3b80] [c0007ecc] show_stack+0x4c/0x16c (unreliable)
[df7f3bc0] [c013e4c8] ubifs_check_node+0x17c/0x308
[df7f3be0] [c0147934] ubifs_scan_a_node+0x15c/0x2d8
[df7f3c10] [c015cd08] ubifs_recover_leb+0x3f0/0x940
[df7f3c80] [c0148244] replay_buds+0xb4/0xb4c
[df7f3d20] [c01493dc] ubifs_replay_journal+0x700/0xf48
[df7f3da0] [c013aba8] ubifs_fill_super+0xd9c/0x15fc
[df7f3e00] [c013c6fc] ubifs_get_sb+0x10c/0x344
[df7f3e80] [c007b4d0] vfs_kern_mount+0x60/0x150
[df7f3ea0] [c007b610] do_kern_mount+0x40/0x100
[df7f3ec0] [c0092210] do_mount+0x40c/0x718
[df7f3f10] [c00925ac] sys_mount+0x90/0xd8
[df7f3f40] [c0010b44] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe93d18
    LR = 0x1000347c
UBIFS DBG (pid 1416): no_more_nodes: unexpected bad common header at 139:116088
UBIFS error (pid 1416): ubifs_recover_leb: bad node
UBIFS error (pid 1416): ubifs_scanned_corruption: corruption at LEB 139:116088
UBIFS error (pid 1416): ubifs_scanned_corruption: first 8192 bytes from LEB 139:116088
00000000: 31181006 3bdfa246 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  1...;..F........................
00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
00000060: ffffffff ffffffff 4647fdeb ee4bdded 4e4f50d1 5253f675 56577d59 5a5b7d5f  ........FG...K..NOP.RS.uVW}YZ[}_
00000080: 5e5f6061 62636465 ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ^_`abcde........................
...

I'm still looking for a reason for this behaviour and can't explain
it yet. Maybe we have a problem in the CFI driver.

Thanks,
Anatolij

--
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
