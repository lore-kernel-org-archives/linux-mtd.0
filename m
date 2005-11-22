Received: from mx1.cdacindia.com ([203.199.132.35] helo=mx2.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeSWd-0002Q4-41
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 02:25:17 -0500
Received: from mailhub.cdac.in ([196.1.109.254])
	by mx2.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2005112212535223931
	for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2005 12:53:52 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id jAM7P5Rf003767
	for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2005 12:55:05 +0530
Received: from cdac.in (localhost [127.0.0.1])
	by mailhub.cdac.in (8.13.4/8.13.4) with SMTP id jAM7P5wo003758
	for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2005 12:55:05 +0530
Date: Tue, 22 Nov 2005 12:55:05 +0530 (IST)
To: <linux-mtd@lists.infradead.org>
From: "Nikhil" <nikhils@cdac.in>
Message-ID: <twig.1132644305.54050@cdac.in>
Subject: MKFS.JFFS2 util
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi all,

I am a bit confused whether i need to use mkfs.jffs2 when i need to save
data files on flash in jffs2 format, or is it fine to just mount flash
partition as jffs2 and simply copy the file from another storage(e.g. hard
disk)

i had a txt file on /home/mydir/test.txt which i need to have it on flash
in JFFS2 format. 

i followed the following steps.
1) mount the partition as JFFS2 (mount -t jffs2 /dev/mtdblock0 /mnt/cf)
and 
2) then copy the file (cp /home/mydir/test.txt /mnt/cf/) or 

1) i can MKFS.JFFS2 on the dir (mkfs.jffs2 -d /home/mydir/ -o myimage) 
2) then dd it to flash (dd if=myimage of=/dev/mtdblock0)
3) and then mount it (mount -t jffs2 /dev/mtdblock0 /mnt/cf/)

is the first method the correct way of implementation, as i am getting the
same results either way but i need not use mkfs.jffs2. if yes, then when
shud i use mkfs.jffs2 utility 




-- 
Thanks & Regards

Nikhil Shirodkar
Project Engineer
NISG, CDAC
