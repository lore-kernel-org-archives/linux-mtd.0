Received: from smtpauth11.prod.mesa1.secureserver.net ([64.202.165.33])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RiPC2-0005W7-SI
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 11:39:44 +0000
Message-ID: <4F043A7C.1060504@heeltoe.com>
Date: Wed, 04 Jan 2012 06:39:40 -0500
From: Brad Parker <brad@heeltoe.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubifs panic with 2.6.39 stable - followup
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

[sorry for the duplicate post; I tried to post a followup with just
  the url to the pastebin log but for some reason  it got stuck
  waiting for the moderator]

Running and older 2.6.31 kernel with UBIFS I see a panic which appears
to be during recovery of a bad block. The root fs (which is UBIFS)
won't mount and the kernel panics.

I upgraded the kernel 2.6.39-stable, hoping that would fix the problem,
as I noticed a lot of recovery fixes had gone in.  It still panics;
it appears the recovery fails.

I rebooted with "ignore_loglevel" and the output is here:

     http://pastebin.com/ETJjP4uw

The board is essentially an Olimex SAM9-L9260, with Samsung NAND.

I'm curious if this looks familiar and if it might be fixed post 2.5.39

thanks for any insight.

-brad

UBIFS: recovery needed
UBI error: ubi_io_read: error -74 (ECC error) while reading 126976 bytes 
from PEB 2970:4096, read 126976 bytes
UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0xf510fb95, 
read 0x4f0a3196
UBIFS error (pid 1): ubifs_check_node: bad node at LEB 3589:45128
         magic          0x6101831
         crc            0x4f0a3196
         node_type      0 (inode node)
         group_type     2 (last of node group)
         sqnum          69874250
         len            160
         key            (23417, inode)
         creat_sqnum    230076
         size           608
         nlink          2
         atime          1306744746.0
         mtime          1316662493.0
         ctime          1316662493.0
         uid            0
         gid            0
         mode           16832
         flags          0x1
         xattr_cnt      2147483648
         xattr_size     0
         xattr_names    0
         compr_type     0x0
         data len       0
...
UBIFS error (pid 1): ubifs_recover_leb: bad node
UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 3589:45128
UBIFS error (pid 1): ubifs_scanned_corruption: first 8192 bytes from LEB 
3589:45128
...
UBIFS error (pid 1): ubifs_recover_leb: LEB 3589 scanning failed
