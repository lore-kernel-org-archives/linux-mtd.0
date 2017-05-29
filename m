Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFRyb-00073P-4z
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 21:13:24 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, "Cyrille
 Pitchen" <cyrille.pitchen@atmel.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: Make sure drivers not supporting
 SET/GET_FEATURES return -ENOTSUPP
Date: Mon, 29 May 2017 21:12:52 +0000
Message-ID: <595a00a9d9aa47718b7662e542abf3a0@svr-chch-ex1.atlnz.lc>
References: <20170526151015.32673-1-boris.brezillon@free-electrons.com>
 <20170529112355.73f55f89@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

Hi Boris,=0A=
=0A=
On 29/05/17 21:24, Boris Brezillon wrote:=0A=
> Hi Chris,=0A=
> =0A=
> On Fri, 26 May 2017 17:10:15 +0200=0A=
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:=0A=
> =0A=
>> A lot of drivers are providing their own ->cmdfunc(), and most of the=0A=
>> time this implementation does not support all possible NAND operations.=
=0A=
>> But since ->cmdfunc() cannot return an error code, the core has no way=
=0A=
>> to know that the operation it requested is not supported.=0A=
>>=0A=
>> This is a problem we cannot address for all kind of operations with the=
=0A=
>> current design, but we can prevent these silent failures for the=0A=
>> GET/SET FEATURES operation by overloading the default=0A=
>> ->onfi_{set,get}_features() methods with one returning -ENOTSUPP.=0A=
>>=0A=
>> Reported-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>=0A=
>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>=0A=
> =0A=
> Can you test this patch and add your Tested-by if it works?=0A=
=0A=
For Armada-38x (pxa3xx_nand) with Mircon MT29F8G08ABACAWP:C=0A=
=0A=
Tested-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>=0A=
=0A=
> =0A=
> Thanks,=0A=
> =0A=
> Boris=0A=
> =0A=
>> ---=0A=
>>=0A=
>> This bug has been discovered by Chris while testing linux-next on his=0A=
>> marvell platform (which is using pxa3xx NAND controller driver).=0A=
>> The bug was caused by commit b566d9c055de ("mtd: nand: add support for=
=0A=
>> Micron on-die ECC") which is using ->set/get_features() to detect=0A=
>> whether the NAND supports on-die ECC or not.=0A=
>>=0A=
>> This reveals how fragile the current ->cmdfunc() interface is. Not only=
=0A=
>> ->cmdfunc() cannot return an error code, but even if it could, most of=
=0A=
>> the time, learning that a specific operation is not supported when=0A=
>> trying to execute it is already too late.=0A=
>>=0A=
>> Anyway, this is not something we can address immediately (I'm working=0A=
>> on a new ->exec_op()/->supports_op() interface that will hopefully=0A=
>> address the aforementioned problems), but I guess this fix can serve as=
=0A=
>> a reference to show that overloading ->cmdfunc() is a really bad idea=0A=
>> and that ->cmd_ctrl() should be implemented instead, unless it's proven=
=0A=
>> to be impossible.=0A=
>>=0A=
>> Note that I didn't add a Fixes tag because I plan to rearrange my=0A=
>> nand/next branch to put this commit before b566d9c055de to avoid=0A=
>> breaking bisectability.=0A=
>> ---=0A=
>>   drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c  |  2 ++=0A=
>>   drivers/mtd/nand/cafe_nand.c                  |  2 ++=0A=
>>   drivers/mtd/nand/denali.c                     |  2 ++=0A=
>>   drivers/mtd/nand/docg4.c                      |  2 ++=0A=
>>   drivers/mtd/nand/fsl_elbc_nand.c              |  2 ++=0A=
>>   drivers/mtd/nand/fsl_ifc_nand.c               |  2 ++=0A=
>>   drivers/mtd/nand/hisi504_nand.c               |  2 ++=0A=
>>   drivers/mtd/nand/mpc5121_nfc.c                |  2 ++=0A=
>>   drivers/mtd/nand/nand_base.c                  | 19 +++++++++++++++++++=
=0A=
>>   drivers/mtd/nand/pxa3xx_nand.c                |  2 ++=0A=
>>   drivers/mtd/nand/qcom_nandc.c                 |  2 ++=0A=
>>   drivers/mtd/nand/sh_flctl.c                   |  2 ++=0A=
>>   drivers/mtd/nand/vf610_nfc.c                  |  2 ++=0A=
>>   drivers/staging/mt29f_spinand/mt29f_spinand.c |  2 ++=0A=
>>   include/linux/mtd/nand.h                      |  5 +++++=0A=
>>   15 files changed, 50 insertions(+)=0A=
>>=0A=
>> diff --git a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/=
nand/bcm47xxnflash/ops_bcm4706.c=0A=
>> index f1da4ea88f2c..54bac5b73f0a 100644=0A=
>> --- a/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c=0A=
>> +++ b/drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c=0A=
>> @@ -392,6 +392,8 @@ int bcm47xxnflash_ops_bcm4706_init(struct bcm47xxnfl=
ash *b47n)=0A=
>>   	b47n->nand_chip.read_byte =3D bcm47xxnflash_ops_bcm4706_read_byte;=0A=
>>   	b47n->nand_chip.read_buf =3D bcm47xxnflash_ops_bcm4706_read_buf;=0A=
>>   	b47n->nand_chip.write_buf =3D bcm47xxnflash_ops_bcm4706_write_buf;=0A=
>> +	b47n->nand_chip.onfi_set_features =3D nand_onfi_get_set_features_notsu=
pp;=0A=
>> +	b47n->nand_chip.onfi_get_features =3D nand_onfi_get_set_features_notsu=
pp;=0A=
>>   =0A=
>>   	nand_chip->chip_delay =3D 50;=0A=
>>   	b47n->nand_chip.bbt_options =3D NAND_BBT_USE_FLASH;=0A=
>> diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c=
=0A=
>> index d40c32d311d8..2fd733eba0a3 100644=0A=
>> --- a/drivers/mtd/nand/cafe_nand.c=0A=
>> +++ b/drivers/mtd/nand/cafe_nand.c=0A=
>> @@ -654,6 +654,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,=0A=
>>   	cafe->nand.read_buf =3D cafe_read_buf;=0A=
>>   	cafe->nand.write_buf =3D cafe_write_buf;=0A=
>>   	cafe->nand.select_chip =3D cafe_select_chip;=0A=
>> +	cafe->nand.onfi_set_features =3D nand_onfi_get_set_features_notsupp;=
=0A=
>> +	cafe->nand.onfi_get_features =3D nand_onfi_get_set_features_notsupp;=
=0A=
>>   =0A=
>>   	cafe->nand.chip_delay =3D 0;=0A=
>>   =0A=
>> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c=0A=
>> index 16634df2e39a..b3c99d98fdee 100644=0A=
>> --- a/drivers/mtd/nand/denali.c=0A=
>> +++ b/drivers/mtd/nand/denali.c=0A=
>> @@ -1531,6 +1531,8 @@ int denali_init(struct denali_nand_info *denali)=
=0A=
>>   	chip->cmdfunc =3D denali_cmdfunc;=0A=
>>   	chip->read_byte =3D denali_read_byte;=0A=
>>   	chip->waitfunc =3D denali_waitfunc;=0A=
>> +	chip->onfi_set_features =3D nand_onfi_get_set_features_notsupp;=0A=
>> +	chip->onfi_get_features =3D nand_onfi_get_set_features_notsupp;=0A=
>>   =0A=
>>   	/*=0A=
>>   	 * scan for NAND devices attached to the controller=0A=
>> diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c=0A=
>> index 7af2a3cd949e..a27a84fbfb84 100644=0A=
>> --- a/drivers/mtd/nand/docg4.c=0A=
>> +++ b/drivers/mtd/nand/docg4.c=0A=
>> @@ -1260,6 +1260,8 @@ static void __init init_mtd_structs(struct mtd_inf=
o *mtd)=0A=
>>   	nand->read_buf =3D docg4_read_buf;=0A=
>>   	nand->write_buf =3D docg4_write_buf16;=0A=
>>   	nand->erase =3D docg4_erase_block;=0A=
>> +	nand->onfi_set_features =3D nand_onfi_get_set_features_notsupp;=0A=
>> +	nand->onfi_get_features =3D nand_onfi_get_set_features_notsupp;=0A=
>>   	nand->ecc.read_page =3D docg4_read_page;=0A=
>>   	nand->ecc.write_page =3D docg4_write_page;=0A=
>>   	nand->ecc.read_page_raw =3D docg4_read_page_raw;=0A=
>> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elb=
c_nand.c=0A=
>> index 113f76e59937..b9ac16f05057 100644=0A=
>> --- a/drivers/mtd/nand/fsl_elbc_nand.c=0A=
>> +++ b/drivers/mtd/nand/fsl_elbc_nand.c=0A=
>> @@ -775,6 +775,8 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *p=
riv)=0A=
>>   	chip->select_chip =3D fsl_elbc_select_chip;=0A=
>>   	chip->cmdfunc =3D fsl_elbc_cmdfunc;=0A=
>>   	chip->waitfunc =3D fsl_elbc_wait;=0A=
>> +	chip->onfi_set_features =3D nand_onfi_get_set_features_notsupp;=0A=
>> +	chip->onfi_get_features =3D nand_onfi_get_set_features_notsupp;=0A=
>>   =0A=
>>   	chip->bbt_td =3D &bbt_main_descr;=0A=
>>   	chip->bbt_md =3D &bbt_mirror_descr;=0A=
>> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_=
nand.c=0A=
>> index d1570f512f0b..89e14daeaba6 100644=0A=
>> --- a/drivers/mtd/nand/fsl_ifc_nand.c=0A=
>> +++ b/drivers/mtd/nand/fsl_ifc_nand.c=0A=
>> @@ -831,6 +831,8 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *pri=
v)=0A=
>>   	chip->select_chip =3D fsl_ifc_select_chip;=0A=
>>   	chip->cmdfunc =3D fsl_ifc_cmdfunc;=0A=
>>   	chip->waitfunc =3D fsl_ifc_wait;=0A=
>> +	chip->onfi_set_features =3D nand_onfi_get_set_features_notsupp;=0A=
>> +	chip->onfi_get_features =3D nand_onfi_get_set_features_notsupp;=0A=
>>   =0A=
>>   	chip->bbt_td =3D &bbt_main_descr;=0A=
>>   	chip->bbt_md =3D &bbt_mirror_descr;=0A=
>> diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_=
nand.c=0A=
>> index e40364eeb556..530caa80b1b6 100644=0A=
>> --- a/drivers/mtd/nand/hisi504_nand.c=0A=
>> +++ b/drivers/mtd/nand/hisi504_nand.c=0A=
>> @@ -764,6 +764,8 @@ static int hisi_nfc_probe(struct platform_device *pd=
ev)=0A=
>>   	chip->write_buf		=3D hisi_nfc_write_buf;=0A=
>>   	chip->read_buf		=3D hisi_nfc_read_buf;=0A=
>>   	chip->chip_delay	=3D HINFC504_CHIP_DELAY;=0A=
>> +	chip->onfi_set_features	=3D nand_onfi_get_set_features_notsupp;=0A=
>> +	chip->onfi_get_features	=3D nand_onfi_get_set_features_notsupp;=0A=
>>   =0A=
>>   	hisi_nfc_host_init(host);=0A=
>>   =0A=
>> diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_n=
fc.c=0A=
>> index 6d6eaed2d20c..0e86fb6277c3 100644=0A=
>> --- a/drivers/mtd/nand/mpc5121_nfc.c=0A=
>> +++ b/drivers/mtd/nand/mpc5121_nfc.c=0A=
>> @@ -708,6 +708,8 @@ static int mpc5121_nfc_probe(struct platform_device =
*op)=0A=
>>   	chip->read_buf =3D mpc5121_nfc_read_buf;=0A=
>>   	chip->write_buf =3D mpc5121_nfc_write_buf;=0A=
>>   	chip->select_chip =3D mpc5121_nfc_select_chip;=0A=
>> +	chip->onfi_set_features	=3D nand_onfi_get_set_features_notsupp;=0A=
>> +	chip->onfi_get_features	=3D nand_onfi_get_set_features_notsupp;=0A=
>>   	chip->bbt_options =3D NAND_BBT_USE_FLASH;=0A=
>>   	chip->ecc.mode =3D NAND_ECC_SOFT;=0A=
>>   	chip->ecc.algo =3D NAND_ECC_HAMMING;=0A=
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c=
=0A=
>> index 54a1dfa327ff..d6fb4a139387 100644=0A=
>> --- a/drivers/mtd/nand/nand_base.c=0A=
>> +++ b/drivers/mtd/nand/nand_base.c=0A=
>> @@ -3424,6 +3424,25 @@ static int nand_onfi_get_features(struct mtd_info=
 *mtd, struct nand_chip *chip,=0A=
>>   }=0A=
>>   =0A=
>>   /**=0A=
>> + * nand_onfi_get_set_features_notsupp - set/get features stub returning=
=0A=
>> + *					-ENOTSUPP=0A=
>> + * @mtd: MTD device structure=0A=
>> + * @chip: nand chip info structure=0A=
>> + * @addr: feature address.=0A=
>> + * @subfeature_param: the subfeature parameters, a four bytes array.=0A=
>> + *=0A=
>> + * Should be used by NAND controller drivers that do not support the SE=
T/GET=0A=
>> + * FEATURES operations.=0A=
>> + */=0A=
>> +int nand_onfi_get_set_features_notsupp(struct mtd_info *mtd,=0A=
>> +				       struct nand_chip *chip,=0A=
>> +				       int feature_addr, u8 *subfeature_para)=0A=
>> +{=0A=
>> +	return -ENOTSUPP;=0A=
>> +}=0A=
>> +EXPORT_SYMBOL(nand_onfi_get_set_features_notsupp);=0A=
>> +=0A=
>> +/**=0A=
>>    * nand_suspend - [MTD Interface] Suspend the NAND flash=0A=
>>    * @mtd: MTD device structure=0A=
>>    */=0A=
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_na=
nd.c=0A=
>> index 649ba8200832..74dae4bbdac8 100644=0A=
>> --- a/drivers/mtd/nand/pxa3xx_nand.c=0A=
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c=0A=
>> @@ -1812,6 +1812,8 @@ static int alloc_nand_resource(struct platform_dev=
ice *pdev)=0A=
>>   		chip->write_buf		=3D pxa3xx_nand_write_buf;=0A=
>>   		chip->options		|=3D NAND_NO_SUBPAGE_WRITE;=0A=
>>   		chip->cmdfunc		=3D nand_cmdfunc;=0A=
>> +		chip->onfi_set_features	=3D nand_onfi_get_set_features_notsupp;=0A=
>> +		chip->onfi_get_features	=3D nand_onfi_get_set_features_notsupp;=0A=
>>   	}=0A=
>>   =0A=
>>   	nand_hw_control_init(chip->controller);=0A=
>> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc=
.c=0A=
>> index 57d483ac5765..88af7145a51a 100644=0A=
>> --- a/drivers/mtd/nand/qcom_nandc.c=0A=
>> +++ b/drivers/mtd/nand/qcom_nandc.c=0A=
>> @@ -2008,6 +2008,8 @@ static int qcom_nand_host_init(struct qcom_nand_co=
ntroller *nandc,=0A=
>>   	chip->read_byte		=3D qcom_nandc_read_byte;=0A=
>>   	chip->read_buf		=3D qcom_nandc_read_buf;=0A=
>>   	chip->write_buf		=3D qcom_nandc_write_buf;=0A=
>> +	chip->onfi_set_features	=3D nand_onfi_get_set_features_notsupp;=0A=
>> +	chip->onfi_get_features	=3D nand_onfi_get_set_features_notsupp;=0A=
>>   =0A=
>>   	/*=0A=
>>   	 * the bad block marker is readable only when we read the last codewo=
rd=0A=
>> diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c=
=0A=
>> index 442ce619b3b6..891ac7b99305 100644=0A=
>> --- a/drivers/mtd/nand/sh_flctl.c=0A=
>> +++ b/drivers/mtd/nand/sh_flctl.c=0A=
>> @@ -1183,6 +1183,8 @@ static int flctl_probe(struct platform_device *pde=
v)=0A=
>>   	nand->read_buf =3D flctl_read_buf;=0A=
>>   	nand->select_chip =3D flctl_select_chip;=0A=
>>   	nand->cmdfunc =3D flctl_cmdfunc;=0A=
>> +	nand->onfi_set_features =3D nand_onfi_get_set_features_notsupp;=0A=
>> +	nand->onfi_get_features =3D nand_onfi_get_set_features_notsupp;=0A=
>>   =0A=
>>   	if (pdata->flcmncr_val & SEL_16BIT)=0A=
>>   		nand->options |=3D NAND_BUSWIDTH_16;=0A=
>> diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c=
=0A=
>> index 3ea4bb19e12d..744ab10e8962 100644=0A=
>> --- a/drivers/mtd/nand/vf610_nfc.c=0A=
>> +++ b/drivers/mtd/nand/vf610_nfc.c=0A=
>> @@ -703,6 +703,8 @@ static int vf610_nfc_probe(struct platform_device *p=
dev)=0A=
>>   	chip->read_buf =3D vf610_nfc_read_buf;=0A=
>>   	chip->write_buf =3D vf610_nfc_write_buf;=0A=
>>   	chip->select_chip =3D vf610_nfc_select_chip;=0A=
>> +	chip->onfi_set_features =3D nand_onfi_get_set_features_notsupp;=0A=
>> +	chip->onfi_get_features =3D nand_onfi_get_set_features_notsupp;=0A=
>>   =0A=
>>   	chip->options |=3D NAND_NO_SUBPAGE_WRITE;=0A=
>>   =0A=
>> diff --git a/drivers/staging/mt29f_spinand/mt29f_spinand.c b/drivers/sta=
ging/mt29f_spinand/mt29f_spinand.c=0A=
>> index e389009fca42..a4e3ae8f0c85 100644=0A=
>> --- a/drivers/staging/mt29f_spinand/mt29f_spinand.c=0A=
>> +++ b/drivers/staging/mt29f_spinand/mt29f_spinand.c=0A=
>> @@ -915,6 +915,8 @@ static int spinand_probe(struct spi_device *spi_nand=
)=0A=
>>   	chip->waitfunc	=3D spinand_wait;=0A=
>>   	chip->options	|=3D NAND_CACHEPRG;=0A=
>>   	chip->select_chip =3D spinand_select_chip;=0A=
>> +	chip->onfi_set_features =3D nand_onfi_get_set_features_notsupp;=0A=
>> +	chip->onfi_get_features =3D nand_onfi_get_set_features_notsupp;=0A=
>>   =0A=
>>   	mtd =3D nand_to_mtd(chip);=0A=
>>   =0A=
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h=0A=
>> index f01991649118..5388c07836fd 100644=0A=
>> --- a/include/linux/mtd/nand.h=0A=
>> +++ b/include/linux/mtd/nand.h=0A=
>> @@ -1261,6 +1261,11 @@ int nand_read_oob_std(struct mtd_info *mtd, struc=
t nand_chip *chip, int page);=0A=
>>   int nand_read_oob_syndrome(struct mtd_info *mtd, struct nand_chip *chi=
p,=0A=
>>   			   int page);=0A=
>>   =0A=
>> +/* Stub used by drivers that do not support GET/SET FEATURES operations=
 */=0A=
>> +int nand_onfi_get_set_features_notsupp(struct mtd_info *mtd,=0A=
>> +				       struct nand_chip *chip,=0A=
>> +				       int feature_addr, u8 *subfeature_para);=0A=
>> +=0A=
>>   /* Default read_page_raw implementation */=0A=
>>   int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,=
=0A=
>>   		       uint8_t *buf, int oob_required, int page);=0A=
> =0A=
> =0A=
=0A=
