Received: from tweedy.ksc.nasa.gov ([128.217.76.165])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17FCBb-0004sJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2002 12:09:11 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by tweedy.ksc.nasa.gov (8.11.6/8.11.6) with ESMTP id g54B98n12522
	for <linux-mtd@lists.infradead.org>; Tue, 4 Jun 2002 07:09:08 -0400
Subject: JFFS2 and the DOC 2000
From: Bob Chiodini <Robert.Chiodini-1@ksc.nasa.gov>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 04 Jun 2002 07:09:08 -0400
Message-Id: <1023188948.26276.46.camel@tweedy.ksc.nasa.gov>
Mime-Version: 1.0
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

All,

I have a PC/104 Pentium board with a 32MB DOC2000 and 64MB of RAM. 
Currently the system is bootable and running with the 32MB DOC laid out
as follows:

0-1MB reserved for grub_firmware,
1MB-32MB formated with a single ext2 partition

How can I format the DOC with multiple jffs2 partitons.  Fdisk reports
the geometry for the DOC as:
 
Disk /dev/nftla: 1 heads, 64960 sectors, 1 cylinders
Units = cylinders of 64960 * 512 bytes

It appears that with only one cylinder there can be only one partition. 
Will altering the geometry with fdisk work?  I would like the DOC laid
out as follows:

0-2MB reserved for BIOS extension, 
2MB-6MB /dev/nftla1 (ext2 for /boot)
6MB-24MB /dev/nftla2 (jffs2 for /)
24MB-32MB /dev/nftla3 (jffs2 for /home)

Any suggestions?

-- 
Bob Chiodini
Sr. Communications Engineer
Dynacs Engineering Company, Inc.
DNX-18
Kennedy Space Center, Florida 32899
321-867-6313 (voice)
321-867-6300 (fax)

Bob...
