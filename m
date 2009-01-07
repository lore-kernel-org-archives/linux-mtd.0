Received: from ns.konzeptpark.de ([195.226.66.162] helo=mail.konzeptpark.de)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKVxL-0004Fs-M4
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 10:48:12 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: AW: [PATCH][MTD-UTILS][compr_lzo.c] Fix calls to liblzo library
Date: Wed, 7 Jan 2009 11:48:07 +0100
Message-ID: <46597312D56D2A47A3A6E9C1D0D9B7AE01426F71@kpladc0001.konzeptpark.intra>
In-Reply-To: <20090107130255.GA2333@yoda.jdub.homelinux.org>
References: <1231186350.6612.11.camel@kplaws107lx>
	<20090107130255.GA2333@yoda.jdub.homelinux.org>
From: "Carsten Schlote" <c.schlote@konzeptpark.de>
To: "Josh Boyer" <jwboyer@gmail.com>
Cc: Linux MTD Dev <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Josh,

> > ...
> >+	lzo_compress_buf =3D malloc(2*page_size);
>=20
> Don't leave comments in the code about why things are dangerous and
> then
> leave the code itself commented out.  A comment about why you need to
> allocate a certain size is fine, but this is pretty ugly.  For a
minute
> I thought you were doing two mallocs and ignoring the first one
because
> I didn't see the multi-line /* comment.
>=20
> Did you poke around with gdb at all to determine why it segfaults?

Not yet due to lack of time problem (HW series ramp-up right now). The
comment was left to trigger questions like yours :-) =20

I came across this problem, when I compiled my ptxdist projects on
Ubuntu64 at home. Suddently mkfs.jffs2 segfaulted - it always worked
fine on IA32.

So I spent some time to fix this problem, as they are:
- Wrong usage of LZO API calls for decompression. Caused -t to fail,
also
  on IA32. This is now fixed correctly by setting the destlen to the
  allowed maximum before calling the 'safe' decompression function.
- Crash on AMD64 with the currently supplied work buffer - just
increased the buffer
  until it worked again - that's a hack, but a working one.
  Possible suspects:=20
    - Compiler uses different value and structure alignments on 64bit
hosts
      increasing size of structures and arrays.

I agree that it is undesireable to 'guess' workbuffer sizes. I had no
time to check and figure out, if there is an appropriate LZO API call to
derive a safe size for a workbuffer for a given algorythm and
compression parameters.

Frankly spoken, the previous formula is no solution either. The comments
says: 'Taken from their FAQs'. Beside the note, just some hardcoded
numbers are used to get some size. There is no explanation, what these
values mean or from what and where these constants are taken.

The correct solution is to query the size from the LZO library itself -
should the estimate be wrong, just fix the library and all applications
will work again.

If somebody knows how to get the correct information from LZO library -
just fix and post a patch, or tell me where to find this information and
I will fix and post a patch.=20

Carsten
