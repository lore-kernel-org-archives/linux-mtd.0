Received: from mpls-qmqp-01.inet.qwest.net ([63.231.195.112])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQWrK-0005sJ-4C
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2005 16:40:43 -0400
Received: from oz.embeddedx86.com (IDENT:www@localhost [127.0.0.1])
	by oz.embeddedx86.com (8.11.6p3/8.11.6) with ESMTP id j3QKXxb12580
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Apr 2005 13:33:59 -0700 (MST)
Date: Tue, 26 Apr 2005 13:33:59 -0700 (MST)
Message-ID: <32985.192.168.0.136.1114547639.squirrel@oz.embeddedx86.com>
From: "Eddie Dawydiuk" <eddie@embeddedx86.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: Bad Blocks...
Reply-To: eddie@embeddedx86.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Yaffers,

After running some stress tests on a 128MB NAND Flash I have found some
strange behavior while using the Yaffs filesystem... The stress test
creates a ring-buffer of 5 directories, each directory contains 10,000
files with a size of 1248 bytes (Please find the source code attached). 
When running this application on a 32MB NAND Flash I am able to fill the
disk and then delete the files as expected... Although when running the
test on a 128MB NAND Flash(with the same kernel) I find that after
creating slightly over 35,000 files I am unable to write any more files to
disk(my board hangs). After rebooting the board, when I attempt to delete
the files only some of the files are deleted successfully(on the first
attempt). After attempting several more times I am able to delete all of
the files but I find that I have hundreds of bad blocks(there are no error
messages when I attempt to delete a file and it is unsucessfully deleted).
I have provided the output of /proc/yaffs below(after running the stress
test multiple times) and am using a 2.4.26 kernel... I have read the other
posts refering to bad block management
(http://www.aleph1.co.uk/pipermail/yaffs/2005q1/000955.html) and have
ensured the fixes suggested have been made. If anyone has any suggestions
I would appreciate them...

$ cat /proc/yaffs
YAFFS built:Apr 26 2005 10:44:45
$Id: yaffs_fs.c,v 1.3 2005/01/25 00:38:25 eddie Exp $
$Id: yaffs_guts.c,v 1.41 2005/04/24 08:54:36 charles Exp $

Device yaffs
startBlock......... 1
endBlock........... 7999
chunkGroupBits..... 2
chunkGroupSize..... 4
nErasedBlocks...... 1575
nTnodesCreated..... 35000
nFreeTnodes........ 21790
nObjectsCreated.... 34400
nFreeObjects....... 21795
nFreeChunks........ 142801
nPageWrites........ 71420
nPageReads......... 2573700
nBlockErasures..... 4021
nGCCopies.......... 317
garbageCollections. 3599
passiveGCs......... 3599
nRetriedWrites..... 0
nRetireBlocks...... 2397
eccFixed........... 0
eccUnfixed......... 0
tagsEccFixed....... 0
tagsEccUnfixed..... 654
cacheHits.......... 0
nDeletedFiles...... 22161
nUnlinkedFiles..... 22162
nBackgroudDeletions 0
useNANDECC......... 1

Thanks,
Eddie
