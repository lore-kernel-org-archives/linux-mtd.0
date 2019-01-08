Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggp8e-0006Vs-M1
 for linux-mtd@lists.infradead.org; Tue, 08 Jan 2019 11:01:42 +0000
Date: Tue, 8 Jan 2019 12:01:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-mtd@lists.infradead.org, Abhishek Sahu <absahu@codeaurora.org>,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon
 <bbrezillon@kernel.org>
Subject: Re: [PATCH] mtd: rawnand: qcom: fix memory corruption that causes
 panic
Message-ID: <20190108120121.1ebee938@xps13>
In-Reply-To: <20181223003126.1704-1-chunkeey@gmail.com>
References: <20181223003126.1704-1-chunkeey@gmail.com>
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

Hi Christian,

Christian Lamparter <chunkeey@gmail.com> wrote on Sun, 23 Dec 2018
01:31:26 +0100:

> This patch fixes a memory corruption that occurred in the
> qcom-nandc driver since it was converted to nand_scan().
>=20
> On boot, an affected device will panic from a NPE at a weird place:
> | Unable to handle kernel NULL pointer dereference at virtual address 0
> | pgd =3D (ptrval)
> | [00000000] *pgd=3D00000000
> | Internal error: Oops: 80000005 [#1] SMP ARM
> | CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.9 #0
> | Hardware name: Generic DT based system
> | PC is at   (null)
> | LR is at nand_block_isbad+0x90/0xa4
> | pc : [<00000000>]    lr : [<c0592240>]    psr: 80000013
> | sp : cf839d40  ip : 00000000  fp : cfae9e20
> | r10: cf815810  r9 : 00000000  r8 : 00000000
> | r7 : 00000000  r6 : 00000000  r5 : 00000001  r4 : cf815810
> | r3 : 00000000  r2 : cfae9810  r1 : ffffffff  r0 : cf815810
> | Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> | Control: 10c5387d  Table: 8020406a  DAC: 00000051
> | Process swapper/0 (pid: 1, stack limit =3D 0x(ptrval))
> | [<c0592240>] (nand_block_isbad) from [<c0580a94>]
> | [<c0580a94>] (allocate_partition) from [<c05811e4>]
> | [<c05811e4>] (add_mtd_partitions) from [<c0581164>]
> | [<c0581164>] (parse_mtd_partitions) from [<c057def4>]
> | [<c057def4>] (mtd_device_parse_register) from [<c059d274>]
> | [<c059d274>] (qcom_nandc_probe) from [<c0567f00>]
>=20
> The problem is that the nand_scan()'s qcom_nand_attach_chip callback
> is updating the nandc->max_cwperpage from 1 to 4. This causes the
> sg_init_table of clear_bam_transaction() in the driver's
> qcom_nandc_block_bad() to memset much more than what was initially
> allocated by alloc_bam_transaction().
>=20
> This patch restores the old behavior by reallocating the shared bam
> transaction alloc_bam_transaction() after the chip was identified,
> but before mtd_device_parse_register() (which is an alias for
> mtd_device_register() - see panic) gets called. This fixes the
> corruption and the driver is working again.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 6a3cec64f18c ("mtd: rawnand: qcom: convert driver to nand_scan()")
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> ---

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
