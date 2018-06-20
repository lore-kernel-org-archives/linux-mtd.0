Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVkO1-00049s-FG
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 21:11:31 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, "Marek
 Vasut" <marek.vasut@gmail.com>
Subject: Re: [PATCH v3 1/4] mtd: rawnand: marvell: Handle on-die ECC
Date: Wed, 20 Jun 2018 21:10:56 +0000
Message-ID: <0bf16d760f6a468ebe4417bacc9fc6b4@svr-chch-ex1.atlnz.lc>
References: <20180620050544.31549-1-chris.packham@alliedtelesis.co.nz>
 <20180620050544.31549-2-chris.packham@alliedtelesis.co.nz>
 <20180620094654.4280caeb@bbrezillon>
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

On 20/06/18 19:47, Boris Brezillon wrote:=0A=
> Hi Chris,=0A=
> =0A=
> On Wed, 20 Jun 2018 17:05:41 +1200=0A=
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>>  From the controllers point of view this is the same as no or=0A=
>> software only ECC.=0A=
>>=0A=
>> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>=0A=
> =0A=
> I'm nitpicking, but we usually put the R-b/A-b tags after the author=0A=
> SoB.=0A=
=0A=
Yeah sorry force of habit from using gerrit internally. I'll try to =0A=
re-train my fingers.=0A=
=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>> Changes in v2:=0A=
>> - New=0A=
>> Changes in v3:=0A=
>> - Add review from Boris=0A=
>>=0A=
>>   drivers/mtd/nand/raw/marvell_nand.c | 1 +=0A=
>>   1 file changed, 1 insertion(+)=0A=
>>=0A=
>> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/=
marvell_nand.c=0A=
>> index ebb1d141b900..ba6889bbe802 100644=0A=
>> --- a/drivers/mtd/nand/raw/marvell_nand.c=0A=
>> +++ b/drivers/mtd/nand/raw/marvell_nand.c=0A=
>> @@ -2157,6 +2157,7 @@ static int marvell_nand_ecc_init(struct mtd_info *=
mtd,=0A=
>>   		break;=0A=
>>   	case NAND_ECC_NONE:=0A=
>>   	case NAND_ECC_SOFT:=0A=
>> +	case NAND_ECC_ON_DIE:=0A=
>>   		if (!nfc->caps->is_nfcv2 && mtd->writesize !=3D SZ_512 &&=0A=
>>   		    mtd->writesize !=3D SZ_2K) {=0A=
>>   			dev_err(nfc->dev, "NFCv1 cannot write %d bytes pages\n",=0A=
> =0A=
> =0A=
=0A=
