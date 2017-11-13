Received: from fllnx209.ext.ti.com ([198.47.19.16])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eEL7P-0001u1-Ec
 for linux-mtd@lists.infradead.org; Mon, 13 Nov 2017 20:14:09 +0000
Subject: Re: [PATCH v3 5/7] mtd: onenand: omap2: Unify OMAP2 and OMAP3 DMA
 implementation
To: Ladislav Michl <ladis@linux-mips.org>, Tony Lindgren <tony@atomide.com>
CC: Roger Quadros <rogerq@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Kyungmin Park
 <kyungmin.park@samsung.com>
References: <20171109091155.6a6azfvjarwvlfh2@lenoch>
 <20171109091529.x3pqqvbiywj5aulo@lenoch>
 <4a58dfac-8cc9-101f-b079-da8925d7ab4c@ti.com>
 <20171110095154.kf34cd7h2eyfvwf3@lenoch> <20171110152610.GN28152@atomide.com>
 <20171110181951.siddrdubjkwwspqt@lenoch> <20171110182938.GS28152@atomide.com>
 <20171111125054.4gkttjltqrgjqtwt@lenoch>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <e9f73904-78c6-1a52-662f-4a6ff3171ef5@ti.com>
Date: Mon, 13 Nov 2017 22:10:49 +0200
MIME-Version: 1.0
In-Reply-To: <20171111125054.4gkttjltqrgjqtwt@lenoch>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=EF=BB=BF
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki

On 11/11/2017 02:50 PM, Ladislav Michl wrote:
> On Fri, Nov 10, 2017 at 10:29:38AM -0800, Tony Lindgren wrote:
>> I just made sure things keep working with Peter's changes, no additional
>> patches. So the dma is barely used at all.
>=20
> It seemed suspicious to me looking here:
> https://github.com/omap-audio/linux-audio/commit/52e914395afe31a7401b3581=
4b6dabf3ef46a052#diff-1662a4cc544d322b68c547cfdc99448cR312
> as wait_for_completion_timeout is returning time remaining and zero on
> timeout :-)

aargh, yes, you are right...

> Fixed in next version and also changed to wait_for_completion_io_timeout
> to get proper sched stats.
> Btw, I think we should stop DMA on timeout as we are unmapping DMA region
> later and it might not behave nicely if we do so while DMA is eventually
> running (that's fixed too).
>=20
> I made Peter's patches part of next version and enabled DMA unconditional=
ly.
> It works nicely on:

Pretty cool! Thanks for doing it!

> OF: fdt: Machine model: IGEPv2 Rev. C (TI OMAP AM/DM37x)
> OMAP3630/DM3730 ES1.2 (l2cache iva sgx neon isp 192mhz_clk)
> ...
> omap-gpmc 6e000000.gpmc: GPMC revision 5.0
> gpmc_mem_init: disabling cs 0 mapped at 0x0-0x1000000
> omap2-onenand 30000000.onenand: initializing on CS0 (0x30000000), va e008=
0000, DMA mode
> Muxed OneNAND(DDP) 512MB 1.8V 16-bit (0x58)
> OneNAND version =3D 0x0031
> Scanning device for bad blocks
> OneNAND eraseblock 597 is an initial bad block
> OneNAND eraseblock 1159 is an initial bad block
> OneNAND eraseblock 2812 is an initial bad block
> omap2-onenand 30000000.onenand: optimized timings for 83 MHz
> 2 ofpart partitions found on MTD device 30000000.onenand
> Creating 2 MTD partitions on "30000000.onenand":
> 0x000000000000-0x000000080000 : "SPL"
> 0x000000080000-0x000020000000 : "UBI"
> ...
>=20
> Based on this experiment, I'll delay v4 a bit and leave DMA enabled by
> default. We are brave enough and want some testing, right?
> It would be nice if someone could provide some benchmarks using PIO
> and DMA mode. I do not expect any dramatic change, but kernel latencies
> should decrease when doing flash I/O.
>=20
> Based on above I also think R/B pin should be in ordinary GPIO mode.
> Perhaps using external DMA request is somehow posible, but it is not clea=
r
> to me how after yet another reading of SDMA, GPMC and OneNAND documentati=
on,
> so I'll happily leave it for others.
>=20
> Btw, using R/B pin would elimitate latencies caused by busy looping while
> waiting for onenand command to complete. Nice todo for someone with a lot
> of spare time :-)
>=20
> Best regards,
> 	ladis
>=20


--=20
P=C3=A9ter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
