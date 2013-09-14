Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VKuSB-0007cw-C6
 for linux-mtd@lists.infradead.org; Sat, 14 Sep 2013 18:20:20 +0000
Received: by mail-pd0-f172.google.com with SMTP id z10so2532737pdj.17
 for <linux-mtd@lists.infradead.org>; Sat, 14 Sep 2013 11:19:56 -0700 (PDT)
Message-ID: <5234A8CA.5050505@gmail.com>
Date: Sat, 14 Sep 2013 11:19:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxpart: detect Squashfs partition
References: <1379090297-2880-1-git-send-email-zajec5@gmail.com>
 <20130913185610.GG4550@ld-irv-0074.broadcom.com>
 <CACna6rwXxZMzd0CyvS2tEvtJhcB3F7kyVu6BerLgjLW8nHuEnw@mail.gmail.com>
In-Reply-To: <CACna6rwXxZMzd0CyvS2tEvtJhcB3F7kyVu6BerLgjLW8nHuEnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/13/2013 01:02 PM, Rafał Miłecki wrote:
> 2013/9/13 Brian Norris <computersforpeace@gmail.com>:
>> On Fri, Sep 13, 2013 at 06:38:17PM +0200, Rafał Miłecki wrote:
>>>
>>> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
>>> ---
>>>   drivers/mtd/bcm47xxpart.c |    8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
>>> index 9279a91..96f821a 100644
>>> --- a/drivers/mtd/bcm47xxpart.c
>>> +++ b/drivers/mtd/bcm47xxpart.c
>>> @@ -32,6 +32,7 @@
>>>   #define ML_MAGIC1                    0x39685a42
>>>   #define ML_MAGIC2                    0x26594131
>>>   #define TRX_MAGIC                    0x30524448
>>> +#define SQSH_MAGIC                   0x71736873      /* shsq */
>>
>> s/shsq/sqsh/
>>
>> Or really, the "sqsh" comment doesn't add much to the SQSH_MAGIC macro.
>> Maybe this instead?
>>
>> s/shsq/SquashFS/
>
> This is really a "shsq". If you read 0x71736873 in LE, you get:
> 1) 0x73 (s)
> 2) 0x68 (h)
> 3) 0x73 (s)
> 4) 0x71 (q)
>
> This is way I put the comment. To underline that this is a "shsq" in
> LE, that means SQSH (SQuaSHfs).

I see, my bad. That's still a weird magic (not your fault), as it's not 
really LE in the traditional (byte atomic) sense, but little endian with 
16-bit atoms.

Brian
