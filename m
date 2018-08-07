Received: from mail-it0-f65.google.com ([209.85.214.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fn6t0-0007QU-Ha
 for linux-mtd@lists.infradead.org; Tue, 07 Aug 2018 18:39:15 +0000
Received: by mail-it0-f65.google.com with SMTP id d16-v6so16137004itj.0
 for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2018 11:39:04 -0700 (PDT)
Date: Tue, 7 Aug 2018 12:39:01 -0600
From: Rob Herring <robh@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 NeilBrown <neilb@suse.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Zhiqiang Hou <Zhiqiang.Hou@nxp.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: only apply reset hacks to broken hardware
Message-ID: <20180807183901.GB31722@rob-hp-laptop>
References: <20180727183313.137943-1-computersforpeace@gmail.com>
 <20180727220337.1b3375ca@bbrezillon>
 <87wotcrz94.fsf@notabene.neil.brown.name>
 <20180731221255.3e65c1fa@bbrezillon>
 <20180731223550.GA60117@ban.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180731223550.GA60117@ban.mtv.corp.google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 31, 2018 at 03:35:50PM -0700, Brian Norris wrote:
> Hi Neil, Boris,
> 
> On Tue, Jul 31, 2018 at 10:12:55PM +0200, Boris Brezillon wrote:
> > On Tue, 31 Jul 2018 11:05:11 +1000
> > NeilBrown <neilb@suse.com> wrote:
> > > On Fri, Jul 27 2018, Boris Brezillon wrote:
> > > > On Fri, 27 Jul 2018 11:33:13 -0700
> > > > I'll leave Neil some time to review/test/comment on the patch before
> > > > queuing it, but it looks good to me.  
> > > 
> > > Thanks.
> > > I can confirm that if I apply this patch, my system won't reboot
> > > properly (as expected), and if I then add
> > > 
> > > 		broken-flash-reset;
> > > 
> > > to the jedec,spi-nor device, it starts functioning correctly again.
> > > 
> > > I don't like the pejorative "broken", and it also suggests that a thing
> > > used to work, but something happened to break it - this is not
> > > accurate.
> > > I would prefer something like "reset-not-connected" which is an accurate
> > > description of the state of the hardware.
> 
> One reason I didn't specifically say something like "not connected", is
> because IIUC it's actually *possible* to have a robust boot sequence
> without the RESET# pin -- e.g., if your boot ROM hardcoded a software
> reset command (just because it's not really standardized doesn't mean
> one can't do it).

Based on that, then it sounds like you need a specific compatible string 
so you too can know how to s/w reset the device.

I guess you are assuming a bootloader didn't leave the flash in an 
unknown addressing state?

Rob
