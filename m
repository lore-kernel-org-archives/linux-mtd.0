Received: from bay19-f25.bay19.hotmail.com ([64.4.53.75] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYKNa-0006tc-QR
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 11:02:49 +0100
Message-ID: <BAY19-F25626592BB956CC2B586828BBF0@phx.gbl>
From: "Anil Gupta" <anilgupta9@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 25 Apr 2006 06:02:27 -0400
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Subject: squashfs and NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
We have an embedded system with a squashfs rootfs in NAND flash. The
rootfs is mounted using the RO mtdblock device. The rootfs is
occasionally upgraded, writing the entire squashfs
image into flash using nandwrite.

We found that if the NAND flash has a bad sector, the bad sector is
correctly skipped when the image is written but fs access errors occur
when the fs is mounted. Some debugging shows that the filesystem is
off by 1 when reading flash sectors beyond the bad sector.

We are using squashfs-2.1, kernel 2.4.31, mtd snapshot 20051003.

Should mtd handle bad blocks when using squashfs?

Thanks

-Anil

_________________________________________________________________
Is your PC infected? Get a FREE online computer virus scan from McAfee® 
Security. http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963
