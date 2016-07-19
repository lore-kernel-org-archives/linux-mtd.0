Received: from mail-yw0-x242.google.com ([2607:f8b0:4002:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPa4A-0003IK-TU
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 18:48:27 +0000
Received: by mail-yw0-x242.google.com with SMTP id j12so1250510ywb.1
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jul 2016 11:48:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160719183047.GC85399@google.com>
References: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
 <1468942904-26464-2-git-send-email-andrew.smirnov@gmail.com>
 <20160719183047.GC85399@google.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 19 Jul 2016 11:48:04 -0700
Message-ID: <CAHQ1cqHJK-EYB_P4Vzeze8x7hHGfb6mzHrBWqSu1HOhj0KmBvQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: Get rid of needless 'goto'
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 19, 2016 at 11:30 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Jul 19, 2016 at 08:41:44AM -0700, Andrey Smirnov wrote:
>> Using "goto" in that "switch" statement only makes it harder to follow
>> control flow and doesn't bring any advantages. Rewrite the code to avoid
>> using "goto".
>>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  drivers/mtd/nand/nand_base.c | 13 +++++--------
>>  1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 57043a6..8fa5536 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -2139,18 +2139,15 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
>>       case MTD_OPS_PLACE_OOB:
>>       case MTD_OPS_AUTO_OOB:
>>       case MTD_OPS_RAW:
>> +             if (!ops->datbuf)
>> +                     ret = nand_do_read_oob(mtd, from, ops);
>> +             else
>> +                     ret = nand_do_read_ops(mtd, from, ops);
>>               break;
>> -
>>       default:
>> -             goto out;
>> +             break;
>>       }
>>
>> -     if (!ops->datbuf)
>> -             ret = nand_do_read_oob(mtd, from, ops);
>> -     else
>> -             ret = nand_do_read_ops(mtd, from, ops);
>> -
>> -out:
>>       nand_release_device(mtd);
>>       return ret;
>>  }
>
> The default case is really just a catch-all error case. We don't
> actually even need the nand_get_device() call for that... can we just
> do this instead?

Sure, although, if you don't mind, I'd rather you used:

if (ops->mode != MTD_OPS_PLACE_OOB &&
    ops->mode != MTD_OPS_AUTO_OOB &&
    ops->mode != MTD_OPS_RAW)
       return -ENOTSUPP;

instead of the switch statement, IMHO, this way it is more obvious
that this codepath is just arguments correctness checking.

Andrey
