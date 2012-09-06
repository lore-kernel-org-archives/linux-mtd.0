Received: from mail86.messagelabs.com ([216.82.242.179])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T9Su9-0005nQ-Dp
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2012 03:37:22 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 6 Sep 2012 13:37:13 +1000
Subject: RE: [PATCH] Test for multi-bit error correction
Message-ID: <6871BC8982B258468985EE735D2C57524E269AFB89@ntcex01.corp.netcomm.com.au>
References: <6871BC8982B258468985EE735D2C57524E269AFB52@ntcex01.corp.netcomm.com.au>
 <1346310033.2848.536.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB54@ntcex01.corp.netcomm.com.au>
 <1346315075.2848.538.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C57524E269AFB60@ntcex01.corp.netcomm.com.au>,
 <CAN8TOE_ax=8inGyZxS+nTfcSkskyNvHEh9ipnOTVu-moB4FqjA@mail.gmail.com>
In-Reply-To: <CAN8TOE_ax=8inGyZxS+nTfcSkskyNvHEh9ipnOTVu-moB4FqjA@mail.gmail.com>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Brian,

thanks for commenting.

Please be aware that this test aims at MTD driver developers,
so I expect the 'users' to know all about their flash geometries
and not be surprised by whole block erases and such. :-)

More answers below.


Best regards,

Iwo

On Thu, 6 Sep 2012 04:19:57 +1000
Brian Norris <computersforpeace@gmail.com> wrote:
> On Thu, Aug 30, 2012 at 3:59 PM, Iwo Mergler
> <Iwo.Mergler@netcommwireless.com> wrote:
> > This tests ECC biterror recovery on a single NAND page. Mostly intende=
d
> > to test ECC hardware and low-level NAND driver.
> >
> > There are two test modes:
>=20
> Why does this test even need to be in the kernel? Can't it be done
> easily in userspace? I think it could even be a simple script that
> utilizes flash_erase + nandwrite / nanddump with the -n (no ECC)
> option. And anything that's lacking in nandwrite for this
> functionality could easily be added there (for instance, support
> erasure in nandwrite, rather than having to use flash_erase).

You are right. The same=20can be said about most of the other
tests too.

Personally, I appreciate these tests being where they are
because they are most useful to driver developers and as
such are more accessible in the kernel than in userspace.

On new embedded systems, we often have to develop MTD drivers
before we have a rootfs, since the rootfs is supposed to live in the MTD.
MTD is often the first hardware driver to get ported / written for a new
system.

With the current test arrangement I can, with minimal edits,
run any test from within the MTD driver under development.

> I would also note that this test doesn't explicitly test for bad
> blocks, although it should fail when running the erase command.

Fair enough. Usually, by the time I need this test, I know the
locations of all bad block by heart. :-)

> > +static unsigned page_offset;
> > +module_param(page_offset, uint, S_IRUGO);
> > +MODULE_PARM_DESC(page_offset, "Page number relative to dev start");
>=20
> Why use a page number? For erase, we'll be affecting many adjacent
> pages, so this might be an unclear parameter to the user. Is there a
> good reason not to use an entire eraseblock as the unit of test? Also,
> is there a reason to use page number vs. eraseblock number vs. offset
> as the input parameter?

Mostly because loff_t isn't supported as a parameter type, so I can't
specify offsets beyond 4G.

Erase block number would work as well. There isn't much to be learned
from applying the test to all pages of a block, but in rare circumstances
I'd like to be able to control which page of the block to test anyway.

It would of course be possible to specify the offset  as separate
erase block numbers and page numbers. I don't have a strong
preference either way.

>=20
> > +static loff_t   offset;     /* Offset of the page we're using. */
> > +static unsigned eraseblock; /* Eraseblock number for our page. */
> > +
> > +/* We assume that the ECC can correct up to a certain number
> > + * of biterrors per subpage. */
> > +static unsigned subsize;  /* Size of subpages */
> > +static unsigned subcount; /* Number of subpages per page */
> > +
> > +static struct mtd_info *mtd;   /* MTD device */
> > +
> > +static uint8_t *wbuffer; /* One page write / compare buffer */
> > +static uint8_t *rbuffer; /* One page read buffer */
>=20
> Why are all of these globals? It seems like the read_page(),
> write_page(), and rewrite_page() functions would be more sensible (and
> safely extendible) if they had an extra parameter for the address. And
> do you really need to represent the same value (offset) in three
> different ways (offset, page offset, eraseblock)? In fact,
>=20

I had to force myself ;-). My excuse is that I copied the style of
the other tests, because of a probably misguided sense of consistency.

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
