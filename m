Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HkZmD-0004aF-RL
	for linux-mtd@lists.infradead.org; Sun, 06 May 2007 01:59:22 -0400
Subject: Re: Spare area access information from JFFS2
From: Thomas Gleixner <tglx@linutronix.de>
To: Sudeep K N <sudeep.holla@gmail.com>
In-Reply-To: <a1e50e4b0705050918j73dfc01cnd9fdb667f19b31f1@mail.gmail.com>
References: <a1e50e4b0705050918j73dfc01cnd9fdb667f19b31f1@mail.gmail.com>
Content-Type: text/plain
Date: Sun, 06 May 2007 08:01:49 +0200
Message-Id: <1178431309.31213.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, rpurdie@openedhand.com, dwmw2@infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-05-05 at 21:48 +0530, Sudeep K N wrote:
>        1. During Mount: scans the block, [erases], and writes "0x20031985"
>                into the spare area on start of every block followed by another
>                18 bytes which spans across multiple pages because free bytes in
>                spare area is only 4

JFFS2 writes only 4 bytes, when you set the ecclayout information
correct. Even if you set it to something else, it writes max. 12 bytes.
So your 4 + 18 bytes observation is rather strange.

>        2. Later during main page program operation our nand controller
>                updates spare area ECC bytes, during this sequence we are not
>                clear whether JFFS2 perform any spare operation to updates it
>                meta data.

JFFS2 does not use the spare area for metadata information other than
the cleanmarker.

>        3. Also, we want know, later the above sequence, does JFFS2 performs
>                any spare only program operations.
> 

No. The only exception is the block_mark_bad operation.

	tglx
