Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D0bmz-0006HR-TA
	for linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 03:41:10 -0500
Received: from custom-daemon.mailout1.samsung.com by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	id <0IBW00L0184C1L@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 17:41:00 +0900 (KST)
Received: from ep_mmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IBW003FZ84CVL@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 17:41:00 +0900 (KST)
Received: from july7 ([168.219.213.193])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPSA id <0IBW007DD84BOU@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Feb 2005 17:41:00 +0900 (KST)
Date: Mon, 14 Feb 2005 17:40:59 +0900
From: kyungmin park <kyungmin.park@samsung.com>
To: 'David Woodhouse' <dwmw2@infradead.org>,
	'Thomas Gleixner' <tglx@linutronix.de>
Message-id: <0IBW007DE84BOU@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 7BIT
Cc: linux-mtd@lists.infradead.org
Subject: [RFC] adding support for OneNAND flash memory
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear,

I'm working on a MTD driver-level support for OneNAND flash memory.
OneNAND is a new type of fusion flash memory which has a small control logic inside.
It is connected to the CPU via NOR flash interface, but acts like NAND device.

At first, I've tried using the existing nand framework and extending it. However, due to the difference in the interfacing scheme, the existing nand framework needs to be modified heavily. 
This is due to the fact that every NAND command is directly written to the OneNAND controller register accessed via address bus, while the data is read through specific buffer accessed via address bus and read via data bus.

E.g., write operation
In NAND nature, basic operations are based on address/command latch enable.

1. send start address (ALE)
2. send write command (CLE)
3. write data
4. send write command (CLE)
5. send status command (CLE)
6. check status

But OneNAND operations are different from NAND flash.
The OneNAND uses register based access

1. select DataRAM* (REG)
2. write data into DataRAM
3. write block and page to Start Address Register (REG)
4. write Start Buffer Register (REG)
5. write 0 to interrupt register (REG)
6. write program command to command register (REG)
7. wait for write completed
8. read controller status register (REG)
9. check status
Note: (1) must happen before data input

So it's hard to apply OneNAND access method to current nand directory

Moreover,

To identify the OneNAND scheme is changed. There's no read id command.
Just it reads from device id register (read-only).
Also the device ids can be conflicted between NAND and OneNAND.

For this reason, I'd like to suggest adding another directory (ex. drivers/mtd/onenand) to mtd source tree for supporting OneNAND flash memory instead of modifying/extending existing nand framework.

Comments are always welcome.

Regards,

ps. for detailed info about OneNAND, please visit the following link http://www.samsung.com/Products/Semiconductor/Flash/OneNAND_TM/512Mbit/KFG1216Q2M/KFG1216Q2M.htm

--
 
Kyungmin Park
Embedded Linux Group, System Lab.
Samsung Electronics Co., Ltd.
E-mail: kyungmin.park@samsung.com
Office: +82-31-200-3109
