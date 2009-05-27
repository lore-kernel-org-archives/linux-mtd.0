Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]
	helo=master.linux-sh.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M97Z2-0000m2-Mh
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 01:04:23 +0000
Date: Wed, 27 May 2009 10:03:59 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH 1/3] mtd/maps: uclinux: allow systems to override map
	addr/size
Message-ID: <20090527010359.GA8979@linux-sh.org>
References: <20090526231902.GA6295@linux-sh.org>
	<1243380798-10089-1-git-send-email-vapier@gentoo.org>
	<20090526234616.GC6295@linux-sh.org>
	<200905262047.21041.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200905262047.21041.vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, uclinux-dev@uclinux.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 26, 2009 at 08:46:24PM -0400, Mike Frysinger wrote:
> On Tuesday 26 May 2009 19:46:16 Paul Mundt wrote:
> > On Tue, May 26, 2009 at 07:33:16PM -0400, Mike Frysinger wrote:
> > > +extern char _ebss;
> > > +
> >
> > Also, it would be nice if the remaining architectures that define _ebss
> > could shove this in their asm/sections.h so we can kill this off from the
> > driver itself.
> 
> well, everyone would still have to define the _ebss symbol otherwise they'd 
> get an undefined error due to how the map is initialized.

Yes, but that is not the issue. The issue is that the section
extern has no place in a driver, this is precisely what asm/sections.h is
for. Only microblaze and sh define it there today, and there is already
inconsistency. Having the others define it for themselves and agreeing on
a type would permit us to kill it off from the driver.
