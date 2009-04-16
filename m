Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LuKVn-0003eJ-Et
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 05:51:54 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB70305C86F@usw-am-xch-02.am.trimblecorp.net>
References: <1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
	<20090415164416.GD4325@shareable.org>
	<alpine.LFD.2.00.0904151422170.6741@xanadu.home>
	<20090415183806.GA8669@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C86F@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Apr 2009 08:51:26 +0300
Message-Id: <1239861086.3390.209.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas Pitre <nico@cam.org>, Urs Muff <urs_muff@Trimble.com>,
	Jamie Lokier <jamie@shareable.org>, linux-mtd@lists.infradead.org,
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

On Wed, 2009-04-15 at 13:33 -0600, Eric Holmberg wrote:
> > I don't remember if it was NOR, NAND or something else, but I remember
> > reading about some flash which supports 1 concurrent write and 1
> > erase, and thinking "oh that's clever, it means you can do streaming
> > writes or rapid fsync/database commits without long pauses 
> > for erasing".
> 
> The evolution seems to be:
>  1. Allow erase / program suspend to do a read from a different PEB (the
> chip I'm using supports this)
>  2. Allow simultaneous read while either erasing or programming a
> different PEB
>  3. Allow parallel operations on different flash banks
>  4. Combine NOR and NAND onto the same chip
> 
> My understanding is that the parallel operations are only valid on
> different flash banks, where a flash bank could be thought of
> conceptually as a separate flash chip.  I'm no flash memory expert by
> any means, so I'm sure there are some other systems out there.

As Nikolas noted, intel guys sent an mtdstripe layer implementation
here, but for some reasons they did not make it into mainline. That
level could interleave between several chips. E.g., you have 2 NANDs,
then that layer could present them as one virtual device with twice as
large eraseblock size and twice as large page size. And you get 2x
speed.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
