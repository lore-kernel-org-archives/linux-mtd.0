Received: from mail1.bemta8.messagelabs.com ([216.82.243.195])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfHcE-0006Lh-JO
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2015 00:43:43 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: Youxin Su <suyouxin@gmail.com>
Date: Tue, 7 Apr 2015 10:42:49 +1000
Subject: RE: GPMI driver ecc_write_page with oob data problem
Message-ID: <EACD232272DA4849B060F0828564D13B6EB7D55F64@ntcex01.corp.netcomm.com.au>
References: <CAJMQpAesoRsuV8i0HnGNy63vmhHeULcXTh9aXnpBGM-HJ6cneA@mail.gmail.com>
 <EACD232272DA4849B060F0828564D13B6EB7D55F5F@ntcex01.corp.netcomm.com.au>,
 <CAJMQpAceAw8cS+mzMQbE-pk3dAQY7pQ5+z-C1o9i6x59QmG-GA@mail.gmail.com>
In-Reply-To: <CAJMQpAceAw8cS+mzMQbE-pk3dAQY7pQ5+z-C1o9i6x59QmG-GA@mail.gmail.com>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2 Apr 2015 20:40:32 +1100
Youxin Su <suyouxin@gmail.com> wrote:

> Hi Iwo,
>=20
> Thank you for your explanation.
>=20
> On 2 April 2015 at 17:38, Iwo Mergler
> <Iwo.Mergler@netcommwireless.com> wrote:
> > Hi Youxin,
> >
> >
> > I have only encountered the GPMI controller on the IMX28
> > processor, but I assume that it hasn't changed.
> >
> > The GPMI controller is weird - it calculates ECC on small
> > subpages (512byte) at a time and *must* store / read
> > the ECC bytes immediately after the respective data block.
> >
> > Since the controller does this on the fly, during DMA, you
> > can't influence the layout - all you transfer is the page
> > payload. The result is a strange physical layout in the NAND:
> >
> > XX SPARE D512 ECC D512 ECC D512 ECC, etc.
>=20
> I've read the data sheet and have a brief idea of this BCH layout
> stuff. My question is why don't use SPARE area above as OOB area since
> in IMX6 BCH controller can support SPARE size up to 255 bytes. DMA can
> transfer this area if you make it bigger? What we need to do is just
> prepare OOB data to this SPARE area.

> I am not really understand why pretends the OOB is read-only. In my
> mind it's not read-only. The GPMI driver provided a gpmi_ecc_write_oob
> method which MTD driver can use it to write OOB area separately. It
> may use by file system when it only needs to read/write only OOB data
> I believe.


That layout requires that you're writing page data and OOB
simultaneously, since the XX contains the two data bytes which
would otherwise fall into the bad block marker region.

Filesystems like YAFFS and JFFS2 not only require OOB
space, but also need to write this OOB space independently
of the page data area.

There is a way, but it's probably not worth the hassle.
You'll have to rewrite MTD drivers for everything. It
will allow to write OOB data first, before page data,
but not the other way 'round.

Bear in mind that I have only thought about this, but
decided not to implement it in the end. I might have missed
something and I'm a little unclear about some details.

First, you need a NAND that allows sub-page writes, but
you'll sacrifice sub-page write support for MTD.

Next, you drop the bad block marker scheme on anything but
the FCB structures and use a bad block table for the rest
of the NAND. The FCBs can be marked bad anyway, so it's not
a problem. All bootloaders and kernels will require BBT
support implemented/enabled.

Your factory procedure needs to scan the NAND for bad block
markers and build the BBT before the first boot.

Your new page structure is this:

SPARE ECC D512 ECC D512 ECC, etc.

The ECC over the spare area can be ECC0, if you don't
want ECC protection for that.

At this point, you can implement the OOB write as a
subpage write, covering SPARE+ECC. For this, you need
to arrange for a short DMA transfer of SPARE bytes, and
ensure that the NAND page buffer is otherwise filled
with 0xFF bytes.

To write the page data, you do the opposite of the OOB
operation above. Write the SPARE+ECC region as 0xFF and
the page data and ECC to the rest of the page and (real)
OOB.

One or both of these may require byte-bashing via GPIO
or creative on-the-fly reprogramming of the ECC controller.
Bear in mind that the BCH ECC bytes of a 0xFF data block
are *not* 0xFF.

The BCH controller allows a memory-to-memory operation
which could potentially help working around the limitations.
Performance won't be impressive though.

Due to the in-order write requirement, you must not
write data before OOB in this scenario. I know that
this is the way JFFS2 uses it - don't know about YAFFS.

There are probably other ways to achieve OOB access,
at various levels of performance and NAND endurance
trade-offs. Almost always it will be specific for a file
system and/or use case.


Best regards,

Iwo
