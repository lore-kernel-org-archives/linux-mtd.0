Received: from rwcrmhc54.attbi.com ([216.148.227.87])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177R14-00087m-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 May 2002 02:22:14 +0100
Received: from attbi.com ([12.233.209.146]) by rwcrmhc54.attbi.com
          (InterMail vM.4.01.03.27 201-229-121-127-20010626) with ESMTP
          id <20020514012142.SJSS25765.rwcrmhc54.attbi.com@attbi.com>
          for <linux-mtd@lists.infradead.org>;
          Tue, 14 May 2002 01:21:42 +0000
Received: (from will@localhost)
	by attbi.com (8.11.6/8.11.6/SuSE Linux 0.5) id g4E1LYC06039
	for linux-mtd@lists.infradead.org; Mon, 13 May 2002 18:21:34 -0700
Date: Mon, 13 May 2002 18:21:33 -0700
From: Michael.Will@attbi.com
To: linux-mtd@lists.infradead.org
Subject: Advise sought: new FAT12 for SmartMedia driver
Message-ID: <20020513182133.D4497@attbi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

I am interested in contributing to Paul's work on the SmartMedia driver,
especially to access the jpeg images my Fuj Finepix 1400 digital camera
writes to it in a FAT12 format. I am sick of booting Windows XP just for
copying the pictures. 

As far as I understand it, I will have to write a translation layer that
is a MTD-user, providing a block-device interface to read all blocks from
the CIS structure that belong to the FAT12 filesystem. Then it can be
mounted read-only by the normal VFAT+msdosfs code of the kernel. 

I looked at the way the usb smartmedia card sddr09 driver is programmed,
but it seems that the sddr09 has some kind of SCSI adapter on the device, 
and so the device driver actually does only do a mapping between real scsi
requests (10 byte) and the one implemented in the firmware of the sddr09
hardware, and shipping those across the usb bus using the usb-storage 
infrastructure. 

An interpretation of the CIS datastructure 

What would I gain if I implemented a virtual scsi host analogous to how
the usb-storage driver does it? And then map the scsi requests to the
corresponding mtd calls?

On the other hand I could just write a FAT12 extraction block device that
can be directly mounted, too. 

Where should I start? 

Michael Will
PS: My next step is studying ftl.c 
-- 
LINUX pleite - MS in Mikrofirmen aufgelöst - Apple verwirrt
