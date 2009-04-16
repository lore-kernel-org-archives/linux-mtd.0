Subject: Re: [PATCH 1/3 v3] mtd: physmap_of: Add multiple regions and
	concatenation support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Grant Likely <grant.likely@secretlab.ca>
In-Reply-To: <fa686aa40904160646v75a98e02s446fd89c08cfebae@mail.gmail.com>
References: <1239883845-17804-1-git-send-email-sr@denx.de>
	<fa686aa40904160626k118cea3cvc0db38a2277e45b8@mail.gmail.com>
	<200904161537.59048.sr@denx.de>
	<fa686aa40904160646v75a98e02s446fd89c08cfebae@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Apr 2009 16:51:39 +0300
Message-Id: <1239889899.3390.216.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	devicetree-discuss@ozlabs.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-04-16 at 07:46 -0600, Grant Likely wrote:
> On Thu, Apr 16, 2009 at 7:37 AM, Stefan Roese <sr@denx.de> wrote:
> > On Thursday 16 April 2009, Grant Likely wrote:
> >> > Signed-off-by: Stefan Roese <sr@denx.de>
> >> > Reviewd-by: Grant Likely <grant.likely@secretlab.ca>
> >>
> >> Yup, still looks good to me.  What boards has this been tested on?
> >
> > I tested this version on PPC405EX Kilauea equipped only one "standard"
> > Spansion S29GL512 NOR chip. And a slightly modified version on an MPC8360
> > board (kmeter1) which is equipped with the Intel P30 part mentioned in the
> > bindings description. Slightly modified since this board support is not yet
> > pushed upstream and currently using v2.6.28 (physmap_of.c has received minor
> > modifications after 2.6.28 release).
> 
> Okay.  It will be good to get this one into -next for some testing
> exposure.  Unless he asks me to do otherwise, I'll leave this one to
> David to pick up.

David usually picks up stuff just before or during merge window,
so if you want linux-next exposure, you need to have some extra
care.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
