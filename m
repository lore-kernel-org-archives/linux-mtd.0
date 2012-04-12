Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SI9yD-00073Y-7T
 for linux-mtd@lists.infradead.org; Thu, 12 Apr 2012 02:41:14 +0000
Message-ID: <4F86416B.4090501@freescale.com>
Date: Thu, 12 Apr 2012 10:43:55 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd : add parsing code for one kind of Hynix's nand chip
References: <1334026606-18327-1-git-send-email-b32955@freescale.com>
 <CAN8TOE8xz+t1X-JVC1sOy70k64_gRDU-6DkrnqtDkvdbELHQLQ@mail.gmail.com>
In-Reply-To: <CAN8TOE8xz+t1X-JVC1sOy70k64_gRDU-6DkrnqtDkvdbELHQLQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian:
> Hi Huang,
>
> On Mon, Apr 9, 2012 at 7:56 PM, Huang Shijie<b32955@freescale.com>  wrote:
>>   drivers/mtd/nand/nand_base.c |   43 ++++++++++++++++++++++++++++++++++++++++++
>>   1 files changed, 43 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 6315b94..8997023 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3028,6 +3028,49 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>>                         mtd->erasesize = (128 * 1024)<<
>>                                 (((extid>>  1)&  0x04) | (extid&  0x03));
>>                         busw = 0;
>> +               } else if (id_data[0] == NAND_MFR_HYNIX&&  id_data[1] == 0xd7) {
>> +                       /* Calc pagesize */
> I'm not sure this is the beset heuristic. Hynix could easily make a
> larger chip that has the same decoding table, so we probably shouldn't
> compare dev_id == 0xD7. It actually seems like the decoding table
> might be intended for all Hynix MLC. What do you think about the
> following condition?
>
> +       } else if ((chip->cellinfo&  NAND_CI_CELLTYPE_MSK)&&
> id_data[0] == NAND_MFR_HYNIX) {
I am afraid this can not solve the problem.
The HY27UT088G2M whose id_data[2] is 0x14 DOES not follow your code.
Please check the datasheet of HY27UT088G2M. ( I ever emailed to you.)

The same issue exits in H627UW08CGFM too.

>> +                       /* Calc oobsize */
>> +                       switch (extid&  0x03) {
> The table actually includes a third column (bit 6) that corresponds
> with the OOB field that, in future revs could have an expanded OOB
> size. Personally, I wrote this condition as:
>
> +               switch (((extid>>  2)&  0x04) | (extid&  0x03)) {
yes, we can add this.
> That way, we can catch the "default" case as an unknown OOB size.
>
>> +                       default:
>> +                               pr_info("Cannot parse out the oobsize.\n");
>> +                               break;
>> +                       }
> I'm not sure if we should just print a message for the default case;
> the warning message could easily be missed, and the uninitialized
> oobsize would cause problems. Either we should throw an error somehow
> or just default to the highest known OOB for this chip type (448
> bytes). Personally, I just chose the latter...
ok. I can use the 448 as the default.
> BTW, I actually have some patches queued up that I need to complete
> properly, where I'm trying to clean up and update NAND detection a
> little. So I basically have this same patch, but rebased on top of
> some other changes I have ready... I don't mind taking a revised
> version of yours, or I can try to clean up my series and send it out
> soon.
>
I hope you send it out as soon as possible. :)

> Either way, please remember to copy me on these type of NAND detection
> patches! I've been studying this for a while and have a lot of stuff
> queued up to work on sometime, so it's nice to know when others are
> touching these areas.
ok, no problem.

thanks
Huang Shijie
