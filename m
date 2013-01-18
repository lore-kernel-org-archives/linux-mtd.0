Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tw6xK-0007O8-G3
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2013 08:05:43 +0000
Message-ID: <50F9023D.5040408@freescale.com>
Date: Fri, 18 Jan 2013 16:05:17 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>
Subject: question: Why the nand_wait() wait for 20ms for nand program.
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all:
Why the nand_wait() wait for 20ms for nand program. could we
expand this time to 40ms? I have a nand chip : Micron MT29F64G08CBABAWP.
The chip's BUSY/READY pin may needs more then 20ms to become ready,
though its
datasheet tells me the tPROG's max value is 2.5ms.

thanks
Huang Shijie
