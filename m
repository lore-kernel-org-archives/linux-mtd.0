Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzr9W-00067l-Nf
 for linux-mtd@lists.infradead.org; Thu, 27 Oct 2016 20:19:55 +0000
Received: by mail-pf0-x241.google.com with SMTP id i85so3484236pfa.0
 for <linux-mtd@lists.infradead.org>; Thu, 27 Oct 2016 13:19:34 -0700 (PDT)
Date: Thu, 27 Oct 2016 13:19:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jagan Teki <jagan@openedev.com>
Cc: Marek Vasut <marex@denx.de>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 boris.brezillon@free-electrons.com, nicolas.ferre@atmel.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] MAINTAINERS: add a maintainer for the SPI NOR
 subsystem
Message-ID: <20161027201930.GA1582@localhost>
References: <aad52b708dcf6754edab87d2e0afe4f0ee6831f9.1476891131.git.cyrille.pitchen@atmel.com>
 <d92f8ef8-be78-0386-fa84-117c3cae6459@denx.de>
 <CAD6G_RRm0ttasw8DAQvE2fOpXd61tTsbNwyy_vJ_quAO0y3swA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD6G_RRm0ttasw8DAQvE2fOpXd61tTsbNwyy_vJ_quAO0y3swA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Oct 21, 2016 at 11:28:00PM +0530, Jagan Teki wrote:
> On Thu, Oct 20, 2016 at 7:12 PM, Marek Vasut <marex@denx.de> wrote:
> > On 10/19/2016 05:34 PM, Cyrille Pitchen wrote:
> >> I would like to volunteer as a maintainer for the SPI NOR part of the MTD
> >> subsystem.

Thanks! I'll be happy to have the help.

[...]

> >> Also both Marek Vasut and Richard Weinberger have volunteered as well as
> >> maintainers for the SPI NOR subsystem.

Snipped all mention of Richard, since he did not volunteer :)

> >> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> >> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> >
> > Acked-by: Marek Vasut <marek.vasut@gmail.com>
> 
> Acked-by: Jagan Teki <jteki@openedev.com>
> 
> >
> > btw I think I'll need higher privileges in patchwork to fiddle with patches.

I expect you'll be mailing Jeremy soon then.

> >> ---
> >> ChangeLog:
> >>
> >> v1 -> v2:
> >> - add Marek and Richard as maintainers.
> >> - add Acked-by from Boris Brezillon.
> >>
> >>
> >>  MAINTAINERS | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 757f9c4b388d..7e63b2015072 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -11390,6 +11390,18 @@ W:   http://www.st.com/spear
> >>  S:   Maintained
> >>  F:   drivers/clk/spear/
> >>
> >> +SPI NOR SUBSYSTEM
> >> +M:   Cyrille Pitchen <cyrille.pitchen@atmel.com>
> >> +M:   Marek Vasut <marek.vasut@gmail.com>
> >> +M:   Richard Weinberger <richard@nod.at>

Snipped the above line, and pushed to linux-mtd.git.

> 
> May be I was little late, but if there is any space for one more or so
> I would also like to co-maintain? Currently I am maintaining
> SPI/SPI-FLASH for u-boot and working for generic MTD (with u-boot
> driver model) + SPI-NOR addition on u-boot which eventually similar
> conceptual theory what Linux follows.

I'd be happy to add more if the others think that it's warranted. If
not, I'm sure all involved would still be happy with extra review, and
that could serve nearly the same purpose, as long as the committers
don't fall asleep like I admittedly have too often.

Regards,
Brian
