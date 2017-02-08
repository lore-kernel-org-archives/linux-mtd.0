Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbPc3-0006Yl-3f
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 10:36:37 +0000
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
To: Heiner Kallweit <hkallweit1@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
 <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
CC: Boris BREZILLON <boris.brezillon@free-electrons.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, MTD
 Maling List <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <c89577f7-2908-3a75-6be4-78455c5cffcb@atmel.com>
Date: Wed, 8 Feb 2017 11:36:10 +0100
MIME-Version: 1.0
In-Reply-To: <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
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

Le 08/02/2017 à 06:52, Heiner Kallweit a écrit :
> Am 08.02.2017 um 02:09 schrieb Marek Vasut:
>> On 02/07/2017 04:31 PM, Cyrille Pitchen wrote:
[...]
>>> Heiner Kallweit (1):
>>>       mtd: m25p80: consider max message size in m25p80_read
>>
>> I cannot say I'm super-happy about this particular patch, still ...
>>
> W/o it at least the fsl-espi driver is broken for transfers >= 64kB.
> 

We asked Mark Brown about the need to check the limits for the size of SPI
transfers and messages and I've understood his answer correctly, he told us
we should check those limits:

http://patchwork.ozlabs.org/patch/688176/

"> Does this imply that we have to fix every single driver this way ?"

"Ideally.  Any SPI driver that has an upper limit really ought to export
it, and any driver that might bump into one of those limits should
check.  A lot of drivers are either unlikely to be deployed in a system
that has relevant limits or tend to only do short enough transfers
though - if systems are currently working it's just neatening things up
really"

Then the discussion ended there. I didn't see any comment after that so I
just thought the discussion was over and everybody agreed.


Besides, this patch doesn't introduce the check of SPI controller limits
but only extend this check. What I mean is that the m25p80 driver already
checks the maximum transfer size. This check was introduced by commit

95193796256c ("mtd: m25p80: read in spi_max_transfer_size chunks")

Then if we already check the SPI max transfer size, I guess it make sense
to also test other limits such as the SPI max message size.

Finally, I think it would be very difficult and dirty to try to fix this
bug only from the SPI controller driver. If m25p80_read() tries to read too
many data based on what the SPI controller can actually read in a single
operation, we would have to split the (Fast) Read command into two (Fast)
Read commands, incrementing the address bytes as needed before sending the
second command to the SPI bus.

Please note that this split is already handled by spi_nor_read() when
nor->read() returns a size lower than its len parameter.

However, if we try to fix the issue at the SPI controller driver side, once
we start to use the SPI API with spi_transfer and spi_message structures,
we loose protocol info. SPI transfers and messages only carry stream of
data/bytes, hence we loose the SPI flash protocol split: instruction |
address | mode | dummy | data.

When using the regular SPI API, the SPI controller driver should not try to
recover that protocol split. It should even not be aware that the SPI
device is indeed a SPI flash.
Also there is no mean to recover the protocol split out without duplicating
many parts of the spi-nor framework:
- 3-byte or 4-byte address ?
- how many dummy cycle bytes ? => this number depends on both the
instruction op code and the memory manufacturer.

Also I don't think it's a good think when SPI controller drivers by-pass
or duplicate the selection of the right flash parameters, op codes and so
on. When they do so, they do it so it works with very specific memory parts
and they just don't care about some other memory parts that work slightly
differently. Then it becomes a mess to maintain such drivers.


With Heiner's patch, the issue is fixed by changing only one line and the
bandwidth performance of read operations should not be impacted.

I don't think his solution is that dirty as compared to the only other
proposed solution: fix it in the SPI controller driver.

The SPI controller driver could also implement its own version of
spi_flash_read() mainly duplicating the code of m25p80_read() but it
doesn't sound like a cleaner fix, IMHO.


Best regards,

Cyrille
