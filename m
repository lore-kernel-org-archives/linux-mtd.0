Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c03OY-0002SJ-F6
 for linux-mtd@lists.infradead.org; Fri, 28 Oct 2016 09:24:16 +0000
Date: Fri, 28 Oct 2016 11:23:52 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger
 <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MAINTAINERS: add more people to the MTD maintainer team
Message-ID: <20161028112352.772abae8@bbrezillon>
In-Reply-To: <20161027205732.GB1582@localhost>
References: <1477312526-7563-1-git-send-email-boris.brezillon@free-electrons.com>
 <20161027205732.GB1582@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Thu, 27 Oct 2016 13:57:32 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Mon, Oct 24, 2016 at 02:35:26PM +0200, Boris Brezillon wrote:
> > Brian has been maintaining the MTD subsystem alone for several years
> > now, and maintaining such a subsystem can really be time consuming.
> > 
> > Create a maintainer team formed of the most active MTD contributors
> > to help Brian with this task, which will hopefully improve the
> > subsystem reactivity.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>  
> 
> Thanks to all the volunteers! Applied to linux-mtd.git. Will send to
> Linus once we can collect other outstanding fixes.
> 
> > ---
> > Hi all,
> > 
> > I'm just trying to summarize what I understood the process would be,
> > don't hesitate to correct me if I'm wrong.
> > 
> > For each release we will assign a specific MTD maintainer which will be
> > responsible for taking MTD core patches and pulling spi-nor and nand PRs
> > into the MTD tree and eventually send one or several PRs to Linus.  
> 
> I had imagined that the "release owner" role wouldn't necessarily imply
> exclusive commit rights, but that they'd just the primary one
> responsible. I don't see a problem with other maintainer(s) applying
> patches as long as they've gotten the proper review. Or would that be
> too confusing?

Nope, I'm fine with both solutions.

> 
> But that's something not discussed here so far: review requirements. I
> expect we need a minimum of 1 reviewer (where reviewer may be the one
> applying it) that isn't the author. And for bigger things (i.e., not
> trivial and not just a leaf driver) maybe 2. Hopefully in the form of
> explicit Reviewed-by or Acked-by.

Agreed.

> And that means that for NAND or
> SPI-NOR PRs, that may require preempting the "release owner" (e.g., if
> Boris is supposed to be the "owner" for a release, he'll have to find
> someone else to review his NAND PR -- I'm still happy to do so for now,
> but others are welcome).

Cool.

> 
> And for PRs to Linus: if y'all don't mind, I'd still like to have a
> last look at things from the brand new maintainers, at least for now.
> (Boris and Richard would probably also be good candidates for the last
> review / PR, as they've proven to maintain things well already.) I'm
> sure that can be relaxed after a release or so (say, after 4.10?).

I'm perfectly fine with that.

> 
> Thoughts?
> 
> Also, everyone should make their attempts to get their PGP keys into the
> web-of-trust. And we need David to get people infradead.org permissions.
> 
> One other point of order: if it isn't clear, I've been using
> l2-mtd.git/master as the -next "branch" and linux-mtd.git/master as the
> -current-release "branch." We should work extra hard to avoid rebasing
> in either of those trees now. In fact, I'll go disable non-ff pushes
> now...
> 
> I also currently have a server-side post-receive git hook installed in
> l2-mtd.git that tries to update patchwork. It's not 100% accurate
> because it matches contents (which might be the same across multiple
> revisions of a series). I should probably remove or modify that before
> others start pushing there.

I use git notes to do that: each time I apply a patch using pwclient,
it adds a note containing the patchwork id, then, I have a pre-push
hook that scan all the commits that are being pushed on my nand/next
branch and mark the new ones as Accepted in patchwork.

I can provide those scripts if you want, but this means it has to be
done on the client side, because notes are discarded when you push
things to a remote.

> 
> > For fixes that are submitted after -rc1, I usually ask Brian to apply
> > them directly into the MTD tree (I don't think there's a real need to
> > prepare spi-nor and nand PRs for fixes), so we can proceed the same
> > way: ask the maintainer assigned to this release to also take care of
> > applying fixes and sending PRs to Linus before each -rc.  
> 
> I'm flexible on this. If the "release owner" is attentive enough,
> applying them to the MTD tree works just fine. But if a PR helps (as
> Boris is planning to do right now for 4.9-rc) I don't see a problem with
> that either.

Well, it all depends on the number of fixes we have. But if we all have
permissions to push to the mtd tree, then we can just create a fixes
branch where the sub-subsystem maintainers can easily push their fixes
and the release owner will then send a PR to Linus before the next -rc.

> 
> > If you have other ideas, or would like to proceed differently, don't
> > hesitate propose them.  
> 
> Good luck, and happy MTD hacking :)

Thanks.
