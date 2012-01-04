Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=TX2EHSOBE007.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiIx0-000343-HY
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 04:59:48 +0000
Message-ID: <4F03DC8B.3030407@freescale.com>
Date: Wed, 4 Jan 2012 10:28:51 +0530
From: Prabhakar <prabhakar@freescale.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH 2/2] mtd/nand: Fix IFC driver to support 2K NAND page
References: <1325134779-3571-1-git-send-email-prabhakar@freescale.com>
 <1325134779-3571-3-git-send-email-prabhakar@freescale.com>
 <4F035BDF.5070207@freescale.com>
In-Reply-To: <4F035BDF.5070207@freescale.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Poonam Aggrwal <poonam.aggrwal@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 04 January 2012 01:19 AM, Scott Wood wrote:
> On 12/28/2011 10:59 PM, Prabhakar Kushwaha wrote:
>> 1) OOB area should be updated irrespective of NAND page size. Earlier it was
>> updated only for 512byte NAND page.
>>
>> 2) During OOB update fbcr should be equal to OOB size.
>>
>> Signed-off-by: Poonam Aggrwal<poonam.aggrwal@freescale.com>
>> Signed-off-by: Prabhakar Kushwaha<prabhakar@freescale.com>
>> ---
>>   git://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git (branch next)
> The IFC driver hasn't been merged into that tree that I can see.

This patch is created on top of IFC driver patch (already floated in 
mailing list). Please find there link:

http://patchwork.ozlabs.org/patch/133315/
http://patchwork.ozlabs.org/patch/133316/


>>   Tested on P1010RDB
>>
>>   drivers/mtd/nand/fsl_ifc_nand.c |   20 ++++++++------------
>>   1 files changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
>> index 2df7206..2c02168 100644
>> --- a/drivers/mtd/nand/fsl_ifc_nand.c
>> +++ b/drivers/mtd/nand/fsl_ifc_nand.c
>> @@ -439,20 +439,16 @@ static void fsl_ifc_cmdfunc(struct mtd_info *mtd, unsigned int command,
>>   			out_be32(&ifc->ifc_nand.nand_fir1,
>>   				 (IFC_FIR_OP_CW1<<  IFC_NAND_FIR1_OP5_SHIFT));
>>
>> -			if (column>= mtd->writesize) {
>> -				/* OOB area -->  READOOB */
>> -				column -= mtd->writesize;
>> -				nand_fcr0 |= NAND_CMD_READOOB<<
>> -						IFC_NAND_FCR0_CMD0_SHIFT;
>> -				ifc_nand_ctrl->oob = 1;
>> -			} else if (column<  256)
>> +			if (column<  256)
>>   				/* First 256 bytes -->  READ0 */
>>   				nand_fcr0 |=
>>   				NAND_CMD_READ0<<  IFC_NAND_FCR0_CMD0_SHIFT;
>> -			else
>> -				/* Second 256 bytes -->  READ1 */
>> -				nand_fcr0 |=
>> -				NAND_CMD_READ1<<  IFC_NAND_FCR0_CMD0_SHIFT;
>> +		}
>> +
>> +		if (column>= mtd->writesize) {
>> +			/* OOB area -->  READOOB */
>> +			column -= mtd->writesize;
>> +			ifc_nand_ctrl->oob = 1;
>>   		}
> Where is NAND_CMD_READOOB going to be set in the small-page case?

2K NAND flash does not require NAND_CMD_READOOB. So i thought same 
should be applied to 512byte NAND. but i am wrong.
Thanks for pointing it out :)

>
> The small-page code should read something like:
>
> 	if (column>= mtd->writesize) {
> 		nand_fcr0 |=
> 			NAND_CMD_READOOB<<  IFC_NAND_FCR0_CMD0_SHIFT;
> 	} else {
> 		nand_fcr0 |=
> 			NAND_CMD_READ0<<  IFC_NAND_FCR0_CMD0_SHIFT;
> 	}
>
> It looks like we can get rid of ctrl->column, BTW.
>

  I will take care this in next patch release

--Prabhakar
