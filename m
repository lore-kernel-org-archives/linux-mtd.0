Received: from exsmtp01.microchip.com ([198.175.253.37]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWLTg-0000Yc-PD
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 11:11:02 +0000
Subject: Re: [PATCH, 1/2] mtd: m25p80: Let m25p80_read() fallback to spi
 transfer
To: Michal Suchanek <hramrach@gmail.com>, Marek Vasut <marex@denx.de>
References: <1484949023-2085-1-git-send-email-kdasu.kdev@gmail.com>
 <3e1f1c8e-4a87-e186-20cb-2ba784bd58d5@denx.de>
 <CAOMqctT-JMczFR4yZ0Ncy8f41aH-inOjaw8HoJv2MmSWM-AhSA@mail.gmail.com>
 <06d8264e-5ddb-aa76-a83e-4c2c3af42f08@denx.de>
 <CAC=U0a1ESxC__PBOjW5L6AE3W5ebs8tMf1T1P1cuDzgFzWdxbA@mail.gmail.com>
 <62931580-f21f-e6a1-8e8b-d3c92195a2e0@denx.de>
 <CAOMqctS_izeoNJyN_7N=dmGMmvA8bpiqvmhQT2OmPR0H7btcXg@mail.gmail.com>
CC: Kamal Dasu <kdasu.kdev@gmail.com>, Mark Brown <broonie@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Florian
 Fainelli <f.fainelli@gmail.com>, MTD Maling List
 <linux-mtd@lists.infradead.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <58938eae-1311-6b89-8629-aabba66bca1e@atmel.com>
Date: Wed, 25 Jan 2017 12:10:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAOMqctS_izeoNJyN_7N=dmGMmvA8bpiqvmhQT2OmPR0H7btcXg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Le 25/01/2017 à 07:29, Michal Suchanek a écrit :
> On 25 January 2017 at 03:08, Marek Vasut <marex@denx.de> wrote:
>> On 01/24/2017 12:41 AM, Kamal Dasu wrote:
>>> "ret can never be > 0 , it is only 0 or negative "
>>>
>>> I can fix this.
>>>
>>>>>> This looks really fragile and special-casing EINVAL here doesn't scale.
>>>>>> But still, if your controller driver is buggy, fix the driver, do not
>>>>>> pollute core code with workarounds. If you do support this sort of
>>>>>> accelerated read and it fails, it means something is seriously wrong.
>>>>>> If you need to invoke regular SPI reads to complete under some obscure
>>>>>> circumstances, do it from the driver, not here.
>>>>>
>>>>> I guess the other half of m25p80_read can be factored out and used as
>>>>> fallback from either m25p80_read or the controller driver.
>>>>
>>>> I think I see what you mean, but care to show an RFC patch ?
>>>>
>>>> --
>>>
>>> Its not the controller driver, but he hardware limitation with older
>>> controller version. I have tried to see how I can do this better,
>>> however when spi_flash_read() is called  cannot handle it within my
>>> driver without returning from the function. I went over this with Mark
>>> previously and this current solution seemed reasonable. Any other
>>> solution outside of the generic driver would replicate a lot of code
>>> unnecessarily.
>>
>> Hmmm, I kinda see the problem. I was thinking splitting the m25p80_read
>> function could be the solution and invoking the second part from the
>> driver if applicable, but this cannot work because the driver does not
>> know when it's interacting with SPI NOR and when with something else .
>>
>> Can you tell me about the conditions under which the bcm controller
>> fails and should fall back to standard spi read ?
> 
> spi_flash_read is designed to perform what m25p80_read does in a
> controller-specific way. So how can you get to a point when you are
> in spi_flash_read, it fails, and you do not know you if you can call
> the bottom half of m25p80_read to finish the job?
>

Indeed, spi_flash_read() was designed so the m25p80.c driver can bypass all
the regular SPI API and access directly the SPI controller driver.

When using the regular SPI API with spi_transfer and spi_message
structures, some pieces of information are lost at the level of the SPI
controller driver. This driver only sees streams of bytes to be read or
written on the SPI bus but no longer knows the protocol split between op
code | address/dummy | data bytes. Actually in this scenario, the SPI
driver should not even know whether the SPI device is a memory or not.

Then for "hybrid" SPI controllers, which can be connected at the same time
to SPI NOR and other SPI devices, the spi-nor framework API is not suited
as it is fully oriented to SPI memory devices and other SPI devices can't
be used. That's why spi_flash_read() was introduced in the API of the SPI
subsystem. This new hook allows the SPI controller driver to fully take
advantage of the hardware capabilities mainly to read from flash memory,
mapped in the system memory by the SPI controller.
To do so, the spi_flash_read_message structure was designed so the pieces
of informations (op code, address, address width, number of dummy bytes,
...) that were previously lost by the regular SPI API are now still
available to the SPI controller.

All this long introduction (sorry for that), just to say that, yes, in the
regular case, the SPI controller driver has no mean to know whether the SPI
device is a memory or not so some workarounds can only be done in upper
layers where the protocol details are still known. However we are not
in such a case here: we are using spi_flash_read(), so the SPI controller
driver knows without any doubt that it is talking to a SPI memory device
and this SPI controller driver still has all the protocol details it needs
to build some spi_message/spi_transfer structures like the m25p80.c driver
does when spi_flash_read_supported() returns false.

So I see many solutions to handle the unaligned data issue or implement
other workarounds:

1 - do everything in the SPI controller driver specific implementation of
spi_flash_read(). This is Marek's approach

1 bis - extract the half-bottom of m25p80_read in some exported function to
be called from the SPI controller driver specific implementation of
spi_flash_read() if we want an easy way to add a fallback implementation
without duplicating code. That's what Michal suggests I think.

2 - check the return code of spi_flash_read() and in the case of a specific
value (-EINVAL), m25p80_read() executes the same code as if
spi_flash_read_supported() returned false: That's what Kamal proposes with
this patch.


After reading this thread, IMHO solution 1 (including 1 bis) seems cleaner
than solution 2. Solution 2 gives a special meaning to some error code
value to ask m25p80_read() to retry with the legacy implementation.
However some other SPI controller drivers could return the very same (and
very common) error code without expecting m25p80_read() to send them a
spi_message structure as a fallback.

When I say a "very common error code", I don't change my mind and still
think that -EINVAL is better than -EAGAIN if finally the solution 2 is
chosen. Solution 2 is not that bad but I personally have a small preference
for solution 1 / 1 bis.

Best regards,

Cyrille



> Thanks
> 
> Michal
> 
