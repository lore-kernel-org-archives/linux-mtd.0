Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anYCW-000792-Eo
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2016 21:07:53 +0000
Received: by mail-pf0-x22c.google.com with SMTP id n1so18227761pfn.2
 for <linux-mtd@lists.infradead.org>; Tue, 05 Apr 2016 14:07:32 -0700 (PDT)
Date: Tue, 5 Apr 2016 14:07:27 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 Michal Suchanek <hramrach@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marex@denx.de>, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
Message-ID: <20160405210727.GB5243@localhost>
References: <56D22823.7090005@gmail.com> <20160405193952.GA5243@localhost>
 <57041B43.2000109@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57041B43.2000109@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 05, 2016 at 10:08:35PM +0200, Heiner Kallweit wrote:
> Am 05.04.2016 um 21:39 schrieb Brian Norris:
> > On Sat, Feb 27, 2016 at 11:50:11PM +0100, Heiner Kallweit wrote:
> >> Some controllers have transfer size limits. To allow to deal with this
> >> max_transfer_size was introduced in the SPI core recently.
> >> Use this new feature to read in chunks if needed.
> >>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > 
> > Michal has been working on a similar series, with some differences (I'll
> > comment below). I think his latest work is here:
> > 
> > http://lists.infradead.org/pipermail/linux-mtd/2015-December/063865.html
> > 
> > Is there a particular reason you've continued on your series instead of
> > reviewing/fixing his?
> > 
> Latest version of Michal's patch set was sent beginning of December and has
> received no comment since then, so I assumed it's dead.
> If that's not the case, totally fine with me and I'll have a further look at it.

There was a comment about the loop bounds changing away from page
alignment. I think otherwise it's about ready to go.

If you or Michal don't take a look at it, I'll rebase and resubmit it.

Brian
