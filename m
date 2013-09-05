Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHECp-0006ug-3q
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 14:37:17 +0000
Received: by mail-pa0-f41.google.com with SMTP id bj1so519569pad.14
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 07:36:53 -0700 (PDT)
Date: Wed, 4 Sep 2013 22:41:47 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: gpmi-nand driver and jffs2 support
Message-ID: <20130905024145.GA5913@gmail.com>
References: <522062B4.4080709@digi.com> <201309031353.18964.marex@denx.de>
 <52269A56.4030808@freescale.com> <201309041600.37107.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201309041600.37107.marex@denx.de>
Cc: "fabio.estevam@freescale.com" <fabio.estevam@freescale.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Huang Shijie <b32955@freescale.com>,
 Hector Palacios <hector.palacios@digi.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 scottwood@freescale.com, Fabio Estevam <festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 04, 2013 at 04:00:36PM +0200, Marek Vasut wrote:
> Dear Huang Shijie,
> How come hector was then able to write his JFFS2 partition ?
If he uses the gpmi, he should not write the JFFS2, since the gpmi
does not support the jffs2. He will get the failure in the end.


> 
> > So the jffs2 support is compatiable all the time.
> 
> Is the old Freescale 2.6.35 GPMI NAND format compatible with the one after 
> applying this patchset?

Not compatible.

This patch set is still underreview.

> 
> > > that I could mount with Linux 3.7 and earlier?
> > 
> > I think the mount can be succeeded.
> 
> Ok, does that mean that we need this patchset in U-Boot in order to properly 
> write JFFS2 onto GPMI NAND there? Is that the message you wanted to relay to us?

Besides this patchset, the u-boot needs more patches to sync with the
kernel mtd code. Such as the full-id features.

thanks
Huang Shijie
