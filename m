Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ocvpz-0007u7-Gu
	for linux-mtd@lists.infradead.org; Sun, 25 Jul 2010 07:41:32 +0000
Received: by wwb13 with SMTP id 13so887357wwb.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 25 Jul 2010 00:41:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1279991008.4915.7.camel@localhost>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
	<1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
	<AANLkTi=Aw=yFCsz4PArNoMVOpOU567ffzUHooVvXKQtF@mail.gmail.com>
	<1279991008.4915.7.camel@localhost>
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Sun, 25 Jul 2010 10:41:07 +0300
Message-ID: <AANLkTikCQsH8kGCsPPOqQ+Qj_TxyxepGGb6=462MuQxT@mail.gmail.com>
Subject: Re: [PATCH 2.6.35] mtd: blktrans: Move device and module ref-counting
	back to open/release
To: Ben Hutchings <bhutchings@solarflare.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Sat, Jul 24, 2010 at 8:03 PM, Ben Hutchings
<bhutchings@solarflare.com> wrote:
> OK, I get it. =C2=A0Maybe that should be deferred to a work item.
>

I thought about that too.
It doesn't solve the races, because now the deferred work races with
device removal, just like the function that adds new mtd device.
Unless it takes mtd_table_mutex....



> This only works if the MTD itself is hotplugged, and not if the MTD's
> parent is hotplugged.  In fixing one case you have broken the other.

Why?

In my case the mtd device does have a parent, a pci device.
If pci device is removed, I just remove the mtd device from the pci driver.
 (although this codepath it untested)
