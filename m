Received: from an-out-0708.google.com ([209.85.132.242])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IYXxV-0003hf-4u
	for linux-mtd@lists.infradead.org; Thu, 20 Sep 2007 22:09:38 -0400
Received: by an-out-0708.google.com with SMTP id c3so103414ana
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Sep 2007 19:09:31 -0700 (PDT)
From: Matteo Croce <technoboy85@gmail.com>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>
Subject: Re: [PATCH][MIPS][2/7] AR7: mtd partition map
Date: Fri, 21 Sep 2007 04:09:22 +0200
References: <200709201728.10866.technoboy85@gmail.com>
	<20070920193547.GA911@lst.de>
	<20070920200058.GB1692@lazybastard.org>
In-Reply-To: <20070920200058.GB1692@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200709210409.23521.technoboy85@gmail.com>
Cc: linux-mips@linux-mips.org, Felix Fietkau <nbd@openwrt.org>,
	Eugene Konev <ejka@imfi.kspu.ru>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org,
	Christoph Hellwig <hch@lst.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Il Thursday 20 September 2007 22:00:59 J=C3=B6rn Engel ha scritto:
> On Thu, 20 September 2007 21:35:49 +0200, Christoph Hellwig wrote:
> > On Thu, Sep 20, 2007 at 09:29:11PM +0200, Matteo Croce wrote:
> > > +#ifdef CONFIG_CPU_LITTLE_ENDIAN
> > > +#define LOADER_MAGIC1	0xfeedfa42
> > > +#define LOADER_MAGIC2	0xfeed1281
> > > +#else
> > > +#define LOADER_MAGIC1	0x42faedfe
> > > +#define LOADER_MAGIC2	0x8112edfe
> > > +#endif
> >=20
> > Please keep only one defintion and use le/be32_to_cpu on it.
> >=20
> > > +struct ar7_bin_rec {
> > > +	unsigned int checksum;
> > > +	unsigned int length;
> > > +	unsigned int address;
> > > +};
> >=20
> > Wich means you'd need an endianess annotation here.  What about the
> > length and address fields, are they always native-endian unlike
> > the checksum field or will the need to be byte-swapped aswell?
>=20
> <slightly off-topic, feel free to skip>
> If this is indeed the squashfs magic, le/be32_to_cpu won't help.
> Squashfs can have either endianness, tries to detect the one actually
> used by checking either magic and sets a flag in the superblock.
> Afterwards every single access checks the flag and conditionally swaps
> fields around or not.
>=20
> If squashfs had a fixed endianness, quite a lot of this logic could get
> removed and both source and object size would shrink.  Some two years
> after requesting this for the first time, I'm thinking about just doing
> it myself.  If I find a sponsor who pays me for it, I might even do it
> soon.
> </offtopic>
>=20
>=20
> I don't really understand why the squashfs magic number should be used
> in this code at all.  It may have set a bad example, though.  In general
> you should decide on a fixed endianness (1) and use the beXX_to_cpu
> macros when accessing data unless you have a very good reason to do
> otherwise.
>=20
> 1) Big endian is my preferred choice because it is easy to read in a
> hexdump and the opposite of my notebook.  Being forced to do endian
> conversions during development/testing helps to find problems early.

I use little endian since 99% of AR7s are little endian. Dunno if
le/be32_to_cpu does some runtime calculations. Do they?
