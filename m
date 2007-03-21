Received: from ns.tz.ru ([194.149.234.1])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTzBh-0001Wy-UP
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 07:41:07 -0400
Date: Wed, 21 Mar 2007 14:40:59 +0300
From: Igor Marnat <marny@rambler.ru>
Message-ID: <267409125.20070321144059@rambler.ru>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: jffs2_gcd_mtd0 invoked oom-killer
In-Reply-To: <1174468672.10840.4.camel@localhost.localdomain>
References: <16125243125.20070312152801@rambler.ru>
	<1173705053.5493.28.camel@sauron> <41978953.20070319084552@rambler.ru>
	<1174288746.13341.490.camel@localhost.localdomain>
	<9323738734.20070319144832@rambler.ru>
	<1174323006.13341.504.camel@localhost.localdomain>
	<1055017593.20070321111428@rambler.ru>
	<1174468672.10840.4.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
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

TG> Can you please set JFFS2_DEBUG_LEVEL to 2 and log the output to a serial
TG> console, bzip2 the result and upload it somewhere ?
TG> Beware: it's slow and huge!

I put it to ftp://ftp.tz.ru/pub/jffs2.log.bz2.

Tell me if you need any additional details.

Best regards,
Igor Marnat
mailto:marny@rambler.ru
