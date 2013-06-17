Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UoTyC-0007KE-EW
 for linux-mtd@lists.infradead.org; Mon, 17 Jun 2013 07:35:21 +0000
Received: by mail-pb0-f45.google.com with SMTP id mc8so2500365pbc.4
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jun 2013 00:34:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51BEB89A.3090105@ti.com>
References: <51B82388.2000909@ti.com> <51BB29A5.3000100@ti.com>
 <51BB2AE4.4020109@gmail.com> <51BB2C2B.1010404@ti.com>
 <51BC93AF.5080808@gmail.com> <51BEA955.9080907@ti.com>
 <CAD6G_RTUSPgUf0GMeXDxkmTKmjx-_YaV6TR4_kGz0Zm_2SpxQw@mail.gmail.com>
 <51BEB3AB.6020603@ti.com>
 <CAD6G_RQPfQrwxkYZvB+hx6YVrMSNNYKSzCEB9_8t0SYCfwKt2g@mail.gmail.com>
 <51BEB69B.5010902@ti.com>
 <CAD6G_RSXJ-k0ciwc8zdKwimAnLwCv=9YTv4YkmAqrREizEtDUg@mail.gmail.com>
 <51BEB89A.3090105@ti.com>
Date: Mon, 17 Jun 2013 13:04:54 +0530
Message-ID: <CAD6G_RRNT5ukFovS1Spa7uMmX72kLpZ-YycfcdDdESTMHnNU9Q@mail.gmail.com>
Subject: Re: [U-Boot] U-boot: Erase/read/write issue with S25fl256S flash
 device
From: Jagan Teki <jagannadh.teki@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Rajendra nayak <rnayak@ti.com>, jagannadha.sutradharudu-teki@xilinx.com,
 Felipe Balbi <balbi@ti.com>, u-boot@lists.denx.de,
 linux-mtd@lists.infradead.org, Tom Rini <trini@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 17, 2013 at 12:49 PM, Sourav Poddar <sourav.poddar@ti.com> wrote:
> On Monday 17 June 2013 12:44 PM, Jagan Teki wrote:
>>
>> On Mon, Jun 17, 2013 at 12:41 PM, Sourav Poddar<sourav.poddar@ti.com>
>> wrote:
>>>
>>> On Monday 17 June 2013 12:35 PM, Jagan Teki wrote:
>>>>
>>>> On Mon, Jun 17, 2013 at 12:28 PM, Sourav Poddar<sourav.poddar@ti.com>
>>>> wrote:
>>>>>
>>>>> HI Jagan,
>>>>>
>>>>> On Monday 17 June 2013 12:17 PM, Jagan Teki wrote:
>>>>>>
>>>>>> Hi Sourav,
>>>>>>
>>>>>> On Mon, Jun 17, 2013 at 11:44 AM, Sourav Poddar<sourav.poddar@ti.com>
>>>>>> wrote:
>>>>>>>
>>>>>>> Hi Jagan,
>>>>>>>
>>>>>>> On Saturday 15 June 2013 09:47 PM, Jagan Teki wrote:
>>>>>>>>
>>>>>>>> On 14-06-2013 20:13, Sourav Poddar wrote:
>>>>>>>>>
>>>>>>>>> Hi Jagan,
>>>>>>>>> On Friday 14 June 2013 08:08 PM, Jagan Teki wrote:
>>>>>>>>>>
>>>>>>>>>> On 14-06-2013 20:03, Sourav Poddar wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Hi,
>>>>>>>>>>>
>>>>>>>>>>> On Wednesday 12 June 2013 01:00 PM, Sourav Poddar wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> I am working on qspi flash device S25FL256S at u-boot level. I
>>>>>>>>>>>> am
>>>>>>>>>>>> trying to
>>>>>>>>>>>> make use of the existing spi_flash.c framework available at
>>>>>>>>>>>> u-boot
>>>>>>>>>>>> for
>>>>>>>>>>>> erasing/reading/writing
>>>>>>>>>>>> into the flash device.
>>>>>>>>>>>>
>>>>>>>>>>>> There are several issues(mentioned below), which I faced while
>>>>>>>>>>>> using
>>>>>>>>>>>> S25FL256s flash device
>>>>>>>>>>>> with my dra7xx board which has a qspi controller to which the
>>>>>>>>>>>> above
>>>>>>>>>>>> mentioned flash device is attached.
>>>>>>>>>>>>
>>>>>>>>>>>> 1. Erase (spi_flash_cmd_erase)
>>>>>>>>>>>>
>>>>>>>>>>>> Issuing a command something like this..
>>>>>>>>>>>>
>>>>>>>>>>>> sf erase 0x0 0x50000
>>>>>>>>>>>>     - erases only first 0x20000 bytes of flash device, anything
>>>>>>>>>>>> above
>>>>>>>>>>>> that is not erase. I need to
>>>>>>>>>>>>       issue separate commands after 0x20000 for every 0x10000
>>>>>>>>>>>> bytes.
>>>>>>>>>>>>
>>>>>>>>>>>> Am i missing anything here?
>>>>>>>>>>>>
>>>>>>>>>>>> 2. read
>>>>>>>>>>>>
>>>>>>>>>>>> sf read 81000000 0 0x10000
>>>>>>>>>>>>
>>>>>>>>>>>> Read is not happening properly. The last few byte along the 4k
>>>>>>>>>>>> boundary always shows zero.
>>>>>>>>>>>> Above 4k bytes, read is not happening.
>>>>>>>>>>>>
>>>>>>>>>>>> For ex:
>>>>>>>>>>>>     DRA752 EVM # md 81000f00
>>>>>>>>>>>> 81000f00: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000f10: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000f20: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000f30: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000f40: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000f50: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000f60: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000f70: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000f80: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000f90: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000fa0: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000fb0: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000fc0: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000fd0: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000fe0: ffffffff ffffffff ffffffff ffffffff
>>>>>>>>>>>> ................
>>>>>>>>>>>> 81000ff0: ffffffff ffffffff 00ffffff 00000000
>>>>>>>>>>>> ................
>>>>>>>>>>>>
>>>>>>>>>>>> In this dump, if you see 81000ff0 the last column shows 000000
>>>>>>>>>>>> which
>>>>>>>>>>>> is
>>>>>>>>>>>> not expected. and it happens along every 4k bytes.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> So, to get rid of the above issue, I switched to page read with
>>>>>>>>>>>> the
>>>>>>>>>>>> below patch[1],
>>>>>>>>>>>> which is giving me the correct result.
>>>>>>>>>>>> [1]:
>>>>>>>>>>>> @@ -147,17 +153,40 @@ int spi_flash_read_common(struct spi_flash
>>>>>>>>>>>> *flash, const u8 *cmd,
>>>>>>>>>>>>     int spi_flash_cmd_read_fast(struct spi_flash *flash, u32
>>>>>>>>>>>> offset,
>>>>>>>>>>>>                    size_t len, void *data)
>>>>>>>>>>>>     {
>>>>>>>>>>>> -       u8 cmd[5];
>>>>>>>>>>>> +       unsigned long page_addr, byte_addr, page_size;
>>>>>>>>>>>> +       size_t chunk_len, actual;
>>>>>>>>>>>> +       int ret = 0;
>>>>>>>>>>>> +       u8 cmd[4];
>>>>>>>>>>>>
>>>>>>>>>>>>            /* Handle memory-mapped SPI */
>>>>>>>>>>>>            if (flash->memory_map)
>>>>>>>>>>>>                    memcpy(data, flash->memory_map + offset,
>>>>>>>>>>>> len);
>>>>>>>>>>>> +       page_size = flash->page_size;
>>>>>>>>>>>> +       page_addr = offset / page_size;
>>>>>>>>>>>> +       byte_addr = offset % page_size;
>>>>>>>>>>>> +
>>>>>>>>>>>> +       cmd[0] = CMD_READ_ARRAY_SLOW;
>>>>>>>>>>>> +       for (actual = 0; actual<    len; actual += chunk_len) {
>>>>>>>>>>>> +               chunk_len = min(len - actual, page_size -
>>>>>>>>>>>> byte_addr);
>>>>>>>>>>>> +
>>>>>>>>>>>> +               cmd[1] = page_addr>>    8;
>>>>>>>>>>>> +               cmd[2] = page_addr;
>>>>>>>>>>>> +               cmd[3] = byte_addr;
>>>>>>>>>>>> +
>>>>>>>>>>>> +               ret = spi_flash_read_common(flash, cmd,
>>>>>>>>>>>> sizeof(cmd),
>>>>>>>>>>>> data + actual, chunk_len);
>>>>>>>>>>>> +               if (ret<    0) {
>>>>>>>>>>>> +                       debug("SF: read failed");
>>>>>>>>>>>> +                       break;
>>>>>>>>>>>> +               }
>>>>>>>>>>>>
>>>>>>>>>>>> -       cmd[0] = CMD_READ_ARRAY_FAST;
>>>>>>>>>>>> -       spi_flash_addr(offset, cmd);
>>>>>>>>>>>> -       cmd[4] = 0x00;
>>>>>>>>>>>> +               byte_addr += chunk_len;
>>>>>>>>>>>> +               if (byte_addr == page_size) {
>>>>>>>>>>>> +                       page_addr++;
>>>>>>>>>>>> +                       byte_addr = 0;
>>>>>>>>>>>> +               }
>>>>>>>>>>>> +       }
>>>>>>>>>>>>
>>>>>>>>>>>> -       return spi_flash_read_common(flash, cmd, sizeof(cmd),
>>>>>>>>>>>> data,
>>>>>>>>>>>> len);
>>>>>>>>>>>> +       return ret;
>>>>>>>>>>>>     }
>>>>>>>>>>>>
>>>>>>>>>>>> Any idea about this?
>>>>>>>>>>>>
>>>>>>>>>>>> 3.  write (spi_flash_cmd_write_multi)
>>>>>>>>>>>>      write not happening properly.
>>>>>>>>>>>>
>>>>>>>>>>>> observations: only able to write single page, anything after a
>>>>>>>>>>>> page
>>>>>>>>>>>> is
>>>>>>>>>>>> not getting
>>>>>>>>>>>>            written.
>>>>>>>>>>>> Workaround:
>>>>>>>>>>>> I did a write disable latch at the end of every write cycle(page
>>>>>>>>>>>> program) and enable it
>>>>>>>>>>>> again for the next loop. With this, I see I get rid of the above
>>>>>>>>>>>> issue.
>>>>>>>>>>>>
>>>>>>>>>>>>     @@ -117,6 +117,12 @@ int spi_flash_cmd_write_multi(struct
>>>>>>>>>>>> spi_flash
>>>>>>>>>>>> *flash, u32 offset,
>>>>>>>>>>>>                    if (ret)
>>>>>>>>>>>>                            break;
>>>>>>>>>>>>
>>>>>>>>>>>> +               ret = spi_flash_cmd_write_disable(flash);
>>>>>>>>>>>> +               if (ret<    0) {
>>>>>>>>>>>> +                       printf("SF: disabling write failed\n");
>>>>>>>>>>>> +                       break;
>>>>>>>>>>>> +               }
>>>>>>>>>>>> +
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Have anyone seen the above mentioned issues regarding
>>>>>>>>>>>> read/write/erase? OR is there any
>>>>>>>>>>>> configurations that I might be missing ?
>>>>>>>>>>>>
>>>>>>>>>>> Any Input on this?
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Please wait, I am pushing some changes tonight or so.
>>>>>>>>>>
>>>>>>>>>> We will continue this thread, after testing your part with these
>>>>>>>>>> new
>>>>>>>>>> changes.
>>>>>>>>>>
>>>>>>>>>> I will intimate you once the push done.
>>>>>>>>>>
>>>>>>>>>> --
>>>>>>>>>> Thanks,
>>>>>>>>>> Jagan.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>> Thanks a lot for the reply.
>>>>>>>>> Sure, will wait for your changes to go in.
>>>>>>>>
>>>>>>>>
>>>>>>>> Will take some time go these changes on master.
>>>>>>>>
>>>>>>>> Please checkout master-work branch in u-boot-spi repo
>>>>>>>> git://git.denx.de/u-boot-spi.git
>>>>>>>>
>>>>>>>> and try to test 256S parts, fyi: I tested the same part got the
>>>>>>>> +ve result.
>>>>>>>>
>>>>>>> Tested the above tree on my board.
>>>>>>> But, still the issues remain the same for me in all the three
>>>>>>> cases(erase/read/write).
>>>>>>>
>>>>>>> Here is the short log of the read command..
>>>>>>> DRA752 EVM # sf probe 0
>>>>>>> SF: Detected S25FL256S_64K with page size 64 KiB, total 32 MiB
>>>>>>> SF: Warning - Only lower 16MiB accessible, Full access #define
>>>>>>> CONFIG_SPI_FLASH_BAR
>>>>>>> DRA752 EVM # sf erase 0x0 0x10000
>>>>>>> SF: 65536 bytes @ 0x0 Erased: OK
>>>>>>> DRA752 EVM # mw.b 0x81000100 0xff 0x10000
>>>>>>> DRA752 EVM # sf read 0x81003000 0x0 0x10000
>>>>>>> SF: 65536 bytes @ 0x0 Read: OK
>>>>>>> DRA752 EVM # cmp.b 0x81003000  0x81000100  0x10000
>>>>>>> byte at 0x81003ffb (0x0) != byte at 0x810010fb (0xff)
>>>>>>> Total of 4091 byte(s) were the same
>>>>>>>
>>>>>>>
>>>>>>> Erase: not able to do with a single command, need to issue for every
>>>>>>> 0x10000
>>>>>>> bytes.
>>>>>>>
>>>>>>> Write: Need to disable latch after every write to make it properly
>>>>>>> work.
>>>>>>>
>>>>>>> Is it possible for you to  give me  basic commands which you might
>>>>>>> have
>>>>>>> ran
>>>>>>> to confirm
>>>>>>> the read/write and erase ??
>>>>>>
>>>>>> I tested the same part - for me i couldn't see the issues with SL256S
>>>>>>
>>>>>> OK! can enable the log on poll function, spi_flash_cmd_wait_ready()
>>>>>> make debug ->    printf.
>>>>>> Do the same test.! and send the log file.
>>>>>>
>>>>>> --
>>>>>> Thanks,
>>>>>> Jagan.
>>>>>
>>>>> Here is the output log, no change..
>>>>>
>>>>>
>>>>> DRA752 EVM # sf probe 0
>>>>> SF: Detected S25FL256S_64K with page size 64 KiB, total 32 MiB
>>>>> DRA752 EVM # sf erase 0x0 0x10000
>>>>> SF: 65536 bytes @ 0x0 Erased: OK
>>>>> DRA752 EVM # mw.b 0x81000100 0xff 0x10000
>>>>> DRA752 EVM # sf read 0x81003000 0x0 0x10000
>>>>> SF: 65536 bytes @ 0x0 Read: OK
>>>>> DRA752 EVM # cmp.b 0x81003000  0x81000100  0x10000
>>>>> byte at 0x81003ffb (0x0) != byte at 0x810010fb (0xff)
>>>>> Total of 4091 byte(s) were the same
>>>>> DRA752 EVM #
>>>>>
>>>>>
>>>>> Code change: for above output.
>>>>> --- a/drivers/mtd/spi/spi_flash.c
>>>>> +++ b/drivers/mtd/spi/spi_flash.c
>>>>> @@ -85,7 +85,7 @@ int spi_flash_cmd_wait_ready(struct spi_flash *flash,
>>>>> unsigned long timeout)
>>>>>
>>>>>           ret = spi_xfer(spi, 8,&cmd, NULL, SPI_XFER_BEGIN);
>>>>>
>>>>>           if (ret) {
>>>>> -               debug("SF: fail to read %s status register\n",
>>>>> +               printf("SF: fail to read %s status register\n",
>>>>>                           cmd == CMD_READ_STATUS ? "read" : "flag");
>>>>>                   return ret;
>>>>>           }
>>>>> @@ -109,7 +109,7 @@ int spi_flash_cmd_wait_ready(struct spi_flash
>>>>> *flash,
>>>>> unsigned long timeout)
>>>>>                   return 0;
>>>>>
>>>>>           /* Timed out */
>>>>> -       debug("SF: time out!\n");
>>>>> +       printf("SF: time out!\n");
>>>>>           return -1;
>>>>>    }
>>>>>
>>>> Ohh..
>>>>
>>>> - What if you erase the entire flash and read back, same result is it?
>>>
>>> Yes.
>>>
>>>> - please send the paths for config file for this board?
>>>
>>> include/configs/dra7xx_evm.h
>>
>> I couldn't find any SPI flash configs on above config file,
>> Can you point me the relevant configurations.
>>
> Following are the configuration details for spi..
> #define CONFIG_SPI_FLASH_BAR
> #define CONFIG_TI_QSPI

Where can i find this?

> #define CONFIG_SPI_FLASH
> #define CONFIG_SPI_FLASH_SPANSION
> #define CONFIG_CMD_SF
> #define CONFIG_CMD_SPI
> #define CONFIG_SF_DEFAULT_SPEED         12000000
> #define CONFIG_DEFAULT_SPI_MODE         SPI_MODE_3
>
> /* SPI SPL */
> #define CONFIG_SPL_SPI_SUPPORT
> #define CONFIG_SPL_SPI_LOAD
> #define CONFIG_SPL_SPI_FLASH_SUPPORT
> #define CONFIG_SPL_SPI_BUS              0
> #define CONFIG_SPL_SPI_CS               0
> #define CONFIG_SYS_SPI_U_BOOT_OFFS      0x20000

--
Thanks,
Jagan.
