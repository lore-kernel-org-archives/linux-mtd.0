Received: from mail07.syd.optusnet.com.au ([211.29.132.188])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JvLUo-0000ey-TL
	for linux-mtd@lists.infradead.org; Mon, 12 May 2008 00:02:27 +0000
Subject: Re: New thread [BUG] JFFS2 usage of write_begin and write_end
	functions causes kernel panic
From: James <jamessteward@optusnet.com.au>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1210545663.2861.1.camel@shinybook.infradead.org>
References: <1210312276.28139.19.camel@Ubuntu-Desktop>
	<1210320731.25560.1193.camel@pmac.infradead.org>
	<1210545077.6235.10.camel@Ubuntu-Desktop>
	<1210545663.2861.1.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Mon, 12 May 2008 10:01:16 +1000
Message-Id: <1210550476.6235.30.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2008-05-11 at 23:41 +0100, David Woodhouse wrote:
> Just type it.
> http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=abe2f4143

It seems better.  I still get bucket loads of;

mtd->read(0x62c bytes from 0x3204608) returned ECC error

and the occasional;

Data CRC failed on REF_PRISTINE data node at 0x0331540c: Read
0x503a4071, calculated 0x52c053a8

but no more kernel oops, which makes me much happier.

Any ideas on the above two mentioned warnings?  Are they the result of
unclean NAND oob data, or kernel bugs, or something else?

Regards,
James.
