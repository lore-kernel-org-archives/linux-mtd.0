Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19pm0a-0008CF-2n
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2003 10:45:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Eugeny Mints <eugeny.mints@auriga.ru>
In-Reply-To: <5B439D84E6653F4AA2E14A5D8898A7E163D75F@auriga.auriga.ru>
References: <5B439D84E6653F4AA2E14A5D8898A7E163D75F@auriga.auriga.ru>
Message-Id: <1061459097.13830.22.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 21 Aug 2003 10:44:57 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: proposed patch to 20030818 mtd spanshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-21 at 12:22 +0400, Eugeny Mints wrote:
> >Problem 2.
> 
> >My board falls in the infinite loop at (!(this->read_byte(mtd) & 
> >0x40)); >even with the latest snapshot 18.08.2003 on RESET command. 
> >Interesting, >that it happens not from the very begging but just when 
> >write_oob has >executed (during eraseall) for about a half of the 
> >flash.
> 
> >I found that insertion of udelay() before issuing STATUS command helps.
> 
> >Any >suggestions?
> 
> Please, find proposed patch for mtd snapshot 20030818 attached. 

Looks sane, but I'm not sure it's sufficient.

In the case where we issued RESET after an erase, the Toshiba datasheets
say it can take 500µs for the chip to become ready again -- and
explicitly forbid issuing STATUS during that time.

We _really_ want to read the FR/B# line if we have it, and delay only if
we _have_ to.

-- 
dwmw2
