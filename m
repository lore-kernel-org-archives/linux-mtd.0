Received: from mx1.cdacindia.com ([203.199.132.35] helo=mx2.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EjGCa-0003Sz-34
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2005 08:16:26 -0500
Received: from mailhub.cdac.in ([196.1.109.254])
	by mx2.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2005120518451315485
	for <linux-mtd@lists.infradead.org>; Mon, 05 Dec 2005 18:45:13 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id jB5DGEJL032572
	for <linux-mtd@lists.infradead.org>; Mon, 5 Dec 2005 18:46:14 +0530
Received: from cdac.in (localhost [127.0.0.1])
	by mailhub.cdac.in (8.13.4/8.13.4) with SMTP id jB5DGDaY032565
	for <linux-mtd@lists.infradead.org>; Mon, 5 Dec 2005 18:46:13 +0530
Date: Mon, 5 Dec 2005 18:46:13 +0530 (IST)
To: <linux-mtd@lists.infradead.org>
From: "Nikhil" <nikhils@cdac.in>
Message-ID: <twig.1133788573.93553@cdac.in>
Subject: mtdpart.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


hi all,

I had a trivial doubt about the functioning of mtdpart.c.

First of all if we create the mtd partitions from the comandline (using
mtdpart=...) how can we check whether the partitions heve been created? 

I am using block2mtd for mounting JFFS2 on compact flash. whether i need
to create different partitions using fdisk and then emulate each using
block2mtd or i should use mtdpart for making partitions on a single mtd
block created using block2mtd.

which one is the better option?

-- 
Thanks & Regards

Nikhil Shirodkar
Project Engineer
NISG, CDAC
