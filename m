Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cnICa-0002Ns-LZ
 for linux-mtd@lists.infradead.org; Mon, 13 Mar 2017 05:07:26 +0000
Received: by mail-wm0-x242.google.com with SMTP id z63so7951850wmg.2
 for <linux-mtd@lists.infradead.org>; Sun, 12 Mar 2017 22:07:02 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: Fix mtdblock for >4GB MTD devices
To: lepton <ytht.net@gmail.com>
References: <20170222021558.710-1-ytht.net@gmail.com>
 <254c5202-64cd-ddae-2e76-8db6a4486b80@gmail.com>
 <CALqoU4xRhjFY7=qz1toJsJff8rsZn+vS7gpb0C2Lp++_Rt3BHg@mail.gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 boris.brezillon@free-electrons.com, richard@nod.at,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f0a93340-728e-853b-4822-732c41074891@gmail.com>
Date: Mon, 13 Mar 2017 06:07:00 +0100
MIME-Version: 1.0
In-Reply-To: <CALqoU4xRhjFY7=qz1toJsJff8rsZn+vS7gpb0C2Lp++_Rt3BHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/01/2017 05:14 AM, lepton wrote:
> If checking some calling side,  the len is from cache_size of struct
> mtdblk_dev, it's defined as unsigned int now. So it's not 64bit yet.

Ummm ... since you're top-posting, I have no clue which part do you
refer to , sorry.

> BTW, seems it's just block size (512) at some other calling side.
> 
> (Sorry for previous same content email, just found out it's html
> format and rejected by mail list)
> 
> On Mon, Feb 27, 2017 at 1:31 AM, Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 02/22/2017 03:15 AM, Lepton Wu wrote:
>>> Change to use loff_t instead of unsigned long in some functions
>>> to make sure mtdblock can handle offset bigger than 4G in 32 bits mode.
>>>
>>> Signed-off-by: Lepton Wu <ytht.net@gmail.com>
>>> ---
>>>  Changes in v2:
>>>   - Make the commit message more clearer and fix some format issues.
>>>
>>>  drivers/mtd/mtdblock.c    | 35 ++++++++++++++++++-----------------
>>>  drivers/mtd/mtdblock_ro.c |  4 ++--
>>>  2 files changed, 20 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
>>> index bb4c14f83c75..373c0edca803 100644
>>> --- a/drivers/mtd/mtdblock.c
>>> +++ b/drivers/mtd/mtdblock.c
>>> @@ -61,8 +61,8 @@ static void erase_callback(struct erase_info *done)
>>>       wake_up(wait_q);
>>>  }
>>>
>>> -static int erase_write (struct mtd_info *mtd, unsigned long pos,
>>> -                     int len, const char *buf)
>>> +static int erase_write(struct mtd_info *mtd, loff_t pos, int len,
>>> +                    const char *buf)
>>
>> Can the length be 64bit too now ?
>>
>> [...]
>>
>> --
>> Best regards,
>> Marek Vasut


-- 
Best regards,
Marek Vasut
