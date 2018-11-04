Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJKlW-0001PZ-6E
 for linux-mtd@lists.infradead.org; Sun, 04 Nov 2018 15:56:44 +0000
Date: Sun, 4 Nov 2018 16:56:27 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Richard Weinberger
 <richard@nod.at>, Andy Gross <andy.gross@linaro.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: remove driver specific
 block_markbad function
Message-ID: <20181104165627.293773a8@bbrezillon>
In-Reply-To: <20180720150348.592c8984@bbrezillon>
References: <1530863519-5564-1-git-send-email-absahu@codeaurora.org>
 <1530863519-5564-3-git-send-email-absahu@codeaurora.org>
 <20180718232350.3eaade9a@xps13>
 <20180718234358.6bb5e8a0@bbrezillon>
 <7ab0be154272b71f9beb2a7fb830c7be@codeaurora.org>
 <20180720150348.592c8984@bbrezillon>
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

Hi Abhishek,

On Fri, 20 Jul 2018 15:03:48 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Fri, 20 Jul 2018 17:46:38 +0530
> Abhishek Sahu <absahu@codeaurora.org> wrote:
>=20
> > Hi Boris,
> >=20
> > On 2018-07-19 03:13, Boris Brezillon wrote: =20
> > > On Wed, 18 Jul 2018 23:23:50 +0200
> > > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > >    =20
> > >> Boris,
> > >>=20
> > >> Can you please check the change in qcom_nandc_write_oob() is
> > >> valid? I think it is but as this is a bit of a hack I prefer double=
=20
> > >> checking.   =20
> > >=20
> > > Indeed, it's hack-ish.
> > >    =20
> > >>=20
> > >> Thanks,
> > >> Miqu=C3=A8l
> > >>=20
> > >>=20
> > >> Abhishek Sahu <absahu@codeaurora.org> wrote on Fri,  6 Jul 2018
> > >> 13:21:56 +0530:
> > >>    =20
> > >> > The NAND base layer calls write_oob() by setting bytes at
> > >> > chip->badblockpos with value non 0xFF for updating bad block statu=
s.
> > >> > The QCOM NAND controller skips the bad block bytes while doing nor=
mal
> > >> > write with ECC enabled. When initial support for this driver was
> > >> > added, the driver specific function was added temporarily for
> > >> > block_markbad() with assumption to change for raw read in NAND base
> > >> > layer. Moving to raw read for block_markbad() seems to take more t=
ime
> > >> > so this patch removes driver specific block_markbad() function by
> > >> > using following HACK in write_oob() function.
> > >> >
> > >> > Check for BBM bytes in OOB and accordingly do raw write for updati=
ng
> > >> > BBM bytes in NAND flash or normal write for updating available OOB
> > >> > bytes.   =20
> > >=20
> > > Why don't we change that instead of patching the qcom driver to guess
> > > when the core tries to mark a block bad? If you're afraid of breaking
> > > existing drivers that might rely on the "write/read BBM in non-raw
> > > mode" solution (I'm sure some drivers are), you can always add a new
> > > flag in chip->options (NAND_ACCESS_BBM_IN_RAW_MODE) and only use raw
> > > accessors when this flag is set.
> > >    =20
> >=20
> >   We started with that Only
> >=20
> >   http://patchwork.ozlabs.org/patch/508565/
> >=20
> >   and since we didn't conclude, we went for driver
> >   specific bad block check and mark bad block functions.
> >=20
> >   Now, we wanted to get rid of driver specific functions
> >=20
> >   1. For bad block check, we found the way to get the BBM bytes
> >      with ECC read. Controller updates BBM in separate register
> >      which we can read and update the same in OOB. Patch #1 of
> >      series does the same.
> >=20
> >   2. For bad block mark, there is no way to update in ECC mode
> >      that's why we went for HACK to get rid of driver specific
> >      function.
> >=20
> >   If adding flag is fine now then this HACK won't be required. =20
>=20
> Yep. I'm fine with that. Can you rebase the patch you pointed out on top
> of nand/next and move the flag to chip->options instead of
> chip->bbt_options + prefix it with NAND_ instead of NAND_BBT_?

I'm currently trying to get rid of chip->block_bad() (now placed in
chip->legacy.block_bad()), and I wanted to know if you were still
planning to submit the changes we discussed in this thread. If you
don't have time, please let me know and I'll try to do it.

Thanks,

Boris
