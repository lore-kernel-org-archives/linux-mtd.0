Received: from mx1.cdacindia.com ([203.199.132.35] helo=mx2.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfAq0-0004HC-Fh
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 01:44:12 -0500
Received: from mailhub.cdac.in ([196.1.109.254])
	by mx2.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2005112412124509345
	for <linux-mtd@lists.infradead.org>; Thu, 24 Nov 2005 12:12:45 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id jAO6i5jN026312
	for <linux-mtd@lists.infradead.org>; Thu, 24 Nov 2005 12:14:05 +0530
Received: from cdac.in (localhost [127.0.0.1])
	by mailhub.cdac.in (8.13.4/8.13.4) with SMTP id jAO6i41e026309
	for <linux-mtd@lists.infradead.org>; Thu, 24 Nov 2005 12:14:04 +0530
Date: Thu, 24 Nov 2005 12:14:04 +0530 (IST)
To: <linux-mtd@lists.infradead.org>
From: "Nikhil" <nikhils@cdac.in>
Message-ID: <twig.1132814644.42779@cdac.in>
In-Reply-To: <twig.1132813909.78363@cdac.in>
Subject: dd image without flash_eraseall 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 24, 2005, Nikhil <nikhils@cdac.in> said:

 Hi all,
 
 I just wanted some clarity on some of the results i am geting by 'dd'ing
 on compact flash without flash_eraseall
 
 I did the following
 1) Made an image of some directory with 40 odd files usking mkfs.jffs2
 2) dd if=image of=/dev/mtdblock0
 3) mount -t jffs2 /dev/mtdblock0 /mnt/cf
 4) checked the contents by ls then removed around 19 files by rm.
 5) unmounted
 6) dd the same image again
 7) mounted  and checked by ls
 
 i was expecting to get all the files but the files which were removed by
 rm were not present. i understand that doing flash_eraseall will overcome
 this problem but the following expt makes things confusing.
 
 In this expt. i did the same step from the above 1-5.  Now instead of
 dd'ing the same image, I dd some different image.  Now this image is
 overwritten onto the flash (without me explicitly using flash_eraseall).
 
 If dd'ing a new image overwrites the flash (without flash_eraseall),
 shouldn't the same be true when I dd the same image?
  
 -- 
 Thanks & Regards
 
 Nikhil Shirodkar
 Project Engineer
 NISG, CDAC
