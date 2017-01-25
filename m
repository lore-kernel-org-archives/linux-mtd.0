Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWU1m-0000TU-Vc
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 20:18:49 +0000
Subject: Re: [PATCH, 1/2] mtd: m25p80: Let m25p80_read() fallback to spi
 transfer
To: Kamal Dasu <kamal.dasu@broadcom.com>
References: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
 <3e1f1c8e-4a87-e186-20cb-2ba784bd58d5@denx.de>
 <CAOMqctT-JMczFR4yZ0Ncy8f41aH-inOjaw8HoJv2MmSWM-AhSA@mail.gmail.com>
 <06d8264e-5ddb-aa76-a83e-4c2c3af42f08@denx.de>
 <CAC=U0a1ESxC__PBOjW5L6AE3W5ebs8tMf1T1P1cuDzgFzWdxbA@mail.gmail.com>
 <62931580-f21f-e6a1-8e8b-d3c92195a2e0@denx.de>
 <CAC=U0a3mhruPtHA-1y08noS_Vq1y2KrBYiEM-GbpwLn_Eou7=A@mail.gmail.com>
 <d38d4ee1-d222-9ebe-6432-f4b6167f80e2@denx.de>
 <CAKekbevaUdn4BCVh+XdP9tRZiUgm6OdfBjqn4sS_Umr4qV-u1g@mail.gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Mark Brown
 <broonie@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <ac8d3e78-863a-b42d-24fe-3913a51ddd39@denx.de>
Date: Wed, 25 Jan 2017 21:17:12 +0100
MIME-Version: 1.0
In-Reply-To: <CAKekbevaUdn4BCVh+XdP9tRZiUgm6OdfBjqn4sS_Umr4qV-u1g@mail.gmail.com>
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

On 01/25/2017 06:10 PM, Kamal Dasu wrote:
> On Wed, Jan 25, 2017 at 11:39 AM, Marek Vasut <marex@denx.de> wrote:
>> On 01/25/2017 05:28 PM, Kamal Dasu wrote:
>>> If the transfers are short and dest buffer or the flash address are
>>> unaligned.
>>
>> That sounds like a DMA problem where you're trying to fall back to PIO ?
>>
>>> Also in case of older version of the controller there are
>>> some address mapping limitations when a transfer crosses 4MB window
>>> (addr + len).  So in such cases  need to fallback to normal MSPI
>>> reads.
>>
>> But the driver can also detect this mode of failure before doing the
>> transfer and call it's internal functions to perform the transfer as
>> needed, right?
>>
>>> One other option is that controller divers implementation of
>>> bcm_qspi_spi_flash_read() can return msg.retlen = 0 and the
>>> m25p80_read() can fallback to normal mspi read.
>>
>> I'd much rather see the driver handling such detail internally instead
>> of patching the core code. Moreover, if you patch the core code, the SF
>> read will go - in case of a failure- all the way through the SPI
>> framework only to land in the same driver, which doesn't make much sense.
> 
> Yes this is how the code was  organized before when I was making
> initial commits. However I had to change it so that spi_flash_read()
> can be exploited based on the review comments.

This is OK, using spi_flash_read() is no problem.

> I was  handling code
> internally using spi generic msg handling code for mspi transfer
> fallback, but I was told that this code did not belong in the
> controller driver. Hence the current implementation is geared towards
> using spi transfer_one() in case of mspi transfers, without bothering
> with how the messages are formed and pumped by the spi layer. If I
> reorganize I am back to where I was before. Yes the code lands in the
> same driver but it returns back to the m25p80 and uses the  normal
> mspi reads.

Another option would be to split bcm_qspi_transfer_one into function
which does the actual CS manipulation and data transfer AND the SPI
interface shim , then invoke the data transfer bit from
bcm_qspi_flash_read () in case mspi_read = true , no ?

>> btw please do NOT top-post:
>> http://www.arm.linux.org.uk/mailinglists/etiquette.php#e3
>>
> 
> Sorry about that, I will make sure from this point forward I do not top-post.
> 
>>> Kamal
>>>
>>>
>>>
>>> On Tue, Jan 24, 2017 at 9:08 PM, Marek Vasut <marex@denx.de> wrote:
>>>> On 01/24/2017 12:41 AM, Kamal Dasu wrote:
>>>>> "ret can never be > 0 , it is only 0 or negative "
>>>>>
>>>>> I can fix this.
>>>>>
>>>>>>>> This looks really fragile and special-casing EINVAL here doesn't scale.
>>>>>>>> But still, if your controller driver is buggy, fix the driver, do not
>>>>>>>> pollute core code with workarounds. If you do support this sort of
>>>>>>>> accelerated read and it fails, it means something is seriously wrong.
>>>>>>>> If you need to invoke regular SPI reads to complete under some obscure
>>>>>>>> circumstances, do it from the driver, not here.
>>>>>>>
>>>>>>> I guess the other half of m25p80_read can be factored out and used as
>>>>>>> fallback from either m25p80_read or the controller driver.
>>>>>>
>>>>>> I think I see what you mean, but care to show an RFC patch ?
>>>>>>
>>>>>> --
>>>>>
>>>>> Its not the controller driver, but he hardware limitation with older
>>>>> controller version. I have tried to see how I can do this better,
>>>>> however when spi_flash_read() is called  cannot handle it within my
>>>>> driver without returning from the function. I went over this with Mark
>>>>> previously and this current solution seemed reasonable. Any other
>>>>> solution outside of the generic driver would replicate a lot of code
>>>>> unnecessarily.
>>>>
>>>> Hmmm, I kinda see the problem. I was thinking splitting the m25p80_read
>>>> function could be the solution and invoking the second part from the
>>>> driver if applicable, but this cannot work because the driver does not
>>>> know when it's interacting with SPI NOR and when with something else .
>>>>
>>>> Can you tell me about the conditions under which the bcm controller
>>>> fails and should fall back to standard spi read ?
>>>>
>>>> --
>>>> Best regards,
>>>> Marek Vasut
>>
>>
>> --
>> Best regards,
>> Marek Vasut


-- 
Best regards,
Marek Vasut
