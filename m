Received: from mx1.cdacindia.com ([203.199.132.35] helo=mx2.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHezb-0007iP-Gp
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 05:38:40 -0500
Received: from mailhub.cdac.in ([203.199.132.67])
	by mx2.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2006031016041324452
	for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2006 16:04:13 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id k2AAZrEB004697
	for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2006 16:05:54 +0530
Date: Fri, 10 Mar 2006 16:05:52 +0530 (IST)
To: <linux-mtd@lists.infradead.org>
From: "Nikhil" <nikhils@cdac.in>
Message-ID: <twig.1141986952.51718@cdac.in>
Cc: nikhils@cdac.in
Subject: About JFFS2 garbage collector.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

I am fascinated about the JFFS3 garbage collect mechanism but before
moving to the JFFS3 garbage collection policy i wanted to analyse the
jffs2 garbage collection. 

Is there any documentations as such for the JFFS2 garbage collection
policy. Plaese let me know if any. Even if there is none, i am not
hesistant to look in the code, can some one of you give me some pointers
for the same.

i would also like to kno all the instances when the GC thread gets
activated for JFFS2.

Seeking your advice, thanks for the same..
 
-- 
Thanks & Regards

Nikhil Shirodkar
Project Engineer
NISG, CDAC
