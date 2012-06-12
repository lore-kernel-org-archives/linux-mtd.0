Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SeR4I-0006v4-CL
 for linux-mtd@lists.infradead.org; Tue, 12 Jun 2012 13:23:35 +0000
Message-ID: <4FD742D1.2080501@newsguy.com>
Date: Tue, 12 Jun 2012 06:23:29 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: ignore ecc errors during bbt reads
References: <1339093928-17545-1-git-send-email-mikedunn@newsguy.com>
 <20120610145004.702d24d7@pixies.home.jungo.com>
 <CAN8TOE_JVZYnVqAL=63ErnUHxdREjQw6EMZNNTm6h=jeyG9=6A@mail.gmail.com>
In-Reply-To: <CAN8TOE_JVZYnVqAL=63ErnUHxdREjQw6EMZNNTm6h=jeyG9=6A@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/10/2012 10:45 PM, Brian Norris wrote:
> 
> On Sun, Jun 10, 2012 at 4:50 AM, Shmulik Ladkani
> <shmulik.ladkani@gmail.com> wrote:
>> On Thu,  7 Jun 2012 11:32:08 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
>>> Ignore ecc errors in the scan_read_raw_oob() function.  Also removed code that
>>> is now redundant.
>>>
>>> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>
>>> ---
>>>  drivers/mtd/nand/nand_bbt.c |    6 +++---
>>>  1 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
>>> index 30d1319..585da44 100644
>>> --- a/drivers/mtd/nand/nand_bbt.c
>>> +++ b/drivers/mtd/nand/nand_bbt.c
>>> @@ -319,7 +319,8 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
>>>
>>>               res = mtd_read_oob(mtd, offs, &ops);
>>>
>>> -             if (res)
>>> +             /* Ignore ECC errors when checking for BBM */
>>> +             if (res && !mtd_is_bitflip_or_eccerr(res))
>>>                       return res;
>>
>> IMO this is not necessary.
>> Note the 'ops.mode' is initialized to MTD_OPS_RAW;  meaning, no ECC is
>> performed during read ('ecc.read_page_raw' will be invoked).
>> Thus, EUCLEAN/EBADMSG should not be reported.
>> Am I missing something here?
> 
> Shmulik is correct. A check for bitflips on a MTD_OPS_RAW operation is
> unnecessary.


Yes, I missed the ops mode raw.  Obviously my analysis was wrong.

Good that nand_bbt is getting cleaned up some.

Thanks again Brian and Shmulik.

Mike
