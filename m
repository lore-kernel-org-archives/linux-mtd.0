Received: from msr29.hinet.net ([168.95.4.129] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dR5i-0003ZY-00
	for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2002 08:55:18 +0100
Received: from stevexp (61-228-124-243.HINET-IP.hinet.net [61.228.124.243])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id PAA05853
	for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2002 15:56:23 +0800 (CST)
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: NAND Configuration
Date: Sat, 10 Aug 2002 15:54:59 +0800
Message-ID: <000a01c24043$3a331d10$80d1a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1028880582.9673.28.camel@thomas.tec.linutronix.de>
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

That's the fault of our board. We can not adujst a proper chip_delay, so
we add a circuit to check the ready bit and it does not have these
errors so far. Do you think chip_delay can be used with NAND flash? I
don't think it is good idea to use chip_delay.

Steve Tsai

> > I got another problem in mounting  JFFS2 file system.  When 
> I write a 
> > JFFS2 image into the NAND partition, I can mount it on /mnt. If I 
> > write a JFFS2 image into the NAND partition and reboot 
> system to use 
> > it as the root file system, there are some CRC errors 
> occur. When the 
> > system mounts the root file system, it will start to access files 
> > also. Does the kernel access file on jffs2 file system too early?
> No, also the kernel has to wait until the filesystem is 
> mounted complete. The kernel reads files, which you probably 
> do not access, when you mount it manually on /mnt. Try to 
> copy all your files from /mnt to anywhere and check, if the 
> same errors occure. 
> 
