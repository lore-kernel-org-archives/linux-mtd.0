Received: from zoot.lnxi.com ([63.145.151.20])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gclqw-0000Vp-MP
	for linux-mtd@lists.infradead.org; Wed, 25 Oct 2006 12:43:48 -0400
Date: Wed, 25 Oct 2006 10:43:31 -0600
From: Ryan Jackson <rjackson@lnxi.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] [PATCH] [MTD] MAPS: Support for BIOS flash chips on the
	nvidia ck804 southbridge
Message-ID: <20061025164331.GE25530@localdomain>
References: <20061024174606.GE21009@localdomain>
	<1161776104.3260.201.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1161776104.3260.201.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy <dedekind@infradead.org> [061025 05:35]:
> > + * $Id: ck804xrom.c,v 1.1 2005/01/06 16:58:24 dolsen Exp $
> No need to dubmit CVS stuff

Oops.

> Also it would be nice to add your name at the header.

Sure, but I'm not the original author.  I'll put his name in as well as
mine.

> > +#include <linux/config.h>
> Don't include this file - this stuff is done by the Linux build system. 

Didn't catch that.  I'll remove it.

> > +#define ROM_PROBE_STEP_SIZE (64*1024) /* 64KiB */
> I personally would be happier to see a comment about what this macro is,
> not about that 64*1024 = 64KiB.

Sure.

> {} for one-line operators are not needed as well as all over the code -
> that's a linux coding style convention.

> Please, use } else { instead.

No problem.  I should have checked for this already.

Thanks.

-- 
Ryan Jackson
Linux Networx
