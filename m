Received: from mail-db5eur01on0135.outbound.protection.outlook.com
 ([104.47.2.135] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHshE-0008Il-Ju
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2016 13:37:17 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>
Subject: RE: [PATCH 2/3] mtd: spi-nor: Implement die erase command logic
Date: Fri, 16 Dec 2016 13:36:49 +0000
Message-ID: <AM4PR0701MB2130F29C85760862E9D4F3F3FE9C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
 <1477314214-17718-3-git-send-email-marcin.krzeminski@nokia.com>
 <7e94d439-114a-8827-9667-1472d3e4323a@atmel.com>
 <AM4PR0701MB2130740455BE1618C36E5020FE8C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
 <852daf6e-a304-2dd3-0a54-0a24c7dc347b@atmel.com>
 <AM4PR0701MB213003E9E3A8C6DD71E3E2AEFE8C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
 <2e4aa41d-19a6-6524-0e23-b8d64a614005@atmel.com>
 <AM4PR0701MB21309F515B35267C2892F0FBFE9C0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
 <31d65517-25ac-198c-b87e-91208a5d4853@atmel.com>
In-Reply-To: <31d65517-25ac-198c-b87e-91208a5d4853@atmel.com>
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



> -----Original Message-----
> From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> Sent: Friday, December 16, 2016 11:52 AM
> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
> Cc: rfsw-patches@mlist.nokia.com; dwmw2@infradead.org;
> computersforpeace@gmail.com; marek.vasut@gmail.com
> Subject: Re: [PATCH 2/3] mtd: spi-nor: Implement die erase command logic
>=20
> Hi Marcin,
>=20
> Le 16/12/2016 =E0 07:38, Krzeminski, Marcin (Nokia - PL/Wroclaw) a =E9cri=
t :
> > Cyrille,
> >
> > Sorry for late answer.
> >
> >> -----Original Message-----
> >> From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> >> Sent: Friday, December 09, 2016 6:23 PM
> >> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> >> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
> >> Cc: rfsw-patches@mlist.nokia.com; dwmw2@infradead.org;
> >> computersforpeace@gmail.com; marek.vasut@gmail.com
> >> Subject: Re: [PATCH 2/3] mtd: spi-nor: Implement die erase command
> >> logic
> >>
> >> Le 30/11/2016 =E0 19:18, Krzeminski, Marcin (Nokia - PL/Wroclaw) a =E9=
crit :
> >>>
> >>>
> >>>> -----Original Message-----
> >>>> From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> >>>> Sent: Wednesday, November 30, 2016 6:20 PM
> >>>> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> >>>> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
> >>>> Cc: rfsw-patches@mlist.nokia.com; dwmw2@infradead.org;
> >>>> computersforpeace@gmail.com; marek.vasut@gmail.com
> >>>> Subject: Re: [PATCH 2/3] mtd: spi-nor: Implement die erase command
> >>>> logic
> >>>>
> >>>> Le 30/11/2016 =E0 17:44, Krzeminski, Marcin (Nokia - PL/Wroclaw) a =
=E9crit :
> >>>>>
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
> >>>>>> Sent: Tuesday, November 29, 2016 5:47 PM
> >>>>>> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> >>>>>> <marcin.krzeminski@nokia.com>; linux-mtd@lists.infradead.org
> >>>>>> Cc: rfsw-patches@mlist.nokia.com; dwmw2@infradead.org;
> >>>>>> computersforpeace@gmail.com; marek.vasut@gmail.com
> >>>>>> Subject: Re: [PATCH 2/3] mtd: spi-nor: Implement die erase
> >>>>>> command logic
> >>>>>>
> >>>>>> Hi Marcin,
> >>>>>>
> >>>>>> I know you have already answered some of my questions of IRC but
> >>>>>> I ask them again here on the mailing list so everybody can
> >>>>>> benefit from your answers.
> >>>>>>
> >>>>>> Le 24/10/2016 =E0 15:03, marcin.krzeminski@nokia.com a =E9crit :
> >>>>>>> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> >>>>>>>
> >>>>>>> This commit implements die erase logic.
> >>>>>>> Sector at a time procedure is moved to function, then erase
> >>>>>>> algorithm will try to use die erase cmd if size and address
> >>>>>>> cover one or more dies.
> >>>>>>>
> >>>>>>
> >>>>>> I'm reading your v2 series but indeed I try to understand the
> >>>>>> purpose of the series simply because I don't know what does die
> >>>>>> erase do as compared to chip erase of sector erase.
> >>>>>> Is you series a bug fix or an optmization, maybe both?
> >>>>>
> >>>>> In current spi-nor framework when user want to erase whole flash
> (eg.
> >>>>> mtd_debug erase /dev/mtdX 0 0x8000000) framework issue chip
> erase
> >>>> cmd.
> >>>>> N25Q00 does not support chip erase, instead there was introduced
> >>>>> die erase command that can erase whole die (N25Q00 is a mulit-die
> >>>>> NOR
> >> chip).
> >>>>> So for this case this patch is a bug fix.
> >>>>> Since I have die erase command implemented it was tempting to use
> >>>>> die erase also in case where erase area cover one or more dies to
> >>>>> speed up erase process, especially when user has enabled 4KiB
> >>>>> sector. That is a small
> >>>> optimization.
> >>>>>
> >>>>> I will rewrite commit message and add those informations.
> >>>>>
> >>>>> Thanks,
> >>>>> Marcin
> >>>>>
> >>>>
> >>>> OK, then I think your patch should be split into two different patch=
es.
> >>>>
> >>>> 1 - bug fix:
> >>>>
> >>>> The first patch introducing an explicit flag such as
> >>>> SPI_NOR_NO_CHIP_ERASE, which would be set in the relevant entries
> >>>> of the spi_nor_ids[] (see already existing flags such as
> >>>> SPI_NOR_NO_FR,
> >> SPI_NOR_NO_ERASE, ...).
> >>>>
> >>>> In spi_nor_scan():
> >>>>
> >>>>  	if (info->flags & USE_FSR)
> >>>>  		nor->flags |=3D SNOR_F_USE_FSR;
> >>>>  	if (info->flags & SPI_NOR_HAS_TB)
> >>>>  		nor->flags |=3D SNOR_F_HAS_SR_TB;
> >>>> +	if (info->flags & SPI_NOR_NO_CHIP_ERASE)
> >>>> +		nor->flags |=3D SNOR_F_NO_CHIP_ERASE;
> >>>>
> >>>> Then in spi_nor_erase():
> >>>>
> >>>>  	/* whole-chip erase? */
> >>>> -	if (len =3D=3D mtd->size) {
> >>>> +	if (len =3D=3D mtd->size && !(nor->flags & SNOR_F_NO_CHIP_ERASE)) =
{
> >>>>  		unsigned long timeout;
> >>>>
> >>>> So you fall into the sector erase case, no optimization yet.
> >>>>
> >>>> 2 - optimization of spi_nor_erase()
> >>>>
> >>>> In the "sector"-at-a-time erase branch, try to optimize when
> >>>> possible using die erase instead of sector erase.
> >>>>
> >>>> Each commit message describing the purpose of the patch.
> >>>
> >>>
> >>> OK, I will split patches in this way.
> >>>
> >>>>
> >>>> I would like to also handle the cases where the memory supports:
> >>>> - both chip and die erases: if so, no reason not to use chip erase o=
n
> such
> >>>>   multi-die memory.
> >>> I do not think that there are chips supporting both.
> >>> In this case two flags are needed one for disable chip erase and
> >>> another one for enabling die erase. Is that OK?
> >>
> >> I think it might be better to have 2 separated flags, at least for
> >> semantic
> >> reason: "the memory supports Die-Erase hence we don't try to use
> >> Chip- Erase" sounds a little bit odd to me.
> >
> > Let's do it with two flags then.
> >
> >>
> >> This is what I understand when I read:
> >>  	/* whole-chip erase? */
> >> -	if (len =3D=3D mtd->size) {
> >> +	if (len =3D=3D mtd->size && !die_erase) {
> >>
> >> Why do we try Chip-Erase only if Die-Erase is not supported?
> >
> > I assumed that there is no flash that support both.
> > Do you know one that has chip erase and die erase?
> >
>=20
> No, I don't but I didn't focus on erase operations so maybe some already
> exist or might exit in the future, who knows? :)
>=20
> Also, please have a look at Ricardo's patch:
> [v9] mtd: spi-nor: Add supported for S3AN spi-nor devices
> http://patchwork.ozlabs.org/patch/701935/
>=20
> This patch has recently been merged into git://github.com/spi-nor/linux.g=
it
> so you will have to rebase your work on that tree.

Thanks for information, so git://github.com/spi-nor/linux.git should be use=
d=20
As base to send spi-nor patches?
>=20
> Ricardo's patch already introduces a SNOR_F_NO_OP_CHIP_ERASE flag used
> from spi_nor_erase(). The only missing part is to set this flag in nor->f=
lag
> when another dedicated flag is set in info->flags.
> Currently this SNOR_F_NO_OP_CHIP_ERASE is only set from
> s3an_nor_scan() but it should be also set from spi_nor_scan() for the
> relevant memories.

Ok.
>=20
> >>
> >> Reading something like "we try Chip-Erase unless Chip-Erase is not
> >> supported" is more logic, isn't it?
> >>
> >> I want to avoid the implicit assumption "Die Erase supported =3D> Chip
> >> Erase not supported", even if it *might* be true, because it is
> >> strange when we read the code.
> >
> > Ok.
> >>
> >>>> - neither chip nor die erases.
> >>> This is supported DIE_ERASE flasg set and die_cnt =3D=3D 0
> >>
> >> DIE_ERASE flag set and die_cnt =3D=3D 0 meaning Chip-Erase is not supp=
orted?
> >> IHMO, semantically, it's not logical.
> >
> > Just to save yet another flag. Having so many flags make codes
> > complicated, but I agree the it I at least logical.
> >>
> >> Also discussing another topic on #mtd, it seems that some memories
> >> don't have a 4-byte address version of the Die Erase op code.
> >
> > Yes. Could be workarounded by enabling 4byte address mode just before
> > sending die erase and then disable it back.
> > The more important question is if you really one to have in upstream di=
e
> erase?
> > It is about 30% faster than  sector at time erase on some flash
> > (especially in case 4KiB sectors). From the other hand I see chips
> > that it was not faster at all (it also applies on chip erase).
> > My first version of fixing this problem was to add only the flag of dis=
able
> chip erase.
> > See here:
> > http://lists.infradead.org/pipermail/linux-mtd/2016-October/069888.htm
> > l Maybe for now it is better to take above?
> >
> >>
> >> If so, it's preferred to use a 4-byte address Sector/Block Erase op
> >> code than to enter/exit the statefull 4-byte address mode then use
> >> the Die Erase op
> >> code: this statefull mode should be avoided as much as possible
> >> because many bootloaders expect the SPI memory to be in 3byte address
> >> mode and if a spurious reset occurs on the CPU side (but not on the
> >> memory side) those bootloaders will fail to read data from the SPI
> memory.
> >
> > Yeap, moreover similar problem you will face when you will try to add
> > QPi modes (444) to framework.
> >
>=20
> Entering the 4-byte address mode might be accepted as a workaround to
> allow using the Die Erase op code even on > 16MiB memory as long as the
> user can choose to disable this feature and the feature is not enabled by
> default.
> This way we don't prevent end users from using Die Erase if they want but
> we don't force them to use it if they don't want to.
>=20
> Indeed, Die Erase is an optimization but it is not mandatory to erase the
> memory: the slower Sector/Block Erase commands can still be used.
> However entering the 4-byte address mode to allow using the Die Erase
> command has side effects, as explained above, that might introduce
> regression.
>=20
> Let's imagine the case of a 2-die memory used to store 2 firmware images.
> The firmware update process could alternate between dies when writing a
> new firmware image so the current/older firmware image is still available=
 if
> the update process fails to write the new image.

At least for Micron it is possible to do such sequence:
1. Enter 4 byte address mode.
2. Send die erase.
3. Exit 4 byte address mode.
4. Start to poll if erase has been done.

Anyway this prove that upstreaming die erase impl. Is not good idea for now=
.
Let's wait for your JESD218 work to be merged.

>=20
> Then, if you make the whole memory enter its 4-byte address mode to erase
> one single die and a spurious reboot occurs, many bootloaders would fail =
to
> read the old firmware from the other die just because the whole memory
> expects 4-byte addresses.
>=20
> About the QPI mode (SPI 4-4-4), I agree with you, it has the very same
> annoying side effect. Hence I've removed support of the SPI 2-2-2 and SPI
> 4-4-4 protocols at the memory side from my SFDP series for the moment.

And that's remained me I have a comment about that :)

Thanks,
Marcin

> Besides, on the controller side, by changing the 3rd argument parameter o=
f
> spi_nor_scan(), one of my patch allows the SPI controller driver to claim=
 "I
> can't/don't want to use SPI 4-4-4 but I support SPI 1-1-4 and SPI 1-4-4
> protocols". So the SPI 4-4-4 protocol can be disabled if needed.
>=20
> Best regards,
>=20
> Cyrille
>=20
>=20
> > Thanks,
> > Marcin
> >
> >>
> >>>>
> >>>> Maybe I'm wrong but the assumption (multi-die =3D> chip erase not
> >>>> supported) might be false.
> >>> It is false, but all multi-die chip I know support die erase or chip =
erase.
> >>> Never both.
> >>>
> >>> Thanks,
> >>> Marcin
> >>>
> >>>>
> >>>>
> >>>> Best regards,
> >>>>
> >>>> Cyrille
> >>>>
> >>>>
> >>>>>>
> >>>>>> Best regards,
> >>>>>>
> >>>>>> Cyrille
> >>>>>>
> >>>>>>> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> >>>>>>> ---
> >>>>>>>  drivers/mtd/spi-nor/spi-nor.c | 90
> >>>>>>> +++++++++++++++++++++++++++++++++++++------
> >>>>>>>  1 file changed, 78 insertions(+), 12 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
> >>>>>>> b/drivers/mtd/spi-nor/spi-nor.c index 3afe207..17bbec0 100644
> >>>>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
> >>>>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >>>>>>> @@ -360,6 +360,29 @@ static int spi_nor_erase_sector(struct
> >>>>>>> spi_nor
> >>>>>> *nor, u32 addr)
> >>>>>>>  	return nor->write_reg(nor, nor->erase_opcode, buf, nor-
> >>>>>>> addr_width); }
> >>>>>>>
> >>>>>>> +static inline int spi_nor_sector_at_time_erase(struct mtd_info
> >>>>>>> +*mtd,
> >>>>>>> +u32 addr, u32 len) {
> >>>>>>> +	struct spi_nor *nor =3D mtd_to_spi_nor(mtd);
> >>>>>>> +	int ret =3D 0;
> >>>>>>> +
> >>>>>>> +	while (len) {
> >>>>>>> +		write_enable(nor);
> >>>>>>> +
> >>>>>>> +		ret =3D spi_nor_erase_sector(nor, addr);
> >>>>>>> +		if (ret)
> >>>>>>> +			return ret;
> >>>>>>> +
> >>>>>>> +		addr +=3D mtd->erasesize;
> >>>>>>> +		len -=3D mtd->erasesize;
> >>>>>>> +
> >>>>>>> +		ret =3D spi_nor_wait_till_ready(nor);
> >>>>>>> +		if (ret)
> >>>>>>> +			return ret;
> >>>>>>> +	}
> >>>>>>> +
> >>>>>>> +	return ret;
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>  /*
> >>>>>>>   * Erase an address range on the nor chip.  The address range
> >>>>>>> may
> >>>> extend
> >>>>>>>   * one or more erase sectors.  Return an error is there is a
> >>>>>>> problem
> >>>> erasing.
> >>>>>>> @@ -367,9 +390,11 @@ static int spi_nor_erase_sector(struct
> >>>>>>> spi_nor *nor, u32 addr)  static int spi_nor_erase(struct
> >>>>>>> mtd_info *mtd, struct erase_info *instr)  {
> >>>>>>>  	struct spi_nor *nor =3D mtd_to_spi_nor(mtd);
> >>>>>>> -	u32 addr, len;
> >>>>>>> +	u32 addr, len, die_no, die_size;
> >>>>>>>  	uint32_t rem;
> >>>>>>>  	int ret;
> >>>>>>> +	unsigned long timeout;
> >>>>>>> +	u8 die_erase =3D nor->die_cnt && SNOR_F_DIE_ERASE;
> >>>>>>>
> >>>>>>>  	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr-
> >addr,
> >>>>>>>  			(long long)instr->len);
> >>>>>>> @@ -386,7 +411,7 @@ static int spi_nor_erase(struct mtd_info
> >>>>>>> *mtd,
> >>>>>> struct erase_info *instr)
> >>>>>>>  		return ret;
> >>>>>>>
> >>>>>>>  	/* whole-chip erase? */
> >>>>>>> -	if (len =3D=3D mtd->size) {
> >>>>>>> +	if (len =3D=3D mtd->size && !die_erase) {
> >>>>>>>  		unsigned long timeout;
> >>>>>>>
> >>>>>>>  		write_enable(nor);
> >>>>>>> @@ -416,17 +441,58 @@ static int spi_nor_erase(struct mtd_info
> >>>>>>> *mtd, struct erase_info *instr)
> >>>>>>>
> >>>>>>>  	/* "sector"-at-a-time erase */
> >>>>>>>  	} else {
> >>>>>>> -		while (len) {
> >>>>>>> -			write_enable(nor);
> >>>>>>> -
> >>>>>>> -			ret =3D spi_nor_erase_sector(nor, addr);
> >>>>>>> -			if (ret)
> >>>>>>> +		if (die_erase) {
> >>>>>>> +			die_size =3D div_u64_rem(mtd->size, nor-
> >>> die_cnt,
> >>>>>> &rem);
> >>>>>>> +			if (rem) {
> >>>>>>> +				ret =3D -EINVAL;
> >>>>>>>  				goto erase_err;
> >>>>>>> -
> >>>>>>> -			addr +=3D mtd->erasesize;
> >>>>>>> -			len -=3D mtd->erasesize;
> >>>>>>> -
> >>>>>>> -			ret =3D spi_nor_wait_till_ready(nor);
> >>>>>>> +			}
> >>>>>>> +			while (len) {
> >>>>>>> +				die_no =3D div_u64_rem(addr,
> >> die_size,
> >>>>>> &rem);
> >>>>>>> +
> >>>>>>> +				/* Check if address is aligned to die
> >> begin*/
> >>>>>>> +				if (!rem) {
> >>>>>>> +					/* die erase? */
> >>>>>>> +					if (len >=3D die_size) {
> >>>>>>> +						ret =3D
> >> spi_nor_die_erase(nor,
> >>>>>> addr);
> >>>>>>> +						if (ret)
> >>>>>>> +							goto
> >> erase_err;
> >>>>>>> +
> >>>>>>> +						len -=3D die_size;
> >>>>>>> +						addr +=3D die_size;
> >>>>>>> +
> >>>>>>> +						timeout =3D
> >>>>>> max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
> >>>>>>> +
> >>>>>> 	CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
> >>>>>>> +
> >> 	(unsigned
> >>>>>> long)(die_size / SZ_2M));
> >>>>>>> +						ret =3D
> >>>>>> spi_nor_wait_till_ready_with_timeout(nor, timeout);
> >>>>>>> +						if (ret)
> >>>>>>> +							goto
> >> erase_err;
> >>>>>>> +					} else {
> >>>>>>> +						ret =3D
> >>>>>> spi_nor_sector_at_time_erase(mtd, addr, len);
> >>>>>>> +						if (ret)
> >>>>>>> +							goto
> >> erase_err;
> >>>>>>> +						len =3D 0;
> >>>>>>> +					}
> >>>>>>> +				} else {
> >>>>>>> +					/* check if end address cover
> >> at least
> >>>>>> one die */
> >>>>>>> +					if (div64_ul(addr + len,
> >> die_size) >
> >>>>>> ++die_no) {
> >>>>>>> +						/* align to next die */
> >>>>>>> +						rem =3D die_size - rem;
> >>>>>>> +						ret =3D
> >>>>>> spi_nor_sector_at_time_erase(mtd, addr, rem);
> >>>>>>> +						if (ret)
> >>>>>>> +							goto
> >> erase_err;
> >>>>>>> +						len -=3D rem;
> >>>>>>> +						addr +=3D rem;
> >>>>>>> +					} else {
> >>>>>>> +						ret =3D
> >>>>>> spi_nor_sector_at_time_erase(mtd, addr, len);
> >>>>>>> +						if (ret)
> >>>>>>> +							goto
> >> erase_err;
> >>>>>>> +						len =3D 0;
> >>>>>>> +					}
> >>>>>>> +				}
> >>>>>>> +			}
> >>>>>>> +		} else {
> >>>>>>> +			ret =3D spi_nor_sector_at_time_erase(mtd,
> >> addr, len);
> >>>>>>>  			if (ret)
> >>>>>>>  				goto erase_err;
> >>>>>>>  		}
> >>>>>>>
> >>>>>
> >>>>>
> >>>
> >>>
> >
> >
