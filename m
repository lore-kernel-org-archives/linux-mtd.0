Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgV4k-0003iJ-Ej
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2018 13:04:04 +0000
Date: Fri, 20 Jul 2018 15:03:48 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: remove driver specific
 block_markbad function
Message-ID: <20180720150348.592c8984@bbrezillon>
In-Reply-To: <7ab0be154272b71f9beb2a7fb830c7be@codeaurora.org>
References: <1530863519-5564-1-git-send-email-absahu@codeaurora.org>
 <1530863519-5564-3-git-send-email-absahu@codeaurora.org>
 <20180718232350.3eaade9a@xps13>
 <20180718234358.6bb5e8a0@bbrezillon>
 <7ab0be154272b71f9beb2a7fb830c7be@codeaurora.org>
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

On Fri, 20 Jul 2018 17:46:38 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> Hi Boris,
>=20
> On 2018-07-19 03:13, Boris Brezillon wrote:
> > On Wed, 18 Jul 2018 23:23:50 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >  =20
> >> Boris,
> >>=20
> >> Can you please check the change in qcom_nandc_write_oob() is
> >> valid? I think it is but as this is a bit of a hack I prefer double=20
> >> checking. =20
> >=20
> > Indeed, it's hack-ish.
> >  =20
> >>=20
> >> Thanks,
> >> Miqu=C3=A8l
> >>=20
> >>=20
> >> Abhishek Sahu <absahu@codeaurora.org> wrote on Fri,  6 Jul 2018
> >> 13:21:56 +0530:
> >>  =20
> >> > The NAND base layer calls write_oob() by setting bytes at
> >> > chip->badblockpos with value non 0xFF for updating bad block status.
> >> > The QCOM NAND controller skips the bad block bytes while doing normal
> >> > write with ECC enabled. When initial support for this driver was
> >> > added, the driver specific function was added temporarily for
> >> > block_markbad() with assumption to change for raw read in NAND base
> >> > layer. Moving to raw read for block_markbad() seems to take more time
> >> > so this patch removes driver specific block_markbad() function by
> >> > using following HACK in write_oob() function.
> >> >
> >> > Check for BBM bytes in OOB and accordingly do raw write for updating
> >> > BBM bytes in NAND flash or normal write for updating available OOB
> >> > bytes. =20
> >=20
> > Why don't we change that instead of patching the qcom driver to guess
> > when the core tries to mark a block bad? If you're afraid of breaking
> > existing drivers that might rely on the "write/read BBM in non-raw
> > mode" solution (I'm sure some drivers are), you can always add a new
> > flag in chip->options (NAND_ACCESS_BBM_IN_RAW_MODE) and only use raw
> > accessors when this flag is set.
> >  =20
>=20
>   We started with that Only
>=20
>   http://patchwork.ozlabs.org/patch/508565/
>=20
>   and since we didn't conclude, we went for driver
>   specific bad block check and mark bad block functions.
>=20
>   Now, we wanted to get rid of driver specific functions
>=20
>   1. For bad block check, we found the way to get the BBM bytes
>      with ECC read. Controller updates BBM in separate register
>      which we can read and update the same in OOB. Patch #1 of
>      series does the same.
>=20
>   2. For bad block mark, there is no way to update in ECC mode
>      that's why we went for HACK to get rid of driver specific
>      function.
>=20
>   If adding flag is fine now then this HACK won't be required.

Yep. I'm fine with that. Can you rebase the patch you pointed out on top
of nand/next and move the flag to chip->options instead of
chip->bbt_options + prefix it with NAND_ instead of NAND_BBT_?


>   Moving to RAW mode for every one still looks risky.

I agree.
