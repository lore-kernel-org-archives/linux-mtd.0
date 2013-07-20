Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V0Ksr-0005yP-SS
 for linux-mtd@lists.infradead.org; Sat, 20 Jul 2013 00:18:50 +0000
Received: by mail-pa0-f52.google.com with SMTP id kq12so1636480pab.25
 for <linux-mtd@lists.infradead.org>; Fri, 19 Jul 2013 17:18:26 -0700 (PDT)
Date: Sat, 20 Jul 2013 08:22:33 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: No pull for mtd?
Message-ID: <20130720122231.GB4410@gmail.com>
References: <20130712124728.GB31726@localhost>
 <CAN8TOE-y0HvZYWqwoPEZhReVVP_iY6t5p1N0ZMJXPQqwuK5ozQ@mail.gmail.com>
 <51E64B40.1030408@freescale.com>
 <CAF4G-tLsOO_F-Mhn=+5vS2kkJuoeLJwrTdCR90DVuQQ+xn40aw@mail.gmail.com>
 <CAN8TOE_osCKY86W2O5mLxSSahyiW2peFwDhCFuSQ+ewGHeXNKw@mail.gmail.com>
 <1374102799.21468.3.camel@shinybook.infradead.org>
 <CAN8TOE9CX7fcDRQzee=Xg5TYkYYOs3__vWzy3r0Ofg0aCsgxSg@mail.gmail.com>
 <1374109439.21468.67.camel@shinybook.infradead.org>
 <CAN8TOE_y=mDY4frFB9kmedhGnNhf4pQwqH1q+fAcDAE_RNwO+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN8TOE_y=mDY4frFB9kmedhGnNhf4pQwqH1q+fAcDAE_RNwO+A@mail.gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, torvalds@linux-foundation.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 18, 2013 at 10:33:09PM -0700, Brian Norris wrote:
> On Wed, Jul 17, 2013 at 6:03 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> > On Wed, 2013-07-17 at 16:26 -0700, Brian Norris wrote:
> >> Is there any hassling the rest of us can do in the future to avoid
> >> this situation?
> >
> > Certainly can't hurt :)
> 
> I was kinda wondering about specifics :) Like more email? More capital
> letters in our emails? Track down your phone number and call you in
> the middle of the night?
> 
> >> Ezequiel gave a timely reminder via email (2 or 3 days
> >> left in the merge window). We can shout louder and earlier, but it's
> >> hard to tell if we're shouting into an empty forest sometimes.
> >
> > Earlier is better. If I haven't got a tree lined up in good time
> > *before* the merge window opens, Linus isn't going to want to know.
> > So if the merge window is already open and I'm slacking and/or changing
> > nappies, that's a bit late already.
hi David:

We can hassle you when the merge-window just opens.
I think two weeks is enough for you.

> 
> Yeah, I realize now that 3 days is a bit late. And I didn't really
> notice our missing the merge window myself until it was nearly too
> late :)
> 
> > Occasionally when I've failed to get things together in time for the
> > merge window, I have handled that by just looking at Artem's "l2-mtd"
> > tree and submitting what's in there as-is, without making any changes.
> > Or submitting a strict subset of it, up to the *important* part but
> > leaving out some of the more dubious later commits which I want to
> > change or reject.
> >
> > Normally though, I use Artem's l2-mtd tree a bit like patchwork. He
> > hoovers up most things from the list and even does some preliminary
> > fixes on them — so it's *much* more convenient for me than raw patchwork
> > would be. And it's close *enough* to what I'm actually going to accept,
> > that it's reasonable for it to be in linux-next as it is.
> 
> I guess I didn't fully grasp the relation between you and Artem. It
> seemed to me like Artem's tree was practically the pull request tree,
> that his status as "not the maintainer" simply gave him the luxury to
> rebase more freely, and that your sign-off (or sometimes pull request
> w/o adding sign-offs) was mostly just a rubber stamp. But I was
> slightly off, I suppose. Anyway, I do appreciate the editorial
> control, whether it's Artem or you, and I would not be hasty to
> discard that.
> 
> > Artem has historically expressed a reticence to have direct commit
> > access to the main MTD tree (I think he does actually *have* it, in
> > fact, but he's never used it). I think he prefers that I continue to
> > have the final say after he does the first pass, and I think that model
> > generally works out OK as a division of labour.
> >
> > So... other than putting a few more hours in my day (and ringfencing
> > them so they don't get used up by all the *other* things I need a few
> > more hours each day for, like sleeping as I should be doing right now),
> > what can we do?
> 
> Lengthen your day? Maybe a time machine? Hire a body double to go to
> your "real" job?
> 
> > Brian, Huang, thanks for volunteering to help. It's much appreciated.
> >
> > I think the way forward, if Artem is willing, might be the following:
> >
> > Turn the l2-mtd tree into a group-access repository, so all of us can
> > push to it (or rebase/reorder/etc). Try to keep it (as Artem already
> > does to a certain extent) in order of "good" and then "staging" patches.
> 
> I did not realize that there was an order other than chronological in
> which Artem kept l2-mtd. This might be a little harder to manage if
> the distinction between "good" and "staging" are unclear, and there
> are up to 3 people rebasing and pushing. We'll definitely need Artem's
> agreement for anything of this sort.
> 
> > It's that sorting that's important; I should be able to just pull the
> > 'good' ones directly into the main tree as a stable commit which *will*
> > to go Linus.
> 
> My suggestion, to resolve some of the potential conflicts of too many
> writing to the same branch and to make the sorting clear: perhaps a
> separate branch that will hold the "good" stuff (named 'for-3.12' for
> example) with minimal rebasing. Then l2-mtd's 'master' will rebase on
> top of that to include "staging" fixes that are more likely to be
> fixed-up, dropped, or delayed.
> 
> > And then after a while, once we're all happy that I never
> > actually end up rejecting or even tweaking patches in the "good" pile,
> > we'll just start using the main linux-mtd.git tree as the "good" pile
> > and you can push there directly. I'll try to be more explicit about what
> > I change and why, in cases where I would previously have silently fixed
> > things up.
> >
> > I'll probably still keep doing a final pass on it for a while even after
> > that, and constructing the pull request. But I'm not averse to letting
> > others do that too, once we've reached the point where I'm sure it'd be
> > as I want it.
> >
> > How does that sound?
> 
> I think that mostly sounds OK. I can't speak for everyone, but it
> seems that for some of us, the process just needs to be able to adapt
> to changes in job situations (where at least you and Artem aren't even
> employed in MTD-related work anymore), vacations, babies, absences, or
> any of the other reasons that MTD participation ebbs and flows. So
> bringing others into the process should help.
yes.

If more people can ack and merge the patches, we can speed up the mtd.

I really envy the other maillist, you can get response in several days.
but if i send patches to mtd, i maybe should wait for a month or more.

> 
> I guess we'll see what Artem thinks when he's back from vacation and
Waiting for Artem's solution too. He becomes much busy this year, and
can not review the patches as he did last year.

thanks
Huang Shijie
