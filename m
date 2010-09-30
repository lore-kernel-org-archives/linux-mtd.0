Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1KiX-0000RL-KS
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 15:06:42 +0000
Received: by eye22 with SMTP id 22so946274eye.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Sep 2010 08:06:40 -0700 (PDT)
Date: Thu, 30 Sep 2010 19:06:33 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v3 6/7] mtd: m25p80: add a read function to read page
	by page
Message-ID: <20100930150633.GA13741@oksana.dev.rtsoft.ru>
References: <841976.76219.qm@web180306.mail.gq1.yahoo.com>
	<AANLkTinBDdEyMDt3KoauNdmTCz1ZAJ5mZ23iMWiwsUm4@mail.gmail.com>
	<AANLkTi=GydTyhf3TOzCZOtrme1Jh0UmNDHqTVP59q=LH@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTi=GydTyhf3TOzCZOtrme1Jh0UmNDHqTVP59q=LH@mail.gmail.com>
Cc: kumar.gala@freescale.com, David Brownell <david-b@pacbell.net>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	spi-devel-general@lists.sourceforge.net,
	Mingkai Hu <Mingkai.hu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 30, 2010 at 11:41:40PM +0900, Grant Likely wrote:
> On Thu, Sep 30, 2010 at 11:16 PM, Grant Likely
> <grant.likely@secretlab.ca> wrote:
> > On Thu, Sep 30, 2010 at 7:46 PM, David Brownell <david-b@pacbell.net> wrote:
> >>
> >> --- On Thu, 9/30/10, Mingkai Hu <Mingkai.hu@freescale.com> wrote:
> >>
> >>> From: Mingkai Hu <Mingkai.hu@freescale.com>
> >>> Subject: [PATCH v3 6/7] mtd: m25p80: add a read function to read page by page
> >>
> >> NAK.
> >>
> >> We went over this before.
> >
> > Yes, I agree with David on this.  If large transfers don't work, then
> > it is the SPI master driver that is buggy.
> 
> By the way, does this fix your problem?
> 
> https://patchwork.kernel.org/patch/184752/

It shouldn't. AFAIK, eSPI is PIO-only controller, and the overrun
fix is for the DMA mode.

Thanks,

p.s. Btw, in patch 3/7, is_dma_mapped argument of fsl_espi_bufs()
is unneeded.

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
