Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRLIu-0000Q7-4V
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 07:23:00 +0000
Subject: Re: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090715220942.GQ3056@shareable.org>
References: <C77C279BA71FD14985DC8E75FB265AB7034DBD10@usw-am-xch-02.am.trimblecorp.net>
	<1246627562.20721.190.camel@localhost.localdomain>
	<1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<20090715205528.GI3056@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB703B47FCE@usw-am-xch-02.am.trimblecorp.net>
	<20090715220942.GQ3056@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 10:22:31 +0300
Message-Id: <1247728951.11353.74.camel@localhost.localdomain>
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

On Wed, 2009-07-15 at 23:09 +0100, Jamie Lokier wrote:
> Eric Holmberg wrote:
> > > So I guess the right thing is to assume nothing, just that the whole
> > > block may have bits flipped from 1 to 0 in an indeterminate order, and
> > > then all bits flipped from 0 to 1 in an indeterminate order.
> > > 
> > > Or maybe the weaker assumption, that the whole block is indeterminate
> > > during erase.
> > 
> > >From the beginning of the erase to the end is definitely an
> > indeterminate state for the entire PEB.  Writing all zero's to the
> > header as in Artem's fix should work in all cases excluding the
> > extremely rare cases where a write of 0's is interrupted and the header
> > has been changed to a valid value and in the case where an erase
> > (0-to-1) transition is interrupted which results in a valid header.  The
> > odds against that are huge, so I would expect the flash to wear out
> > before it ever happens in real life.
> 
> I agree, with a nice strong checksum that should be rare.  With 100
> millions of devices and full lifetime of each device, I don't know if
> they are so rare with the checksum actually used that they'll never
> happen though, or if it matters.

Well, I invalidate the magic EC/VID header's 32-bit words, so this
is not even about checksum. Unless these words somehow resurrect from
all-zero to valid-number, we are safe.

The magic numbers are the first 32-bit words of both headers:

/* Erase counter header magic number (ASCII "UBI#") */
#define UBI_EC_HDR_MAGIC  0x55424923
/* Volume identifier header magic number (ASCII "UBI!") */
#define UBI_VID_HDR_MAGIC 0x55424921

> It could be made virtually impossible by writing to a record on a
> different PEB which says which PEB is undergoing erase and therefore
> indeterminate.  Is that required for NAND in principle, since you
> can't overwrite the header to zero it?

For MLC, yes. In case of SLC we have free OOB bytes.

> If there are NANDs which would require that, it could be a generic
> part of UBI/UBIFS and strengthen the behaviour on NOR slightly,
> otherwise I'm sure the header-zeroing is enough for NOR.

Let's wait and see if some one comes up wit such a requirement. Anyway,
the user base of UBIFS is small, and it is not clear if it will grow
in future, because the industry goes away from raw NANDs.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
