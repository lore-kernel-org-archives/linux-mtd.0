Received: from da1vs01.rockwellcollins.com ([205.175.227.27])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAhZC-0006tn-OU
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 19:56:13 +0000
Received: by mail-ot0-f200.google.com with SMTP id m22-v6so8531498otf.3
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2018 12:55:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180422190743.36e65119@xps13>
References: <1523992259-56588-1-git-send-email-ronak.desai@rockwellcollins.com>
 <20180422190743.36e65119@xps13>
From: Ronak Desai <ronak.desai@rockwellcollins.com>
Date: Mon, 23 Apr 2018 14:55:48 -0500
Message-ID: <CADFuHZ4i52AxD6G3xf_RyWD7Z5bs-2-zXddMevBsKYkT=JTWCg@mail.gmail.com>
Subject: Re: [PATCH] Added set feature command in FSL IFC nand controller
 driver for ONFI nand
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 22, 2018 at 12:07 PM, Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Hi Ronak,
>
> On Tue, 17 Apr 2018 14:10:59 -0500, Ronak Desai
> <ronak.desai@rockwellcollins.com> wrote:
>
>> This patch adds set feature command (EFh) support in Freescale IFC nand
>> controller driver.
>>
>> The SET FEATURES (EFh) command is used to modify the target's default
>> power-on behavior. This command uses one-byte feature address to
>> determine which sub-feature parameters will be modified.
>>
>
> Could you rebase on top of 4.17-rc1 at least, this file has moved and
> the core changed about set/get_features() handling.
>
> Also while you are at it, the prefix should be
> 'mtd: rawnand: fsl_ifc: '.
>
Agree, I will do that.

>> Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
>> ---
>>  drivers/mtd/nand/fsl_ifc_nand.c |   51 ++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_=
nand.c
>> index af85c4b..20b97ef 100644
>> --- a/drivers/mtd/nand/fsl_ifc_nand.c
>> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
>> @@ -613,6 +613,23 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, u=
nsigned int command,
>>               fsl_ifc_run_command(mtd);
>>               return;
>>
>> +     case NAND_CMD_SET_FEATURES: {
>> +             ifc_out32((IFC_FIR_OP_CW0 << IFC_NAND_FIR0_OP0_SHIFT) |
>> +                     (IFC_FIR_OP_UA << IFC_NAND_FIR0_OP1_SHIFT) |
>> +                     (IFC_FIR_OP_WBCD << IFC_NAND_FIR0_OP2_SHIFT),
>> +                     &ifc->ifc_nand.nand_fir0);
>> +
>> +             ifc_out32((NAND_CMD_SET_FEATURES << IFC_NAND_FCR0_CMD0_SHI=
FT),
>> +                     &ifc->ifc_nand.nand_fcr0);
>> +
>> +             ifc_out32(column, &ifc->ifc_nand.row3);
>> +
>> +              /* Write only 4 bytes from flash buffer */
>> +             ifc_out32(4, &ifc->ifc_nand.nand_fbcr);
>> +             fsl_ifc_run_command(mtd);
>> +             return;
>> +     }
>> +
>>       case NAND_CMD_RNDOUT: {
>>               __le16 Tccs =3D 0;
>>               chip->onfi_version ? (Tccs =3D chip->onfi_params.t_ccs)
>> @@ -905,6 +922,39 @@ static void fsl_ifc_sram_init(struct fsl_ifc_mtd *p=
riv)
>>       ifc_out32(csor_ext, &ifc_global->csor_cs[cs].csor_ext);
>>  }
>>
>> +/**
>> + * fsl_ifc_onfi_set_features- set features for ONFI nand
>> + * @mtd: MTD device structure
>> + * @chip: nand chip info structure
>> + * @addr: feature address.
>> + * @subfeature_param: the subfeature parameters, a four bytes array.
>> + */
>> +static int fsl_ifc_onfi_set_features(struct mtd_info *mtd, struct nand_=
chip *chip,
>> +                     int addr, uint8_t *subfeature_param)
>> +{
>> +     int status;
>> +     int i;
>> +
>> +#ifdef CONFIG_SYS_NAND_ONFI_DETECTION
>> +     if (!chip->onfi_version ||
>> +         !(le16_to_cpu(chip->onfi_params.opt_cmd)
>> +           & ONFI_OPT_CMD_SET_GET_FEATURES))
>> +             return -EINVAL;
>> +#endif
>
> No need to do that, the core will take care of it, see [1].

Agree, I will remove this.
>
>> +
>> +     /* Want data from start of the buffer */
>> +     set_addr(mtd, 0, 0, 0);
>
> This is the only thing that differs from the core's implementation. I
> see most of the time it is called from ->cmdfunc(), could you move it
> there? If yes you could get rid of this entire hook and rely on the
> core's function.
>
NAND_CMD_SET_FEATURES command sends the sub-feature param from flash
buffer on the provided address and I added this here because I wanted
to make sure
that the data is set from start of the buffer. I looked at the core's
implementation
and I see that the NAND_CMD_SET_FEATURES  command is called first and then
the data is filled into the buffer which will not work in case of my
implementation.
So, I will have to keep this here and the function, please suggest. I
will wait for your
feedback before submitting V2.  Moreover, I would suggest to check
sequence in core's
implementation as the command should run after setting the data and not bef=
ore.
>> +
>> +     for (i =3D 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
>> +             chip->write_byte(mtd, subfeature_param[i]);
>> +
>> +     chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr, 0);
>> +
>> +     status =3D chip->waitfunc(mtd, chip);
>> +     if (status & NAND_STATUS_FAIL)
>> +             return -EIO;
>> +     return 0;
>> +}
>>  static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
>>  {
>>       struct fsl_ifc_ctrl *ctrl =3D priv->ctrl;
>> @@ -932,6 +982,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *pri=
v)
>>       chip->select_chip =3D fsl_ifc_select_chip;
>>       chip->cmdfunc =3D fsl_ifc_cmdfunc;
>>       chip->waitfunc =3D fsl_ifc_wait;
>> +     chip->onfi_set_features =3D fsl_ifc_onfi_set_features;
>
> Should be chip->set_features now. And fsl_ifc_onfi_set_features() could
> become fsl_ifc_set_features().
>
> If the driver does not support get_features, you should add a:
>
>         chip->get_features =3D nand_get_set_features_notsupp;
>
Agree, I will update this.
>>
>>       chip->bbt_td =3D &bbt_main_descr;
>>       chip->bbt_md =3D &bbt_mirror_descr;
>> --
>> 1.7.9.5
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> [1]
> https://elixir.bootlin.com/linux/v4.17-rc1/source/drivers/mtd/nand/raw/na=
nd_base.c#L1204
>
> Thanks,
> Miqu=C3=A8l
>
> --
> Miquel Raynal, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Ronak A Desai
Sr. Software Engineer
Airborne Information Solutions / RC Linux Platform Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA

Phone : 319-263-2667 / VPN : 263-2667

Ronak.Desai@rockwellcollins.com

https://www.rockwellcollins.com/
