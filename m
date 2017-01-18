Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTqen-0006tJ-OC
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2017 13:52:11 +0000
Received: by mail-wm0-x241.google.com with SMTP id d140so4255795wmd.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2017 05:51:48 -0800 (PST)
Subject: Re: [PATCH v3] mtd: spi-nor: add dt support for Everspin MRAMs
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
 <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
 <CACna6rwSZH8697px46KitcsFTROhqAQa2Cm2-RCTH=L_5nQFYg@mail.gmail.com>
 <82a0b0f7-a94b-70b5-1a5e-e5c04943a684@atmel.com>
 <CACna6rz_g+N2rs=O-QRAka_BVMiMXhmC+O5KgeZJFmCe8bf1jQ@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jagan Teki <jagan@openedev.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4276ee3d-c922-e02c-4fa0-4f903db988cc@gmail.com>
Date: Wed, 18 Jan 2017 14:51:43 +0100
MIME-Version: 1.0
In-Reply-To: <CACna6rz_g+N2rs=O-QRAka_BVMiMXhmC+O5KgeZJFmCe8bf1jQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/17/2017 04:49 PM, Rafał Miłecki wrote:
> On 17 January 2017 at 14:57, Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
>> Le 17/01/2017 à 14:16, Rafał Miłecki a écrit :
>>> On 17 January 2017 at 12:03, Uwe Kleine-König
>>> <u.kleine-koenig@pengutronix.de> wrote:
>>>> The MR25 family doesn't support JEDEC, so they need explicit mentioning
>>>> in the list of supported spi IDs. This makes it possible to add these
>>>> using for example:
>>>>
>>>>         compatible = "everspin,mr25h40";
>>>
>>> (...)
>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>>> index 2c91c03e7eb0..3e920ec5c4d3 100644
>>>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
>>>> @@ -14,6 +14,8 @@ Required properties:
>>>>                   at25df641
>>>>                   at26df081a
>>>>                   mr25h256
>>>> +                 mr25h10
>>>> +                 mr25h40
>>>>                   mx25l4005a
>>>>                   mx25l1606e
>>>>                   mx25l6405d
>>>
>>> Uh, this is getting a never-ending-story...
>>> If these chipsets don't support JEDEC, should we keep them in jedec,spi-nor.txt?
>>>
>>
>> Maybe not but I think the new compatible strings should be documented
>> somewhere. Currently jedec,spi-nor.txt already documents all the
>> "m25p*-nonjedec" memories. So maybe just renaming the jedec,spi-nor.txt
>> file into spi-nor.txt or mtd,spi-nor.txt could be a solution. Otherwise, we
>> can let it as is. I have no idea of what would be the best solution.
>>
>> To be honest, I don't always fully understand the DT policy/philosophy and
>> its requirements. I just thought when a new property or a new value is
>> introduced it has to be documented.
>> Generally speaking, when DT is involved in some series of patches, it often
>> generates many discussions about the proper way to do thinks and about
>> choosing the best between many technically functional solutions.
>>
>> If you think jedec,spi-nor.txt is not suited to document the new value for
>> the compatible string, why not, I perfectly understand your point.
>>
>> I don't mind choosing another way. I just want to be sure that, if not all,
>> most of people agree on that solution and if possible, it is compliant with
>> DT policy so everybody is happy and works together.
>> That's why I involve DT people, even if it's a small detail, so they can
>> advise us.
>>
>> Anyway, at some point we have to take a decision to carry on thinks.
>> So actually, I would like to avoid a never-ending story :)
> 
> Sounds OK to me, I'm not DT expert though ;)

So ok, we already have a few non-jedec bindings documented in
jedec,spi-nor,text . Let's just apply this patch and if someone wants to
split the
binding document, patch is welcome. Good ?

-- 
Best regards,
Marek Vasut
