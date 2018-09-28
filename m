Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5nt6-0004PO-Us
 for linux-mtd@lists.infradead.org; Fri, 28 Sep 2018 08:12:39 +0000
Date: Fri, 28 Sep 2018 10:12:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Daniel Mack
 <daniel@zonque.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Message-ID: <20180928101213.58f0273f@xps13>
In-Reply-To: <20180928084046.221bdda0@bbrezillon>
References: <20180927071751.21513-1-daniel@zonque.org>
 <20180927101145.4c2d1159@xps13>
 <20180927105630.19fc1ff8@bbrezillon>
 <de6fbe4af7904d6db23e42bf3e4e2565@svr-chch-ex1.atlnz.lc>
 <20180928084046.221bdda0@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Fri, 28 Sep 2018
08:40:46 +0200:

> On Thu, 27 Sep 2018 21:55:57 +0000
> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
>=20
> > Hi All,
> >=20
> > On 27/09/18 20:56, Boris Brezillon wrote: =20
> > > On Thu, 27 Sep 2018 10:11:45 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >    =20
> > >> Hi Daniel,
> > >>
> > >> Daniel Mack <daniel@zonque.org> wrote on Thu, 27 Sep 2018 09:17:51
> > >> +0200:
> > >>   =20
> > >>> At least on PXA3xx platforms, enabling RDY interrupts in the NDCR r=
egister
> > >>> will only cause the IRQ to latch when the RDY lanes are changing, a=
nd not
> > >>> in case they are already asserted.
> > >>>
> > >>> This means that if the controller finished the command in flight be=
fore
> > >>> marvell_nfc_wait_op() is called, that function will wait for a chan=
ge in
> > >>> the bit that can't ever happen as it is already set.
> > >>>
> > >>> To address this race, check for the RDY bits after the IRQ was enab=
led,
> > >>> and complete the completion immediately if the condition is already=
 met.
> > >>>
> > >>> This fixes a bug that was observed with a NAND chip that holds a UB=
IFS
> > >>> parition on which file system stress tests were executed. When
> > >>> marvell_nfc_wait_op() reports an error, UBI/UBIFS will eventually m=
ount
> > >>> the filesystem read-only, reporting lots of warnings along the way.
> > >>>
> > >>> Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller=
 driver
> > >>> Cc: stable@vger.kernel.org
> > >>> Signed-off-by: Daniel Mack <daniel@zonque.org>
> > >>> ---   =20
> > >>
> > >> Sorry I haven't had the time to check on my Armada, but you figured =
it
> > >> out, and the fix looks good to me!
> > >>
> > >> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > >>
> > >> Boris, do you plan to send another fixes PR of can I take it into
> > >> the nand/next branch?   =20
> > >=20
> > > Queued to mtd/master.   =20
> >=20
> > After fixing my R/B configuration I get a new error with this patch whe=
n=20
> > running stress_1 from mtd-utils-2.0.0. I don't see this without the pat=
ch.
> >=20
> > My board is a custom design using an Armada-385 SoC with Macronix NAND.
> >=20
> > # stress_1
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ/WRDREQ while=20
> > draining raw data (NDSR: 0x00000000)
> > ubi0 error: ubi_io_write: error -5 while writing 4096 bytes to PEB=20
> > 1858:110592, written 0 bytes
> > CPU: 1 PID: 1170 Comm: stress_1 Not tainted 4.19.0-rc5-at1+ #8
> > Hardware name: Marvell Armada 380/385 (Device Tree)
> > [<8011143c>] (unwind_backtrace) from [<8010c17c>] (show_stack+0x10/0x14)
> > [<8010c17c>] (show_stack) from [<805ec28c>] (dump_stack+0x88/0x9c)
> > [<805ec28c>] (dump_stack) from [<80418a28>] (ubi_io_write+0x55c/0x6c0)
> > [<80418a28>] (ubi_io_write) from [<80415b4c>] (ubi_eba_write_leb+0x80/0=
x780)
> > [<80415b4c>] (ubi_eba_write_leb) from [<80414580>] (ubi_leb_write+0xbc/=
0xe0)
> > [<80414580>] (ubi_leb_write) from [<802d46b4>] (ubifs_leb_write+0xa0/0x=
118)
> > [<802d46b4>] (ubifs_leb_write) from [<802d5620>]=20
> > (ubifs_wbuf_write_nolock+0x184/0x6ac)
> > [<802d5620>] (ubifs_wbuf_write_nolock) from [<802c8a18>]=20
> > (ubifs_jnl_write_data+0x1c0/0x2bc)
> > [<802c8a18>] (ubifs_jnl_write_data) from [<802caed8>]=20
> > (do_writepage+0xa4/0x1b0)
> > [<802caed8>] (do_writepage) from [<801aa160>] (__writepage+0x14/0x48)
> > [<801aa160>] (__writepage) from [<801aa900>] (write_cache_pages+0x1d0/0=
x3e4)
> > [<801aa900>] (write_cache_pages) from [<801aab68>]=20
> > (generic_writepages+0x54/0x80)
> > [<801aab68>] (generic_writepages) from [<801ac9a0>]=20
> > (do_writepages+0x68/0x8c)
> > [<801ac9a0>] (do_writepages) from [<801a0ac8>]=20
> > (__filemap_fdatawrite_range+0x88/0xc0)
> > [<801a0ac8>] (__filemap_fdatawrite_range) from [<801a0cc4>]=20
> > (file_write_and_wait_range+0x3c/0x98)
> > [<801a0cc4>] (file_write_and_wait_range) from [<802cb600>]=20
> > (ubifs_fsync+0x3c/0xb0)
> > [<802cb600>] (ubifs_fsync) from [<801a2828>]=20
> > (generic_file_write_iter+0x198/0x24c)
> > [<801a2828>] (generic_file_write_iter) from [<802ccb84>]=20
> > (ubifs_write_iter+0xf0/0x158)
> > [<802ccb84>] (ubifs_write_iter) from [<801ef854>] (__vfs_write+0xfc/0x1=
60)
> > [<801ef854>] (__vfs_write) from [<801efa60>] (vfs_write+0xa4/0x1ac)
> > [<801efa60>] (vfs_write) from [<801efcac>] (ksys_write+0x54/0xb8)
> > [<801efcac>] (ksys_write) from [<80101000>] (ret_fast_syscall+0x0/0x54)
> > Exception stack(0xbd789fa8 to 0xbd789ff0)
> > 9fa0:                   0ca5d000 00000000 00000003 7e9f2900 00008000=20
> > ffffffff
> > 9fc0: 0ca5d000 00000000 00008000 00000004 00000003 00000000 76f24fb4=20
> > 00000000
> > 9fe0: 00000000 7e9f27fc 00010fd8 76e775ec
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining=
=20
> > FIFO (data) (NDSR: 0x00000810)
> > ttyS ttyS1: tty_port_close_start: tty->count =3D 1 port count =3D 2
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining=
=20
> > FIFO (data) (NDSR: 0x00000810)
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining=
=20
> > FIFO (data) (NDSR: 0x00000810)
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining=
=20
> > FIFO (data) (NDSR: 0x00000810)
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining=
=20
> > FIFO (data) (NDSR: 0x00000810)
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining=
=20
> > FIFO (data) (NDSR: 0x00000810)
> > marvell-nfc f10d0000.nand-controller: Timeout on RDDREQ while draining=
=20
> > FIFO (data) (NDSR: 0x00000810)
> >=20
> > ... (RDDREQ messages repeat). =20
>=20
> Hm, that's weird, unless RDDREQ is a 'clear-on-read' bit, that
> shouldn't happen.
>=20

The spec clearly states it's not. In the status register (NDSR), you
must write a bit to clear it.

The RDDREQ and RDY0/1 bit checks do not share the same path. Would it
be possible that in some situations all the bits are not actually
cleared, and so reading the NDSR register tells us the event happened
while it has not in reality?

IIRC this patch fixes pxa implementation (NFCv1) while the errors
happen on an Armada 385 (NFCv2). It would be great to understand (and
document) this behavior, otherwise it is still possible to do the
manual check only for NFCv1 if this is the only IP suffering about the
race.

Thanks,
Miqu=C3=A8l
