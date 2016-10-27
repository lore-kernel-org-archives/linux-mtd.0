Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzrkJ-0005dV-TO
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 20:57:57 +0000
Received: by mail-pf0-x243.google.com with SMTP id s8so3543139pfj.2
 for <linux-mtd@lists.infradead.org>; Thu, 27 Oct 2016 13:57:35 -0700 (PDT)
Date: Thu, 27 Oct 2016 13:57:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] MAINTAINERS: add more people to the MTD maintainer team
Message-ID: <20161027205732.GB1582@localhost>
References: <1477312526-7563-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477312526-7563-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 24, 2016 at 02:35:26PM +0200, Boris Brezillon wrote:
> Brian has been maintaining the MTD subsystem alone for several years
> now, and maintaining such a subsystem can really be time consuming.
> 
> Create a maintainer team formed of the most active MTD contributors
> to help Brian with this task, which will hopefully improve the
> subsystem reactivity.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks to all the volunteers! Applied to linux-mtd.git. Will send to
Linus once we can collect other outstanding fixes.

> ---
> Hi all,
> 
> I'm just trying to summarize what I understood the process would be,
> don't hesitate to correct me if I'm wrong.
> 
> For each release we will assign a specific MTD maintainer which will be
> responsible for taking MTD core patches and pulling spi-nor and nand PRs
> into the MTD tree and eventually send one or several PRs to Linus.

I had imagined that the "release owner" role wouldn't necessarily imply
exclusive commit rights, but that they'd just the primary one
responsible. I don't see a problem with other maintainer(s) applying
patches as long as they've gotten the proper review. Or would that be
too confusing?

But that's something not discussed here so far: review requirements. I
expect we need a minimum of 1 reviewer (where reviewer may be the one
applying it) that isn't the author. And for bigger things (i.e., not
trivial and not just a leaf driver) maybe 2. Hopefully in the form of
explicit Reviewed-by or Acked-by. And that means that for NAND or
SPI-NOR PRs, that may require preempting the "release owner" (e.g., if
Boris is supposed to be the "owner" for a release, he'll have to find
someone else to review his NAND PR -- I'm still happy to do so for now,
but others are welcome).

And for PRs to Linus: if y'all don't mind, I'd still like to have a
last look at things from the brand new maintainers, at least for now.
(Boris and Richard would probably also be good candidates for the last
review / PR, as they've proven to maintain things well already.) I'm
sure that can be relaxed after a release or so (say, after 4.10?).

Thoughts?

Also, everyone should make their attempts to get their PGP keys into the
web-of-trust. And we need David to get people infradead.org permissions.

One other point of order: if it isn't clear, I've been using
l2-mtd.git/master as the -next "branch" and linux-mtd.git/master as the
-current-release "branch." We should work extra hard to avoid rebasing
in either of those trees now. In fact, I'll go disable non-ff pushes
now...

I also currently have a server-side post-receive git hook installed in
l2-mtd.git that tries to update patchwork. It's not 100% accurate
because it matches contents (which might be the same across multiple
revisions of a series). I should probably remove or modify that before
others start pushing there.

> For fixes that are submitted after -rc1, I usually ask Brian to apply
> them directly into the MTD tree (I don't think there's a real need to
> prepare spi-nor and nand PRs for fixes), so we can proceed the same
> way: ask the maintainer assigned to this release to also take care of
> applying fixes and sending PRs to Linus before each -rc.

I'm flexible on this. If the "release owner" is attentive enough,
applying them to the MTD tree works just fine. But if a PR helps (as
Boris is planning to do right now for 4.9-rc) I don't see a problem with
that either.

> If you have other ideas, or would like to proceed differently, don't
> hesitate propose them.

Good luck, and happy MTD hacking :)

Brian

> Thanks,
> 
> Boris
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1cd38a7e0064..cbf9583fdbe7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7912,6 +7912,10 @@ F:	mm/
>  MEMORY TECHNOLOGY DEVICES (MTD)
>  M:	David Woodhouse <dwmw2@infradead.org>
>  M:	Brian Norris <computersforpeace@gmail.com>
> +M:	Boris Brezillon <boris.brezillon@free-electrons.com>
> +M:	Marek Vasut <marek.vasut@gmail.com>
> +M:	Richard Weinberger <richard@nod.at>
> +M:	Cyrille Pitchen <cyrille.pitchen@atmel.com>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> -- 
> 2.7.4
> 
