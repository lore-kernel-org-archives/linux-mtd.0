Received: from mx10.radisys.com ([206.102.10.36])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VbFC-0002aq-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2002 16:36:26 +0000
To: linux-mtd@lists.infradead.org
Subject: JFFS compile problem on Linux 2.4.10
MIME-Version: 1.0
Message-ID: <OFAE7C11C5.51291617-ON85256B50.00588BDC@radisys.com>
From: Jan.Rovins@radisys.com
Date: Tue, 29 Jan 2002 11:36:27 -0500
Content-Type: text/plain; charset="us-ascii"
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

I pulled the Latest JFFS snapshot off the website yesterday, 
I am in the process of porting a board specific patch from a 2.2.17 kernel
to a 2.4.10 kernel.

In  file inode-v23.c  at line 367 
the compiler didn't like the value member of
inode->i_rdev.value = 0;

(I commented it out & JFFS still seems to be working fine)
perhaps we need a version specific #ifdef
around this line?
(someone with CVS access please fix)

Thanks
Jan
