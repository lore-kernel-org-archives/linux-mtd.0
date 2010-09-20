Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oxbn2-0006lr-Qt
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 08:31:58 +0000
Received: by fxm4 with SMTP id 4so697728fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Sep 2010 01:31:55 -0700 (PDT)
Subject: Re: [PATCH 2.6.35] mtd: blktrans: Move device and module
	ref-counting back to open/release
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <AANLkTinqy+hYrj5WN=4QEbPu+8F_HFs+rrb35TThoBRm@mail.gmail.com>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
	<1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
	<AANLkTinqy+hYrj5WN=4QEbPu+8F_HFs+rrb35TThoBRm@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 20 Sep 2010 11:30:03 +0300
Message-ID: <1284971403.2286.45.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ben Hutchings <bhutchings@solarflare.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
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
> 
> CONFIG_MTD_BLOCK=y
> CONFIG_MTD_BLKDEVS=y
> CONFIG_MTD_UBI_GLUEBI=y

Would you please check if Maxim's patch fixes this:
[PATCH V2] MTD: blktrans: Final version of hotplug support

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
