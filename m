Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1xQg-0004T8-NQ
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 10:35:55 +0000
Received: by lagu2 with SMTP id u2so1275155lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2012 03:35:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120816112507.01b7c0f0@pixies.home.jungo.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-4-git-send-email-richard.genoud@gmail.com>
 <1345043331.3393.151.camel@sauron.fi.intel.com>
 <20120816112507.01b7c0f0@pixies.home.jungo.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 16 Aug 2012 12:35:23 +0200
Message-ID: <CACQ1gAi+dDFBrLM0-cVAsFu6_7B3=ij9Lqm3W+SHCxTRSE9kww@mail.gmail.com>
Subject: Re: [PATCH 3/4] UBI: use the whole MTD device size to get
 bad_peb_limit
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/16 Shmulik Ladkani <shmulik.ladkani@gmail.com>:
> Hi Artem, Richard,
>
> On Wed, 15 Aug 2012 18:08:51 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> 1. Invalid blocks are block that contain one or more bad bits beyond
>> ECC.
>
> I would remove this one sentence from the log, it is misleading; invalid
> blocks are not necessarily related to ECC.
I agree (even if this sentence is from a nand datasheet !)

>
>>               if (CONFIG_MTD_UBI_BEB_LIMIT > 0) {
>> -                     int percent = CONFIG_MTD_UBI_BEB_LIMIT;
>> -                     int limit = mult_frac(ubi->peb_count, percent, 100);
>> +                     int per1024 = CONFIG_MTD_UBI_BEB_LIMIT;
>> +                     int limit, device_pebs;
>> +                     uint64_t device_size;
>> +
>> +                     /*
>> +                      * Here we are using size of the entire flash chip and
>> +                      * not just the MTD partition size because the maximum
>> +                      * number of bad eraseblocks is a percentage of the
>> +                      * whole device and bad eraseblocks are not fairly
>> +                      * distributed over the flash chip. So the worst case
>> +                      * is that all the bad eraseblocks of the chip are in
>> +                      * the MTD partition we are attaching (ubi->mtd).
>> +                      */
>> +                     device_size = mtd_get_device_size(ubi->mtd);
>> +                     device_pebs = mtd_div_by_eb(device_size, ubi->mtd);
>> +                     limit = mult_frac(device_pebs, per1024, 1024);
>>
>>                       /* Round it up */
>> -                     if (mult_frac(limit, 100, percent) < ubi->peb_count)
>> +                     if (mult_frac(limit, 1024, per1024) < ubi->peb_count)
>
> Oops... should be:
>
> +                       if (mult_frac(limit, 1024, per1024) < device_pebs)
>
> Regards,
> Shmulik
Ok, I'll change that, may be in a separate patch, as it's a bug fix.
I'll add your signoff.

thanks !


-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
