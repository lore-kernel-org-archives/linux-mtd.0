Received: from f04s01.cac.psu.edu ([128.118.141.31] helo=f04n01.cac.psu.edu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cB90-0005h2-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 20:36:59 +0100
Received: from nrlgrad.psu.edu (nrlgrad.cedcc.psu.edu [130.203.252.43])
	by f04n01.cac.psu.edu (8.9.3/8.9.3) with ESMTP id PAA103190
	for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2001 15:42:53 -0400
Message-Id: <5.1.0.14.2.20010829153518.00a677d0@mail.psu.edu>
Date: Wed, 29 Aug 2001 15:42:54 -0400
To: linux-mtd@lists.infradead.org
From: Bill Seisler <wrs122@psu.edu>
Subject: DOC 2000 file install question
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Your help so far has been wonderful. I have a much better understanding of 
what is really going on in the system which is key. I rattled my brain for 
over a week before I sent out any help messages.

Ok, I can boot from the HDD and see the DoC. I'm ready to put a file system 
on it and copy files to it. It is 144 Megs, therefore I don't think I need 
to compress it. I've heard a lot of good things about JFFS but I also heard 
it's not quite functional with DoC, is this true? If so, is ext2 fine? 
Also, does anyone know of a good utility to batch copy over to the DoC what 
it needs to run stand-alone (aside from the kernel). M-Sys had a nice 
utility but it was for RedHat 6.2 and it relies on their drivers, which I 
am not using. I can try hacking the script but I am not the most confident 
at my capabilities there. Also, what should I use to modify lilo to boot 
the Disk on Chip? I found the mtd-lilo hack. Is there a more up to date 
version than what was published in April? and it looks like the CVS might 
have it packaged in it as well or that could be from staring at the monitor 
too long.

-Bill
