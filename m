Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOweI-0007Yc-EL
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 21:29:32 +0000
Received: by mail-ob0-f181.google.com with SMTP id gq1so584223obb.12
 for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2013 14:29:09 -0700 (PDT)
Date: Wed, 25 Sep 2013 14:29:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v6 1/4] ARM: OMAP2+: cleaned-up DT support of various
 ECC schemes
Message-ID: <20130925212903.GI23337@ld-irv-0074.broadcom.com>
References: <1378986619-26765-1-git-send-email-pekon@ti.com>
 <1378986619-26765-2-git-send-email-pekon@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA15ED7@DBDE04.ent.ti.com>
 <20130925134619.GG10746@radagast>
 <20130925175527.GA23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA16884@DBDE04.ent.ti.com>
 <20130925200539.GH23337@ld-irv-0074.broadcom.com>
 <CAOesGMif301iBe9zxHudkC_G9SzPPy1Mj4XYvQ-MY8nmx4wO+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOesGMif301iBe9zxHudkC_G9SzPPy1Mj4XYvQ-MY8nmx4wO+A@mail.gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>, Rob Herring <rob.herring@calxeda.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Stephen Warren <swarren@wwwdotorg.org>,
 "benoit.cousson@linaro.org" <benoit.cousson@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 25, 2013 at 01:33:27PM -0700, Olof Johansson wrote:
> On Wed, Sep 25, 2013 at 1:05 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> 
> > Olof has given good advice on your DT binding and has (slowly) been
> > responding to other requests for DT review that make it to his list. I
> > see that he hasn't followed up on your changes (this v6), so pinging him
> > (as you did) is probably the correct approach. But please do recognize
> > that the DT list is very high volume, so it's hard to get good timely
> > responses there.
> 
> I am not a DT mainainer, but sometimes when I see a binding that
> appears to be wrong I speak up. In this case, the binding was one of
> those.

Whoops, my bad. I was deceived by the responses I've seen from you on
other issues (thanks, BTW). In that case, I haven't seen any response
from a proper DT binding maintainer :(
 
> So, I have no more objections to it, and I hope you can get a quick
> review from a DT maintainer on the rest of the binding.

At this point, I'm comfortable going ahead without their ack, since they
obviously don't care/don't have the manpower to review.

Brian
