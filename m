Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYFUf-00017v-8i
 for linux-mtd@lists.infradead.org; Mon, 30 Jan 2017 17:11:55 +0000
Received: by mail-qk0-x243.google.com with SMTP id e1so19843594qkh.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Jan 2017 09:11:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ae95a543-65cf-9e4b-ddc7-c5e60af11b3d@ti.com>
References: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
 <3e1f1c8e-4a87-e186-20cb-2ba784bd58d5@denx.de>
 <CAOMqctT-JMczFR4yZ0Ncy8f41aH-inOjaw8HoJv2MmSWM-AhSA@mail.gmail.com>
 <06d8264e-5ddb-aa76-a83e-4c2c3af42f08@denx.de>
 <CAC=U0a1ESxC__PBOjW5L6AE3W5ebs8tMf1T1P1cuDzgFzWdxbA@mail.gmail.com>
 <62931580-f21f-e6a1-8e8b-d3c92195a2e0@denx.de>
 <CAC=U0a3mhruPtHA-1y08noS_Vq1y2KrBYiEM-GbpwLn_Eou7=A@mail.gmail.com>
 <ae95a543-65cf-9e4b-ddc7-c5e60af11b3d@ti.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Mon, 30 Jan 2017 12:11:31 -0500
Message-ID: <CAC=U0a3-5iKmViKhCKGdhRA-9fnnt+rP-BsJeaE3YaOdJ-4U6g@mail.gmail.com>
Subject: Re: [PATCH,
 1/2] mtd: m25p80: Let m25p80_read() fallback to spi transfer
To: "R, Vignesh" <vigneshr@ti.com>
Cc: Marek Vasut <marex@denx.de>, Florian Fainelli <f.fainelli@gmail.com>,
 Mark Brown <broonie@kernel.org>, Michal Suchanek <hramrach@gmail.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 29, 2017 at 6:16 AM, R, Vignesh <vigneshr@ti.com> wrote:
>
>
> On 1/25/2017 9:58 PM, Kamal Dasu wrote:
>> If the transfers are short and dest buffer or the flash address are
>> unaligned.
>
> How about using using bounce buffer here? Using bounce buffer and doing
> double copy might still be faster than PIO.
>
>> Also in case of older version of the controller there are
>> some address mapping limitations when a transfer crosses 4MB window
>> (addr + len).  So in such cases  need to fallback to normal MSPI
>> reads.
>>
>
> At least, this can be handled by breaking transfers and handle what
> falls within 4MB range. And then update msg.retlen equal to number of
> bytes read.
>

 I did give a thought that idea as well. In bcm driver  these are just
exception and a rare cases mostly with tests that issue short reads
like mtd_debug read etc. So I think I will go for reverting to mspi
reads using existing framework. Its easier this way. So will go with
Marek's suggestion.

> Regards
> Vignesh
>
Thanks
Kamal
>
>> One other option is that controller divers implementation of
>> bcm_qspi_spi_flash_read() can return msg.retlen = 0 and the
>> m25p80_read() can fallback to normal mspi read.
>>
>> Kamal
>>
>>
>>
>> On Tue, Jan 24, 2017 at 9:08 PM, Marek Vasut <marex@denx.de> wrote:
>>> On 01/24/2017 12:41 AM, Kamal Dasu wrote:
>>>> "ret can never be > 0 , it is only 0 or negative "
>>>>
>>>> I can fix this.
>>>>
>>>>>>> This looks really fragile and special-casing EINVAL here doesn't scale.
>>>>>>> But still, if your controller driver is buggy, fix the driver, do not
>>>>>>> pollute core code with workarounds. If you do support this sort of
>>>>>>> accelerated read and it fails, it means something is seriously wrong.
>>>>>>> If you need to invoke regular SPI reads to complete under some obscure
>>>>>>> circumstances, do it from the driver, not here.
>>>>>>
>>>>>> I guess the other half of m25p80_read can be factored out and used as
>>>>>> fallback from either m25p80_read or the controller driver.
>>>>>
>>>>> I think I see what you mean, but care to show an RFC patch ?
>>>>>
>>>>> --
>>>>
>>>> Its not the controller driver, but he hardware limitation with older
>>>> controller version. I have tried to see how I can do this better,
>>>> however when spi_flash_read() is called  cannot handle it within my
>>>> driver without returning from the function. I went over this with Mark
>>>> previously and this current solution seemed reasonable. Any other
>>>> solution outside of the generic driver would replicate a lot of code
>>>> unnecessarily.
>>>
>>> Hmmm, I kinda see the problem. I was thinking splitting the m25p80_read
>>> function could be the solution and invoking the second part from the
>>> driver if applicable, but this cannot work because the driver does not
>>> know when it's interacting with SPI NOR and when with something else .
>>>
>>> Can you tell me about the conditions under which the bcm controller
>>> fails and should fall back to standard spi read ?
>>>
>>> --
>>> Best regards,
>>> Marek Vasut
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>
> --
> Regards
> Vignesh
