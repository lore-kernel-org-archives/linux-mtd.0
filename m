Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9N1r-0002k5-Bh
 for linux-mtd@lists.infradead.org; Tue, 31 Oct 2017 03:15:53 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>, Kalyan Kinthada
 <Kalyan.Kinthada@alliedtelesis.co.nz>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "ezequiel.garcia@free-electrons.com"
 <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/1] mtd: nand: pxa3xx: Set FORCE_CSX bit to ARMADA370
 variants.
Date: Tue, 31 Oct 2017 03:15:01 +0000
Message-ID: <c07cfd25d70842cea279b71eac285a8a@svr-chch-ex1.atlnz.lc>
References: <20170928005756.3938-1-kalyan.kinthada@alliedtelesis.co.nz>
 <20170928005756.3938-2-kalyan.kinthada@alliedtelesis.co.nz>
 <20171005094138.11b73a0e@xps13>
 <c6832720-7c58-4afe-2d1b-76bb9397299e@alliedtelesis.co.nz>
 <20171009081848.49681975@xps13>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,=0A=
=0A=
On 09/10/17 19:19, Miquel RAYNAL wrote:=0A=
> Hello Kalyan,=0A=
> =0A=
> On Mon, 9 Oct 2017 02:31:30 +0000=0A=
> Kalyan Kinthada <Kalyan.Kinthada@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> On 05/10/17 20:41, Miquel RAYNAL wrote:=0A=
>>> Hello Kalyan,=0A=
>>>=0A=
>>> On Thu, 28 Sep 2017 13:57:56 +1300=0A=
>>> Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz> wrote:=0A=
>>>   =0A=
>>>> When the arbitration between NOR and NAND flash is enabled=0A=
>>>> the <FORCE_CSX> field bit[21] in the Data Flash Control Register=0A=
>>>> needs to be set to 1 according to guidleine GL-5830741 mentioned=0A=
>>> Typo: guideline ^=0A=
>> I will correct this typo in the next patch version.=0A=
>>>> in Marvell Errata document MV-S501377-00, Rev. D.=0A=
>>> Thanks for that, I checked it.=0A=
>>>   =0A=
>>>> This commit sets the FORCE_CSX bit to 1 for all=0A=
>>>> ARMADA370 variants as the arbitration is always enabled by default.=0A=
>>>> This change does not apply for pxa3xx variants because the=0A=
>>>> FORCE_CSX bit does not exist/reserved on the NFCv1.=0A=
>>> Sorry to bother you again but I am reworking the pxa3xx_nand driver=0A=
>>> and so I would like to deeply understand why this is needed because=0A=
>>> I will have to integrate it in my work too.=0A=
>>>=0A=
>>> So please tell me what is your setup, do you really use NAND/NOR=0A=
>>> arbitration? Do you have not-Don't Care CS NAND chips? I have some=0A=
>>> doubts because even if the spec precises in the NAND controller=0A=
>>> chapter that arbitration is always enabled by default, the bit 27=0A=
>>> (NfArbiterEn) in the SoC Device Multiplex Register at offset=0A=
>>> 0x00018208 is actually at 0 by default (disabled). Did you enable=0A=
>>> this bit manually ? I checked with devmem on my setup and this bit=0A=
>>> was unset.=0A=
>> Yes, my setup use NAND/NOR arbitration and use a Don't=0A=
>> care CS Nand Chip. The bit 27 at offset 0x00018208 is set to 1=0A=
>> by default in my case. I did not manually set the bit 27 to 1.=0A=
> =0A=
> Actually if you use Don't Care CS NAND chips you should not need the=0A=
> force CS bit, as it is mentioned in the guidelines you pointed, this=0A=
> bit is only useful for *not* don't care CS NAND chips (and the name=0A=
> "force CS" is pretty straight forward too!).=0A=
=0A=
It's less straight forward than you think. It's FORCE_CSX (the X is =0A=
important) which is defined as "force chip select false on busy". What =0A=
it means is that the NF_CSn is de-asserted if the interface is =0A=
arbitrated away from the NAND flash controller. I think that means you =0A=
won't end up with the chip-select for the dev-bus/NOR firing immediately =
=0A=
when that device is arbitrated.=0A=
=0A=
> Otherwise what bootloader and kernel do you use to have this=0A=
> bit set by default? You may also want to check if this bit is set by=0A=
> your bootloader by stopping it before it loads Linux and check manually=
=0A=
> the value of this bit with 'md' (on U-Boot).=0A=
> =0A=
> Thank you,=0A=
> Miqu=E8l=0A=
> =0A=
>>=0A=
>> Please let me now if you have any other question or do you want me=0A=
>> to send the updated patch version with the typo fixed.=0A=
>>=0A=
>> Thank You,=0A=
>> Kalyan=0A=
>>=0A=
>>>=0A=
>>> Thank you for your time,=0A=
>>> Miqu=E8l=0A=
>>>   =0A=
>>>> The NDCR_ND_MODE conflicts with the new NDCR_FORCE_CSX but is=0A=
>>>> unused so remove it along with NDCR_NAND_MODE.=0A=
>>>>=0A=
>>>> Signed-off-by: Kalyan Kinthada=0A=
>>>> <kalyan.kinthada@alliedtelesis.co.nz> ---=0A=
>>>=0A=
>>>   =0A=
>>>>    drivers/mtd/nand/pxa3xx_nand.c | 9 +++++++--=0A=
>>>>    1 file changed, 7 insertions(+), 2 deletions(-)=0A=
>>>>=0A=
>>>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c=0A=
>>>> b/drivers/mtd/nand/pxa3xx_nand.c index 85cff68643e0..a6a7a5af7bed=0A=
>>>> 100644 --- a/drivers/mtd/nand/pxa3xx_nand.c=0A=
>>>> +++ b/drivers/mtd/nand/pxa3xx_nand.c=0A=
>>>> @@ -67,8 +67,7 @@=0A=
>>>>    #define NDCR_DWIDTH_M		(0x1 << 26)=0A=
>>>>    #define NDCR_PAGE_SZ		(0x1 << 24)=0A=
>>>>    #define NDCR_NCSX		(0x1 << 23)=0A=
>>>> -#define NDCR_ND_MODE		(0x3 << 21)=0A=
>>>> -#define NDCR_NAND_MODE   	(0x0)=0A=
>>>> +#define NDCR_FORCE_CSX		(0x1 << 21)=0A=
>>>>    #define NDCR_CLR_PG_CNT		(0x1 << 20)=0A=
>>>>    #define NFCV1_NDCR_ARB_CNTL	(0x1 << 19)=0A=
>>>>    #define NFCV2_NDCR_STOP_ON_UNCOR	(0x1 << 19)=0A=
>>>> @@ -1464,6 +1463,9 @@ static int pxa3xx_nand_config_ident(struct=0A=
>>>> pxa3xx_nand_info *info) info->chunk_size =3D PAGE_CHUNK_SIZE;=0A=
>>>>    	info->reg_ndcr =3D 0x0; /* enable all interrupts */=0A=
>>>>    	info->reg_ndcr |=3D (pdata->enable_arbiter) ?=0A=
>>>> NDCR_ND_ARB_EN : 0;=0A=
>>>> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#:=0A=
>>>> GL-5830741 */=0A=
>>>> +	if (info->variant =3D=3D PXA3XX_NAND_VARIANT_ARMADA370)=0A=
>>>> +		info->reg_ndcr |=3D NDCR_FORCE_CSX;=0A=
>>>>    	info->reg_ndcr |=3D NDCR_RD_ID_CNT(READ_ID_BYTES);=0A=
>>>>    	info->reg_ndcr |=3D NDCR_SPARE_EN;=0A=
>>>>    =0A=
>>>> @@ -1498,6 +1500,9 @@ static void pxa3xx_nand_detect_config(struct=0A=
>>>> pxa3xx_nand_info *info) info->reg_ndcr =3D ndcr &=0A=
>>>>    		~(NDCR_INT_MASK | NDCR_ND_ARB_EN |=0A=
>>>> NFCV1_NDCR_ARB_CNTL); info->reg_ndcr |=3D (pdata->enable_arbiter) ?=0A=
>>>> NDCR_ND_ARB_EN : 0;=0A=
>>>> +	/* Set FORCE_CSX bit for all ARMADA370 Variants. Ref#:=0A=
>>>> GL-5830741 */=0A=
>>>> +	if (info->variant =3D=3D PXA3XX_NAND_VARIANT_ARMADA370)=0A=
>>>> +		info->reg_ndcr |=3D NDCR_FORCE_CSX;=0A=
>>>>    	info->ndtr0cs0 =3D nand_readl(info, NDTR0CS0);=0A=
>>>>    	info->ndtr1cs0 =3D nand_readl(info, NDTR1CS0);=0A=
>>>>    }=0A=
>>>=0A=
>>>   =0A=
> =0A=
> =0A=
> =0A=
=0A=
