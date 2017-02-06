Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cagmh-00082I-Td
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2017 10:44:37 +0000
Subject: Re: [PATCH v1 3/5] spi: Added way to check for pm support for flash
 devices
To: Kamal Dasu <kdasu.kdev@gmail.com>, Mark Brown <broonie@kernel.org>
References: <1486164676-12912-1-git-send-email-kdasu.kdev@gmail.com>
 <1486164676-12912-4-git-send-email-kdasu.kdev@gmail.com>
 <20170204112555.p77votp5m7klygbe@sirena.org.uk>
 <CAC=U0a0o21taio6jYzTCx1ix85aFNtikXHs=O99OW1pChbG4TA@mail.gmail.com>
CC: linux-spi <linux-spi@vger.kernel.org>, Marek Vasut <marex@denx.de>, MTD
 Maling List <linux-mtd@lists.infradead.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <11cfd6da-c537-eca9-5c50-7789d5b672dd@atmel.com>
Date: Mon, 6 Feb 2017 11:44:09 +0100
MIME-Version: 1.0
In-Reply-To: <CAC=U0a0o21taio6jYzTCx1ix85aFNtikXHs=O99OW1pChbG4TA@mail.gmail.com>
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

Le 04/02/2017 à 21:47, Kamal Dasu a écrit :
> On Sat, Feb 4, 2017 at 6:25 AM, Mark Brown <broonie@kernel.org> wrote:
>> On Fri, Feb 03, 2017 at 06:31:14PM -0500, Kamal Dasu wrote:
>>
>>> Device drivers can check if the master controller driver has to support
>>> flash pm. The controller driver indicates this using flash_pm_supported()
>>> spi master interface.
>>
>> What is "flash pm" and how would a client use it given that no API for
>> actually managing power is being added here?  Someone looking at the API
>> needs to be able to figure these things out and right now I can't see
>> how they'd do that...o
> 
> The flash_pm function just indicates if  m25p80 resume op that does a
> spi_nor_pm_rescan() is needed, and by default will do nothing for
> other platforms. So the basic idea of the patches was to execute the
> only necessary spi_nor_pm_rescan() on resume when flash parts are
> reset on suspend. So from controller perspective there is no
> additional pm activity to be done. Patches 1/5-2/5 is what is needed
> actually. And Patches 3/3 - 5/5 only add a check if m25p80 resume
> should call spi_nor_pm_rescan(). And the controller driver shall
> implement the flash_pm function and return true if it does need a
> rescan to be done on resume.
> 

I don't understand why we extend in the SPI framework API to add power
management features but only for SPI flashes. I guess concerning the power
management, there is nothing special about SPI flashes: they are just SPI
devices like others. So why not extend the SPI framework, if needed, with
something working for all SPI devices, not just for SPI flashes.

There was a good reason to create a flash specific API in the SPI
framework: spi_flash_read(), flash_read_supported().
The reason is that the SPI controller needs protocol info (op code,
address, dummy cycles, SPI x-y-z protocol, ...) to handle the read
operation correctly and those pieces of information were lost in m25p80.c
when it used the regular SPI API with spi_transfer and spi_message
structures. Hence spi_flash_read() is a mean to bypass the regular SPI API
and provide the SPI controller driver with all the protocol info it needs.

Back to the power management use case, I don't see any technical reason to
create a SPI flash oriented solution.

Best regards,

Cyrille
