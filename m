Received: from f04s07.cac.psu.edu ([128.118.141.35] helo=f04n07.cac.psu.edu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ceP7-0007uo-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 03:51:33 +0100
Received: from nrl1 (nrl1.cedcc.psu.edu [130.203.252.61])
	by f04n07.cac.psu.edu (8.9.3/8.9.3) with SMTP id WAA76256
	for <linux-mtd@lists.infradead.org>; Thu, 30 Aug 2001 22:57:31 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Bill <wrs122@psu.edu>
Reply-To: wrs122@psu.edu
To: linux-mtd@lists.infradead.org
Subject: DOC2000 Boot de-ja-vue
Date: Thu, 30 Aug 2001 22:59:44 -0400
MIME-Version: 1.0
Message-Id: <01083022594400.01562@nrl1>
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Well, DOC2000 seems happy now kinda. I think my problem is with Linux. Here 
is the end of my boot screen:

blah... blah... blah...
NFTL driver: nftlcore.c $Revision: 1.78 $, nftlmount.c $Revision: 1.21 $
Cannot calculate an NFTL geometry to match size of 0x46840
Using C:1002 H:16 S:18 (== 0x46740 sects)
 nftla: nftla1
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 2048 buckets, 16 Kbytes
TCP: Hash tables configured (established 16384 bind 16384)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory 204k freed
Kernel panic: No init found. Try passing init= option to kernel.

It mounts the device fine but then dies. Any ideas?

-Bill
