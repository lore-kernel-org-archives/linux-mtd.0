Received: from mail-pz0-f197.google.com ([209.85.222.197])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MbUU0-0004kZ-DO
	for linux-mtd@lists.infradead.org; Thu, 13 Aug 2009 07:12:24 +0000
Received: by pzk35 with SMTP id 35so473782pzk.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Aug 2009 00:12:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A83A3B2.4070300@compulab.co.il>
References: <967093cd0908120036q51283790se400dc08219daed@mail.gmail.com>
	<4A82DBE7.3090901@compulab.co.il>
	<967093cd0908122207q5198dfe8j207455c477dacf23@mail.gmail.com>
	<4A83A3B2.4070300@compulab.co.il>
Date: Thu, 13 Aug 2009 12:42:18 +0530
Message-ID: <967093cd0908130012j2754fc07m75068b6d971c7bc0@mail.gmail.com>
Subject: Re: Problem with nand flash while booting 2.6.30
From: Saurabh Kadekodi <saurabhkadekodi@gmail.com>
To: Mike Rapoport <mike@compulab.co.il>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

Thanks for the solution. That really helped. Board is now recognising
the flash device.

Regards,
Saurabh

On Thu, Aug 13, 2009 at 10:55 AM, Mike Rapoport<mike@compulab.co.il> wrote:
> Hi Saurabh,
> (Adding linux-mtd back to CC)
>
> Saurabh Kadekodi wrote:
>> Hi Mike,
>>
>> I have already enabled the NAND_BUILTIN in the kernel configuration.
>> That is why it iterated through all the providers and then since it
>> couldn't match any of the providers it printed 'Unknown'.
>
> Try setting .keep_config in pxa3xx_nand_platform_data in your board
> configuration file. This will tell the driver to preserve controller sett=
ings
> set up by the bootloader.
>
>> Actually it is a Micron Nand flash.
>>
>> It can't be a jffs2 problem since the driver itself cannot recognize
>> the hardware. Can it be timing related?
>>
>> Thanks and Regards,
>>
>> Saurabh
>>
>>
>>
>> On Wed, Aug 12, 2009 at 8:42 PM, Mike Rapoport<mike@compulab.co.il> wrot=
e:
>>>
>>> Saurabh Kadekodi wrote:
>>>> Hi All,
>>>>
>>>> I am working on a board with pxa320 processor. It has a micron 128 mb
>>>> flash. It boots well with kernel 2.6.25, but when booting with 2.6.30,
>>>> it somehow cannot detect the nand chip properly.
>>>>
>>>> It shows following messages:
>>>>
>>>> NAND device: Manufacturer ID: 0x00, Chip ID: 0xa1 (Unknown NAND 128MiB
>>>> 1,8V 8-bit)
>>>>
>>>> While with 2.6.25 it properly detects as a micron flash.
>>> Make sure that you either select CONFIG_MTD_NAND_PXA3xx_BUILTIN or set
>>> .keep_config flag in pxa3xx_nand_platform_data in your board configurat=
ion.
>>>
>>>> Then later it gives a lot of ECC errors and prints the following messa=
ges:
>>>>
>>>>
>>>> Cowardly refusing to erase blocks on filesystem with no valid JFFS2 no=
des
>>>>> empty_blocks 0, bad_blocks 208, c->nr_blocks 438
>>>>> VFS: Cannot open root device "mtdblock2" or unknown-block(31,2)
>>>>> Please append a correct "root=3D" boot option; here are the available=
 partitions:
>>>>> 1f00 =A0 =A0 =A0 =A0 =A0 =A0 256 mtdblock0 (driver?)
>>>>> 1f01 =A0 =A0 =A0 =A0 =A0 =A02048 mtdblock1 (driver?)
>>>>> 1f02 =A0 =A0 =A0 =A0 =A0112128 mtdblock2 (driver?)
>>>>> 1f03 =A0 =A0 =A0 =A0 =A0 =A0 512 mtdblock3 (driver?)
>>>>> b300 =A0 =A0 =A0 =A0 2008064 mmcblk0 driver: mmcblk
>>>>> =A0 b301 =A0 =A0 =A0 =A0 =A0 31288 mmcblk0p1
>>>>> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-b=
lock(31,2)
>>>>> Backtrace:
>>>>> [<c0028a34>] (dump_backtrace+0x0/0x110) from [<c0028b78>] (dump_stack=
+0x18/0x1c)
>>>>> =A0r6:c03af144 r5:c001d884 r4:cf81df54
>>>>> [<c0028b60>] (dump_stack+0x0/0x1c) from [<c003ca9c>] (panic+0x60/0x13=
c)
>>>>> [<c003ca3c>] (panic+0x0/0x13c) from [<c0008dac>] (mount_block_root+0x=
104/0x234)
>>>>> =A0r3:00000000 r2:20000013 r1:cf81df54 r0:c0330e50
>>>>> [<c0008ca8>] (mount_block_root+0x0/0x234) from [<c0008fb8>] (mount_ro=
ot+0xdc/0x100)
>>>>> [<c0008edc>] (mount_root+0x0/0x100) from [<c0009024>] (prepare_namesp=
ace+0x48/0x190)
>>>>> =A0r7:00000000 r6:c001d840 r5:c001d83c r4:c03ae0c4
>>>>> [<c0008fdc>] (prepare_namespace+0x0/0x190) from [<c00087dc>] (kernel_=
init+0xc8/0xf4)
>>>>> =A0r6:c001cdec r5:c001cb58 r4:c03ae0b8
>>>>> [<c0008714>] (kernel_init+0x0/0xf4) from [<c003fc90>] (do_exit+0x0/0x=
6c8)
>>>>> =A0r6:00000000 r5:00000000 r4:00000000
>>>>>
>>>>>
>>>> Please can someone guide me as to what maybe wrong. The flash cannot
>>>> be corrupt as
>>>> 2.6.25 boots correctly. Then where am I going wrong?
>>>>
>>>> Thanks in advance,
>>>>
>>>> Saurabh
>>>>
>>>> ______________________________________________________
>>>> Linux MTD discussion mailing list
>>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>>
>>> --
>>> Sincerely yours,
>>> Mike.
>>>
>>>
>>
>
> --
> Sincerely yours,
> Mike.
>
>
