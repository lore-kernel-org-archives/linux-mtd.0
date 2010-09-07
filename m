Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ot5Bb-00067K-RE
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 20:54:36 +0000
Received: by fxm12 with SMTP id 12so4288683fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 13:54:34 -0700 (PDT)
Subject: Re: [PATCH 2.6.35] mtd: blktrans: Move device and module
	ref-counting back to open/release
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: dedekind1@gmail.com
In-Reply-To: <1283855250.2979.33.camel@localhost>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
	<1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
	<AANLkTinqy+hYrj5WN=4QEbPu+8F_HFs+rrb35TThoBRm@mail.gmail.com>
	<1283855250.2979.33.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Sep 2010 23:54:29 +0300
Message-ID: <1283892869.3407.4.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Ben Hutchings <bhutchings@solarflare.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-07 at 13:27 +0300, Artem Bityutskiy wrote: 
> On Sun, 2010-09-05 at 16:34 -0700, Kevin Cernekee wrote:
> > On Thu, Jul 22, 2010 at 10:44 AM, Ben Hutchings
> > <bhutchings@solarflare.com> wrote:
> > > commit 048d87199566663e4edc4880df3703c04bcf41d9 "mtd: blktrans: Hotplug
> > > fixes" causes the MTD and the MTD driver module's ref-counts to be
> > > bumped for each block device that is created, whether or not it's
> > > actually in use.
> > >
> > > This means that before removing an MTD or driver module one must first
> > > remove all the associated block devices.  But the block devices will
> > > be removed only when the MTDs themselves are removed, which is no
> > > longer possible.
> > 
> > Just updated to 2.6.36-rc3 and noticed a related issue.  Configuration is:
> 
> Sounds like a regression which should be either fixed or the patch which
> causes this should be reverted. Maxim?

We have a tough issue here.
The way mtd core is built, it assumes that one can always remove an mtd
device, therefore all users must let it go as soon as asked first time.
Its possible to fix that of course, but I'll need to touch a lot of code
I can't test.
Really mtd core wasn't build with hotplug in the mind.
I'll think of something (and you all are welcome to help).

Best regards,
Maxim Levitsky
