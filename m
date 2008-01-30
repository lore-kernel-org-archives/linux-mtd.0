Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKM11-00072l-At
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 23:06:53 +0000
Date: Wed, 30 Jan 2008 23:06:31 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Richard Purdie <rpurdie@rpsys.net>
Subject: Re: [RFC PATCH 1/3]] Add mtd panic_write function pointer
Message-ID: <20080130220631.GA6786@lazybastard.org>
References: <1201607964.5017.48.camel@localhost.localdomain>
	<20080129231104.GC32157@lazybastard.org>
	<1201687383.4668.1.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1201687383.4668.1.camel@localhost.localdomain>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 January 2008 10:03:03 +0000, Richard Purdie wrote:
> On Wed, 2008-01-30 at 00:11 +0100, Jörn Engel wrote:
> > 
> > I like the description.  So why is it not part of the patch proper?
> 
> You mean add it to mtd.h?

Yes.  struct mtd_info, like many other kernel interfaces, is nearly
impossible to use without either copying example code or reading the
implementation (aka reverse-engineering the kernel).  We could certainly
do better than that.  And for new additions we should.

Jörn

-- 
To announce that there must be no criticism of the President, or that we
are to stand by the President, right or wrong, is not only unpatriotic
and servile, but is morally treasonable to the American public.
-- Theodore Roosevelt, Kansas City Star, 1918
