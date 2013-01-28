Received: from mail-da0-f42.google.com ([209.85.210.42])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tzs8b-00078q-Tt
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 17:04:54 +0000
Received: by mail-da0-f42.google.com with SMTP id z17so1344844dal.29
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2013 09:04:52 -0800 (PST)
Message-ID: <5106AFAA.1020502@gmail.com>
Date: Mon, 28 Jan 2013 22:34:42 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
In-Reply-To: <5105EE9B.9050405@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/28/2013 8:50 AM, Huang Shijie wrote:
> 于 2013年01月28日 10:39, Vikram Narayanan 写道:
>> Hello Huang,
>>
>> On 1/21/2013 7:42 AM, Huang Shijie wrote:
>>> 于 2013年01月19日 00:52, Vikram Narayanan 写道:
>>>> Hi,
>>>>
>>>> When I try to run the mtd_oobtest on an i.Mx6Q board, it results in a
>>>> failure with the following error.
>>>> I'm using 3.5.7 Kernel.
>>>>
>>>> root@freescale:/# insmod mtd_oobtest.ko dev=6
>>>> [ 7534.508880]
>>>> [ 7534.511228] =================================================
>>>> [ 7534.518460] mtd_oobtest: MTD device: 6
>>>> [ 7534.523000] mtd_oobtest: MTD device size 304087040, eraseblock size
>>>> 262144, page size 4096, count of eraseblocks 1160, pages per
>>>> eraseblock 64, OOB size 128
>>>> [ 7534.539301] mtd_oobtest: scanning for bad eraseblocks
>>>> [ 7534.545345] mtd_oobtest: scanned 1160 eraseblocks, 0 are bad
>>>> [ 7534.552482] mtd_oobtest: test 1 of 5
>>>> [ 7534.556797] mtd_oobtest: erasing whole device
>>>> [ 7537.523540] mtd_oobtest: erased 1160 eraseblocks
>>>> [ 7537.528888] mtd_oobtest: writing OOBs of whole device
>>>> [ 7537.534704] mtd_oobtest: error: writeoob failed at 0x0
>>>> [ 7537.540562] mtd_oobtest: error: use_len 0, use_offset 0
>>>> [ 7537.546565] mtd_oobtest: error -22 occurred
>>>> [ 7537.551456] =================================================
>>>>
>>>> This boils down to the fake "struct nand_ecclayout" defined in
>>>> <drivers/mtd/nand/gpmi-nand/gpmi-nand.c>
>>>>
>>>> Is there a way to run this test successfully?
>>> The gpmi-nand may use all the oob. So the oobtest may fails.
>>
>> I'm in receipt of the error mentioned in [1]. The FAQ also suggests to
>> run mtd_tests. mtd_oobtest might give more information on whether or
>> not the NAND driver is buggy.
>>
>> Since I couldn't run this test on gpmi-nand due to the driver design,
>> any ideas on how do I resolve the "ubi_io_read: error -74 (ECC error)"
>> while mounting my UBIFS?
>>
> [1] what's the kernel's version?

The above log is from 3.5.7, but the results are same for the latest 
kernel (3.8-rc) too.

> [2] what's type of the nand chips?
>      could you show me the nand chip's geometry?

Toshiba, 4 Gbit, (4096 +224) bytes ×64 pages ×2048blocks
writesize - 4KiB
oobsize - 224 bytes

Regards,
Vikram
