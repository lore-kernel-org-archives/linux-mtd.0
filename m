Subject: Re: [PATCH] [MTD] ONENAND: Fix devexit macro usage in OMAP OneNAND
	(was  Re: [PATCH] OMAP OneNAND: add missing __devexit_p wrappers)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mika Korhonen <mika.j.korhonen@gmail.com>
In-Reply-To: <7948530905211317h5bd9a395ta5b8575befed96c@mail.gmail.com>
References: <7948530905211317h5bd9a395ta5b8575befed96c@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 23 May 2009 12:14:39 +0300
Message-Id: <1243070079.21646.24.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Brownell <david-b@pacbell.net>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-05-21 at 23:17 +0300, Mika Korhonen wrote:
> 2009/4/29 David Brownell <david-b@pacbell.net>:
> > On Wednesday 29 April 2009, Adrian Hunter wrote:
> >> +       .shutdown       = __devexit_p(omap2_onenand_shutdown),
> >
> > That looks wrong.  Shutdown functions shouldn't get discarded
> > like exit functions.  I'd think the fix for that would be taking
> > away any __devexit annotation on the shutdown function.
> >
> >
> 
> Here follows the revised patch, fixed as suggested.

I've taken this patch to l2-mtd-2.6.git.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
