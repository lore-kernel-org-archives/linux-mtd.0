Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WbweL-0006FD-GU
 for linux-mtd@lists.infradead.org; Sun, 20 Apr 2014 18:39:34 +0000
Message-ID: <53541449.9080308@codeaurora.org>
Date: Sun, 20 Apr 2014 21:39:05 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dolev Raviv <draviv@codeaurora.org>
Subject: UBIFS CRC error, calculated from ubifs_check_node
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All

I'm hitting "UBIFS error (pid 1026): ubifs_check_node: bad CRC: 
calculated 0x79dbca01, read 0x31afb5d7" and as a result the partition is 
remounted as RO.

I'm using 3.10 based kernel.
The test scenario to reproduce this is:
1. fill the partition tested using dd
2. try to write some more data

There are no errors in the log from the ubi layer or from the underlying 
nand driver, both also testing crc.

I've tried disabling compression, mounting the partition as sync and 
issuing the write command with sync param. None of the former has any 
effect on this crash.
I tried disabling crc on data nodes. This lowered the possibility of 
hitting the above error but eventually, with stress test of concurrent 
read and write we hit the same error with a different node type.

Has any one encountered similar behavior? I'm not that much familiar 
with ubifs so any help will be highly apritiated!

Bellow is the snippet of the call stack in question and the command I 
used to hit it:
dd if=/dev/zero of=/firmware/file2 bs=1M count=5000
[ 187.472289] UBIFS error (pid 1026): ubifs_check_node: bad CRC: 
calculated 0x79dbca01, read 0x31afb5d7
[ 187.480925] UBIFS error (pid 1026): ubifs_check_node: bad node at LEB 
263:94456
[ 187.488385] magic 0x6101831
[ 187.491483] crc 0x31afb5d7
[ 187.495198] node_type 1 (data node)
[ 187.499147] group_type 0 (no node group)
[ 187.503522] sqnum 10721
[ 187.506791] len 4013
[ 187.510002] key (102, data, 2102)
[ 187.514369] size 4096
[ 187.517552] compr_typ 1
[ 187.520508] data size 3965
[ 187.523740] data:
...
188.849392] CPU: 0 PID: 1026 Comm: dd Tainted: G W 3.10.28+ #1
[ 188.855598] [sched_delayed] sched: RT throttling activated
[ 188.861091] [<c0014674>] (unwind_backtrace+0x0/0x11c) from 
[<c0011a34>] (show_stack+0x10/0x14)
[ 188.869687] [<c0011a34>] (show_stack+0x10/0x14) from [<c0163e40>] 
(ubifs_check_node+0x280/0x2b8)
[ 188.878447] [<c0163e40>] (ubifs_check_node+0x280/0x2b8) from 
[<c016ba6c>] (ubifs_scan_a_node+0x190/0x304)
[ 188.888002] [<c016ba6c>] (ubifs_scan_a_node+0x190/0x304) from 
[<c016c038>] (ubifs_scan+0xa0/0x348)
[ 188.896939] [<c016c038>] (ubifs_scan+0xa0/0x348) from [<c0170bb0>] 
(ubifs_garbage_collect_leb+0x1e0/0x76c)
[ 188.906569] [<c0170bb0>] (ubifs_garbage_collect_leb+0x1e0/0x76c) from 
[<c01713c8>] (ubifs_garbage_collect+0x28c/0x5fc)
[ 188.917248] [<c01713c8>] (ubifs_garbage_collect+0x28c/0x5fc) from 
[<c0173b0c>] (ubifs_budget_space+0x64c/0x898)
[ 188.927320] [<c0173b0c>] (ubifs_budget_space+0x64c/0x898) from 
[<c015a320>] (ubifs_write_begin+0x3b0/0x524)
[ 188.937047] [<c015a320>] (ubifs_write_begin+0x3b0/0x524) from 
[<c009a2d8>] (generic_file_buffered_write+0xd8/0x250)
[ 188.947461] [<c009a2d8>] (generic_file_buffered_write+0xd8/0x250) from 
[<c009b614>] (__generic_file_aio_write+0x364/0x3b0)
[ 188.958486] [<c009b614>] (__generic_file_aio_write+0x364/0x3b0) from 
[<c009b6b4>] (generic_file_aio_write+0x54/0xb0)
[ 188.968982] [<c009b6b4>] (generic_file_aio_write+0x54/0xb0) from 
[<c01597f8>] (ubifs_aio_write+0x16c/0x180)
[ 188.978708] [<c01597f8>] (ubifs_aio_write+0x16c/0x180) from 
[<c00d47d4>] (do_sync_write+0x74/0x98)
[ 188.987648] [<c00d47d4>] (do_sync_write+0x74/0x98) from [<c00d5138>] 
(vfs_write+0xd4/0x16c)
[ 188.995979] [<c00d5138>] (vfs_write+0xd4/0x16c) from [<c00d5478>] 
(SyS_write+0x3c/0x60)
[ 189.005059] [<c00d5478>] (SyS_write+0x3c/0x60) from [<c000e440>] 
(ret_fast_syscall+0x0/0x30)
[ 189.012651] UBIFS error (pid 1026): ubifs_scan: bad node
[ 189.018546] UBIFS error (pid 1026): ubifs_scanned_corruption: 
corruption at LEB 263:94456
[ 189.026124] UBIFS error (pid 1026): ubifs_scanned_corruption: first 
8192 bytes from LEB 263:94456
[ 189.039633] UBIFS error (pid 1026): ubifs_scan: LEB 263 scanning failed
[ 189.045313] UBIFS warning (pid 1026): ubifs_ro_mode: switched to 
read-only mode, error -117
[ 189.053634] CPU: 0 PID: 1026 Comm: dd Tainted: G W 3.10.28+ #1


Thanks!
Tanya Brokhman
-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
