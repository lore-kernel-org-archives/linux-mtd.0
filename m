Received: from mx1.cdacindia.com ([203.199.132.35] helo=mx2.cdac.ernet.in)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ExQLg-0001MY-7S
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2006 09:56:25 -0500
Received: from mailhub.cdac.in ([203.199.132.67])
	by mx2.cdac.ernet.in (SAVSMTP 3.1.0.29) with SMTP id
	M2006011320242408568
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2006 20:24:24 +0530
Received: from mailhub.cdac.in (mailhub [196.1.109.254])
	by mailhub.cdac.in (8.13.4/8.13.4) with ESMTP id k0DEu7YI028904
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2006 20:26:07 +0530
Received: from cdac.in (localhost [127.0.0.1])
	by mailhub.cdac.in (8.13.4/8.13.4) with SMTP id k0DEu7xm028901
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2006 20:26:07 +0530
Date: Fri, 13 Jan 2006 20:26:07 +0530 (IST)
To: <linux-mtd@lists.infradead.org>
From: "Nikhil" <nikhils@cdac.in>
Message-ID: <twig.1137164167.21280@cdac.in>
Subject: Question regading Cleanmarker.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

I am analysing the jffs2 methodology for updating the flash memory. I
understand that the jffs2_sb_info maintains three list i.e free_list,
clean_list and dirty_list.

the garbage collector acts on the blocks on the dirty_list and on erasing
those blocks writes a CLEANMARKER to the first 12 bytes indicating
succesful erase and move the block from dirty_list to free_list.

So all the blocks in the free_list are empty with first twelve bytes
having a CLEANMARKER. Whenever some node has to be written on the flash, a
block from the free_list is picked and written.

whether it will overwrite the CLEANMARKER bytes... if so then it has to
perform erase of the whole block again...

else the block is appended after the CLEANMARKER bytes... if so, then
after some time when this block moves from clean_list to dirty_list (by
some updations on the file data or else) how will the garbage collector
identify the block as clean/unclean as the the CLEANMARKER will be
present. 

whether the garbage collector neglects this CLEANMARKER when is it getting
updated or removed? else after some point of time, all the eraseblocks
will have a CLEANMARKER which will defeat the basic purpose of having a
CLEANMARKER.  
 
there is one more query about delayed write. What is the size of the
buffer which gets written on the flash? is it the page size or the erase
block size or is it a function of time?

Can you help in clearing my doubt?

-- 
Thanks & Regards

Nikhil Shirodkar
Project Engineer
NISG, CDAC
