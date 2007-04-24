Received: from wx-out-0506.google.com ([66.249.82.234])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgJ51-0001sV-SE
	for linux-mtd@lists.infradead.org; Tue, 24 Apr 2007 07:21:09 -0400
Received: by wx-out-0506.google.com with SMTP id t8so2214679wxc
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Apr 2007 04:21:06 -0700 (PDT)
Message-ID: <acd2a5930704240421n2d4cb852l2df8ee33d847efa8@mail.gmail.com>
Date: Tue, 24 Apr 2007 15:21:06 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: "Lennert Buytenhek" <buytenh@wantstofly.org>
Subject: Re: [PATCH] NAND Flash support for Intel IXP4xx platform
In-Reply-To: <20070424110139.GE1748@xi.wantstofly.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <46274486.9030609@ru.mvista.com> <462878F9.2090603@ru.mvista.com>
	<462DDD04.5020405@ru.mvista.com>
	<20070424103827.GC1748@xi.wantstofly.org>
	<462DDFEF.4070604@ru.mvista.com>
	<20070424104930.GD1748@xi.wantstofly.org>
	<acd2a5930704240353w58ac0cb5m8d7c2af35b7badc7@mail.gmail.com>
	<20070424110139.GE1748@xi.wantstofly.org>
Cc: linux-mtd@lists.infradead.org, "Ruslan V. Sushko" <rsushko@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/24/07, Lennert Buytenhek <buytenh@wantstofly.org> wrote:
> > >For that matter, I wonder how much sense it makes to submit a
> > >separate NAND driver for every ARM SoC.  For NOR flashes we have
> > >physmap, we should have something similar for NAND.
> >
> > It won't do for all the cases, but for the drivers where only cmd_ctrl
> > differs that might really make sense.
>
> Yes, exactly.  For a unified NAND driver, you can just assume that the
> data register will be memory-mapped.  This is probably true in 99% of
> the cases.  In cases where this isn't true, people can still write their
> own driver.

Yes, but the "write your own" case will also be applicable to the
cases where the controller has HW ECC capabilities, for instance.

Vitaly
