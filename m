Received: from 220.77.144.195.ipv4.evonet.be ([195.144.77.220]
 helo=exchange.essensium.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZC6ze-0002LU-Le
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2015 14:03:37 +0000
To: <linux-mtd@lists.infradead.org>
CC: Philip Oberstaller <Philip.Oberstaller@septentrio.com>
From: Arnout Vandecappelle <arnout.vandecappelle@essensium.com>
Subject: UBIFS: Possible on-flash metadata corruption
Message-ID: <559A8A83.3050508@essensium.com>
Date: Mon, 6 Jul 2015 16:02:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We're facing something that looks like on-flash metadata corruption with UBI/UBIFS.

>From one moment to the other (not sure if there was a reboot or power-cut
in-between) I was not able to list the content of a specific directory on a
UBI partition anymore, getting the following kernel error messages:

UBIFS error (pid 1824): ubifs_read_node_wbuf: bad node type (0 but expected 2)
UBIFS error (pid 1824): ubifs_read_node_wbuf: bad node at LEB 23:120832
Not a node, first 24 bytes:
00000000: 64 8f 2e c3 40 23 2e c3 b0 f5 1a c0 00 00 00 00 00 00 00 00 00 00 00 00

So instead of finding a direntry node, UBIFS found an inode node. After flashing
a new kernel with dynamic debugging enabled the error message
changed into the following where it appears that UBIFS has reused the node
in the meantime for a data node:

UBIFS error (pid 458): ubifs_read_node: bad node type (1 but expected 2)
UBIFS error (pid 458): ubifs_read_node: bad node at LEB 23:120832, LEB mapping
status 1

[<c00131b8>] (unwind_backtrace) from [<c0011350>] (show_stack+0x10/0x14)
[<c0011350>] (show_stack) from [<c0122f34>] (ubifs_read_node+0x290/0x2e4)
[<c0122f34>] (ubifs_read_node) from [<c0141a28>] (ubifs_tnc_read_node+0x60/0x1cc)
[<c0141a28>] (ubifs_tnc_read_node) from [<c0123d7c>] (tnc_read_node_nm+0xb4/0x1c8)
[<c0123d7c>] (tnc_read_node_nm) from [<c0127cdc>] (ubifs_tnc_next_ent+0x1dc/0x244)
[<c0127cdc>] (ubifs_tnc_next_ent) from [<c011977c>] (ubifs_readdir+0x438/0x52c)
[<c011977c>] (ubifs_readdir) from [<c00c41d0>] (iterate_dir+0x60/0x98)
[<c00c41d0>] (iterate_dir) from [<c00c45dc>] (SyS_getdents64+0x78/0xe4)
[<c00c45dc>] (SyS_getdents64) from [<c000e540>] (ret_fast_syscall+0x0/0x30)

The PEB related to LEB 23 contains all data nodes. AFAIK, UBIFS separates
data nodes and other nodes on two different jheads, effectively putting them on
separate PEBs? So, it would be weird why it would even look for a direntry node
on LEB 23.

In our application, files are changed atomically as suggested by
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_atomic_change. The file with
the corrupt metadata is one of the files that is changed this way. These files
are updated at a rate of roughly once every 10-60 seconds.

This problem has now appeared out of the blue after running the application for
months. A few dozen other units have not shown this problem at all.

UBI does not report any bad blocks or any other event around the time it
happened - but debugging output was pretty limited at the time so I don't think
any scrubbing event would have been logged. We're not using fastmap. At the UBI
level, everything seems to be OK.

The used kernel version is 3.14.39. I've checked for upstream bug-fixes, but
couldn't spot any targeting this problem. Further, I copied the UBI partition
from the target device to my PC with a 4.0 kernel and used nandsim to mount the
corrupted UBIFS volume. The same error happens there as well when listing the
'bad' directory.

The original ubifs was created with ubinize + mkfs.ubifs under a 3.4 kernel, but
since all the files and directories have been overwritten several times under
the 3.14 kernel, there is probably not much left from the original creation.

Is this already an identified issue?

I have not been able to locate the node that refers to LEB 23:120832 - it would
seem that that is the one that is corrupt. Is there any tool or debug trace that
will help me find the referring node?

Is there any way that would allow me to automatically recover from such an
issue if it occurs again?

We would be grateful for any help!

Regards,
Philip & Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
