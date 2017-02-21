Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg7bI-0007ey-D6
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 10:23:18 +0000
Received: by mail-wm0-x243.google.com with SMTP id r18so18848867wmd.3
 for <linux-mtd@lists.infradead.org>; Tue, 21 Feb 2017 02:22:55 -0800 (PST)
Subject: Re: [PATCH 03/11] nand: spi: Abstract SPI NAND cmd set to functions
To: Peter Pan <peterpansjtu@gmail.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
 <1487664010-25926-4-git-send-email-peterpandong@micron.com>
 <93b3dd4d-426e-3165-8316-73108847d123@gmail.com>
 <CAAyFORJtSxNp-yVF0cRz0R1B3Z9xBm72Wv9Ph3boQERHsafGwQ@mail.gmail.com>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <434dfc69-1358-3e51-9ff4-d8e07deb0161@gmail.com>
Date: Tue, 21 Feb 2017 11:22:52 +0100
MIME-Version: 1.0
In-Reply-To: <CAAyFORJtSxNp-yVF0cRz0R1B3Z9xBm72Wv9Ph3boQERHsafGwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 21/02/2017 10:40, Peter Pan wrote:
> Hi Arnaud,
>
> On Tue, Feb 21, 2017 at 5:01 PM, Arnaud Mouiche
> <arnaud.mouiche@gmail.com> wrote:
>> Hello Peter.
>> First thank you for this effort to finally bring the spinand framework back
>> on stage.
>>
>> On 21/02/2017 09:00, Peter Pan wrote:
>>> This commit abstracts basic SPI NAND commands to
>>> functions in spi-nand-base.c. Because command sets
>>> have difference by vendors, we create spi-nand-cmd.c
>>> to define this difference by command config table.
>>>
>>> [...]
>>> +
>>> +/**
>>> + * spi_nand_read_page_to_cache - send command 13h to read data from Nand
>>> + * to cache
>>> + * @chip: SPI-NAND device structure
>>> + * @page_addr: page to read
>>> + */
>>> +static int spi_nand_read_page_to_cache(struct spi_nand_chip *chip,
>>> +                                       u32 page_addr)
>>> +{
>>> +       struct spi_nand_cmd cmd;
>>> +
>>> +       memset(&cmd, 0, sizeof(struct spi_nand_cmd));
>>> +       cmd.cmd = SPINAND_CMD_PAGE_READ;
>>> +       cmd.n_addr = 3;
>>> +       cmd.addr[0] = (u8)(page_addr >> 16);
>>> +       cmd.addr[1] = (u8)(page_addr >> 8);
>>> +       cmd.addr[2] = (u8)page_addr;
>>> +
>>> +       return spi_nand_issue_cmd(chip, &cmd);
>>> +}
>>
>> Just a question. Don't you try to map too exactly the spi_nand_cmd to the
>> internal micron SPI command ?
>> Why "cmd.addr" should be a byte array, and not a u32, leaving each chip to
>> details to handle the u32 to SPI byte stream mapping.
>>
>>
>>
>>> +
>>> +/**
>>> + * spi_nand_read_from_cache - read data out from cache register
>>> + * @chip: SPI-NAND device structure
>>> + * @page_addr: page to read
>>> + * @column: the location to read from the cache
>>> + * @len: number of bytes to read
>>> + * @rbuf: buffer held @len bytes
>>> + * Description:
>>> + *   Command can be 03h, 0Bh, 3Bh, 6Bh, BBh, EBh
>>> + *   The read can specify 1 to (page size + spare size) bytes of data
>>> read at
>>> + *   the corresponding locations.
>>> + *   No tRd delay.
>>> + */
>>> +static int spi_nand_read_from_cache(struct spi_nand_chip *chip,
>>> +               u32 page_addr, u32 column, size_t len, u8 *rbuf)
>>> +{
>>> +       struct nand_device *nand = &chip->base;
>>> +       struct spi_nand_cmd cmd;
>>> +
>>> +       memset(&cmd, 0, sizeof(struct spi_nand_cmd));
>>> +       cmd.cmd = chip->read_cache_op;
>>> +       cmd.n_addr = 2;
>>> +       cmd.addr[0] = (u8)(column >> 8);
>>> +       if (chip->options & SPINAND_NEED_PLANE_SELECT)
>>> +               cmd.addr[0] |= (u8)((nand_page_to_eraseblock(nand,
>>> page_addr)
>>> +                               & 0x1) << 4);
>>> +       cmd.addr[1] = (u8)column;
>>> +       cmd.n_rx = len;
>>> +       cmd.rx_buf = rbuf;
>>> +
>>> +       return spi_nand_issue_cmd(chip, &cmd);
>>> +}
>>> +
>> Some reasons to handle the plane concept (Micron specific), and even move
>> the fact that it touch the bit 4 of cdm.addr[0], in common code ?
> Let me try to remove this from framework when separate controller and device
> related code. Any suggestion on this?
I know, Micron was the first spinand chipset available, will be the 
first chipset supported by this framework, but it is already not so 
generic regarding to the page addressing compared with winbond, esmt, 
gigadevice or micronix...

But may be this the sign that "generic_spi_nand_cmd_fn" if "too" 
straight in your implementation and just try to map the "struct 
spi_nand_cmd" into the SPI frame without any more place for chip 
specialization.

I guess I would prefer to see multiple 'command primitive' inside each 
chip structures (eg. chip->read_from_cache() and so on).
But in the meantime, spinand chipset are made to be generic and behave 
mostly the same way, which would make this primitive declaration a 
little bit redundant.

The other way is to already have a "Micron_spi_nand_cmd_fn" that will 
patch the address fields for "read cache op", and then call the 
"generic_spi_nand_cmd_fn" to finalize the job.

Arnaud

>
> Thanks,
> Peter Pan
