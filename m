Received: from 211-23-38-20.hinet-ip.hinet.net ([211.23.38.20]
	helo=serversw.iei.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ODvM-0003Lj-Dw
	for <linux-mtd@lists.infradead.org>; Fri, 06 Jun 2003 10:54:17 +0100
Received: from serversw.iei.com.tw (root@localhost)
	by serversw.iei.com.tw with ESMTP id h569mFU21622
	for <linux-mtd@lists.infradead.org>;
	Fri, 6 Jun 2003 17:48:15 +0800 (CST)
Received: from antivirusgw.hq.iei ([172.16.2.30])
	by serversw.iei.com.tw with SMTP id h569mBK21608
	for <linux-mtd@lists.infradead.org>;
	Fri, 6 Jun 2003 17:48:11 +0800 (CST)
Message-ID: <015b01c32c11$a5c2a950$511711ac@kevinliao>
From: "Kevin Liao" <kevinliao@iei.com.tw>
To: <manningc2@actrix.gen.nz>, "Pantelis Antoniou" <panto@intracom.gr>,
   <tglx@linutronix.de>
References: 
	<3EDB2F4E.6050502@intracom.gr><200306042016.01366.tglx@linutronix.de>
	<3EDEF1D7.9030700@intracom.gr> <20030605210731.4E663157C7@desire.actrix.co.nz>
Date: Fri, 6 Jun 2003 17:54:40 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: NAND write verify failed problem -->cramfs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry I am new to this list and I have two questions as below:

1. To loop mount a CRAMFS (root file system) image on one JFFS2 partition, we should mount that partition first, shouldn't we? But
how can we mount that JFFS2 partition without mounting the root file system?

2. Currently I use NAND flash with ramdisk image on /dev/mtdblock1 as the root file system. Usually I write the ramdisk image using
the command "nandwrite /dev/mtdblock1 ramdisk.gz". So far everything works fine. But I am wondering whether the kernel can still
load the ramdisk image if there are some bad blocks on /dev/mtdblock1?

Thanks a lot for the help.

Regards,
Kevin

----- Original Message ----- 
From: "Charles Manning" <manningc2@actrix.gen.nz>
To: "Pantelis Antoniou" <panto@intracom.gr>; <tglx@linutronix.de>
Cc: <linux-mtd@lists.infradead.org>
Sent: Friday, June 06, 2003 5:10 AM
Subject: Re: NAND write verify failed problem -->cramfs



> BTW, is there something anologous to CRAMFS for NAND flash?
> I have a need for a compressed read-only filesystem on NAND
> but CRAMFS has no concept of bad blocks.

You could use loop mounting. ie. store the CRAMFS  image using a normal NAND
file system (YAFFS or JFFS2) and loop mount it with cramfs.

-- CHarles

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
