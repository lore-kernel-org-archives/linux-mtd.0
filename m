Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsvQJ-0006tG-0r
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 10:29:07 +0000
Received: by fxm12 with SMTP id 12so3699502fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 03:29:06 -0700 (PDT)
Subject: Re: [PATCH 2.6.35] mtd: blktrans: Move device and module
	ref-counting back to open/release
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>, Maxim Levitsky
	<maximlevitsky@gmail.com>
In-Reply-To: <AANLkTinqy+hYrj5WN=4QEbPu+8F_HFs+rrb35TThoBRm@mail.gmail.com>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
	<1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
	<AANLkTinqy+hYrj5WN=4QEbPu+8F_HFs+rrb35TThoBRm@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Sep 2010 13:27:30 +0300
Message-ID: <1283855250.2979.33.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ben Hutchings <bhutchings@solarflare.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-09-05 at 16:34 -0700, Kevin Cernekee wrote:
> On Thu, Jul 22, 2010 at 10:44 AM, Ben Hutchings
> <bhutchings@solarflare.com> wrote:
> > commit 048d87199566663e4edc4880df3703c04bcf41d9 "mtd: blktrans: Hotplug
> > fixes" causes the MTD and the MTD driver module's ref-counts to be
> > bumped for each block device that is created, whether or not it's
> > actually in use.
> >
> > This means that before removing an MTD or driver module one must first
> > remove all the associated block devices.  But the block devices will
> > be removed only when the MTDs themselves are removed, which is no
> > longer possible.
> 
> Just updated to 2.6.36-rc3 and noticed a related issue.  Configuration is:

Sounds like a regression which should be either fixed or the patch which
causes this should be reverted. Maxim?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
