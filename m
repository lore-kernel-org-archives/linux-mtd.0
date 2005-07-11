Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DrttJ-0005cz-HP
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2005 04:43:57 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: kyungmin.park@samsung.com
In-Reply-To: <0IJG00C0MFM33V@mmp1.samsung.com>
References: <0IJG00C0MFM33V@mmp1.samsung.com>
Content-Type: text/plain
Date: Mon, 11 Jul 2005 10:47:11 +0200
Message-Id: <1121071631.26713.327.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: [PATCH] OneNAND MTD support
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-07-11 at 17:30 +0900, Kyungmin Park wrote:
> > Please clean up your includes to avoid redundant includes of header
> > files.
> 
> which one do you mean?
> Are there not required header file?

in omap-onenand.c  

+#include <linux/mtd/mtd.h>
+#include <linux/mtd/onenand.h>
+#include <linux/mtd/partitions.h>

Same in onenand_base.c


in onenand.h you have:

+#include <linux/config.h>
----------^^^^^^^^^^^^^^^^
Not needed, as your header does not contain CONFIG_XXX dependend stuff

+#include <linux/kernel.h>
+#include <linux/spinlock.h>
+#include <linux/mtd/mtd.h>
----------^^^^^^^^^^^^^^^^^
Already included above

+#include <linux/mtd/onenand_regs.h>

tglx
