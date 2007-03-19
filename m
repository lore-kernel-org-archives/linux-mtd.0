Received: from ns.tz.ru ([194.149.234.1])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTGLu-0000Bv-5f
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 07:48:42 -0400
Date: Mon, 19 Mar 2007 14:48:32 +0300
From: Igor Marnat <marny@rambler.ru>
Message-ID: <9323738734.20070319144832@rambler.ru>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: jffs2_gcd_mtd0 invoked oom-killer
In-Reply-To: <1174288746.13341.490.camel@localhost.localdomain>
References: <16125243125.20070312152801@rambler.ru>
	<1173705053.5493.28.camel@sauron> <41978953.20070319084552@rambler.ru>
	<1174288746.13341.490.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: Igor Marnat <marny@rambler.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Thomas,

TG> Can you please dump the mtd partition with the corrupt data with
TG> nanddump:

TG> # nanddump -b -f nand.dmp /dev/mtdX

I put it to ftp://ftp.tz.ru/pub/nand.dmp.bz2.

It's size is 26 MB. Nanddump didn't want to accept options you
provided, so I did the dump with command "nanddump /dev/mtd0
nand.dmp". Please tell me if it is wrong.


Hope the image helps,

Best regards,
Igor Marnat
mailto:marny@rambler.ru
