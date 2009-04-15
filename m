Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lu82I-0006Bu-35
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 16:32:36 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Wed, 15 Apr 2009 10:32:24 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <20090415160921.GA4325@shareable.org>
References: <C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: "Jamie Lokier" <jamie@shareable.org>
Cc: Urs Muff <urs_muff@trimble.com>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Is this really different from NAND and it's page writes?
> Do the CFI block writes have to be aligned (to 64 bytes) offset, or
> can the 64 bytes start at any word position?

Looking through the data sheet again, it looks like there is the concept
of a page for block writes in this particular NOR flash where a page
starts on any address evenly divisible by 0x20 (32-byte block).  The CFI
driver handles this when splitting up the blocks.

Here's the datasheet for reference:
 * http://www.spansion.com/datasheets/s29gl-p_00_a11_e.pdf?page=3D28

Thinking about it, this shouldn't affect the maximum possible corruption
count, since a fully-aligned write buffer is the worst case (a possible
of a <=3D64-byte corruption).  If the block is split between pages, then
32-bytes would occur in the first write and 32-bytes in the second
write, so the maximum corruption would be <=3D32 bytes.

Does this match with your thoughts?

-Eric

P.S.  I'm working on applying the latest patches and running a
corruption test where I limit the write-buffer size of 8 bytes.  So far,
so good.
