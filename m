Received: from mail-qa0-x233.google.com ([2607:f8b0:400d:c00::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjZG4-0003UD-13
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 18:45:44 +0000
Received: by mail-qa0-f51.google.com with SMTP id o15so4120051qap.10
 for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2013 10:45:22 -0800 (PST)
Date: Thu, 21 Nov 2013 10:45:17 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 0/2] Regarding NAND core and drivers maintenance
Message-ID: <20131121184517.GJ9468@ld-irv-0074.broadcom.com>
References: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 20, 2013 at 09:20:07AM -0300, Ezequiel Garcia wrote:
> As it's obvious from the mailing list activity, in the past months Brian
> Norris took the NAND maintainership role. In my opinion, he's been doing
> a terrific work and as a result the reviewing cycle is now considerably
> shorter.
> 
> Great work, Brian!

Thanks!

> This position is not at all easy, due to each NAND driver being filled
> with hardware controller specificities. For that reason, I think it
> would be healthy to take another step in setting maintainership
> responsabilites.
> 
> My proposal (copy-pasted from the media subsystem) is to define
> sub-maintainers, one for each NAND driver, in addition to the top-level
> NAND subsystem maintainer.

I believe the offering is open, for any who are in a situation to
maintain particular drivers. You may note that there are a few NAND
drivers which are listed as "maintained" by others, either under their
corresponding ARM architecture, or standalone. And as you mention, this
arrangement is common in some other subsystems.

I don't suppose that every NAND driver will need a dedicated maintainer,
but active ones which have interested, knowledgeable developers might be
good candidates.

> When a patch comes for a given driver, the _ideal_ situation would be
> for the sub-maintainer to Ack-it first.
> 
> And to formalize this proposal, I'm pushing a couple patches: the first
> adds Brian to MAINTAINERS, as the NAND maintainer.
> 
> Then, I'm adding myself as sub-maintainer to the pxa3xx-nand driver.
> This way, scripts/get_maintainers.pl will show my mail and I'll get
> CCed by occasional or new contributors.
> 
> How does this sound?

For the idea:

Acked-by: Brian Norris <computersforpeace@gmail.com>

I think patch 1 would need a little tweaking, though.

I'd also like David's or Artem's comments. I know that Artem, for one,
claimed to not want to put himself in an official role as MTD
maintainer, even though he was taking much of this responsibility
previously.

Brian
