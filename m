Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq60d-0006uN-Jj
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 15:10:59 +0000
Received: by wyb38 with SMTP id 38so5614071wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 08:10:54 -0700 (PDT)
Subject: Re: [Uclinux-dist-devel] [PATCH] mtd: Blackfin NFC: fix invalid
	free in remove()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <AANLkTikE93Uqnf7_8p72rEhcRydmx0LdBVCM_z3tNr-z@mail.gmail.com>
References: <1283028125-6027-1-git-send-email-vapier@gentoo.org>
	<1283173086.12995.74.camel@brekeke> <1283173173.12995.75.camel@brekeke>
	<AANLkTikE93Uqnf7_8p72rEhcRydmx0LdBVCM_z3tNr-z@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 18:10:47 +0300
Message-ID: <1283181047.2005.1.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: uclinux-dist-devel@blackfin.uclinux.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-30 at 09:32 -0400, Mike Frysinger wrote:
> On Mon, Aug 30, 2010 at 08:59, Artem Bityutskiy wrote:
> > On Mon, 2010-08-30 at 15:58 +0300, Artem Bityutskiy wrote:
> >> On Sat, 2010-08-28 at 16:42 -0400, Mike Frysinger wrote:
> >> > Since info->mtd isn't dynamically allocated, we shouldn't attempt to
> >> > kfree() it.  Otherwise we get random fun corruption when unloading
> >> > the driver built as a module.
> >> >
> >> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> >> > ---
> >> > note: this should be merged for 2.6.36 and probably sent to stable trees
> >>
> >> You send the same patch 2 times once with this note and the other time
> >> without this note. Which one should be ignored?
> >
> > I guess it is 2.6.36 material. Also, if you want this in -stable, add
> > corresponding CC please.
> 
> once it gets merged, then i can notify the stable guys

AFAIK, this is not the way they prefer to work. The right protocol is
that you add 'Cc: stable@kernel.org' to the commit message, ane they
pick the patch. I might be mistaken, but AFAIK this is the way.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
