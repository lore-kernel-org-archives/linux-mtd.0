Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZPyK-0002Ma-M7
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 18:49:30 +0000
Message-ID: <52696B9A.4070505@ti.com>
Date: Fri, 25 Oct 2013 00:18:58 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/5] mtd: m25p80: remove M25PXX_USE_FAST_READ Kconfig
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <1382583503-13748-4-git-send-email-computersforpeace@gmail.com>
 <5268E35C.2030000@ti.com> <5268E495.5010707@ti.com>
 <20131024173912.GC20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131024173912.GC20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 24 October 2013 11:09 PM, Brian Norris wrote:
> On Thu, Oct 24, 2013 at 02:42:53PM +0530, Sourav Poddar wrote:
>> On Thursday 24 October 2013 02:37 PM, Sourav Poddar wrote:
>>> On Thursday 24 October 2013 08:28 AM, Brian Norris wrote:
>>>> --- a/drivers/mtd/devices/m25p80.c
>>>> +++ b/drivers/mtd/devices/m25p80.c
>>>> @@ -1055,13 +1055,14 @@ static int m25p_probe(struct spi_device *spi)
>>>>       flash->page_size = info->page_size;
>>>>       flash->mtd.writebufsize = flash->page_size;
>>>>
>>>> -    flash->fast_read = false;
>>>> -    if (np&&   of_property_read_bool(np, "m25p,fast-read"))
>>>> +    if (np)
>>>> +        /* If we were instantiated by DT, use it */
>>>> +        flash->fast_read = of_property_read_bool(np, "m25p,fast-read");
>>>> +    else
>>>> +        /* If we weren't instantiated by DT, default to fast-read */
>>>>           flash->fast_read = true;
>>>>
>>> This comment is in sync with my quad read mode support patch on
>>> the mtd list.
>>>
>>> Here, you are defaulting the fast read to be true.
> It was already default true for non-DT case where
> M25PXX_USE_FAST_READ=y. I believe my code is purely a refactoring of the
> code, assuming M25PXX_USE_FAST_READ is always enabled (and removing the
> Kconfig).
>
>>> Once I add quad mode
>>> on top of this, I will set flash->quad_read = true. So, we will have both
>>> fast and quad read set(which will not be correct). So, it is
>>> necessary to default to fast read ?
> I think my patch is a correct refactoring by itself. Any problem your
> quad read patch has with it would still be a problem without this patch.
>
True, my bad I didn't realise that for internal testing I disable
fast read option in menuconfig.
> So, without quad-read support, we should default to fast-read unless the
> chip doesn't support it. I think this is reasonable.
>
> Now, once you add quad-read, you need to have quad-read override
> fast-read.
>
>> Though, we will hit this scenario only for a non dt case. For dt
>> case, things will be fine.
> Yes, but we need to make sure things make sense for all cases.
>
Yes.
>>>> -#ifdef CONFIG_M25PXX_USE_FAST_READ
>>>> -    flash->fast_read = true;
>>>> -#endif
>>>> +    /* Some devices cannot do fast-read, no matter what DT tells us */
>>>>       if (info->flags&   M25P_NO_FR)
>>>>           flash->fast_read = false;
>>>>
> I just realized this: fast-read and quad-read are mutually exclusive, so
> the field that is currently 'bool m25p.fast_read' could easily just become
correct.
> an 'enum m25p.read_type' (with values M25P_READ_NORMAL, M25P_READ_FAST,
> M25P_READ_QUAD). That may or may not help your quad read patch.
>
> I can delay this patch until others have looked at it, if you'd like.
> You can resubmit your quad read patch without this patch 4. (But I think
> this patch will help clean up your patch slightly.)
Ok. I will include this patch and try to cleanup.
> Brian
