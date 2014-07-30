Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XCQAb-0001Q1-S2
 for linux-mtd@lists.infradead.org; Wed, 30 Jul 2014 09:27:38 +0000
Received: by mail-ie0-f177.google.com with SMTP id at20so1161058iec.22
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jul 2014 02:27:16 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 30 Jul 2014 11:27:15 +0200
Message-ID: <CACna6rzhD9=Pkb5gRqd9A23gfaqnHmYe_vm0fwT_mefAibmhYQ@mail.gmail.com>
Subject: Writing SPI flash driver for Broadcom BCM53xx ARM SoC
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Andre Renaud <andre@bluewatersys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I own BCM53010 (AKA BCM4708) based router which has (obviously) a
flash memory. Only part of this chip is visible to me (because of the
radiator), but I read a following label: winbond 25Q128FVFG (it's
barely visible). Broadcom documents this flash as:
/* ST M25FL128 128 Mbit Serial Flash */

It seems that Broadcom ARM SoCs use real SPI to access flashes.

I played a bit with this flash and it:
1) Doesn't respond to SPINOR_OP_RDID (no JEDEC), returns all zeroes
2) Responds to 0x90 command (SST25L_CMD_READ_ID) with 0xEF 0x17. Or if
you prefer longer read: 0xEF 0x17 0xEF 0x17 0xEF.
I checked Broadcom code and it treats 0xEF (NXPART) as: /* ST compatible */

So far it seems there is some compatibility between Broadcom ARM flash
support and the sst25l.c.

I decided to compared erasing flash memory.


*** Erasing in Broadcom code ***

mspi_disable_bspi [controller specific]
write WREN command (0x06)

write 0x20 xor 0xD8 xor 0x21 xor 0xDC and offset
wait for RDSR command (0x05) & 0x1 being 0

write WRDI command (0x04)
mspi_enable_bspi [controller specific]


*** Erasing in sst25l_erase ***

wait for RDSR command (0x05) & 0x1 being 0
write WREN command (0x06)
write EWSR command (0x50)
write WRSR and 0 commands (0x01 and 0x00)
check RDSR command (0x05) for having WREN (0x2)

write 0x20 and offset
wait for RDSR command (0x05) & 0x1 being 0

write WRDI command (0x04)
write EWSR command (0x50)
write WRSR and BP0 and BP1 commands (0x04 and 0x08)
check RDSR command (0x05) for having WREN (0x2)


Again, some compatibility, but not really enough for us. First of all
I'm not sure if Broadcom flash is going to accept these extra commands
when enabling/disabling writes (EWSR, WRSR). Not sure what they are
about. I see sst25l_erase is also lacking support for some extra erase
commands:
#define SPI_SE_CMD 0xD8 (for block size 0x10000 and up)
#define SPAN_FLASH_4P4E 0x21 (for new SPAN devices with block size < 0x1000=
0)
#define SPAN_FLASH_4SE 0xDC (for new SPAN devices with bigger  block size)
(on the other hand 0xD8 and 0xDC are used in spi-nor.c / m25p80.c).

What's worse, I have no idea how I could add controller-specific calls
in the flash driver (mspi_disable_bspi / mspi_enable_bspi).

Btw. I took a look at m25p80_erase and it also seems so be a bit
similar... These differences between sst25l.c and m25p80.c seem a bit
tiny to me.


So in this situation... do you have an idea how I could implement
flash driver for Broadcom ARM SoCs? I wanted to use SPI subsystem and
re-use existing SPI flash drivers, but it seems a bit tricky now.
Should I write a standalone MTD driver handling SPI communication on
it's own?

You can see Broadcom's spiflash.s in DD-WRT sources:
http://svn.dd-wrt.com/browser/src/linux/universal/linux-3.10/brcm/arm/share=
d/spiflash.c

--=20
Rafa=C5=82
