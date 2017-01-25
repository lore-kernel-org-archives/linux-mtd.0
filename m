Received: from mail-ua0-f193.google.com ([209.85.217.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWH7G-0004Uw-LL
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 06:31:36 +0000
Received: by mail-ua0-f193.google.com with SMTP id i68so18351260uad.1
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jan 2017 22:31:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <62931580-f21f-e6a1-8e8b-d3c92195a2e0@denx.de>
References: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
 <3e1f1c8e-4a87-e186-20cb-2ba784bd58d5@denx.de>
 <CAOMqctT-JMczFR4yZ0Ncy8f41aH-inOjaw8HoJv2MmSWM-AhSA@mail.gmail.com>
 <06d8264e-5ddb-aa76-a83e-4c2c3af42f08@denx.de>
 <CAC=U0a1ESxC__PBOjW5L6AE3W5ebs8tMf1T1P1cuDzgFzWdxbA@mail.gmail.com>
 <62931580-f21f-e6a1-8e8b-d3c92195a2e0@denx.de>
From: Michal Suchanek <hramrach@gmail.com>
Date: Wed, 25 Jan 2017 07:29:31 +0100
Message-ID: <CAOMqctS_izeoNJyN_7N=dmGMmvA8bpiqvmhQT2OmPR0H7btcXg@mail.gmail.com>
Subject: Re: [PATCH,
 1/2] mtd: m25p80: Let m25p80_read() fallback to spi transfer
To: Marek Vasut <marex@denx.de>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Brown <broonie@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25 January 2017 at 03:08, Marek Vasut <marex@denx.de> wrote:
> On 01/24/2017 12:41 AM, Kamal Dasu wrote:
>> "ret can never be > 0 , it is only 0 or negative "
>>
>> I can fix this.
>>
>>>>> This looks really fragile and special-casing EINVAL here doesn't scale.
>>>>> But still, if your controller driver is buggy, fix the driver, do not
>>>>> pollute core code with workarounds. If you do support this sort of
>>>>> accelerated read and it fails, it means something is seriously wrong.
>>>>> If you need to invoke regular SPI reads to complete under some obscure
>>>>> circumstances, do it from the driver, not here.
>>>>
>>>> I guess the other half of m25p80_read can be factored out and used as
>>>> fallback from either m25p80_read or the controller driver.
>>>
>>> I think I see what you mean, but care to show an RFC patch ?
>>>
>>> --
>>
>> Its not the controller driver, but he hardware limitation with older
>> controller version. I have tried to see how I can do this better,
>> however when spi_flash_read() is called  cannot handle it within my
>> driver without returning from the function. I went over this with Mark
>> previously and this current solution seemed reasonable. Any other
>> solution outside of the generic driver would replicate a lot of code
>> unnecessarily.
>
> Hmmm, I kinda see the problem. I was thinking splitting the m25p80_read
> function could be the solution and invoking the second part from the
> driver if applicable, but this cannot work because the driver does not
> know when it's interacting with SPI NOR and when with something else .
>
> Can you tell me about the conditions under which the bcm controller
> fails and should fall back to standard spi read ?

spi_flash_read is designed to perform what m25p80_read does in a
controller-specific way. So how can you get to a point when you are
in spi_flash_read, it fails, and you do not know you if you can call
the bottom half of m25p80_read to finish the job?

Thanks

Michal
