Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHEEk-00077e-4s
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 14:39:17 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: gpmi-nand driver and jffs2 support
Date: Wed, 4 Sep 2013 16:38:52 +0200
References: <522062B4.4080709@digi.com> <201309041600.37107.marex@denx.de>
 <20130905024145.GA5913@gmail.com>
In-Reply-To: <20130905024145.GA5913@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201309041638.52680.marex@denx.de>
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

Dear Huang Shijie,

> On Wed, Sep 04, 2013 at 04:00:36PM +0200, Marek Vasut wrote:
> > Dear Huang Shijie,
> > How come hector was then able to write his JFFS2 partition ?
> 
> If he uses the gpmi, he should not write the JFFS2, since the gpmi
> does not support the jffs2. He will get the failure in the end.

Hector, can you comment on this?

> > > So the jffs2 support is compatiable all the time.
> > 
> > Is the old Freescale 2.6.35 GPMI NAND format compatible with the one
> > after applying this patchset?
> 
> Not compatible.
> 
> This patch set is still underreview.

So this patch breaks compatiblity with FSL kernel release? This needs fixing, 
otherwise it's impossible to do a drop-in replacement for the ancient FSL 
kernel.

> > > > that I could mount with Linux 3.7 and earlier?
> > > 
> > > I think the mount can be succeeded.
> > 
> > Ok, does that mean that we need this patchset in U-Boot in order to
> > properly write JFFS2 onto GPMI NAND there? Is that the message you
> > wanted to relay to us?
> 
> Besides this patchset, the u-boot needs more patches to sync with the
> kernel mtd code. Such as the full-id features.

Can you elaborate on this more? This is very vague, I would like to know what 
exactly is missing.

Best regards,
Marek Vasut
