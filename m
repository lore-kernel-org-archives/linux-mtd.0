Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D37XD-00063L-Q3
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 01:59:12 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: William J Beksi <wjbeksi@setabox.com>
In-Reply-To: <4209C985.3020902@setabox.com>
References: <4209C985.3020902@setabox.com>
Content-Type: text/plain
Date: Mon, 21 Feb 2005 07:59:05 +0100
Message-Id: <1108969145.24721.419.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] accessing NAND flash through an IDE interface
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-02-09 at 16:27 +0800, William J Beksi wrote:
> Hi Thomas,
> I am not sure if you received the patch I sent you last month for 
> accessing nand flash through an IDE interface so I am sending it again.

@@ -84,6 +84,8 @@
 #include <linux/mtd/partitions.h>
 #endif
 
+#define NAND_USE_IO_INSTR      0

As I said before, I'm not going to accept a change which needs to tweak
a source file to make use of it.

tglx
