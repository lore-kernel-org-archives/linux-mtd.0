Received: from smtp.cogeco.net ([216.221.81.25] helo=fep1.cogeco.net)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KsKHO-0002BI-0S
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 16:40:22 +0000
Message-ID: <48FE060A.2070505@ripnet.com>
Date: Tue, 21 Oct 2008 12:40:42 -0400
From: Mike Sander <msander@ripnet.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: task pdflush blocked during garbage collection.
References: <48FDF397.2080404@ripnet.com>
In-Reply-To: <48FDF397.2080404@ripnet.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mike sander wrote:
> Hi All, I'm new to this list.  Hopefully i'm using a good client 
> (thunderbird).  i have turned off html.
>
> I'm working with a jffs2 filesystem on an atmel dataflash part (on 9260 
> EK). 
>
> My testing involves copying/deleting about 1000 files of a few hundred 
> bytes each.  This is to simulate (on compressed timeframe) a normal 
> usage pattern for our device.  My maximum data size will be about 1 MB 
> within a 2MB partition.
>
> All appears well until garbage collection starts [I think].  I have seen 
> cases where during a copy operation, the copy stalls for a fairly _long_ 
> duration (1 to 2 minutes) after which the copy continues to completion 
> normally.    (This is not the main issue... but any suggestions on 
> improving this are welcome)
>
> Sometimes however, I get the following messages.  In this case below I 
> did an "ls" in a shell prompt.  I have also seen this during a copy 
> operation.  Once these messages start, the operation (cp, ls etc) never 
> appears to complete.    A device reset followed by a remount shows a few 
> jffs2 filesystem error (as expected).
>
> I've seen mention of this type of behavior on the mailing list... but no 
> resolution.
>
> Vital stats:
> target: at91sam9260ek
> dataflash: at45db642d
> environment: buildroot with linux 2.6.25 & atmel specific patches
> partition: 2MB.  I started out with a clean partition using 
> flash_eraseall.  Partition is specified on kernel command line.  I am 
> mounting manually from shell.
>
> The buildroot snapshot I am using is from approx May 01, although with a 
> more recent 2.6.25 kernel.  I'm using mtd-utils-1.2.0 (I doubt mtd-utils 
> is relevant to this issue)
>
> I was wondering if anyone on this list might have any clues as to why 
> these processes seem to be blocking.    Any suggestions on where to 
> start looking and/or how to debug this are most welcome.    I can 
> provide additional details as required.
>
> Thanks in advance.
>
> Mike
>
>
> [ 5614.600000] INFO: task pdflush:49 blocked for more than 120 seconds.
> [ 5614.600000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
> disables this message.
> [ 5614.610000] pdflush       D c02b1ff8     0    49      2
> [ 5614.610000] [<c02b1da0>] (schedule+0x0/0x29c) from [<c02b2218>] 
> (schedule_timeout+0x20/0xc4)
> [ 5614.620000] [<c02b21f8>] (schedule_timeout+0x0/0xc4) from 
> [<c02b1c70>] (wait_for_common+0xf8/0x194)
> [ 5614.630000]  r7:c03b3c98 r6:c03b2000 r5:c03b0cc0 r4:c03b3c58
> [ 5614.640000] [<c02b1b78>] (wait_for_common+0x0/0x194) from 
> [<c02b1d9c>] (wait_for_completion+0x18/0x1c)
> [ 5614.650000] [<c02b1d84>] (wait_for_completion+0x0/0x1c) from 
> [<c02836a8>] (spi_sync+0x58/0x6c)
> [ 5614.660000] [<c0283650>] (spi_sync+0x0/0x6c) from [<c02835e4>] 
> (dataflash_read+0x124/0x154)
> [ 5614.670000]  r6:c03a67a4 r5:c03b3d08 r4:0098a0c4
> [ 5614.670000] [<c02834c0>] (dataflash_read+0x0/0x154) from [<c02801a4>] 
> (part_read+0xa0/0xd4)
> [ 5614.680000] [<c0280104>] (part_read+0x0/0xd4) from [<c0237cd4>] 
> (jffs2_flash_read+0x8c/0x290)
> [ 5614.690000]  r7:00000000 r6:001d3344 r5:001d2200 r4:c03b3e68
> [ 5614.690000] [<c0237c48>] (jffs2_flash_read+0x0/0x290) from 
> [<c02341fc>] (jffs2_garbage_collect_live+0xd50/0xffc)
> [ 5614.700000] [<c02334ac>] (jffs2_garbage_collect_live+0x0/0xffc) from 
> [<c0234b0c>] (jffs2_garbage_collect_pass+0x664/0x784)
> [ 5614.710000] [<c02344a8>] (jffs2_garbage_collect_pass+0x0/0x784) from 
> [<c02391d4>] (jffs2_flush_wbuf_gc+0xc4/0x198)
> [ 5614.720000] [<c0239110>] (jffs2_flush_wbuf_gc+0x0/0x198) from 
> [<c0236278>] (jffs2_write_super+0x44/0x48)
> [ 5614.730000]  r7:c03b3f4c r6:c0318e24 r5:00000000 r4:c0ee4200
> [ 5614.740000] [<c0236234>] (jffs2_write_super+0x0/0x48) from 
> [<c01e7164>] (sync_supers+0x74/0xb0)
> [ 5614.750000]  r5:c0ee403c r4:c0ee4000
> [ 5614.750000] [<c01e70f0>] (sync_supers+0x0/0xb0) from [<c01cef74>] 
> (wb_kupdate+0x58/0x158)
> [ 5614.760000]  r6:c03b3fa4 r5:c0318b20 r4:c03b3f4c
> [ 5614.770000] [<c01cef1c>] (wb_kupdate+0x0/0x158) from [<c01cf680>] 
> (pdflush+0x140/0x1f8)
> [ 5614.770000]  r7:c032811c r6:c03b3fa4 r5:c0318b20 r4:c03b2000
> [ 5614.780000] [<c01cf540>] (pdflush+0x0/0x1f8) from [<c01b4f78>] 
> (kthread+0x58/0x90)
> [ 5614.790000] [<c01b4f20>] (kthread+0x0/0x90) from [<c01a4934>] 
> (do_exit+0x0/0x610)
> [ 5614.790000]  r6:00000000 r5:00000000 r4:00000000
>
> [ 5614.800000] INFO: task ls:27882 blocked for more than 120 seconds.
> [ 5614.810000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
> disables this message.
> [ 5614.810000] ls            D c02b1ff8     0 27882    184
> [ 5614.820000] [<c02b1da0>] (schedule+0x0/0x29c) from [<c02b18e4>] 
> (__down+0xf4/0x10c)
> [ 5614.830000] [<c02b17f0>] (__down+0x0/0x10c) from [<c02b178c>] 
> (__down_failed+0xc/0x20)
> [ 5614.830000]  r8:c0049f58 r7:00000002 r6:c0049eec r5:00000000 r4:00000001
> [ 5614.840000] [<c022aab4>] (jffs2_readdir+0x0/0x1bc) from [<c01f121c>] 
> (vfs_readdir+0x74/0xa8)
> [ 5614.850000] [<c01f11a8>] (vfs_readdir+0x0/0xa8) from [<c01f14f8>] 
> (sys_getdents+0x6c/0xb8)
> [ 5614.860000] [<c01f148c>] (sys_getdents+0x0/0xb8) from [<c018a960>] 
> (ret_fast_syscall+0x0/0x2c)
> [ 5614.870000]  r7:0000008d r6:0008b0d0 r5:0008b098 r4:0008b0b0
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> Scanned with Copfilter Version 0.84beta3a (P3Scan 2.2.1)
> AntiSpam:  SpamAssassin 3.2.3
> by Markus Madlener @ http://www.copfilter.org
>
>   
I have an additional log I would like to post.  This occurred during a 
copy operation.  Perhaps the garbage collection is not a key factor as I 
thought earlier.  As before pdflush is blocking.  But this time "cp" 
also blocks.  I'm  in the process of reading code in the various back 
traces... but it very slow going.   Hopefully someone more knowledgeable 
with mtd and/or jffs2 might see something out of the ordinary.

Once again, thanks for any assistance.  And, if this is not the 
"correct" way to add new information, please advise me of the best way 
to do so.

SECOND LOG:  block during cp on dataflash device.

[  340.380000] INFO: task cp:1493 blocked for more than 120 seconds.
[  340.380000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  340.390000] cp            D c02b6758     0  1493    184
[  340.390000] [<c02b6500>] (schedule+0x0/0x29c) from [<c02b6978>] 
(schedule_timeout+0x20/0xc4)
[  340.400000] [<c02b6958>] (schedule_timeout+0x0/0xc4) from 
[<c02b63d0>] (wait_for_common+0xf8/0x194)
[  340.410000]  r7:c00e9c54 r6:c00e8000 r5:c0f226c0 r4:c00e9c14
[  340.420000] [<c02b62d8>] (wait_for_common+0x0/0x194) from 
[<c02b64fc>] (wait_for_completion+0x18/0x1c)
[  340.430000] [<c02b64e4>] (wait_for_completion+0x0/0x1c) from 
[<c0287da4>] (spi_sync+0x58/0x6c)
[  340.440000] [<c0287d4c>] (spi_sync+0x0/0x6c) from [<c0287cb8>] 
(dataflash_read+0x124/0x17c)
[  340.440000]  r6:c03ce7a4 r5:c00e9cc8 r4:008c0000
[  340.450000] [<c0287b94>] (dataflash_read+0x0/0x17c) from [<c028478c>] 
(part_read+0xa0/0xd4)
[  340.460000] [<c02846ec>] (part_read+0x0/0xd4) from [<c023bdc8>] 
(jffs2_flash_read+0x8c/0x290)
[  340.470000]  r7:00000000 r6:0016b000 r5:c0052860 r4:c00e9d98
[  340.470000] [<c023bd3c>] (jffs2_flash_read+0x0/0x290) from 
[<c023b39c>] (__jffs2_dbg_prewrite_paranoia_check+0x50/0x120)
[  340.480000] [<c023b34c>] 
(__jffs2_dbg_prewrite_paranoia_check+0x0/0x120) from [<c02324f4>] 
(jffs2_write_dirent+0x1c4/0x4c8)
[  340.490000]  r7:c00c53e4 r6:0000000b r5:c037192c r4:e88b1196
[  340.500000] [<c0232330>] (jffs2_write_dirent+0x0/0x4c8) from 
[<c02334e0>] (jffs2_do_create+0x248/0x2f0)
[  340.510000] [<c0233298>] (jffs2_do_create+0x0/0x2f0) from 
[<c022b42c>] (jffs2_create+0xb4/0x150)
[  340.520000] [<c022b378>] (jffs2_create+0x0/0x150) from [<c01ec538>] 
(vfs_create+0x80/0x94)
[  340.530000] [<c01ec4b8>] (vfs_create+0x0/0x94) from [<c01efbfc>] 
(open_namei+0x198/0x6f4)
[  340.540000]  r7:000081ed r6:c00e9f0c r5:c0e267fc r4:00000000
[  340.540000] [<c01efa64>] (open_namei+0x0/0x6f4) from [<c01e3670>] 
(do_filp_open+0x2c/0x48)
[  340.550000] [<c01e3644>] (do_filp_open+0x0/0x48) from [<c01e36e0>] 
(do_sys_open+0x54/0x98)
[  340.560000]  r5:00000004 r4:000000c1
[  340.560000] [<c01e368c>] (do_sys_open+0x0/0x98) from [<c01e375c>] 
(sys_open+0x24/0x28)
[  340.570000]  r8:c018ab04 r7:00000005 r6:00000003 r5:bef20eb2 r4:00000002
[  340.580000] [<c01e3738>] (sys_open+0x0/0x28) from [<c018a960>] 
(ret_fast_syscall+0x0/0x2c)



[  344.680000] INFO: task pdflush:49 blocked for more than 120 seconds.
[  344.680000] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  344.690000] pdflush       D c02b6758     0    49      2
[  344.690000] [<c02b6500>] (schedule+0x0/0x29c) from [<c02b6f10>] 
(__mutex_lock_slowpath+0x6c/0x9c)
[  344.700000] [<c02b6ea4>] (__mutex_lock_slowpath+0x0/0x9c) from 
[<c02b6d80>] (mutex_lock+0x20/0x28)
[  344.710000]  r7:c00562e0 r6:c03ce780 r5:00000000 r4:c0e89e2c
[  344.720000] [<c02b6d60>] (mutex_lock+0x0/0x28) from [<c0287a8c>] 
(dataflash_erase+0xb8/0x1c0)
[  344.730000] [<c02879d4>] (dataflash_erase+0x0/0x1c0) from 
[<c02841b4>] (part_erase+0x54/0x84)
[  344.740000] [<c0284160>] (part_erase+0x0/0x84) from [<c0238668>] 
(jffs2_erase_pending_blocks+0x70c/0x8e4)
[  344.750000]  r5:c00225c8 r4:c00562e0
[  344.750000] [<c0237f5c>] (jffs2_erase_pending_blocks+0x0/0x8e4) from 
[<c0238cfc>] (jffs2_write_super+0x40/0x54)
[  344.760000] [<c0238cbc>] (jffs2_write_super+0x0/0x54) from 
[<c01e7164>] (sync_supers+0x74/0xb0)
[  344.770000]  r5:c0e8303c r4:c0e83000
[  344.770000] [<c01e70f0>] (sync_supers+0x0/0xb0) from [<c01cef74>] 
(wb_kupdate+0x58/0x158)
[  344.780000]  r6:c0e89fa4 r5:c0324b20 r4:c0e89f4c
[  344.780000] [<c01cef1c>] (wb_kupdate+0x0/0x158) from [<c01cf680>] 
(pdflush+0x140/0x1f8)
[  344.790000]  r7:c033411c r6:c0e89fa4 r5:c0324b20 r4:c0e88000
[  344.800000] [<c01cf540>] (pdflush+0x0/0x1f8) from [<c01b4f78>] 
(kthread+0x58/0x90)
[  344.810000] [<c01b4f20>] (kthread+0x0/0x90) from [<c01a4934>] 
(do_exit+0x0/0x610)
[  344.810000]  r6:00000000 r5:00000000 r4:00000000
