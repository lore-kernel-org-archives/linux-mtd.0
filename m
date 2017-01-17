Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTSEd-0004pZ-0a
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 11:47:33 +0000
Received: by mail-ot0-x22a.google.com with SMTP id 65so61609164otq.2
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2017 03:47:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <01b355e9-6095-a2af-5c77-3e15751ff8da@nod.at>
References: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
 <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
 <CAMBC=j7Yjk5RkT5xg1N=q3aVf45BbJgtYaZ8vsy3oBjZ+OOOaA@mail.gmail.com>
 <01b355e9-6095-a2af-5c77-3e15751ff8da@nod.at>
From: chaitanya vinnakota <chaitanya.sai.v@gmail.com>
Date: Tue, 17 Jan 2017 17:17:09 +0530
Message-ID: <CAMBC=j7fn7tqouMD3ZQptZF_xRO5Xsx7HOXaGQahCQm2ug3RUw@mail.gmail.com>
Subject: Re: UBIFS errors are randomly seen after reboots
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

Seems that the ubi-tests are failing work on my board. I'm getting the
below output when I initiated the test.

# ./runtests.sh /dev/ubi1

Running mkvol_basic /dev/ubi1
[mkvol_basic] __initial_check():74: insufficient available eraseblocks
0 on UBI device, required 5

# ./runtests.sh /dev/ubi1_0
Running mkvol_basic /dev/ubi1_0
[mkvol_basic] __initial_check():69: function ubi_get_dev_info() failed
with error 19 (No such device)

Which device should I pass as the argument , is that ubi1 or ubi1_0
[the partition to mount rootfs ] ?

Added ubinfo of /dev/ubi1_0 and /dev/ubi1 for further reference

root@router6654A1:~/arm-openwrt-linux# ubinfo /dev/ubi1_0
Volume ID:   0 (on ubi1)
Type:        dynamic
Alignment:   1
Size:        680 LEBs (86343680 bytes, 82.3 MiB)
State:       OK
Name:        rootfs
Character device major/minor: 248:1

root@router6654A1:~/arm-openwrt-linux# ubinfo /dev/ubi1
ubi1
Volumes count:                           1
Logical eraseblock size:                 126976 bytes, 124.0 KiB
Total amount of logical eraseblocks:     736 (93454336 bytes, 89.1 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  50
Current maximum erase counter value:     1
Minimum input/output unit size:          2048 bytes
Character device major/minor:            248:0
Present volumes:                         0

Can you please refer to any article/tutorial on understanding the
output of ubi-tests ?

Thanks
Chaitanya

On Mon, Jan 16, 2017 at 10:00 PM, Richard Weinberger <richard@nod.at> wrote:
> Chaitanya,
>
> Am 16.01.2017 um 16:21 schrieb chaitanya vinnakota:
>> Hi Richard,
>>
>> Thanks for your response.
>>
>> Based on your response I enabled chk_io , chk_gen,
>> tst_emulate_bitflips and tst_emulate_power_failure  options in
>> /sys/kernel/debug/ubi/ubi0 directory. I carried on with my test which
>> keeps on creating/writing data to files in all the available nand
>> partitions and during which a reboot is issued .
>>
>>  Below are the various UBI messages I'm seeing quite consistently at
>> different times after enabling the debug options.
>>
>> 1. UBI error: do_sync_erase: cannot erase PEB 200 (emulated)
>> 2. UBI error: erase_worker: failed to erase PEB 200, error -5
>> 3. UBI: mark PEB 200 as bad
>> 4. UBI error: ubi_io_write: cannot write 2048 bytes to PEB 452:0 (emulated)
>> 5. UBI error: erase_worker: failed to erase PEB 452, error -5
>>      UBI: mark PEB 452 as bad
>>      Bad block table written to 0x00000ffe0000, version 0x0B
>>      Bad block table written to 0x00000ffc0000, version 0x0B
>>      UBI: 40 PEBs left in the reserve
>>
>> Are all the above errors forecasting any doom or are they expected ?
>
> You've enabled UBI self-tests and error *emulation*. This is not what I meant.
>
> I had in mind:
> 1. MTD tests, these are available in the kernel source:
>    http://linux-mtd.infradead.org/doc/general.html#L_mtd_tests
>    And now also as part of mtd-utils.
> 2. UBI tests, you can find them in the tests/ubi-tests/ directory
>    of the mtd-utils source package.
>
> David, I think we should add a page to mtd-www on testing. :-)
>
> Thanks,
> //richard
