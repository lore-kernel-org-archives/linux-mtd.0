Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MULPD-00076M-GI
	for linux-mtd@lists.infradead.org; Fri, 24 Jul 2009 14:05:56 +0000
Date: Fri, 24 Jul 2009 15:05:47 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS Corrupt during power failure
Message-ID: <20090724140547.GA27755@shareable.org>
References: <7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
	<1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
	<20090715205217.GH3056@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB703B47FC9@usw-am-xch-02.am.trimblecorp.net>
	<4A69596F.8070300@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A69596F.8070300@gmail.com>
Cc: Eric Holmberg <Eric_Holmberg@Trimble.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@Trimble.com>, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> So apparently it is possible to put NOR to the state when you cannot write
> to it. I wonder if this is SW bug or a HW feature.

Could it simply be that the block is worn out, and the chip's write
program does not complete when a block is worn out?

-- Jamie
