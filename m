Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fi3BV-00029A-Ah
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2018 19:41:26 +0000
Received: by mail-pg1-x541.google.com with SMTP id y4-v6so3585979pgp.9
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jul 2018 12:41:14 -0700 (PDT)
Date: Tue, 24 Jul 2018 12:41:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: NeilBrown <neilb@suse.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when
 exiting
Message-ID: <20180724194110.GA190016@ban.mtv.corp.google.com>
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
 <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
 <20180723181350.GA58212@ban.mtv.corp.google.com>
 <20180723221002.736e0830@bbrezillon>
 <CAN8TOE904WXMScHo1b2jhusz-L8eGBK=gzUUX079ZVfiFk+HoQ@mail.gmail.com>
 <87in55po3a.fsf@notabene.neil.brown.name>
 <20180724012226.307f578d@bbrezillon>
 <87fu09pfii.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fu09pfii.fsf@notabene.neil.brown.name>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Jul 24, 2018 at 11:51:49AM +1000, NeilBrown wrote:
> On Tue, Jul 24 2018, Boris Brezillon wrote:
> > On Tue, 24 Jul 2018 08:46:33 +1000
> > NeilBrown <neilb@suse.com> wrote:
> >> One possibility that occurred to me when I was exploring this issue is
> >> to revert to 3-byte mode whenever 4-byte was not actively in use.
> >> So any access beyond 16Meg is:
> >>  switch-to-4-byte ; perform IO ; switch to 3-byte
> >> or similar.  On my hardware it would be more efficient to
> >> use the 4-byte opcode to perform the IO, then reset the cached
> >> 4th address byte that the NOR chip transparently remembered.

Do these chips cache the last 4th-byte used? I don't recall reading
that, but that would be interesting. It also sounds like that would make
things even more difficult to do robustly.

> >> This adds a little overhead, but should be fairly robust.
> >> It doesn't help if something goes terribly wrong while IO is happening,
> >> but I don't think any other software solution does either.
> >> 
> >> How would you see that approach?
> >
> > I think the problem stands: people that have proper HW mitigation for
> > this problem (NOR chip is reset when the Processor is reset) don't want
> > to pay the overhead. So, even if we go for this approach, we probably
> > want to only do that for broken HW.

If it actually saves bytes on the wire to stay in 3-byte mode more
often, then that could be helpful to all systems. But otherwise, yes, it
doesn't really belong on a properly-designed system.

> I agree that a "my-hardware-is-suboptimal" flag is appropriate.
> I was addressing the suggestion that the current approach doesn't handle
> all corner cases and was suggesting a different approach that might
> handle more corner-cases.  I should have been more explicit about that.

If you want to talk about optimizing the broken-hardware hack, then
fine. That's not my interest at all.

Brian
