Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V47N0-0001j1-Jk
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2013 10:41:35 +0000
Message-ID: <1375181173.14869.109.camel@sauron.fi.intel.com>
Subject: Re: No pull for mtd?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Huang Shijie <b32955@freescale.com>
Date: Tue, 30 Jul 2013 13:46:13 +0300
In-Reply-To: <1374109439.21468.67.camel@shinybook.infradead.org>
References: <20130712124728.GB31726@localhost>
 <CAN8TOE-y0HvZYWqwoPEZhReVVP_iY6t5p1N0ZMJXPQqwuK5ozQ@mail.gmail.com>
 <51E64B40.1030408@freescale.com>
 <CAF4G-tLsOO_F-Mhn=+5vS2kkJuoeLJwrTdCR90DVuQQ+xn40aw@mail.gmail.com>
 <CAN8TOE_osCKY86W2O5mLxSSahyiW2peFwDhCFuSQ+ewGHeXNKw@mail.gmail.com>
 <1374102799.21468.3.camel@shinybook.infradead.org>
 <CAN8TOE9CX7fcDRQzee=Xg5TYkYYOs3__vWzy3r0Ofg0aCsgxSg@mail.gmail.com>
 <1374109439.21468.67.camel@shinybook.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 torvalds@linux-foundation.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-07-18 at 02:03 +0100, David Woodhouse wrote:
> Artem has historically expressed a reticence to have direct commit
> access to the main MTD tree (I think he does actually *have* it, in
> fact, but he's never used it). I think he prefers that I continue to
> have the final say after he does the first pass, and I think that model
> generally works out OK as a division of labour.

Whenever you know that you are going to miss the merge window, let me
know, and I will prepare a pull request.

This merge window I was not able to process all incoming patches, but I
did process a big part of them, so I could send a pull request to Linus
with your blessing.

But yes, knowing you for many years I know you are technically
excellent, so I would like you to have a final word, and this is why I
resisted to touch your tree directly.

However, I am fine to temporarily play your role whenever you know you
are going to be late.

> Brian, Huang, thanks for volunteering to help. It's much appreciated.

Indeed.

> Turn the l2-mtd tree into a group-access repository, so all of us can
> push to it (or rebase/reorder/etc). Try to keep it (as Artem already
> does to a certain extent) in order of "good" and then "staging" patches.

Fine with me. Huang, Brian, how do you see your role? What can you do
and how will it help fixing the problem? Do you want to take care about
a small part of MTD (e.g., only gpmi driver) or the MTD overall?

Depending on what you are willing to do, we can figure how we can work
together.

-- 
Best Regards,
Artem Bityutskiy
