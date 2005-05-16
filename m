Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DXZQX-0006nZ-W1
	for linux-mtd@lists.infradead.org; Mon, 16 May 2005 02:50:10 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Mon, 16 May 2005 14:50:07 +0800
Message-Id: <1116226208.31694.26.camel@server11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: stdio.h and kernel space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I believe that stdio.h is used only in user space. If I am correct that
can anybody please tell me why lld.c, low level driver for AMD CFI
flash, contains stdio.h as header file?


-- 
Munira Ahmed
