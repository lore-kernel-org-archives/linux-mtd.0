Received: from smtp2-g21.free.fr ([212.27.42.2])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bx7b7-0007Lg-S2
 for linux-mtd@lists.infradead.org; Thu, 20 Oct 2016 07:17:07 +0000
Date: Thu, 20 Oct 2016 09:16:30 +0200
From: Albert ARIBAUD <albert.aribaud@3adev.fr>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: <linux-mtd@lists.infradead.org>, <yunhui.cui@nxp.com>,
 <devicetree@vger.kernel.org>, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 1/2] fsl-quadspi: fix QUAD read, add NORMAL, DUAL and
 FAST reads
Message-ID: <20161020091630.3477efab.albert.aribaud@3adev.fr>
In-Reply-To: <69a5b0d7-6b89-7edc-738d-c9e25802ba31@atmel.com>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
 <69a5b0d7-6b89-7edc-738d-c9e25802ba31@atmel.com>
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

Hi Cyrille,

Le Wed, 19 Oct 2016 18:42:36 +0200, Cyrille Pitchen
<cyrille.pitchen@atmel.com> a =C3=A9crit :

> Hi Albert,
>=20
> +Yunhui


> It seems that both Yunhui and you work on the same topic, maybe you can
> synchronize?
> https://patchwork.ozlabs.org/patch/660356/

I am already preparing a v2 based over Yunhui's series. :)

> I don't think it is a good thing to select the relevant "READ" LUT entry
> according to the command op code. What if spi-nor.c introduces new op cod=
es?
>=20
> Maybe you could index the LUT entries by functions:
> - READ_REG: the LUT op code would be dynamically updated by your
>             .read_reg(nor, opcode, ...) implementation according to opcod=
e.
> - WRITE_REG: the same as above with the .write_reg(nor, opcode, ...) hook.
> - READ_SLAVE1: read memory from the first SPI-NOR memory.
> - WRITE_SLAVE1: write into the first SPI-NOR memory.
> - READ_SLAVE2: read memory form the 2nd SPI-NOR memory.
> ...
> - WRITE_SLAVEN: write into the N-th SPI-NOR memory.

Actually, my needs could be met using Han Xu's dynamic LUT entries
without the need to introduce 'virtual' opcodes (and without having
to 'leak back' those new opcodes into other kernel code portions).

The per-slave differences (in my case, bus width essentially) can be
managed though DT entries and corresponding per-nor flags in the driver.

> Also be aware even for the .read() hook the nor->read_opcode might changes
> between calls!

Noted -- I'll check that the driver always use the current NOR codes.

> I don't know whether those comments fit your actual needs and the Freesca=
le SPI
> controller hardware constraints but I'm always worried about the ease to =
maintain
> SPI-NOR controller drivers when they are not "op code agnostic".

Understood and agreed.

Thanks for yuor feedback!
=20
> Best regards,
>=20
> Cyrille

Cordialement,
Albert ARIBAUD
3ADEV
