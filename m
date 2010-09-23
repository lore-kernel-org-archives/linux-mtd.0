Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OytHX-0000QD-Rl
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 21:24:44 +0000
Received: by fxm4 with SMTP id 4so1788131fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 14:24:41 -0700 (PDT)
Subject: Re: [PATCH 2.6.35] mtd: blktrans: Move device and module
	ref-counting back to open/release
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <AANLkTikfAveMKPCx29JH+BkqtQgF4qLXD2zhzPAA=FXV@mail.gmail.com>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
	<1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
	<AANLkTinqy+hYrj5WN=4QEbPu+8F_HFs+rrb35TThoBRm@mail.gmail.com>
	<1284971403.2286.45.camel@localhost>
	<AANLkTikfAveMKPCx29JH+BkqtQgF4qLXD2zhzPAA=FXV@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 23:14:36 +0200
Message-ID: <1285276476.12300.4.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Ben Hutchings <bhutchings@solarflare.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-09-20 at 14:47 -0700, Kevin Cernekee wrote: 
> On Mon, Sep 20, 2010 at 1:30 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Sun, 2010-09-05 at 16:34 -0700, Kevin Cernekee wrote:
> >> Just updated to 2.6.36-rc3 and noticed a related issue.  Configuration is:
> >>
> >> CONFIG_MTD_BLOCK=y
> >> CONFIG_MTD_BLKDEVS=y
> >> CONFIG_MTD_UBI_GLUEBI=y
> >
> > Would you please check if Maxim's patch fixes this:
> > [PATCH V2] MTD: blktrans: Final version of hotplug support
> 
> I applied the following patch to my 2.6.36-rc4 tree:
> 
> Subject: [PATCH 1/3] MTD: blktrans: Final version of hotplug support
> Date: Sun, 19 Sep 2010 01:12:36 +0200
> Message-Id: <1284851558-1154-2-git-send-email-maximlevitsky@gmail.com>
> 
> This fixed the MTD_BLOCK + MTD_UBI_GLUEBI regression that I reported earlier.

Sorry for not sending updates, I did split this patch up, and will send
it soon.
Was finding workarounds, filling bugs for Ubuntu 10.10 brain damage.
(Had to install it somewhen).

Look one cosmetic, but annoying regression turned out to be a explicit
feature, and this 'bug' fixes it...
https://bugs.launchpad.net/ubuntu/+source/gnome-power-manager/+bug/619816

Sorry for this ooftopic rant, but it really got my nerves.


Best regards,
Maxim Levitsky
