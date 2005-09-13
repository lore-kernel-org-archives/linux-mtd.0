Received: from mx1.cdacindia.com ([203.199.132.35] helo=mailx.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EF4jM-0001A8-GF
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 02:57:51 -0400
Received: from mailhub.cdac.in ([196.1.109.254])
	by mailx.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2005091312263529977
	for <linux-mtd@lists.infradead.org>; Tue, 13 Sep 2005 12:26:35 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id j8D6u0Mw007760
	for <linux-mtd@lists.infradead.org>; Tue, 13 Sep 2005 12:26:00 +0530
Date: Tue, 13 Sep 2005 12:26:00 +0530 (IST)
To: <linux-mtd@lists.infradead.org>
From: "Nikhil" <nikhils@cdac.in>
Message-ID: <twig.1126594560.927@cdac.in>
Subject: "Perhaps the file system was created with the wrong erasesize"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I am a newbie in this MTD field so perhaps my question might sound a bit
outdated.

actually i was emulate the compact flash as mtd device, when i try to
mount jffs2 as an ordinary filesystem it is not working. it did work for a
Harddisk partition but when i used the same set of command to make the
same image on a compact flash through USB /dev/sdb2 things are not
working, mount is not sucessfull and i get the following msg :

empty flash at 0X004C8BFC ends at 0X004C8C00
CLEANMAKER node found at 0X004c8C00 not first node in block
node at 0X004CFFE4 with length 0X0000063C would run over the end of the
erase block

Perhaps the filesystem was created with the wrong erasesize?

Eep. Child "msg.h".......................

i am using linux kernel 2.6.12 with mtd support and relevant modules
compiled in kernel and BLKMTD as a loadable Kernel module

while insmod i am also specifying erase size as 64....
i had tried diff permutations of erasesize with insmod and the eraseblock
of mkfs.jffs2 command but the system hangs for CF and works fine in case
of harddisk 
i think many of you all must have gone through this one, i tried to get
around but i am in vain.

someone help!!
-- 
Nikhil Shirodkar
Project Engineer
NISG, CDAC
