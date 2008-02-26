Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JTrrH-0007Ng-Tq
	for linux-mtd@lists.infradead.org; Tue, 26 Feb 2008 04:56:04 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.57])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	m1Q4u31a007215
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2008 20:56:03 -0800
To: linux-mtd@lists.infradead.org
Subject: Question about the size field of mtd_info
MIME-Version: 1.0
Message-ID: <OF364D6CEB.467C00F3-ON882573FB.001A64F5-882573FB.001B164C@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Mon, 25 Feb 2008 20:55:58 -0800
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm new to MTD (and writting drivers for Linux :-/ ), and I'm not sure 
about a result I'm seeing in mtd_info->size.  I'm putting together a NAND 
flash driver that ultimately will have 8G of flash attached to it in 2G, 
4G, and 8G stuffing options.  When I'm working with the 2G board 
everything looks fine, but when I jumped to the 4G board I found something 
interesting.  (I don't want to call it a bug, because I don't know how 
things work yet, so I'll stick with "interesting".)  With the 2G board 
mtd_info->size = 0x80000000, which is resonable, however, on the 4G board 
mtd_info->size = 0x0.  That makes sense because 4G= 0x100000000, one bit 
more than can be held in a 32-bit value which is how big mtd_info->size 
is, but it sure makes a mess of the calculations that use mtd_info->size. 
My question is, is this a bug or am I doing something wrong?

Thanks.

Bruce
