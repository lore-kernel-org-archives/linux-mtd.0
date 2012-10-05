Received: from 12.mo4.mail-out.ovh.net ([178.33.104.253]
 helo=mo4.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TK8nO-0001I7-DC
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 14:22:34 +0000
Received: from mail413.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with SMTP id 4C3FE10502F4
 for <linux-mtd@lists.infradead.org>; Fri,  5 Oct 2012 16:28:46 +0200 (CEST)
Date: Fri, 5 Oct 2012 16:20:04 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] mtd: st fsmc_nand: pass the ale and cmd resource
 via resource
Message-ID: <20121005142004.GB12462@game.jcrosoft.org>
References: <1349356456-13371-1-git-send-email-plagnioj@jcrosoft.com>
 <CACRpkdb10dfKR-sAvbUar+ZsC16uLofhBXuMxfL7QtXLhNg1+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb10dfKR-sAvbUar+ZsC16uLofhBXuMxfL7QtXLhNg1+Q@mail.gmail.com>
Cc: Vipin Kumar <vipin.kumar@st.com>, devicetree-discuss@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14:49 Fri 05 Oct     , Linus Walleij wrote:
> 
> On Thu, Oct 4, 2012 at 3:14 PM, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj@jcrosoft.com> wrote:
> 
> > Do not use the platform_data to pass resource and be smart in the drivers.
> > Just pass it via resource
> >
> > Switch to devm_request_and_ioremap at the sametime
> >
> > Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Vipin Kumar <vipin.kumar@st.com>
> > Cc: linux-mtd@lists.infradead.org
> 
> This is much better. Actually I was confused by these offsets recently...
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> My patch to convert the Nomadik to the FSMC driver will collide with this,
> but I can sure fix it up as we run into it, no big deal.
ha you did it too

I'll give it a try

Best Regards,
J.
