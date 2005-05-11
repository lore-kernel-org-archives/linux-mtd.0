Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DVz62-0002vd-3q
	for linux-mtd@lists.infradead.org; Wed, 11 May 2005 17:50:29 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1115239415.6079.3.camel@ibm-ptfdj7idx47.rchland.ibm.com>
References: <20050504201852.7642.qmail@web51007.mail.yahoo.com>
	<1115239415.6079.3.camel@ibm-ptfdj7idx47.rchland.ibm.com>
Content-Type: text/plain
Date: Wed, 11 May 2005 21:51:22 +0000
Message-Id: <1115848282.22180.115.camel@tglx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Vahid Fereydunkolahi <fereydunk@yahoo.com>, linux-mtd@lists.infradead.org
Subject: Re: two questions about jffs2
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-05-04 at 15:43 -0500, Josh Boyer wrote:

> JFFS2 handles bad blocks.  It does this by detecting a block is bad, and
> then never doing anything with said block.  The definition of a bad
> block is that it is marked as such in the spare area at manufacturing
> time. Any write/erase operation to such a block would cause this
> information to be lost.  Therefore, JFFS2 does not touch these blocks
> during runtime.

Even if the filesystem misbehaves the nand driver in the mtd layer
refuses to write/erase bad blocks. 

tglx
