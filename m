Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ix9yc-0002c8-68
	for linux-mtd@lists.infradead.org; Tue, 27 Nov 2007 23:36:32 +0000
Date: Wed, 28 Nov 2007 00:31:09 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
Message-ID: <20071127233108.GC29456@lazybastard.org>
References: <20071127073616.GA22556@party>
	<20071127095518.GA29456@lazybastard.org>
	<9c9fda240711270348q7798ddd5jfb7bf763b3497500@mail.gmail.com>
	<1196164758.20132.6.camel@sauron>
	<9c9fda240711271528j5dd89cacg9b1b1c11e700b16b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c9fda240711271528j5dd89cacg9b1b1c11e700b16b@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	dwmw2@infradead.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 November 2007 08:28:56 +0900, Kyungmin Park wrote:
> 
> Umm, I'm not sure it's the right term. "sub-page" doesn't cover the
> oob area. It's only meanful at data area.
> Anyway it should be sub-page is 0 in MLC case.

Maybe we need a good description of the problem before we proceed.  This
argument about NOP vs. sub-page sounds as if not everyone has the same
definition for those words.  Without agreeing on those definitions, we
could argue for weeks without useful results.

Kyungmin, can you describe the problem again, including definitions of
potentially confusing terms?

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
