Received: from us-smtp-delivery-107.mimecast.com ([63.128.21.107])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5CI8-0007CF-Fc
 for linux-mtd@lists.infradead.org; Thu, 19 Oct 2017 14:59:26 +0000
Subject: Re: [PATCH v2 0/2] mtd: nand: wait for tWHR, and fix the
 setup_data_interface of Denali
To: Masahiro Yamada <yamada.masahiro@socionext.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Mason
 <slash.tmp@free.fr>, Richard Weinberger <richard@nod.at>, LKML
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
 <20170929142635.07d55f77@bbrezillon>
 <CAK7LNASiker+1_uHXyhdkSJVMCX-TwXLhxD_ibQFLXWR9u0p6w@mail.gmail.com>
 <e96ba107-9636-715d-7d53-fa79e0890a3d@sigmadesigns.com>
 <CAK7LNAR0xNm9PVxrsqvHHTMDHYwBuP+1MDmAr7=jDBMg1Qi6UQ@mail.gmail.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <45cccdbe-9787-1b07-a04b-526c87d5e550@sigmadesigns.com>
Date: Thu, 19 Oct 2017 16:58:53 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR0xNm9PVxrsqvHHTMDHYwBuP+1MDmAr7=jDBMg1Qi6UQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13/10/2017 10:34, Masahiro Yamada wrote:

> 2017-10-04 20:05, Marc Gonzalez wrote:
> 
>> On 29/09/2017 16:33, Masahiro Yamada wrote:
>>
>>> tango_nand.c is the only driver that sets NAND_WAIT_TCCS.
>>>
>>> Now, there is completely no delay when reading out the ID.
>>>
>>>
>>> One safe change might be apply this patch,
>>> then set NAND_WAIT_TWHR to tango_nand.c
>>>
>>>
>>> I am guessing NAND_WAIT_TCCS was added for it.
>>> Theoretically, I do not see logical difference between tCCS and tWHR.
>>>
>>> I am CCing Marc Gonzalez, the author of tango_nand.c
>>
>> Hello Masahiro,
>>
>> I remember having issues reading the ONFI ID when I was writing
>> the driver, a year ago. Sometimes, the first few bytes appeared
>> to be missing. This looked like a timing issue.
>>
>> Adding the dev_ready call-back solved the problem. Do you think
>> that was by accident?
> 
> It is odd to use dev_ready() hook to insert delay for the READ ID command.
> READ ID command never toggles the device's Ready/Busy# pin.
> 
> 
>> When I have more time, I will test the 4.14
>> branch, to see if there are any issues with the current driver.
> 
> 
> Yeah, I highly recommend you to test your driver on the latest kernel.
> I suspect it is broken because READ ID command in the generic hook
> has absolutely zero delay.
> 
> As I proposed already, the correct fix it to wait for tWHR.

Hello Masahiro,

I checked out v4.14-rc5, imported the DMA driver (which is, unfortunately,
not upstream) and DT nodes.

Chip identification seems to work out-of-the-box at least on my dev board
with that specific NAND chip model:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.14.0-rc5 (mgonzalez@misti.france.sdesigns.com) (gcc version 7.1.1 20170707 (Linaro GCC 7.1-2017.08)) #2 SMP PREEMPT Thu Oct 19 16:36:36 CEST 2017
[    0.000000] CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: Sigma Designs SMP8758 Vantage-1172 Rev E1
...
[    0.964542] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc
[    0.970951] nand: Micron MT29F4G08ABADAWP
[    0.974986] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    0.982632] Scanning device for bad blocks
[    1.231971] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc
[    1.238370] nand: Micron MT29F4G08ABADAWP
[    1.242405] nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    1.250041] Scanning device for bad blocks


I don't know enough about NAND chips to tell if it works by accident,
or if this is expected. I seem to recall that the first few operations
are carried out at the slowest possible speed, until the core figures
out the best timings for maximum performance. Maybe my controller can
cope with no wait at the slow speeds...

Regards.


Results of some mtd tests:

# modprobe mtd_speedtest dev=1
[  462.394474] mtd_speedtest: MTD device: 1
[  462.398447] mtd_speedtest: MTD device size 536870912, eraseblock size 131072, page size 2048, count of eraseblocks 4096, pages per eraseblock 64, OOB size 64
[  462.413301] mtd_test: scanning for bad eraseblocks
[  462.419640] mtd_test: scanned 4096 eraseblocks, 0 are bad
[  465.321466] mtd_speedtest: testing eraseblock write speed
[  529.053883] mtd_speedtest: eraseblock write speed is 8227 KiB/s
[  529.059843] mtd_speedtest: testing eraseblock read speed
[  564.486643] mtd_speedtest: eraseblock read speed is 14801 KiB/s
[  567.642582] mtd_speedtest: testing page write speed
[  631.715184] mtd_speedtest: page write speed is 8183 KiB/s
[  631.720619] mtd_speedtest: testing page read speed
[  667.403583] mtd_speedtest: page read speed is 14694 KiB/s
[  670.560833] mtd_speedtest: testing 2 page write speed
[  734.453881] mtd_speedtest: 2 page write speed is 8206 KiB/s
[  734.459490] mtd_speedtest: testing 2 page read speed
[  770.031472] mtd_speedtest: 2 page read speed is 14741 KiB/s
[  770.037092] mtd_speedtest: Testing erase speed
[  773.196752] mtd_speedtest: erase speed is 166176 KiB/s
[  773.201920] mtd_speedtest: Testing 2x multi-block erase speed
[  774.815910] mtd_speedtest: 2x multi-block erase speed is 326049 KiB/s
[  774.822388] mtd_speedtest: Testing 4x multi-block erase speed
[  776.436174] mtd_speedtest: 4x multi-block erase speed is 326049 KiB/s
[  776.442652] mtd_speedtest: Testing 8x multi-block erase speed
[  778.055158] mtd_speedtest: 8x multi-block erase speed is 326455 KiB/s
[  778.061636] mtd_speedtest: Testing 16x multi-block erase speed
[  779.673697] mtd_speedtest: 16x multi-block erase speed is 326455 KiB/s
[  779.680262] mtd_speedtest: Testing 32x multi-block erase speed
[  781.292462] mtd_speedtest: 32x multi-block erase speed is 326455 KiB/s
[  781.299027] mtd_speedtest: Testing 64x multi-block erase speed
[  782.910486] mtd_speedtest: 64x multi-block erase speed is 326659 KiB/s
[  782.917051] mtd_speedtest: finished


# modprobe mtd_stresstest dev=1
[ 1021.866306] mtd_stresstest: MTD device: 1
[ 1021.870356] mtd_stresstest: MTD device size 536870912, eraseblock size 131072, page size 2048, count of eraseblocks 4096, pages per eraseblock 64, OOB size 64
[ 1021.886066] mtd_test: scanning for bad eraseblocks
[ 1021.892415] mtd_test: scanned 4096 eraseblocks, 0 are bad
[ 1021.897847] mtd_stresstest: doing operations
[ 1021.902144] mtd_stresstest: 0 operations done
[ 1032.537748] mtd_stresstest: 1024 operations done
[ 1043.112145] mtd_stresstest: 2048 operations done
[ 1053.744567] mtd_stresstest: 3072 operations done
[ 1063.928274] mtd_stresstest: 4096 operations done
[ 1074.518502] mtd_stresstest: 5120 operations done
[ 1084.890384] mtd_stresstest: 6144 operations done
[ 1095.128781] mtd_stresstest: 7168 operations done
[ 1105.454702] mtd_stresstest: 8192 operations done
[ 1115.597722] mtd_stresstest: 9216 operations done
[ 1122.858549] mtd_stresstest: finished, 10000 operations done
