Received: from mail-yh0-x22d.google.com ([2607:f8b0:4002:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8wvh-0002Fq-DE
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 20:10:10 +0000
Received: by mail-yh0-f45.google.com with SMTP id f10so973750yha.32
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 12:09:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150107195244.GB18978@salidar.dom.custoft.eu>
References: <1420394662-20011-1-git-send-email-me@mortis.eu>
 <CAHp75VeZnmsRLV6_gg9Wci03ZEJCk=dRDEkp7DsEubypVvCi3A@mail.gmail.com>
 <20150107195244.GB18978@salidar.dom.custoft.eu>
Date: Wed, 7 Jan 2015 22:09:47 +0200
Message-ID: <CAHp75VeLMaqkTi7kysOZf1a+cqts7nfZPCn=UKR1ysREk_0S_g@mail.gmail.com>
Subject: Re: [PATCH] Fix error-code overwrite bug
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Giel van Schijndel <me@mortis.eu>
Content-Type: text/plain; charset=UTF-8
Cc: "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 7, 2015 at 9:52 PM, Giel van Schijndel <me@mortis.eu> wrote:
> On Wed, Jan 07, 2015 at 20:37:29 +0200, Andy Shevchenko wrote:
>> On Sun, Jan 4, 2015 at 8:04 PM, Giel van Schijndel <me@mortis.eu> wrote:
>>> Don't overwrite the returned error code with the boolean test used by
>>> the if-statement (otherwise it'd be 1 or 0 always, 1 in the if-block).
>>> ---
>>>  drivers/mtd/nftlmount.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/nftlmount.c b/drivers/mtd/nftlmount.c
>>> index 51b9d6a..1cbeb6b 100644
>>> --- a/drivers/mtd/nftlmount.c
>>> +++ b/drivers/mtd/nftlmount.c
>>> @@ -91,7 +91,7 @@ static int find_boot_record(struct NFTLrecord *nftl)
>>>                 /* To be safer with BIOS, also use erase mark as discriminant */
>>>                 if ((ret = nftl_read_oob(mtd, block * nftl->EraseSize +
>>>                                          SECTORSIZE + 8, 8, &retlen,
>>> -                                        (char *)&h1) < 0)) {
>>> +                                        (char *)&h1)) < 0) {
>>
>> Better to move ret = x(); outside of condition. See here:
>> http://permalink.gmane.org/gmane.linux.drivers.mtd/56922
>
> In the sense that this bug wouldn't have occurred when using separate
> assignment and condition checking you're right. It's a style issue
> though, but a relevant one.
>
> So your approach is probably better, though incomplete (like mine), just
> look for the exact same (ret = x() < 0) pattern about 20 lines further
> down the same file. (Yes that's disabled code, but I still believe the
> bug should be fixed considering it's exactly the same class of bug).
>
> So I suggest you resend that ^^ patch you link to with a fix for the
> other instance of the bug fixed as well.

Sounds reasonable. Will do.


-- 
With Best Regards,
Andy Shevchenko
