Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBUMi-00041p-JA
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 13:49:27 +0000
Subject: Re: [resending-2] [PATCH] [MTD] [NAND] Add OMAP2 / OMAP3 NAND driver
From: Artem Bityutskiy <dedekind@infradead.org>
To: vimal singh <vimalsingh@ti.com>
In-Reply-To: <52785.192.168.10.89.1243833774.squirrel@dbdmail.itg.ti.com>
References: <52785.192.168.10.89.1243833774.squirrel@dbdmail.itg.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Jun 2009 16:48:00 +0300
Message-Id: <1243950480.5847.35.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-01 at 10:52 +0530, vimal singh wrote:
> On Fri, May 15, 2009 at 6:38 PM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> > On Thu, 2009-04-30 at 15:03 +0530, vimal singh wrote:
> >> This driver is present in the OMAP tree, now pushing it to MTD.
> >>
> >> Original author(s):
> >>        Jian Zhang <jzhang@ti.com>
> >>
> >> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> >> ---
> >>  drivers/mtd/nand/Kconfig  |    6
> >>  drivers/mtd/nand/Makefile |    1
> >>  drivers/mtd/nand/omap2.c  |  776
> ++++++++++++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 783 insertions(+)
> >
> > Hi Thomas,
> >
> > would you please find a little time and Ack/Nack this
> > please?
> 
> Artem,
> This patch is still pending. This patch has already been reviewed by you and
> Andrew Morton. Seems like Thomas is not finding time to review this. What
> should be the next step about this?

Unfortunately, I do not think I'm able to really review your driver.
So all I can do for you is to put your driver to my l2-mtd-2.6.git
tree into the "dunno" branch, and let dwmw2 review it. Which I did.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
