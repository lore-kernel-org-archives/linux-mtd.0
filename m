Received: from mailout04.sul.t-online.com ([194.25.134.18] helo=mailout04.sul.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ejSp-0003Qh-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 21:39:59 +0100
Received: from gmx.de (lisa.simpson.priv [192.168.2.131])
	by lisa.simpson.priv (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id f85Kjvc14512
	for <linux-mtd@lists.infradead.org>; Wed, 5 Sep 2001 22:45:57 +0200
Message-ID: <3B968F05.55BD868A@gmx.de>
Date: Wed, 05 Sep 2001 22:45:57 +0200
From: Thomas Eschenbacher <Thomas.Eschenbacher@gmx.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: MTD in kernel 2.4.9
Content-Type: text/plain; charset=us-ascii
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

Hi there,

just a newbie question: is there a way to get the current cvs version of
mtd/jffs2 working with kernel 2.4.9?

I can't find any patch for current kernels and if I just spread all the
files/dirs into their destination in the kernel source I can no longer
compile and earn hundreds of error messages.

I'd like to use JFFS2 and I have to boot from it, so compiling separate
from the kernel and making modules is not possible.

Is it possible to use the current JFFS2 with the 2.4.9's mtd drivers -
or let's say: is that mtd stuff in 2.4.9 "new enough" ?

thanks,
   Thomas.
-- 
________________________________________________________________________
Thomas Eschenbacher                           Thomas.Eschenbacher@gmx.de
