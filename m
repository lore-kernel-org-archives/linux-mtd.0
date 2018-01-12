Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZvDm-000360-U8
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 09:01:58 +0000
Date: Fri, 12 Jan 2018 10:01:32 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
Message-ID: <20180112100132.2b8cd003@xps13>
In-Reply-To: <20180112094501.27706bfc@bbrezillon>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180111122751.4bd74366@bbrezillon>
 <87efmwb8bj.fsf@belgarion.home> <20180111232417.4aa86075@xps13>
 <87a7xjbis2.fsf@belgarion.home>
 <20180112094501.27706bfc@bbrezillon>
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

Hi Robert,

On Fri, 12 Jan 2018 09:45:01 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Fri, 12 Jan 2018 09:09:17 +0100
> Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>=20
> > Miquel RAYNAL <miquel.raynal@free-electrons.com> writes:
> >=20
> > I begun all your test procedure (on my zylonite board).
> > The timing registers are the same in both pxa3xx_nand and
> > marvell_nand, ie : [    3.085539] Timing registers from Bootloader:
> > [    3.089971] -  NDTR0: 0x00161c1c
> > [    3.095979] -  NDTR1: 0x0f3c00a2
> >=20
> > I can attach the dmesg of the first run (dump of OOB). Yet I think
> > you're missing the point as to where the bug lies. =20
>=20
> We definitely don't know where the bug lies, otherwise we wouldn't do
> the remote debug session we're doing here.
>=20
> >=20
> > In the zylonite setup, the BBT is _not_ in the OOB of each block.
> > Instead, it lies at the end of the NAND, in the last blocks (see
> > struct nand_bbt_descr). Reading each block and declaring it as bad
> > as is done in marvell_nand (at least that is my understanding of
> > your traces), but it is not what should be done if a match is found
> > for the bbt_pattern. Instead, the BBT should be loaded from the
> > last 8 blocks of the NAND, ie. page 130944 and page 131008 in my
> > setup. =20
>=20
> The driver is not searching for a BBT because it's explicitly disabled
> in your pdata (if it was enabled we would see something like "Bad
> block table not found ..." or "Bad block table found ..." in the
> logs). And that's anyway not the bug we're trying to fix here. In
> your setup (2k pages with Hamming ECC), the bad block markers, i.e.
> the markers present in each block and used to mark a block good or
> bad (0xffff =3D> good, !=3D 0xffff =3D> bad), should be preserved. So, the
> symptoms we're seeing here, where almost all blocks are reported as
> bad when scanning BBMs, is not expected, and that's what we're trying
> to debug/fix.

Also, the first blocks are (presumably) taken by the Bootloader, having
data there in the OOB is not impossible. Could you please show the same
dumps within the partition where you UBI/EXT setup relies?

>=20
> >=20
> > Therefore, I would rather think that marvell-nand is not using the
> > BBT at the end of the nand rather than misconfiguring the timing
> > registers. =20
>=20
> Timing mis-configuration was just a lead we had to follow. It seems
> that it's not the problem here, but we had to test it. Now, the
> missing BBT scan is clearly caused by an explicit config telling the
> driver to ignore the BBT. You can try to enable it if you want to
> test BBT handling (pdata->flash_bbt =3D 1), but even if that works,
> we'd like to understand why the regular BBM scanning does not work.
>=20
> Honestly, it's hard to be sure what you're testing, because we don't
> know whether you're testing the branch Miquel provided or manually
> apply some changes locally. Can you push your local changes somewhere
> (if any)?

Yes, please, can you push a branch with your patches?


As far as I remember, you removed the flash_bbt from the pdata to avoid
smashing the BBT again. Can you test this works with the old driver ?

If the old driver fails without flash_bbt, then you should go back to
the original setup and test again the last modifications.

Thanks,
Miqu=C3=A8l
