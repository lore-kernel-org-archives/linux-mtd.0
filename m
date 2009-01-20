Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LPErO-0006Yk-Ns
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2009 11:33:41 +0000
Subject: Re: [PATCH] ubiupdatevol: make the -t parameter work again
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20090120112525.GA31113@Chamillionaire.breakpoint.cc>
References: <20081217101554.GA4999@www.tglx.de>
	<20090120112525.GA31113@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jan 2009 13:33:12 +0200
Message-Id: <1232451192.22350.46.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-01-20 at 12:25 +0100, Sebastian Andrzej Siewior wrote:
> ping
> 
> * Sebastian Andrzej Siewior | 2008-12-17 11:15:54 [+0100]:
> 
> >From bigeasy at linutronix.de  Wed Dec 17 05:15:54 2008
> >From: bigeasy at linutronix.de (Sebastian Andrzej Siewior)
> >Date: Wed, 17 Dec 2008 11:15:54 +0100
> >Subject: [PATCH] ubiupdatevol: make the -t parameter work again
> >Message-ID: <20081217101554.GA4999@www.tglx.de>
> >
> >The execution of
> >|./ubiupdatevol /dev/ubi0 -t
> >will fail because 'argv[optind + 1]' is undefined and the later executed
> >'strcmp(args.img, "-")' will segfault.
> >So I can hack around and supply a dummy image or fix it that way.

Pushed, thank you.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
