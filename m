Received: from lmsmtp04.st1.spray.net ([212.78.202.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18AIwP-0001Gx-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Nov 2002 23:53:33 +0000
Received: from lycos.de (p50859B38.dip.t-dialin.net [80.133.155.56])
	by lmsmtp04.st1.spray.net (Postfix) with ESMTP id 5A74F47E92
	for <linux-mtd@lists.infradead.org>; Sat,  9 Nov 2002 01:23:24 +0100 (MET)
Message-ID: <3DCC55A3.301@lycos.de>
Date: Sat, 09 Nov 2002 01:24:03 +0100
From: Indy500 <indy5xl@lycos.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Compile error
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi

I try to compile the CVS Tree 21.10 and above with linuxkernel 2.4.19 
but there is always a compile error on File mtdpart.c

mtdpart.c: In function `part_unpoint':
mtdpart.c:76: too many arguments to function
mtdpart.c: In function `add_mtd_partitions':
mtdpart.c:331: warning: assignment from incompatible pointer type
make[4]: *** [mtdpart.o] Fehler 1

any Ideas?
