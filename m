Received: from mx1.cdacindia.com ([203.199.132.35] helo=mx2.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EpSWR-00044y-7u
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2005 10:38:30 -0500
Received: from mailhub.cdac.in ([196.1.109.254])
	by mx2.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2005122221064711252
	for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2005 21:06:47 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id jBMFcKWr026260
	for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2005 21:08:20 +0530
Received: from cdac.in (localhost [127.0.0.1])
	by mailhub.cdac.in (8.13.4/8.13.4) with SMTP id jBMFcJER026255
	for <linux-mtd@lists.infradead.org>; Thu, 22 Dec 2005 21:08:19 +0530
Date: Thu, 22 Dec 2005 21:08:19 +0530 (IST)
To: <linux-mtd@lists.infradead.org>
From: "Nikhil" <nikhils@cdac.in>
Message-ID: <twig.1135265899.51714@cdac.in>
Subject: CLEANMARKER!!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi all,

I am a bit confused regarding the cleanmarker stuff in JFFS2. I understand
that cleanmarker is written to the eraseblock immediately after a
successfull erase, which indicates that the block is empty and can be used
for writes.

Is there any other situation when the cleanmarker has to be added at the
beginning of the eraseblock?

jffs2dump of an image shows the presence of cleanmarker at the beginning
of all the eraseblocks (even if the block contains some valid data). why
is there a need to write cleanmarker in each erase block while creating
image using mkfs.jffs2?
  
-- 
Thanks & Regards

Nikhil
Project Engineer
NISG, CDAC
