Received: from mx1.cdacindia.com ([203.199.132.35] helo=mx2.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F4XgY-0006ts-Oe
	for linux-mtd@lists.infradead.org; Thu, 02 Feb 2006 01:11:22 -0500
Received: from mailhub.cdac.in ([203.199.132.67])
	by mx2.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2006020211392015675
	for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2006 11:39:20 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id k126B4rL024579
	for <linux-mtd@lists.infradead.org>; Thu, 2 Feb 2006 11:41:05 +0530
From: "NIkhil Shirodkar" <nikhils@cdac.in>
To: "h hd" <mycmos@gmail.com>, <linux-mtd@lists.infradead.org>
Date: Thu, 2 Feb 2006 11:44:29 -0000
Message-ID: <GKELLIPIEBJEKGFGNIFKMEDBCAAA.nikhils@cdac.in>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <5c591ceb0602012157p1711b327t48d96d7ff1e0789d@mail.gmail.com>
Cc: 
Subject: RE: mtd on cf card
Reply-To: nikhils@cdac.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey,

I have tried successfully to run JFFS2 on cf using MTD

You need to insert a block2mtd module in the linux, as the CF has a built in
translation layer and it presents the NAND flash of the compact flash as
normal block device. Whether using MTD/JFFS2 for CF will improve the life of
the CF is still a mystery for me, but the block2mtd module presents any
block device (harddisk/CF) as a MTD device and u can then use the MTD layer
and mount JFFS2 on the block device.

Hope that info is helpful

thx,

nik
NISG, CDAC

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of h hd
Sent: Thursday, February 02, 2006 5:58 AM
To: linux-mtd@lists.infradead.org
Subject: mtd on cf card

 Hi,

      I have an at91rm9200 board. It has two 4M nor flashes and a compact
 flash card interface. But I have to run cardmgr command every time to mount
 the cf card. Furthermore, I don't know how to use mtd and jffs2 in the cf
 card. Is there anybody can help me?

 --
 best wishes,
      mycmos

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
