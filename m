Received: from soda.ext.ti.com ([198.47.26.145])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ihmse-0003vl-Vi
	for linux-mtd@lists.infradead.org; Tue, 16 Oct 2007 14:54:47 +0100
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by soda.ext.ti.com (8.13.7/8.13.7) with ESMTP id l9GDpiMC002279
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2007 08:51:51 -0500
Received: from x0081444pc (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id l9GDphnK019759
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Oct 2007 19:21:44 +0530 (IST)
From: "Sameer" <x0081444@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: Jffs2 mounting problem on NOR flash
Date: Tue, 16 Oct 2007 19:21:43 +0530
Message-ID: <013001c80ffb$afdad020$ec8818ac@ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am working on Intel NOR flash driver on OMAP based board.
I am testing Sibley NOR flash driver.
The flash used is Intel M18 flash with size 128MB.

Following is scenario
Mounting jffs2 fs on NOR fs partition.
I am able to mount jffs2 on NOR partition sometimes and perform file operations.
Sometime I am getting the following messages on the console

	SR.4 or SR.5 bits set in buffer write (status a0). Clearing.
	Newly-erased block contained word 0xef9bab5a at offset 0x07c00000
	omapflash.0: buffer write error (status 0x190)
	Write clean marker to block at 0x07c00000 failed: -22
	SR.4 or SR.5 bits set in buffer write (status a0). Clearing.
	Newly-erased block contained word 0xfffffff7 at offset 0x07bc0000
	omapflash.0: buffer write error (status 0x190)
	Write clean marker to block at 0x07bc0000 failed: -22

 
But the fs is mounted and I am able to perform the file operations.
The status register value read is 0xa0 which means the erase operation is failing.

I am beginner working on MTD driver, could you please let me know why erase function
is failing sometimes?

 

Thanks,
-Sameer
