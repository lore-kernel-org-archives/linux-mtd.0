Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HhMYl-0002D2-V1
	for linux-mtd@lists.infradead.org; Fri, 27 Apr 2007 05:16:16 -0400
Subject: Re: corruption of JFFS2 filesystem, csize is set to 0 after moving
	a block
From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1177602237.2755.414.camel@pmac.infradead.org>
References: <1177599259.18969.111.camel@localhost.localdomain>
	<1177602237.2755.414.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Fri, 27 Apr 2007 11:13:49 +0200
Message-Id: <1177665229.18969.143.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-04-26 at 16:43 +0100, David Woodhouse wrote:
> On Thu, 2007-04-26 at 16:54 +0200, Hans-Christian Egtvedt wrote:
> > Hello,
> > 
> > When I stress the JFFS2 filesystem by copying files around on the root
> > (/) I end up with a corrupted filesystem after a reboot. The system just
> > hangs after the kernel is done booting:
> > Freeing init memory: 56K (90000000 - 9000e000)
> > 
> > Where I should get:
> > init started:  BusyBox v1.4.2 (2007-04-17 15:34:55 CEST) multi-call
> > binary
> > etc...
> > 
> > I copy and remove files until I reach "cp: write error: No space left on
> > device"
> > 
> > I extracted the filesystem from my flash device (Atmel AT49BV642D) and
> > did a dump. Here I can see that some of the nodes have a csize set to 0
> > for vital files such as libdl-0.9.28.so.
> 
> There's not necessarily anything wrong with that.

Some filesystem dump from before:
         Dirent     node at 0x0013c7e0, totlen 0x0000003b, #pino     7, version   148, #ino       150, nsize       19, name ld-uClibc-0.9.28.so
         Inode      node at 0x0013c81c, totlen 0x00000a14, #ino    150, version     1, isize    13108, csize     2512, dsize     4092, offset        0
         Inode      node at 0x0013d230, totlen 0x00000c57, #ino    150, version     2, isize    13108, csize     3091, dsize     4092, offset     4092
         Inode      node at 0x0013de88, totlen 0x00000b21, #ino    150, version     3, isize    13108, csize     2781, dsize     4092, offset     8184
         Inode      node at 0x0013e9ac, totlen 0x000001e0, #ino    150, version     4, isize    13108, csize      412, dsize      832, offset    12276

After:
         Dirent     node at 0x006c7bf0, totlen 0x0000003b, #pino     7, version   171, #ino       150, nsize       19, name ld-uClibc-0.9.28.so
         Inode      node at 0x006c7c2c, totlen 0x00000a14, #ino    150, version     5, isize    13108, csize     2512, dsize     4092, offset        0
         Inode      node at 0x006c8640, totlen 0x00000044, #ino    150, version     6, isize    13108, csize        0, dsize     4092, offset     4092
         Inode      node at 0x006c8684, totlen 0x00000044, #ino    150, version     7, isize    13108, csize        0, dsize     4092, offset     8184
         Inode      node at 0x006c86c8, totlen 0x00000044, #ino    150, version     8, isize    13108, csize        0, dsize      832, offset    12276

csize changed to 0 is correct for this node?

If the node header is correct, could it be that the node data has been
corrupted in some way?

> > Any pointers to where I should start debugging, what can go wrong?
> > 
> > I can provide jffs2dump's, logs or images if needed.
> 
> Take a copy of the image, then work out where the kernel is stuck. Use
> SysRq-P and/or SysRq-T, and if it's in JFFS2 try running with
> CONFIG_JFFS2_FS_DEBUG=1 (and with 'verbose' on the command line), and
> capture all the output on a serial console.

The system is in do_signal, which is most likely a sign of the init
process has received an unexpected signal. I assume it is due to one of
the core libraries being corrupted.

JFFS2 log with debug=1

jffs2_scan_dirent_node(): Node at 0x006c7bf0
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 903008c4 is (006c7bac,902febd8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 903008d0 (fffffffe becomes 006c7bf2,00000000) len 0x3c
[JFFS2 DBG] (1) jffs2_add_fd_to_list: add dirent "ld-uClibc-0.9.28.so", ino #150
jffs2_scan_inode_node(): Node at 0x006c7c2c
[JFFS2 DBG] (1) jffs2_add_ino_cache: add 902febc0 (ino #150)
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 903008d0 is (006c7bf2,902e7704)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 903008dc (fffffffe becomes 006c7c2c,00000000) len 0xa14
Node is ino #150, version 5. Range 0x0-0xffc
Fewer than 68 bytes (inode node) left to end of buf. Reading 0x1000 at 0x006c8640
jffs2_scan_inode_node(): Node at 0x006c8640
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 903008dc is (006c7c2c,902febc0)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 903008e8 (fffffffe becomes 006c8640,00000000) len 0x44
Node is ino #150, version 6. Range 0xffc-0x1ff8
jffs2_scan_inode_node(): Node at 0x006c8684
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 903008e8 is (006c8640,903008dc)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 903008f4 (fffffffe becomes 006c8684,00000000) len 0x44
Node is ino #150, version 7. Range 0x1ff8-0x2ff4
jffs2_scan_inode_node(): Node at 0x006c86c8
[JFFS2 DBG] (1) jffs2_link_node_ref: Last node at 903008f4 is (006c8684,903008e8)
[JFFS2 DBG] (1) jffs2_link_node_ref: New ref is 90300900 (fffffffe becomes 006c86c8,00000000) len 0x44
Node is ino #150, version 8. Range 0x2ff4-0x3334

What else should I look for in the log file, it is a bit big to be
attached to this list (21 MB).

-- 
Best regards
Hans-Christian Egtvedt
