Received: from [66.232.140.120] (helo=nsGotta.gotta.co.kr)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BCDJG-0001k3-BB
	for linux-mtd@lists.infradead.org; Sat, 10 Apr 2004 08:53:50 +0100
Received: from prabhakar ([220.75.229.144])
	(authenticated)
	by nsGotta.gotta.co.kr (8.11.6/8.11.6) with ESMTP id i3A8GLC27890
	for <linux-mtd@lists.infradead.org>; Sat, 10 Apr 2004 17:16:21 +0900
From: "Prabhakar Kalasani" <kalasani@sena.com>
To: <linux-mtd@lists.infradead.org>
Date: Sat, 10 Apr 2004 16:54:41 +0900
Message-ID: <ACEDKFIMODAHBNCONGOHAENICCAA.kalasani@sena.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: How to write and read AM29DL640D
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Can anybody tell me the command sequences for writing a byte(0x59) to
flash(AM29DL640D) at an address 0x79FFFF , and reading back the same data ,
as I need to find the size of the flash available on my board , I have two
different sizes chips (AM29DL640D(8MBx2 chips) ,AM29DL642G (16MBx2 chips))
on two different board , I need to support both the boards with same
bootloader , so I need to find exact device and size before booting.

Is there any other way to do my need ?

Thanks in advance

Best regards,
KP
