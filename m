Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AIGdw-0003B8-Ff
	for <linux-mtd@lists.infradead.org>; Sat, 08 Nov 2003 00:07:58 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Shiyan <shc@milas.spb.ru>
In-Reply-To: <20031107114947.19f4f33b.shc@milas.spb.ru>
References: <20031107114947.19f4f33b.shc@milas.spb.ru>
Message-Id: <1068249822.18801.47.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 08 Nov 2003 00:03:42 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Mount jffs2 partition on Doc2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-11-07 at 11:49 +0300, Alexander Shiyan wrote:
> I tryed to create and use jffs2 partition on Doc2000.

What version of JFFS2 code. On NAND flash you shouldn't really be using
anything but the current code from CVS. On DiskOnChip you probably ought
to let me finish the bad block handling first too :)

-- 
dwmw2
