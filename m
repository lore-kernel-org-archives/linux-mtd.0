Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lujtp-0001PG-4W
	for linux-mtd@lists.infradead.org; Fri, 17 Apr 2009 08:58:24 +0000
Subject: Re: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090416213400.GA10578@shareable.org>
References: <C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
	<1239860798.3390.205.camel@localhost.localdomain>
	<20090416213400.GA10578@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Apr 2009 11:58:09 +0300
Message-Id: <1239958689.3390.295.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Urs Muff <urs_muff@Trimble.com>, Eric Holmberg <Eric_Holmberg@Trimble.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-04-16 at 22:34 +0100, Jamie Lokier wrote:
> > 1. eraseblock
> > 2. Min. I/O unit size, which is mtd->writesize in MTD, and
> > ubi->min_io_size in UBI. This corresponds to NAND page, and 1 byte in
> > NOR.
> 
> I guess 1 byte in NOR because you can overwrite a word to set the other byte?
> Logically min_io_size should be 1 bit :-)

Right. But I'm talking more from UBI/UBIFS perspective. We do not
need bits, so for us this is 1 byte. But this is not essential now,
I guess.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
