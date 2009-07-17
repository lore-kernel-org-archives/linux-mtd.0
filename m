Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRhYH-0001zd-JQ
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 07:08:22 +0000
Subject: Re: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090716164908.GI16461@shareable.org>
References: <1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
	<1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
	<20090715205217.GH3056@shareable.org>
	<1247728199.11353.63.camel@localhost.localdomain>
	<20090716164908.GI16461@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Jul 2009 10:07:20 +0300
Message-Id: <1247814440.11353.158.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Eric Holmberg <Eric_Holmberg@Trimble.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@Trimble.com>, Stefan Roese <sr@denx.de>,
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

On Thu, 2009-07-16 at 17:49 +0100, Jamie Lokier wrote:
> Even if they all look like 1 bits after power failure, it's possible
> that some bits are "half-erased" if the erase didn't finish, and
> aren't reliable.  Does UBI notice this, and force the block to be
> erased again even though it looks like all 1 bits?

It checks the headers. If the headers are OK, it goes forward. Otherwise
it erases the PEB.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
