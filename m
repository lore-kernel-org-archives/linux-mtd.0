Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NTHJz-0003p0-PL
	for linux-mtd@lists.infradead.org; Fri, 08 Jan 2010 16:04:24 +0000
Date: Fri, 8 Jan 2010 17:04:04 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: RFC: [PATCH V2 0/9 Integration of SmartMedia/xD into mtd subsystem
Message-ID: <20100108160404.GE31872@logfs.org>
References: <1262963092.12577.14.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1262963092.12577.14.camel@maxim-laptop>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 8 January 2010 17:04:52 +0200, Maxim Levitsky wrote:
> 
> * Write speed is of course still very low, but like I said, it might be
> hardware problem.

Iirc the alauda could do about 400kB/s.  Speed didn't change noticeably
between 16M and 256M cards.  My conclusion back then was to blame the
alauda chip.  If you get even less, the problem likely isn't in the
cards but in the reader and/or your driver.

> * No support for 256 byte SmartMedia in the FTL. I don't have the
> hardware to test that, and I think for now there is not much need for
> that.
> (It only applies to 1MB and 2MB SmartMedia devices anyway...)

Fair enough.  If either of the two people who still use such cards
cares... ;)

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
