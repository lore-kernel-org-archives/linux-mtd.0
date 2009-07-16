Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRLBL-00076p-DG
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 07:15:11 +0000
Subject: Re: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090715205528.GI3056@shareable.org>
References: <C77C279BA71FD14985DC8E75FB265AB70344D104@usw-am-xch-02.am.trimblecorp.net>
	<1242721105.3623.0.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
	<1246627562.20721.190.camel@localhost.localdomain>
	<1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<20090715205528.GI3056@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 10:14:12 +0300
Message-Id: <1247728452.11353.66.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Eric Holmberg <Eric_Holmberg@trimble.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@trimble.com>, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-15 at 21:55 +0100, Jamie Lokier wrote:
> So I guess the right thing is to assume nothing, just that the whole
> block may have bits flipped from 1 to 0 in an indeterminate order, and
> then all bits flipped from 0 to 1 in an indeterminate order.

Yes, agree. This should be fine if we have invalidated the magic
numbers in the headers.

> Or maybe the weaker assumption, that the whole block is indeterminate
> during erase.

If we assume this, then we have to introduce a kind of "journal", where
we write "erase start"/"erase end" markers. This is doable, but I
wouldn't go for this unless there is a real case.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
