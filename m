Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Odo8M-00055d-RZ
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 17:40:07 +0000
Subject: Re: [PATCH 2.6.35] mtd: blktrans: Move device and module
	ref-counting  back to open/release
From: Ben Hutchings <bhutchings@solarflare.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <AANLkTikCQsH8kGCsPPOqQ+Qj_TxyxepGGb6=462MuQxT@mail.gmail.com>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
	<1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
	<AANLkTi=Aw=yFCsz4PArNoMVOpOU567ffzUHooVvXKQtF@mail.gmail.com>
	<1279991008.4915.7.camel@localhost>
	<AANLkTikCQsH8kGCsPPOqQ+Qj_TxyxepGGb6=462MuQxT@mail.gmail.com>
Content-Type: text/plain
Date: Tue, 27 Jul 2010 18:40:01 +0100
Message-Id: <1280252401.2132.12.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-07-25 at 10:41 +0300, Maxim Levitsky wrote:
> On Sat, Jul 24, 2010 at 8:03 PM, Ben Hutchings
> <bhutchings@solarflare.com> wrote:
> > OK, I get it.  Maybe that should be deferred to a work item.
> >
> 
> I thought about that too.
> It doesn't solve the races, because now the deferred work races with
> device removal, just like the function that adds new mtd device.
> Unless it takes mtd_table_mutex....

You can cancel it in device removal.

> > This only works if the MTD itself is hotplugged, and not if the MTD's
> > parent is hotplugged.  In fixing one case you have broken the other.
> 
> Why?
> 
> In my case the mtd device does have a parent, a pci device.
> If pci device is removed, I just remove the mtd device from the pci driver.
>  (although this codepath it untested)

OK, I have tested this and you are right.  But it is a pain to have to
unbind all devices before removing the module.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
