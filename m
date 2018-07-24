Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fi3M0-00067E-J3
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2018 19:52:18 +0000
Received: by mail-pg1-x542.google.com with SMTP id k3-v6so3607466pgq.5
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jul 2018 12:52:06 -0700 (PDT)
Date: Tue, 24 Jul 2018 12:52:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, NeilBrown <neil@brown.name>
Subject: Re: [PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when
 exiting
Message-ID: <20180724195202.GB190016@ban.mtv.corp.google.com>
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
 <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
 <20180723181350.GA58212@ban.mtv.corp.google.com>
 <20180723221002.736e0830@bbrezillon>
 <CAN8TOE904WXMScHo1b2jhusz-L8eGBK=gzUUX079ZVfiFk+HoQ@mail.gmail.com>
 <20180724011811.40165a35@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180724011811.40165a35@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Tue, Jul 24, 2018 at 01:18:11AM +0200, Boris Brezillon wrote:
> On Mon, 23 Jul 2018 15:06:43 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Jul 23, 2018 at 1:10 PM, Boris Brezillon
> > <boris.brezillon@bootlin.com> wrote:
> > > but it still seems to improve things. Of course, that means the
> > > user should try to re-route all HW reset sources to SW ones (RESET input
> > > pin muxed to the GPIO controller, watchdog generating an interrupt
> > > instead of directly asserting the RESET output pin), which is not always
> > > possible, but even when it's not, isn't it better to have a setup that
> > > works fine 99% of the time instead of 50% of the time?  
> > 
> > Perhaps, but not at the expense of future development. And
> > realistically, no one is doing that if they have this hack. Most
> > people won't even know that this hack is protecting them at all (so
> > again, they won't try to mitigate the problem any further).
> 
> Unless we add a huge backtrace at probe time which forces them to look
> closer at what they did wrong (like you seem to suggest below).

Sure, if we can force a huge backtrace, then maybe that's an acceptable
situation. I just predict that someday, somebody will argue that the
warning should be downgraded, since there's nothing the average user can
do about it. (Well, except not buying from that manufacturer in the
future.)

> > Or even better: put this hack behind a DT flag, so that one has to
> > admit that their board design is broken before it will even do
> > anything. Proposal: "linux,badly-designed-flash-reset".
> 
> I think we can remove the "linux," prefix. If it's badly designed, it
> applies to all OSes, don't you think?

Sure.

Shall I send a patch?

Brian
