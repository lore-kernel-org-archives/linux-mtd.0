Received: from mk-filter-2-a-1.mail.uk.tiscali.com ([212.74.100.53])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LSL9A-0004ma-Kc
	for linux-mtd@lists.infradead.org; Thu, 29 Jan 2009 00:52:47 +0000
Subject: Re: [PATCH RFC] sh: maple: Add support for SEGA Dreamcast VMU and
	clean up maple bus driver (2/3)
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <200901281944.57894.vapier@gentoo.org>
References: <1233186456.6734.16.camel@localhost.localdomain>
	<1233187069.6734.21.camel@localhost.localdomain>
	<1233187750.6734.27.camel@localhost.localdomain>
	<200901281944.57894.vapier@gentoo.org>
Content-Type: text/plain
Date: Thu, 29 Jan 2009 00:49:30 +0000
Message-Id: <1233190170.6734.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-sh <linux-sh@vger.kernel.org>, Greg KH <greg@kroah.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, Paul Mundt <lethal@linux-sh.org>,
	MTD <linux-mtd@lists.infradead.org>,
	linux-input <linux-input@vger.kernel.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-01-28 at 19:44 -0500, Mike Frysinger wrote:
> On Wednesday 28 January 2009 19:09:10 Adrian McMenamin wrote:
> > +static struct maple_driver vmu_flash_driver = {
> > +	.function =	MAPLE_FUNC_MEMCARD,
> > +	.drv = {
> > +		.name =		"Dreamcast_visual_memory",
> 
> i thought there was like a 16byte limit or something on this ?


Don't think so, it's just a const char* isn't it?
