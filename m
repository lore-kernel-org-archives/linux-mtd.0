Received: from e1.ny.us.ibm.com ([32.97.182.101])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHpGI-0007AS-9W
	for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2003 18:53:42 +0000
Received: from northrelay04.pok.ibm.com (northrelay04.pok.ibm.com
	[9.56.224.206])
	by e1.ny.us.ibm.com (8.12.10/NS PXFA) with ESMTP id hA6Iprf8477778
	for <linux-mtd@lists.infradead.org>; Thu, 6 Nov 2003 13:51:53 -0500
Received: from d01ml605.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	hA6Ippij067864
	for <linux-mtd@lists.infradead.org>; Thu, 6 Nov 2003 13:51:52 -0500
In-Reply-To: <E1AHKvt-0001UM-VZ@pentafluge.infradead.org>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
From: Joan Dyer <joandy@us.ibm.com>
Message-ID: <OFF4841C15.D689EB19-ON85256DD6.00644A30-85256DD6.00679D59@us.ibm.com>
Date: Thu, 6 Nov 2003 13:51:51 -0500
Content-Type: text/plain; charset="US-ASCII"
Subject: Re: Jffs2 write Error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I too have encountered this error (IOERR -5).  Repeating the failed 
operation generally works but that doesn't find the cause.

I am working with a relatively new jffs2 backported to kernel 2.4.18 with 
patches.  I'm just starting to work on this; has there been any new 
information not yet on the list?
