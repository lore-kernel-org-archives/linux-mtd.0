Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRL6o-00060M-9V
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 07:10:30 +0000
Subject: Re: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090715205217.GH3056@shareable.org>
References: <1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
	<1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
	<20090715205217.GH3056@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 10:09:59 +0300
Message-Id: <1247728199.11353.63.camel@localhost.localdomain>
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

On Wed, 2009-07-15 at 21:52 +0100, Jamie Lokier wrote:
> I suspect that's quite common for NOR cells.
> 
> Here's a question: Does it ever happen for NAND cells?  Does the UBIFS
> code assume that NAND erase only _ever_ converts 0 bits to 1 bits,
> never 1 bits to 0 bits temporarily?

I'm not good in physics of those processes, but AFAIU during the erasure
all bits are set from 0 to 1 on NAND, and this is a simultaneous process
for all bits in the eraseblocks. But I cannot say for sure.

> Can the same problem arise with NAND?  I don't mean "every NAND we
> tested", but NAND in general?  Is it correct to assume they never
> convert 1 bits to 0 bits temporarily during the erase cycle, and
> should the UBIFS code write something to the PEB which invalidates the
> header to ensure this cannot result in the same problems we've seen
> with NOR?

Good question, but I cannot tell for all NANDs, unfortunately. But the
one we tested is fine :-) But yes, would be nice to hear a HW expert.

> You can't necessarily overwrite the header with NAND, but you might be
> able to write elsewhere to say "this PEB is undergoing erase and is
> therefore indeterminate".

Yes, we may write to OOB, after all.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
