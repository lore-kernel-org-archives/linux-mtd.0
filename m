Received: from mail-vb0-f49.google.com ([209.85.212.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TIkSH-0003dB-RG
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2012 18:10:58 +0000
Received: by vbbfo1 with SMTP id fo1so5981564vbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 01 Oct 2012 11:10:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAH9JG2W4jVxrTQVwoLrnMmypcHhM5mfciyK=tvGmi+8i_L78vQ@mail.gmail.com>
References: <1348294351-27182-1-git-send-email-sachin.kamat@linaro.org>
 <CAH9JG2W4jVxrTQVwoLrnMmypcHhM5mfciyK=tvGmi+8i_L78vQ@mail.gmail.com>
Date: Mon, 1 Oct 2012 23:40:55 +0530
Message-ID: <CAK9yfHx=oYRmmceTWhvSBP+3yBQsdHTXE_WHebPKFYTwmXLjQg@mail.gmail.com>
Subject: Re: [PATCH] mtd: onenand: Make flexonenand_set_boundary static
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org, artem.bityutskiy@linux.intel.com,
 dedekind1@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Please line up this patch for 3.7.

On 22 September 2012 12:10, Kyungmin Park <kyungmin.park@samsung.com> wrote:
> On 9/22/12, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> Fixes the following sparse warning:
>> drivers/mtd/onenand/onenand_base.c:3697:5: warning:
>> symbol 'flexonenand_set_boundary' was not declared. Should it be static?
>>
>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  drivers/mtd/onenand/onenand_base.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/onenand/onenand_base.c
>> b/drivers/mtd/onenand/onenand_base.c
>> index 7153e0d..b3f41f2 100644
>> --- a/drivers/mtd/onenand/onenand_base.c
>> +++ b/drivers/mtd/onenand/onenand_base.c
>> @@ -3694,7 +3694,7 @@ static int flexonenand_check_blocks_erased(struct
>> mtd_info *mtd, int start, int
>>   * flexonenand_set_boundary  - Writes the SLC boundary
>>   * @param mtd                        - mtd info structure
>>   */
>> -int flexonenand_set_boundary(struct mtd_info *mtd, int die,
>> +static int flexonenand_set_boundary(struct mtd_info *mtd, int die,
>>                                   int boundary, int lock)
>>  {
>>       struct onenand_chip *this = mtd->priv;
>> --
>> 1.7.4.1
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>



-- 
With warm regards,
Sachin
