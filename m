Received: from router-100m.swansea.linux.org.uk ([194.168.151.17] helo=the-village.bc.nu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15H38K-0000QK-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 13:48:57 +0100
Subject: Re: linux-2.4.6-pre8/drivers/mtd/nand/spia.c: undefined symbols
To: sjhill@cotw.com
Date: Mon, 2 Jul 2001 13:52:46 +0100 (BST)
Cc: adam@yggdrasil.com (Adam J. Richter), dwmw2@redhat.com,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <3B406B63.4E28CA8A@cotw.com> from "Steven J. Hill" at Jul 02, 2001 07:38:59 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <E15H3C2-0005qS-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> The way that I architected the raw NAND flash device driver was to
> break it into 2 parts. 'nand.c' contains the actual driver code and
> is considered to be device independent. 'spia.c' is the device
> dependent part. You should write your own version of 'spia.c' and

So the Config.in is wrong since I can select spia on x86
