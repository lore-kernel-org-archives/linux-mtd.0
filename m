Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V47R8-0001pl-SK
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 10:45:51 +0000
Message-ID: <1375181431.14869.113.camel@sauron.fi.intel.com>
Subject: Re: No pull for mtd?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 30 Jul 2013 13:50:31 +0300
In-Reply-To: <CAN8TOE_y=mDY4frFB9kmedhGnNhf4pQwqH1q+fAcDAE_RNwO+A@mail.gmail.com>
References: <20130712124728.GB31726@localhost>
 <CAN8TOE-y0HvZYWqwoPEZhReVVP_iY6t5p1N0ZMJXPQqwuK5ozQ@mail.gmail.com>
 <51E64B40.1030408@freescale.com>
 <CAF4G-tLsOO_F-Mhn=+5vS2kkJuoeLJwrTdCR90DVuQQ+xn40aw@mail.gmail.com>
 <CAN8TOE_osCKY86W2O5mLxSSahyiW2peFwDhCFuSQ+ewGHeXNKw@mail.gmail.com>
 <1374102799.21468.3.camel@shinybook.infradead.org>
 <CAN8TOE9CX7fcDRQzee=Xg5TYkYYOs3__vWzy3r0Ofg0aCsgxSg@mail.gmail.com>
 <1374109439.21468.67.camel@shinybook.infradead.org>
 <CAN8TOE_y=mDY4frFB9kmedhGnNhf4pQwqH1q+fAcDAE_RNwO+A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>, torvalds@linux-foundation.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-07-18 at 22:33 -0700, Brian Norris wrote:
> > Normally though, I use Artem's l2-mtd tree a bit like patchwork. He
> > hoovers up most things from the list and even does some preliminary
> > fixes on them — so it's *much* more convenient for me than raw
> patchwork
> > would be. And it's close *enough* to what I'm actually going to
> accept,
> > that it's reasonable for it to be in linux-next as it is.
> 
> I guess I didn't fully grasp the relation between you and Artem. It
> seemed to me like Artem's tree was practically the pull request tree,
> that his status as "not the maintainer" simply gave him the luxury to
> rebase more freely, and that your sign-off (or sometimes pull request
> w/o adding sign-offs) was mostly just a rubber stamp.

Well, something like this. Depending on the load, David either sends my
tree to Linus almost intact, or goes through it patch-by-patch and does
real review: amends some, rejects some, etc.

-- 
Best Regards,
Artem Bityutskiy
