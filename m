Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MAkTh-0003Vn-FZ
	for linux-mtd@lists.infradead.org; Sun, 31 May 2009 12:49:36 +0000
Subject: Re: [patch/RESEND 2.6.30-rc2 2/3] NAND: minor davinci_nand cleanup
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kevin Hilman <khilman@deeprootsystems.com>
In-Reply-To: <87vdnjsay6.fsf@deeprootsystems.com>
References: <200904211951.31776.david-b@pacbell.net>
	<87vdnjsay6.fsf@deeprootsystems.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 31 May 2009 15:48:18 +0300
Message-Id: <1243774098.11172.123.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: DaVinci <davinci-linux-open-source@linux.davincidsp.com>,
	David Brownell <david-b@pacbell.net>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, dwmw2@infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-29 at 17:15 -0700, Kevin Hilman wrote:
> David Brownell <david-b@pacbell.net> writes:
> 
> > From: David Brownell <dbrownell@users.sourceforge.net>
> >
> > Make the DaVinci NAND driver require platform_data with
> > board-specific configuration.  We can't actually do any
> > kind of sane job of configuring it otherwise.
> >
> > Also fix the comment about picking the "best" ECC mode.
> >
> > We can't do those any more; that relied on knowing what kind
> > of CPU we're using (they don't all support 4-bit ECC), and
> > current policy is that drivers not have cpu_is_*() checks.
> >
> > Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
> 
> AFAICT, this still hasn't been merged yet.  In case it helps:
> 
> Signed-off-by: Kevin Hilman <khilman@deeprootsystems.com>
> 
> > ---
> > RESEND 7-april version -- refreshing against current kernel
> > Seems appropriate for 2.6.30 merge, but not essential.
> 
> Would be nice to see this in 2.6.31.

Yeah, it is in my l2-mtd-2.6.git tree, which means this won't be
forgotten.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
