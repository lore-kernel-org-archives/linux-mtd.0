Received: from zjuem.zju.edu.cn ([210.32.156.193] helo=zju.edu.cn)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18243X-0002eo-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2002 07:22:51 +0100
Date: Sun, 17 Oct 2004 14:32:30 +0800
From: xuli <slowforce@zju.edu.cn>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Subject: JFFS2 basic question
Mime-Version: 1.0
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
Message-Id: <E18243X-0002eo-00@pentafluge.infradead.org>
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

Hello all,
i want to implement the jffs2 file system under kernel2.4.4,
but when i compile the kernel with the MTD and Jffs2 support
i got a lot of errors: multiple definition. Because there is 
a file zlib.c both located in fs/jffs2/ and drivers/net/.
Does anybody meet the same problem with me?
Li
