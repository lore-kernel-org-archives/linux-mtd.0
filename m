Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCC7j-00065r-Ur
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 14:41:52 +0000
Subject: Re: [PATCHv3 1/3] mkfs.jffs2: fix casting of __off64_t
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: ext Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <BANLkTinVjqzz_f9waArqWZ=dmvCUC3H+KA@mail.gmail.com>
References: <1303195429.2779.2.camel@localhost>
	<971bada1c870aa0baf6e8d07784f95e31bb98213.1303202005.git.ext-andriy.shevchenko@nokia.com>
	<BANLkTi=LuXGaRdiaKRz0RYb1Z3WWaT53ng@mail.gmail.com>
	<1303223386.24954.21.camel@fs-test.research.nokia.com>
	<BANLkTinVjqzz_f9waArqWZ=dmvCUC3H+KA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Apr 2011 17:42:05 +0300
Message-ID: <1303224125.24954.24.camel@fs-test.research.nokia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-19 at 10:38 -0400, ext Mike Frysinger wrote:
> On Tue, Apr 19, 2011 at 10:29, Andy Shevchenko wrote:
> > On Tue, 2011-04-19 at 10:26 -0400, ext Mike Frysinger wrote:
> >> On Tue, Apr 19, 2011 at 04:34, Andy Shevchenko wrote:
> >> > -                                       printf("\ts %04o %9lu             %5d:%-3d %s\n",
> >> > +                                       printf("\ts %04o %" PRIu64 "             %5d:%-3d %s\n",
> >>
> >> is there a reason for dropping the field width ?  printf("%9"PRIu64"
> >> .....") should work fine ...
> >
> > If you guarantee the value not higher than 10^10, why should we use
> > PRIu64 at all? It's enough to have cast to unsigned long in such case.
> 
> it's a *minimum* field width, not a maximum.  it makes sure the output
> is aligned properly for most people.
Ok, probably it's better to keep.

-- 
With Best Regards,
Andy Shevchenko
