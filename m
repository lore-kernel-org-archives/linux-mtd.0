Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEViM-00052A-DE
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 02:42:35 +0000
Received: by mail-pd0-f177.google.com with SMTP id y10so5669586pdj.36
 for <linux-mtd@lists.infradead.org>; Tue, 27 Aug 2013 19:42:12 -0700 (PDT)
Message-ID: <521D6382.2080403@gmail.com>
Date: Tue, 27 Aug 2013 19:42:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: [PATCH v3 01/10] mtd: nand: rename the cellinfo to bits_per_cell
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-2-git-send-email-b32955@freescale.com>
 <521CDD97.6070203@gmail.com>
In-Reply-To: <521CDD97.6070203@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/27/2013 10:10 AM, Vikram Narayanan wrote:
> On 26/Aug/2013 3:06 PM, Huang Shijie wrote:
>> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
>> index 2ed2bb3..645721e 100644
>> --- a/drivers/mtd/nand/denali.c
>> +++ b/drivers/mtd/nand/denali.c
>> @@ -1520,7 +1520,7 @@ int denali_init(struct denali_nand_info *denali)
>>        * so just let controller do 15bit ECC for MLC and 8bit ECC for
>>        * SLC if possible.
>>        * */
>> -    if (denali->nand.cellinfo & NAND_CI_CELLTYPE_MSK &&
>> +    if (!nand_is_slc(&denali->nand) &&
>>               (denali->mtd.oobsize > (denali->bbtskipbytes +
>>               ECC_15BITS * (denali->mtd.writesize /
>>               ECC_SECTOR_SIZE)))) {
>
> Was just skimming thro this patchset.
> Isn't the above change logically conflicting with what this patch is
> supposed to address? Please move this to a different patch.

To move it to a different patch by itself means he has to change this 
line twice: once to
   denali->nand.bits_per_cell != 1
and once to
   !nand_is_slc(&denali->nand)
which doesn't really help at all.

Or, I guess it's helpful to first add the nand_is_slc() helper in one 
patch (using the existing 'cellinfo' field), then introduce the simple 
patch to change 'cellinfo' to 'bits_per_cell'. Maybe that's what you 
were recommending?

Brian
