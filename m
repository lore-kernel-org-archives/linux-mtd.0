Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHoS4-0003Bi-0k
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 21:10:53 +0100
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j8KK9xAE028877
	for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2005 16:09:59 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j8KK9xwa095688
	for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2005 16:09:59 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j8KK9naN021974
	for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2005 16:09:49 -0400
Received: from windu.rchland.ibm.com (windu.rchland.ibm.com [9.10.78.95])
	by d01av04.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j8KK9nMl021052
	for <linux-mtd@lists.infradead.org>; Tue, 20 Sep 2005 16:09:49 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 20 Sep 2005 15:09:30 -0500
Message-Id: <1127246971.3156.4.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Compile error with current CVS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Argh guys!  When compiling with CONFIG_JFFS2_FS_WRITEBUFFER not set we
get the following error:


CC      fs/jffs2/compr.o
  CC      fs/jffs2/dir.o
  CC      fs/jffs2/file.o
  CC      fs/jffs2/nodelist.o
/home/jwboyer/linux/fs/jffs2/nodelist.c: In function `check_node_data':
/home/jwboyer/linux/fs/jffs2/nodelist.c:415: error: structure has no
member named `wbuf_pagesize'
/home/jwboyer/linux/fs/jffs2/nodelist.c:417: error: structure has no
member named `wbuf_pagesize'
make[2]: *** [fs/jffs2/nodelist.o] Error 1
make[1]: *** [fs/jffs2] Error 2
make: *** [fs] Error 2

josh
