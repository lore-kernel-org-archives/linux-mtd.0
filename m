Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CeVGc-0000vh-QT
	for linux-mtd@lists.infradead.org; Wed, 15 Dec 2004 04:16:22 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: jianhung@csie.nctu.edu.tw
In-Reply-To: <200412150900.iBF90stl039451@mail.csie.nctu.edu.tw>
References: <200412150900.iBF90stl039451@mail.csie.nctu.edu.tw>
Content-Type: text/plain
Date: Wed, 15 Dec 2004 10:16:16 +0100
Message-Id: <1103102176.3406.117.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: A problem of porting jffs2 and mtd in kernel 2.4.18
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-15 at 17:00 +0800, jianhung@csie.nctu.edu.tw wrote:
>     1. the mount time is too slow, so we try to update the source code in
>        the kernel, but I don\\\'t know the version of jffs2 and mtd in the
>        kernel source code now is, how do I know it ? And I don\\\'t know how
>        to update it, I hope someone can tell me, I would appreciate your
>        kindness.
> 
>     2. If I use ECC function, and some thing wrong happens. After I trace
>        the source code, I find when I write a file, the jffs2 will write to
>        the same nand flash page (although in different position of the same
>        page) without erase first many times . So the ECC position in the
>        spare area will be write many times. It is reasonable when I read
>        this page next time, the ECC value is not equal to the value I
>        writed in the last time. of course the ecc will error, is this a bug
>        of this version in kernel 2.4.18? (if I don\\\'t use ECC function, the
>        subsystem seems ok)

JFFS2 on NAND in 2.4.18 is not working and buggy. 2.4.18 itself is buggy
too.

Read http://www.linux-mtd.infradead.org/#kernelversions

tglx
