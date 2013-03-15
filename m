Received: from mail-pb0-f44.google.com ([209.85.160.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UG89t-000658-UR
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2013 13:25:29 +0000
Received: by mail-pb0-f44.google.com with SMTP id wz12so2218608pbc.3
 for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2013 06:25:24 -0700 (PDT)
Message-ID: <5142878A.7050701@gmail.com>
Date: Thu, 14 Mar 2013 22:29:30 -0400
From: Huang Shijie <shijie8@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v5 3/3] mtd: add 4 Toshiba nand chips for the full-id case
References: <1363229965-13128-1-git-send-email-b32955@freescale.com>	<1363229965-13128-4-git-send-email-b32955@freescale.com>
 <CAN8TOE9aGckZ2PrCCPQe4ZgW6Aph3otXGohNuRPssu8f302xaA@mail.gmail.com>
In-Reply-To: <CAN8TOE9aGckZ2PrCCPQe4ZgW6Aph3otXGohNuRPssu8f302xaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Huang Shijie <b32955@freescale.com>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

于 2013年03月14日 01:10, Brian Norris 写道:
> On Wed, Mar 13, 2013 at 7:59 PM, Huang Shijie<b32955@freescale.com>  wrote:
>> I have 4 Toshiba nand chips which can not be parsed out by the
>> id data. We can not get the oob size from the id data. So add them
>> as the full-id nand chips in the first of nand_flash_ids.
>>
>> The nand_get_flash_type() scans the full id nands firstly.
>> If a full-id nand matchs, it will not continue to parse other
>> non-full-id nand types, else it will continue to parse the non-full-id nands.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>>   drivers/mtd/nand/nand_ids.c |   22 ++++++++++++++++++++++
>>   1 files changed, 22 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
>> index 625bc89..38b8cee 100644
>> --- a/drivers/mtd/nand/nand_ids.c
>> +++ b/drivers/mtd/nand/nand_ids.c
>> @@ -10,6 +10,7 @@
>>    */
>>   #include<linux/module.h>
>>   #include<linux/mtd/nand.h>
>> +#include<linux/sizes.h>
>>
>>   #define LP_OPTIONS NAND_SAMSUNG_LP_OPTIONS
>>   #define LP_OPTIONS16 (LP_OPTIONS | NAND_BUSWIDTH_16)
>> @@ -22,6 +23,27 @@
>>    * extended chip ID.
>>    */
>>   struct nand_flash_dev nand_flash_ids[] = {
>> +       /*
>> +        * The full-id nands may share the same Device ID with the non-full-id
>> +        * nands. In order to distinguish the two type nands, we put the
>> +        * full-id nands in the first of the table. So the nand_get_flash_type()
>> +        * scans the full id nands firstly. If a full-id nand matchs, it will
>> +        * not continue to parse other non-full-id nand types, else it will
>> +        * continue to parse the non-full-id nands.
>> +        */
> There are a few grammar/language issues (nands ->  NAND chips, id ->
> ID, firstly ->  first). Also, I don't think you need to explain the
> full search here. I would rewrite this whole paragraph as:
>
sorry for my poor english.

> "Some incompatible NAND chips share device ID's and so must be listed
> by full ID. We list them first so that we can easily identify the most
> specific match."
>
thanks. I will use this description.



Huang Shijie
