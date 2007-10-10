Received: from www.tglx.de ([62.245.132.106])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ifhbg-0004Se-Hl
	for linux-mtd@lists.infradead.org; Wed, 10 Oct 2007 20:52:38 +0100
Date: Wed, 10 Oct 2007 21:51:22 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: Re: JFFS2 deadlock in erase callback
In-Reply-To: <4709DF8E.1030707@nokia.com>
Message-ID: <alpine.LFD.0.9999.0710102144510.3147@localhost.localdomain>
References: <4709DF8E.1030707@nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: "Bityutskiy Artem \\\(Nokia-M/Helsinki\\\)" <Artem.Bityutskiy@nokia.com>,
	dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 8 Oct 2007, Adrian Hunter wrote:
>         [MTD] [NAND] Avoid deadlock in erase callback; release chip lock first.
>     
>         When the erase callback performs some other action on the flash, it's
>         highly likely to deadlock unless we actually release the chip lock
>         before calling it.
>     
>         Signed-off-by: David Woodhouse <dwmw2@infradead.org>
> 
> Can you confirm, that adding the "Avoid deadlock..." patch is better
> than reverting "Reduce time..." patch.

Yep, it's safe and definitely better.

I remember vaguely that we planned/discussed to move the release
before the callback some time ago, but the patch never made it into
mainline.
 
	tglx
