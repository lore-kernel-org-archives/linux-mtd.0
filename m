Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19pmsx-0008SF-Lt
	for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2003 11:41:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Eugeny Mints <eugeny.mints@auriga.ru>
In-Reply-To: <5B439D84E6653F4AA2E14A5D8898A7E165649D@auriga.auriga.ru>
References: <5B439D84E6653F4AA2E14A5D8898A7E165649D@auriga.auriga.ru>
Message-Id: <1061462473.13830.33.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 21 Aug 2003 11:41:14 +0100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: RE: proposed patch to 20030818 mtd spanshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

_Please_ fix your mailer or get a Yahoo account or something (actually
if you're going to make a habit of sending sane patches, give me a SSH
key and I'll give you an account, and you can use that). Your messages
which look like fake-replies are getting lost in the flood of spam and
virii.

On Thu, 2003-08-21 at 14:13 +0400, Eugeny Mints wrote:
> Do you mean that delay should be more than 500µs (while
> this->chip_dalay is 20µs in my case). And unfortunately it is not
> obviously for me that Toshiba datasheet I used
> (http://www.toshiba.com/taec/cgi-bin/display.cgi?table=ProductDetail&ProductID=10161) explicitly forbid issuing STATUS after RESET. (it seems it is described on page  22 by the figures 11, 12). Am I wrong?

I'm looking at the TC58V64AFT datasheet.
http://www.infradead.org/~dwmw2/Toshiba-TC58V64AFT_e.pdf

Page 23 is fairly clear about not issuing STATUS before the chip is
ready again after RESET... "However, the following operation is
prohibited. If the following operation is executed, correct resetting of
the address and data register cannot be guaranteed."
(followed by a timing diagram showing 0x70 STATUS command being sent
before FR/B# goes high again.

I'm fairly suspicious about having a single 'chip_delay' parameter, when
the table on page 4 of the above-referenced datasheet shows a whole
table of different timings in different circumstances...

-- 
dwmw2
