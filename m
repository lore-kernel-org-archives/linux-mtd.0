Received: from mx1.cdacindia.com ([203.199.132.35] helo=mx2.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ekbmf-00033x-Bq
	for linux-mtd@lists.infradead.org; Fri, 09 Dec 2005 01:31:18 -0500
Received: from mailhub.cdac.in ([196.1.109.254])
	by mx2.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2005120911595302827
	for <linux-mtd@lists.infradead.org>; Fri, 09 Dec 2005 11:59:53 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id jB96V6Wh030269
	for <linux-mtd@lists.infradead.org>; Fri, 9 Dec 2005 12:01:06 +0530
Received: from cdac.in (localhost [127.0.0.1])
	by mailhub.cdac.in (8.13.4/8.13.4) with SMTP id jB96V5SE030257
	for <linux-mtd@lists.infradead.org>; Fri, 9 Dec 2005 12:01:05 +0530
Date: Fri, 9 Dec 2005 12:01:05 +0530 (IST)
To: <linux-mtd@lists.infradead.org>
From: "Nikhil" <nikhils@cdac.in>
Message-ID: <twig.1134109865.32513@cdac.in>
Subject: mtd_debug
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

i just wanted to know if there is any utility to see how the JFFS2
filesystem is written on the flash. Places where inode structures are
stored when a new file is created or if a file has been modified where
actually on the flash this part is written is a new inode created or the
same inode is re-written to some another location along with the data
node.

i tried to view the flash layout using the "mtd-debug read" utility and i
can view part of the data nodes but i am not able to view what exactly is
written as the metadata of the file. Is there any way of getting the
information of the metadata stored on the flash. 

thanks in advance  

-- 
Thanks & Regards

Nikhil Shirodkar
Project Engineer
NISG, CDAC
