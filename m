Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9ZFA-00083S-7i
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2016 15:13:53 +0000
Subject: Re: Handling soft reset on mt7261 Soc with 32M flash
To: Dominik Menke <dom@digineo.de>, <linux-mtd@lists.infradead.org>
References: <1479478821.2465.41.camel@digineo.de>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
CC: <banglang.huang@foxmail.com>
Message-ID: <09dcc85f-d295-50cc-1ec2-42e3187c9453@atmel.com>
Date: Wed, 23 Nov 2016 16:13:28 +0100
MIME-Version: 1.0
In-Reply-To: <1479478821.2465.41.camel@digineo.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dominik,

Please have a look at:
[1] http://patchwork.ozlabs.org/patch/697267/
[2] http://patchwork.ozlabs.org/patch/697271/
[3] http://patchwork.ozlabs.org/patch/697272/

The Winbond W25Q256 memory is compliant with JESD216 specification
so provides the Serial Flash Discoverable Parameter tables but I didn't
check whether it also provides the optional 4-byte Address Instruction
Table.

If so, patches [2] & [3] should fix your issue by using the 4-byte address
instruction set, which is stateless, instead of making the memory enter
its 4-byte address mode, which is stateful, as currently done by the
spi-nor framework.

If the 4-byte Address Instruction Table is not provided by the SFDP tables,
then you cas use patch [1] as a fallback: you need to add the
SPI_NOR_4B_OPCODES flags in the "w25q256" entry of the spi_nor_ids[] array.
It works the same as patches [2] & [3] and makes use of the 4-byte
instruction set instead of entering the 4-byte address mode.

Since using the 4-byte instruction set doesn't change the internal state
of your Winbond memory, when a software reset occurs, the early bootloader
can still access the lower 16MB of the memory using the regular (Fast) Read
op codes with 3-byte address.

Another solution is to update the bootloader, if possible, to make it send a
Reset Enable / Reset sequence "0x66 0x99" as banglang suggested.
This reset sequence should not be done from Linux because if a spurious
reset occurs, Linux won't sent the reset sequence and your memory still be
in its 4-byte address mode when the booloarder tries to read data.

IMHO, we should avoid using stateful features such as entering the 4-byte
address mode as many bootloader don't expect those memory internal state
changes hence don't know how to cope with them.

Best regards,

Cyrille

Le 18/11/2016 à 15:20, Dominik Menke a écrit :
> Hello list,
> 
> I've been redirected here by Mathias Kresin (mkresin; LEDE project) to
> ask for comments on how to handle the following situation:
> 
> We have a router board using MediaTek's MT7261 SoC with 32M flash memory
> (Winbond W25Q256FV [1]). To address >16M, the SPI bus must be configured
> to use 4-byte addressing mode. The problem arises after a soft reset,
> when the SoC expects the SPI to be in 3-byte addressing mode, but then
> can't communicate with the flash memory.
> 
> When researching the issue, I've found this [2] mail in the OpenWRT
> mailing list archives, describing the problem as
> 
>> Paul Fertser on openwrt-devel, 2015-07-08
>>
>> Apparently MT7620 can't handle 4 byte addressing mode of the flash
>> memory on hardware level so it needs to be reset somehow prior to
>> resetting the SoC.
> 
> From that mail, I have buthered together a patch [3] which fixes the
> problem for my hardware, but it'll most likely not work with other flash
> chips (cp. [4]):
> 
>> Daniel Golle on commit comment, 2015-11-11
>>
>> At least on Macronix SPI chips, using 0x66, 0x99 to reset the chip is
>> not nough as that will not clear the adressing-mode bits.
>> Using 0xE9 (EX4B; exit 4-byte mode) instead fixes the issue eg. on
>> MX25L256.
> 
> In another Pull Request [5], introducing a modalias for a Macronix
> MX25l25635E flash on the Lenovo Newifi D1 [6], the same reset sequence
> appears. Mathias hinted in the PR, that the flash reset sequence should
> be executed conditionally, based on the JEDED id (I have not a clue
> though, how to do that, to be honest).
> 
> How would you proceed?
> 
> Thanks for your advice,
> Dominik
> 
> 
> [1]:
> https://www.winbond.com/resource-files/w25q256fv_revg1_120214_qpi_website_rev_g.pdf
> [2]:
> https://lists.openwrt.org/pipermail/openwrt-devel/2015-July/034153.html
> [3]: https://gist.github.com/dmke/d389bc364b3f73f525076eaee0019dc1
> [4]: https://patchwork.ozlabs.org/patch/541391/
> [5]: https://github.com/lede-project/source/pull/464
> [6]: https://wikidevi.com/wiki/Lenovo_Newifi_D1
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
