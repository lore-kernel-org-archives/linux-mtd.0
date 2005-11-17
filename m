Received: from ms01.sssup.it ([193.205.80.99] helo=sssup.it)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ecg1f-0004SL-6d
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 04:25:54 -0500
Received: from [193.205.82.7] (HELO gandalf.sssup.it)
	by sssup.it (CommuniGate Pro SMTP 4.1.8)
	with ESMTP-TLS id 17356507 for linux-mtd@lists.infradead.org;
	Thu, 17 Nov 2005 09:47:32 +0100
Received: from [192.168.82.59] (feanor.sssup.it [193.205.82.6])
	by gandalf.sssup.it (8.12.10/8.12.10) with ESMTP id jAH8tWG0018129
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2005 09:55:32 +0100
Message-ID: <437C4589.8020700@gandalf.sssup.it>
Date: Thu, 17 Nov 2005 09:55:37 +0100
From: Michael Trimarchi <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: MTD mailing list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: s3c2410 bootloader flashing with multi-ice
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
The problem is to load the bootloader on the nand flash using the 
multi-ice support. Currently I use the vivi bootloader and I would like 
to write it on Nand. Vivi has the support to boot from NAND.
Two question:
- How can I write to nand, is there an open project for flashing the 
bootloader on NAND?
- Is there a  better bootloader

Regards Michael
