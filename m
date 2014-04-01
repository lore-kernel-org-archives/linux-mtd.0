Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV6xu-0007EO-1S
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 22:15:30 +0000
Received: by mail-pb0-f43.google.com with SMTP id um1so10502457pbc.16
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 15:15:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140331165642.GE29542@ld-irv-0074>
References: <1394904668-22978-1-git-send-email-ron@debian.org>
 <1394904668-22978-2-git-send-email-ron@debian.org>
 <20140331165642.GE29542@ld-irv-0074>
From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 1 Apr 2014 15:14:24 -0700
Message-ID: <CAGVrzcadyo5S3YOTQnMzijjcBM+9qM3tihARU2ur7JV_nmeFpQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Fix index regression in nand_read_subpage
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Ron <ron@debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

2014-03-31 9:56 GMT-07:00 Brian Norris <computersforpeace@gmail.com>:
> + Florian
>
> (FYI Ron: 3 of your emails were filtered as spam in my mailbox, for some
> reason. I only pass over my spam mailbox every once in a few weeks; I
> only noticed this because of your IRC ping!)

BTW, you will need to sign-off on these patches using your full name.
Your patch does look good to me. Thanks!

>
> On Sun, Mar 16, 2014 at 04:01:07AM +1030, Ron wrote:
>> Commit 7351d3a5dbf42ba3299af71db3296be447bc1516 added an index variable
>> as part of fixing checkpatch warnings, presumably as a tool to make some
>> long lines shorter, however it only set that index in the case of there
>> being no gaps in eccpos for the fragment being read.  Which means the
>> later step of filling ecccode from oob_poi will use the wrong indexing
>> into eccpos in that case.
>>
>> This patch restores the behaviour that existed prior to that change.
>>
>> Signed-off-by: Ron <ron@debian.org>
>> ---
>>  drivers/mtd/nand/nand_base.c |    5 ++---
>>  1 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 9715a7b..be23dff 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -1170,13 +1170,14 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
>>       int data_col_addr, i, gaps = 0;
>>       int datafrag_len, eccfrag_len, aligned_len, aligned_pos;
>>       int busw = (chip->options & NAND_BUSWIDTH_16) ? 2 : 1;
>> -     int index = 0;
>> +     int index;
>>       unsigned int max_bitflips = 0;
>>
>>       /* Column address within the page aligned to ECC size (256bytes) */
>>       start_step = data_offs / chip->ecc.size;
>>       end_step = (data_offs + readlen - 1) / chip->ecc.size;
>>       num_steps = end_step - start_step + 1;
>> +     index = start_step * chip->ecc.bytes;
>>
>>       /* Data size aligned to ECC ecc.size */
>>       datafrag_len = num_steps * chip->ecc.size;
>> @@ -1213,8 +1214,6 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
>>                * Send the command to read the particular ECC bytes take care
>>                * about buswidth alignment in read_buf.
>>                */
>> -             index = start_step * chip->ecc.bytes;
>> -
>>               aligned_pos = eccpos[index] & ~(busw - 1);
>>               aligned_len = eccfrag_len;
>>               if (eccpos[index] & (busw - 1))
>> --
>> 1.7.2.5
>>



-- 
Florian
