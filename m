Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e4b4O-0006li-1L
 for linux-mtd@lists.infradead.org; Tue, 17 Oct 2017 23:14:46 +0000
Received: by mail-wm0-x244.google.com with SMTP id i124so6643219wmf.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2017 16:14:22 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: Add support for ISSI is25lp128
To: linux-mtd@lists.infradead.org
References: <1455041563-12483-1-git-send-email-nnazarenko@radiofid.com>
From: angelo <angelo70@gmail.com>
Cc: nnazarenko@radiofid.com
Message-ID: <1f9be30c-8042-f067-6667-8afc48d9ac96@gmail.com>
Date: Wed, 18 Oct 2017 01:14:18 +0200
MIME-Version: 1.0
In-Reply-To: <1455041563-12483-1-git-send-email-nnazarenko@radiofid.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nikita and Gabor,

Tested-by: Angelo Dureghello <angelo@sysam.it>


On 09/02/2016 19:12, Nikita Nazarenko wrote:
> Hi Gabor,
>
> On Tue, Mar 08, 2016 at 06:26:41PM +0100, Gabor Juhos wrote:
>>> On Tue, Feb 09, 2016 at 09:12:43PM +0300, Nikita Nazarenko wrote:
>>>> Signed-off-by: Nikita Nazarenko <nnazarenko at radiofid.com>
>>>> ---
>>>>   drivers/mtd/spi-nor/spi-nor.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>>> index ed0c19c..e0bb151 100644
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -739,6 +739,7 @@ static const struct flash_info spi_nor_ids[] = {
>>>>
>>>>   	/* ISSI */
>>> Both of these ISSI entries look wrong.
>>>
>>>>   	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
>>> Looking at the datasheet for this part [1], shouldn't the ID be
>>> 0x9d7f20 (i.e., the MFR ID is 0x9d, not 0x7f)? That would match the
>>> existing CFI definition for "PMC". And IIUC, PMC got bought by ISSI? Or
>>> some kind of merger, I don't follow these things.
>> The ID is definitely 0x7d9d20, the m28p80 driver detects the device correctly
>> with that:
>>
>>    m25p80 spi0.0: found is25cd512, expected m25p80
>>    m25p80 spi0.0: is25cd512 (64 Kbytes)
>>    Creating 4 MTD partitions on "spi0.0":
>>    0x000000000000-0x00000000c000 : "routerboot"
>>    0x00000000c000-0x00000000d000 : "hard_config"
>>    0x00000000d000-0x00000000e000 : "bios"
>>    0x00000000e000-0x00000000f000 : "soft_config"
>>
>> The first byte of the manufacturer ID is indeed 0x9d, but the device returns
>> that as the second byte throught the JEDEC ID READ command. Even though it is a
>> weird behaviour, it is described on page 11 of the datasheet.
> What a stupid implementation. And they changed it to the sane
> implementation for is25lp128 it seems?
>
>>>> +	{ "is25lp128", INFO(0x9d6018, 0, 32 * 1024,   512, SECT_4K) },
>>> This datasheet [1] says that for SPI mode (not QPI mode), 4K erase is
>>> done with opcode 0xD7 (i.e., SPINOR_OP_BE_4K_PMC) not 0x20
>>> (SPINOR_OP_BE_4K). So we would need the SECT_4K_PMC, not the SECT_4K
>>> flag.
>> I don't have a board with such flash device, but Table 8.1 "Instruction Set" is
>> misleading a bit. In my understanding, erasing 4K sectors should work with both
>> commands. Look at Clause 8.10 "SECTOR ERASE OPERATION (SER, D7h/20h)" on page 33
>> in the datasheet. Both Figure 8.12 "Sector Erase Sequence" and Figure 8.13
>> "Sector Erase Sequence (QPI) " says 'D7h/20h'.
> Ah, I could see how the table could be read either way. I expect that
> the submitter (Nikita) should be able to confirm this through testing.
>
it happen i mounted the same spi nor (is25lp128) here on a custom Coldfire board running Linux,
so i appliedthe line

{ "is25lp128", INFO(0x9d6018, 0, 32 * 1024, 512, SECT_4K) },

and preformed some testing, the 4k erase works.

[    8.260000] Creating 3 MTD partitions on "is25lp128":
[    8.260000] 0x000000000000-0x000000100000 : "U-Boot (1024K)"
[    8.330000] 0x000000100000-0x000000800000 : "Kernel+initramfs (7168K)"
[    8.400000] 0x000000800000-0x000001000000 : "Flash Free Space (8192K)"


/bin # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00100000 00001000 "U-Boot (1024K)"
mtd1: 00700000 00001000 "Kernel+initramfs (7168K)"
mtd2: 00800000 00001000 "Flash Free Space (8192K)"

# flash_eraseall /dev/mtd2

/ # hexdump -C -n 8192 /dev/mtd2
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff |................|
*
00002000
/ #

/ # dd if=/dev/zero of=/dev/mtd2 bs=4096 count=1
1+0 records in
1+0 records out
4096 bytes (4.0KB) copied, 0.228499 seconds, 17.5KB/s


/ # hexdump -C -n 8192 /dev/mtd2
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
*
00001000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff |................|
*
00002000
/ #


/ # flash_erase /dev/mtd2 0 1
Erasing 4 Kibyte @ 0 -- 100 % complete
/ #

/ # hexdump -C -n 8192 /dev/mtd2
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff |................|
*
00002000
/ #



>>> Also, the datasheet for this device says it supports 64K sectors, and
>>> the 32K sectors require a different erase command (SPINOR_OP_BE_32K; not
>>> currently supported in this driver). Did you test erase to be sure it
>>> worked as expected? Or are one or more datasheets wrong?
>> It seems that you are correct about this.
> To be clear, it looks like your submission (is25cd512) does use D8h for
> 32K erase blocks, since it's such a tiny device. But Nikita's device
> appears to use 64K erase blocks.
>
> I expect Nikita can test and resubmit a revised entry here.
>
> Regards,
> Brian
Regards,
Angelo Dureghello
