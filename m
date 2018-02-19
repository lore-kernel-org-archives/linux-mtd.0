Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enj74-0007xs-KF
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 10:56:04 +0000
Received: by mail-ot0-x242.google.com with SMTP id q9so8115819oti.0
 for <linux-mtd@lists.infradead.org>; Mon, 19 Feb 2018 02:55:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <93fd5120-28c6-96c7-4a0d-a4bd065f5ae6@lechnology.com>
References: <20180216164712.25898-1-brgl@bgdev.pl>
 <20180216164712.25898-2-brgl@bgdev.pl>
 <20180216201923.16bfca7f@bbrezillon>
 <93fd5120-28c6-96c7-4a0d-a4bd065f5ae6@lechnology.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 Feb 2018 11:55:50 +0100
Message-ID: <CAMRc=MeR6-kXR1+fqwH+h6FosYsdmG0z5eVrAx4Z93zB9isc0A@mail.gmail.com>
Subject: Re: [PATCH 1/6] nand: davinci: rename the platform driver
To: David Lechner <david@lechnology.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2018-02-16 20:22 GMT+01:00 David Lechner <david@lechnology.com>:
> On 02/16/2018 01:19 PM, Boris Brezillon wrote:
>>
>> On Fri, 16 Feb 2018 17:47:07 +0100
>> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>
>>> Commit d8e22fb4ccac ("ARM: da850: add the nand dev_id to the clock
>>> lookup table") broke the nand support in board file mode for
>>> da850-based boards. Instead of reverting it and breaking the DT users
>>> in the process (due to clock lookup), rename the driver to match the
>>> clock table before renaming the users.
>>>
>>> Fixes: d8e22fb4ccac ("ARM: da850: add the nand dev_id to the clock lookup
>>> table")
>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>> ---
>>>   drivers/mtd/nand/davinci_nand.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/nand/davinci_nand.c
>>> b/drivers/mtd/nand/davinci_nand.c
>>> index ccc8c43abcff..4fb143bf1872 100644
>>> --- a/drivers/mtd/nand/davinci_nand.c
>>> +++ b/drivers/mtd/nand/davinci_nand.c
>>> @@ -865,7 +865,7 @@ static struct platform_driver nand_davinci_driver = {
>>>         .probe          = nand_davinci_probe,
>>>         .remove         = nand_davinci_remove,
>>>         .driver         = {
>>> -               .name   = "davinci_nand",
>>> +               .name   = "davinci-nand",
>>
>>
>> Another side-effect of this change you should be aware of: by doing
>> that you also break all users that were defining partitions through the
>> cmdline using mtdparts=davinci_nand.0:<part-layout>.
>>
>> Not sure this is a good idea ;-).
>
>
> Also, once we move to the common clock framework, the AUXDATA that causes
> the DT clock lookup breakage you are trying to avoid will go away, so that
> won't be a reason for changing this either.
>
>

Ok, let's wait for v7 of your series then and reiterate this one.

Best regards,
Bartosz Golaszewski
