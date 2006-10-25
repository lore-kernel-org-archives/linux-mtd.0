Received: from zoot.lnxi.com ([63.145.151.20])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GcmgU-0001Lg-9r
	for linux-mtd@lists.infradead.org; Wed, 25 Oct 2006 13:37:02 -0400
Date: Wed, 25 Oct 2006 11:36:55 -0600
From: Ryan Jackson <rjackson@lnxi.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [PATCH] [MTD] MAPS: Support for BIOS flash chips on the
	nvidia ck804 southbridge
Message-ID: <20061025173654.GF25530@localdomain>
References: <20061024174606.GE21009@localdomain>
	<1161779958.27622.94.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1161779958.27622.94.camel@shinybook.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* David Woodhouse <dwmw2@infradead.org> [061025 06:39]:
> This is very reminiscent of the changes you made recently to the
> amd76xrom driver. Can they be merged?

Technically yes, but I'm not totally convinced that makes sense.  They
are two completely different southbridges and the registers for each are
different.

The code that loops over the window checking for chips is definitely
generic.  The amd76xrom, esb2rom, and the ck804xrom drivers all use it.
Perhaps that bit and anything related could be shared.

> Please fix 'KB' to 'KiB' and 'MB' to 'MiB' if you really mean powers of
> two and not powers of ten.

Okay, I'll change that.

Thanks.

-- 
Ryan Jackson
Linux Networx
