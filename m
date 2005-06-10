Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DgeCf-0004ci-Na
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2005 03:45:23 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Phillip Kamp <pkamp@equator.com>
In-Reply-To: <42A8DC02.90708@equator.com>
References: <42A8DC02.90708@equator.com>
Content-Type: text/plain
Date: Fri, 10 Jun 2005 09:46:17 +0200
Message-Id: <1118389577.13312.41.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 --cleanmarker=?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-06-09 at 17:17 -0700, Phillip Kamp wrote:
> I'm developing a proprietary nand flash driver based on the
> drivers/mtd/nand/nand_base.c code.  I can successfully read

What for ? The nand_base.c code can deal with your chip and just needs a
small and simple board support driver.

tglx
