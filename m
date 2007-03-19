Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTC2Q-0005C8-26
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 03:12:15 -0400
Subject: Re: jffs2_gcd_mtd0 invoked oom-killer
From: Thomas Gleixner <tglx@linutronix.de>
To: Igor Marnat <marny@rambler.ru>
In-Reply-To: <41978953.20070319084552@rambler.ru>
References: <16125243125.20070312152801@rambler.ru>
	<1173705053.5493.28.camel@sauron> <41978953.20070319084552@rambler.ru>
Content-Type: text/plain
Date: Mon, 19 Mar 2007 08:19:06 +0100
Message-Id: <1174288746.13341.490.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-03-19 at 08:45 +0300, Igor Marnat wrote:
> But it cannot pass the second corrupted place. It doesn't meet the
> NULL node, so the valid_ref is  always not NULL. It passes crc check of node header,
> so the loop continues till the system exhausted all the
> memory available (there are calls to kmalloc in the loop). When the
> chain length grows up to 110000 entries, oom killer begins to stop
> kernel threads and a bit later all the system reboots.

Can you please dump the mtd partition with the corrupt data with
nanddump:

# nanddump -b -f nand.dmp /dev/mtdX

compress it with bz2 and put it somewhere to download.


Thanks,

	tglx
