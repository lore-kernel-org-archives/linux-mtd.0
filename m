Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1ClX4F-0004h1-W9
	for linux-mtd@lists.infradead.org; Mon, 03 Jan 2005 13:36:37 -0500
Received: from superfortress.nrl.navy.mil ([132.250.130.208])
	by osdsun1.nrl.navy.mil with esmtp (Exim 3.35 #1 (Debian))
	id 1ClWpJ-0006Ri-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Jan 2005 13:21:09 -0500
Message-ID: <41D9949B.5070207@ieee.org>
Date: Mon, 03 Jan 2005 13:53:15 -0500
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: MTD mailling list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: DOCBoot update
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To those interested:

I've just committed to CVS a new version of DOCBoot, a small Linux 
bootloader for some DiskOnChip devices.  This version adds initrd 
support, the ability to abort DOCBoot from the keyboard, and flexibility 
in the location of the kernel image.  Full details are available in 
docboot/README.

	-Dan Brown
