Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bn7Cj-0003tr-44
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 22:51:37 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Aras Vaichas <arasv@magellan-technology.com>
In-Reply-To: <40FDBCA2.30102@magellan-technology.com>
References: <40FCDE5A.6080504@magellan-technology.com>
	<1090316488.6864.0.camel@lap02.tec.linutronix.de>
	<40FDBCA2.30102@magellan-technology.com>
Content-Type: text/plain
Date: Tue, 20 Jul 2004 22:51:25 -0400
Message-Id: <1090378285.4280.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: Re: problems mounting >3.3MB JFFS2 partitions on Dataflash
	on	AT91RM9200DK
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-07-21 at 10:45 +1000, Aras Vaichas wrote:
> OK, three examples:

That's precisely as I expected -- you have too many erase blocks, the
kmalloc fails and the mount fails without ever trying to read from the
flash.

As I said, it's fixed in the current 2.6 kernel.

-- 
dwmw2
