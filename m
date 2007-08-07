Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IIOvM-0003Pj-36
	for linux-mtd@lists.infradead.org; Tue, 07 Aug 2007 14:16:37 +0100
Date: Tue, 7 Aug 2007 09:10:54 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>
Subject: Re: [PATCH] MTD: remove Momenco Ocelot support
In-Reply-To: <20070807215903.5b22e785.yoichi_yuasa@tripeaks.co.jp>
Message-ID: <Pine.LNX.4.64.0708070909350.18085@localhost.localdomain>
References: <20070807215903.5b22e785.yoichi_yuasa@tripeaks.co.jp>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 7 Aug 2007, Yoichi Yuasa wrote:

>
> This patch has removed Momenco Ocelot support from MTD.
> Ocelot support has already removed.
>
> Signed-off-by: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>

a while back, i submitted a short patch to remove OCELOT_G support.
i don't know what's already queued in anyone's tree, but it might be
worth grepping the tree for "OCELOT" to see what else can be removed
as part of this cleanup.

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
========================================================================
