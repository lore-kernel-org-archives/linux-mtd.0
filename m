Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgIuz-0001VQ-BI
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 07:10:47 -0400
Message-ID: <462DE5B3.90606@ru.mvista.com>
Date: Tue, 24 Apr 2007 15:10:43 +0400
From: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
MIME-Version: 1.0
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH] NAND Flash support for Intel IXP4xx platform
References: <46274486.9030609@ru.mvista.com> <462878F9.2090603@ru.mvista.com>
	<462DDD04.5020405@ru.mvista.com>
	<20070424103827.GC1748@xi.wantstofly.org>
	<462DDFEF.4070604@ru.mvista.com>
	<20070424104930.GD1748@xi.wantstofly.org>
	<acd2a5930704240353w58ac0cb5m8d7c2af35b7badc7@mail.gmail.com>
	<20070424110139.GE1748@xi.wantstofly.org>
In-Reply-To: <20070424110139.GE1748@xi.wantstofly.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lennert Buytenhek wrote:
> Yes, exactly.  For a unified NAND driver, you can just assume that the
> data register will be memory-mapped.  This is probably true in 99% of
> the cases.  In cases where this isn't true, people can still write their
> own driver.
>   
Seem it should be ok for most drivers. In this case we need to drive 
Chip Select signal "manually" through(Not all signal connected to 
expansion bus).  At the same time different vendor make create CS in 
different way.
