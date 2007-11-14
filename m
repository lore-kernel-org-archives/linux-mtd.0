Date: Wed, 14 Nov 2007 18:33:47 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: [RFC] BUG Power loss recovery issues in JFFS2
Message-ID: <Pine.LNX.4.64.0711141825330.19494@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Roman.borisov@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We encountered issues with our power loss tests in JFFS2.
This could be a serious problem in case of operations with databases. 

The problem appears in the following case:
1.	Power loss occurs at the moment of file content write.
2.	The header has been completely written.
3.	Data is written incompletely

If 1 2 and 3 occurs on next mount the partially written node is considered by JFFS2 as valid until we read the data.

Here is the example: 
echo .123456789012345678901234567890. > file.txt
power loss
mount
ls .l file.txt
-rw-r--r--    1 root     root           30 Jan  1 00:22 file.txt

If we try to read the content of this file we won.t get any data but receive read error:
Data CRC 949a52c7 != calculated CRC 0c434291 for node at 00380084

The issue is related to existing implementation of jffs2_scan_eraseblock() function which skips the content scanning of nodes to reach acceptable mount performance. 

If we have power loss it is possible to face the situation when we can't read the middle of the file due to data CRC error. Many applications consider read error as very nasty situation and will return with error flag. For configuration files, scripts and databases it could have bad consequences.

We are thinking of implementing the solution for power loss recovery issues in the following way.

In case of disabled SUMMARY

Create special node which is written once erase block is being filled. The special node will contain the version number. On every mount we perform full scan of the last written node in erase block with the latest version of special node. If we face node with broken CRC . We should make this node obsolete. It won.t affect seriously on mount performance because it will assume full scan of the only one node. But it will add space overhead. 

In case of enabled SUMMARY
Perform full check of last written node in erase blocks which is not covered by summary. If we face node with broken CRC make node obsolete.

It is not clear about the best way how to make the node obsolete. Currently we are thinking of GC the block with broken node but in this case write the special node when all nodes are copied.

The question we have is there any easy way to identify the last written erase block without special node creation? (For example by adding version field to cleanmarker and doing some magic to identify last written erase block)?
Is there a better solution for the problem? Your suggestions are welcome.

Reported-by: Roman Borisov<rborisov at intel.com>
Reported-by: Alexey Korolev<akorolev at infradead.org>

Thanks,
Alexey
