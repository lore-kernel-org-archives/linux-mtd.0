Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0trS-0003RE-U2
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2018 19:02:24 +0000
From: Richard Weinberger <richard@nod.at>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: jedec_probe: Fix crash in jedec_read_mfr()
Date: Tue, 27 Mar 2018 21:02:08 +0200
Message-ID: <21454318.LBOlOGBNfX@blindfold>
In-Reply-To: <20180303222903.27767-1-linus.walleij@linaro.org>
References: <20180303222903.27767-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Samstag, 3. M=E4rz 2018, 23:29:03 CEST schrieb Linus Walleij:
> It turns out that the loop where we read manufacturer
> jedec_read_mfd() can under some circumstances get a
> CFI_MFR_CONTINUATION repeatedly, making the loop go
> over all banks and eventually hit the end of the
> map and crash because of an access violation:
>=20
> Unable to handle kernel paging request at virtual address c4980000
> pgd =3D (ptrval)
> [c4980000] *pgd=3D03808811, *pte=3D00000000, *ppte=3D00000000
> Internal error: Oops: 7 [#1] PREEMPT ARM
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.16.0-rc1+ #150
> Hardware name: Gemini (Device Tree)
> PC is at jedec_probe_chip+0x6ec/0xcd0
> LR is at 0x4
> pc : [<c03a2bf4>]    lr : [<00000004>]    psr: 60000013
> sp : c382dd18  ip : 0000ffff  fp : 00000000
> r10: c0626388  r9 : 00020000  r8 : c0626340
> r7 : 00000000  r6 : 00000001  r5 : c3a71afc  r4 : c382dd70
> r3 : 00000001  r2 : c4900000  r1 : 00000002  r0 : 00080000
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> Control: 0000397f  Table: 00004000  DAC: 00000053
> Process swapper (pid: 1, stack limit =3D 0x(ptrval))
>=20
> Fix this by breaking the loop with a return 0 if
> the offset exceeds the map size.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/chips/jedec_probe.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mtd/chips/jedec_probe.c
> b/drivers/mtd/chips/jedec_probe.c index 7c0b27d132b1..b479bd81120b 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -1889,6 +1889,8 @@ static inline u32 jedec_read_mfr(struct map_info *m=
ap,
> uint32_t base, do {
>  		uint32_t ofs =3D cfi_build_cmd_addr(0 + (bank << 8), map, cfi);
>  		mask =3D (1 << (cfi->device_type * 8)) - 1;
> +		if (ofs >=3D map->size)
> +			return 0;
>  		result =3D map_read(map, base + ofs);
>  		bank++;
>  	} while ((result.x[0] & mask) =3D=3D CFI_MFR_CONTINUATION);

The fix is legit but I'm not sure whether we should emit a warning in this=
=20
case too since something is obviously wrong.
Boris?

Thanks,
//richard
