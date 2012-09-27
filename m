Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TH9GE-0007DH-IY
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2012 08:15:55 +0000
Message-ID: <50640B35.206@parrot.com>
Date: Thu, 27 Sep 2012 10:15:49 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add support for the windbond w25q256 chip
References: <1348563927-9131-1-git-send-email-matthieu.castet@parrot.com>
 <CAN8TOE-h1VrbNg6ZqwQdhLaQ18E4-=_Lw+biuhGONUS5HCx-4g@mail.gmail.com>
In-Reply-To: <CAN8TOE-h1VrbNg6ZqwQdhLaQ18E4-=_Lw+biuhGONUS5HCx-4g@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris a écrit :
> On Tue, Sep 25, 2012 at 2:05 AM, Matthieu CASTET
> <matthieu.castet@parrot.com> wrote:
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>> index 5257345..4eb99c6 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -168,6 +168,7 @@ static inline int set_4byte(struct m25p *flash, u32 jedec_id, int enable)
>>  {
>>         switch (JEDEC_MFR(jedec_id)) {
>>         case CFI_MFR_MACRONIX:
>> +       case 0xEF /* winbond */:
>>                 flash->command[0] = enable ? OPCODE_EN4B : OPCODE_EX4B;
>>                 return spi_write(flash->spi, flash->command, 1);
>>         default:
> 
> Just checking: Winbond didn't use their known manufacturer ID (0xDA)
> for this chip? Do they have other chips that support/need 4-byte
> addressing and use 0xDA?
> 
I don't know, but if you look in m25p80 device list, all windbond flash start
(the jdec manuf code) with 0xEF [1].
May be MFR code are different for NOR flash and spi NOR ?

For info the datasheet is avaiable at :
http://www.winbond.com.tw/NR/rdonlyres/658E0D71-9AC3-48D6-B043-3702625A2CF5/0/W25Q256FV.pdf

Matthieu

[1]
    /* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
    { "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
    { "w25x20", INFO(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
    { "w25x40", INFO(0xef3013, 0, 64 * 1024,  8,  SECT_4K) },
    { "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
    { "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
    { "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
    { "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
    { "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64, SECT_4K) },
    { "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
    { "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
    { "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
    { "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
