Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lu6rq-00088u-31
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 15:17:45 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Wed, 15 Apr 2009 09:17:32 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <1239775237.3390.144.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: <dedekind@infradead.org>,
	"Jamie Lokier" <jamie@shareable.org>
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

> On Tue, 2009-04-14 at 19:00 +0100, Jamie Lokier wrote:
> > Artem Bityutskiy wrote:
> > > > This is for the CFI flash interface.  The
> > > > drivers/mtd/chips/cfi_cmdset_0002.c driver has write=20
> buffers which is
> > > > uses to do a "block" write to the NOR flash which for=20
> my chip allows
> > > > writing up to 32 16-bit words.=20
> > >=20
> > > Oh, this is something from the CFI standard? Then we may=20
> just add this
> > > knowledge to UBIFS: if this is NOR, then UBIFS knows that=20
> the up to 64
> > > bytes may contain garbage.
> >=20
> > I think the block write size is only used when you _submit_=20
> a write of
> > that many words or more.
>=20
> Yes, this is my understanding too.
>=20
> > So it would be correct for UBIFS to know that writes of N > 64(*)
> > bytes may be broken into blocks, with corruption distributed
> > anywhere within each of those blocks, but not more than one block.
>=20
> I though the corruption will be inside the last block, because they
> are written sequentially.

Both are correct.  The corruption will be in the last block written to
the physical flash, but if the original UBIFS block write size is >
FLASH_MAX_BLOCK_WRITE_SIZE, then the MTD CFI driver will split it into
multiple smaller blocks.  The CFI code appears to write out the split
blocks sequentially from lowest address to highest address, but the
actual physical flash chip doesn't always write the flash words out
sequentially.

So, if we assume that the MTD CFI driver will always split blocks into
write-buffer sized blocks and write them sequentially (this is how the
code is currently written), then the maximum corruption due to an
interrupted write will be FLASH_MAX_BLOCK_WRITE_SIZE (which is 64 bytes
for my case).

> Right. I assumed the same, may be I just did not put it clearly. But
> thanks for this suggestion.
>=20
> > That means MTD and UBI should export two values:
> >=20
> >     - Maximum block write size which may be affected by=20
> power failure / reset.
> >       (Maybe that needs an alignment too.)
>=20
> Yup. MTD does not inform about this ATM, though.
>=20
> >     - Minimum write size for padding written items.
> >       (Is that assumed aligned?)
>=20
> Right.
>=20
> > For this particular NOR, the two values would be 64 bytes=20
> and 1 byte.
> > I don't think it's specific to CFI.
>=20
> Agree.

I'll take a look at what is involved in exporting the two values.

-Eric
