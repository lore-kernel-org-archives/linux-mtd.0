Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DBeJf-0003qH-MH
	for linux-mtd@lists.infradead.org; Wed, 16 Mar 2005 14:36:28 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: dedekind@infradead.org
In-Reply-To: <1110974906.30606.38.camel@sauron.oktetlabs.ru>
References: <487B538D08487B4D8FEC138A13D4F6AC509BA5@HOUEXCH077.corp.halliburton.com>
	<1110974906.30606.38.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Wed, 16 Mar 2005 20:36:23 +0100
Message-Id: <1111001784.4814.96.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: failed write verify causes segmentation fault
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-03-16 at 15:08 +0300, Artem B. Bityuckiy wrote:
> I don't see any reason why the NULL dereferencing might happen after the
> "jffs2_flash_writev(): Non-contiguous write to.." output. BUG()
> should be called instead.

>From include/asm-arm/bug.h
#define BUG()           (*(int *)0 = 0)

This is a NULL pointer dereference.

tglx
