Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19cuif-0006Gb-07
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2003 23:25:53 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Eric Laly <e.laly@wanadoo.fr>
In-Reply-To: <20030716185406.GA24813@Bragon>
References: <20030716185406.GA24813@Bragon>
Message-Id: <1058394356.2914.19.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 16 Jul 2003 23:25:56 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mount a DOC2000 [newbie]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-07-16 at 19:54, Eric Laly wrote:
> I've used a 2.4.18 kernel.

Why so old? This should be fixed in 2.4.21.

>  (I've even tried the latest CVS 
> on ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/ but the modules 
> don't compile...)

It's feasible that it's just because we dropped support for kernels so
old and broken. Add stuff like BUG_ON() to the compatmac.h file again
any you may have more joy.

-- 
dwmw2
