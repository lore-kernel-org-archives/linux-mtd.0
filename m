Received: from [152.101.51.1] (helo=janus.hk.panelx.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 197rqr-0005Ik-Nt
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 08:06:02 +0100
Message-ID: <013401c3089d$9a930580$9000010a@paulwong>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 22 Apr 2003 15:05:48 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Subject: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Hi all!
     i installed the YAFFS file system in the NAND flash (samsung 16MB). And
 test the reliability. I tried to copy a 5 MB file to the mounted yaffs
 (spare 8MB) directory ( i separated the device to 3 partition - 4MB 4MB and
 8MB) . and then check the disk space, it is shown that it has 3 MB spare.
 Next step, I erased the file and copied another 5 MB file to it. The device
 said " no enough spare. Then I use the "mkyaffs" to format it, it is shown
 many bad block in the device. I checked the OOB[5] ( bad block flag) it is
 set to 0x00. Why? Why the yaffs set the health block to the bad block after
 erase file? Is the YAFFS not support big file ?  any ideal?

 Thanks

Paul
