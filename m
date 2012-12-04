Received: from mail.pce.us.com ([69.40.160.195])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tftv3-0007cA-Br
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 14:56:23 +0000
Message-ID: <50BE0F12.80709@itwatchdogs.com>
Date: Tue, 4 Dec 2012 08:56:18 -0600
From: Zach Sadecki <zsadecki@itwatchdogs.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBI Fastmap fixes for 3.7
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
 <50BE0C7E.6000001@itwatchdogs.com>
 <20121204154806.140d1005@spider.haslach.nod.at>
In-Reply-To: <20121204154806.140d1005@spider.haslach.nod.at>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/04/2012 08:48 AM, Richard Weinberger wrote:
> Am Tue, 4 Dec 2012 08:45:18 -0600
> schrieb Zach Sadecki <zsadecki@itwatchdogs.com>:
>
>> On 12/03/2012 01:57 PM, Richard Weinberger wrote:
>>> This patch series contains two brown-paper-bag-bugfixes.
>>> I'm very sorry for them!
>>>
>>> [PATCH 1/2] ubi: Remove PEB from free tree in get_peb_for_wl()
>>> This one fixes a very odd issue with fastmap disabled.
>>> With fastmap disabled get_peb_for_wl() did not remove PEBs from
>>> the free list. Therefore the free, used and scrub trees got
>>> corrupted.
>>>
>>> [PATCH 2/2] ubi: Dont call ubi_self_check_all_ff() in __wl_get_peb()
>>> The issue fixed by that patch is also very nasty. I missed that
>>> ubi_self_check_all_ff() can sleep. So, we cannot call it from
>>> __wl_get_peb().
>>>
>>> Thanks,
>>> //richard
>> Thanks, guys.  An overnight test run has shown that these patches
>> have fixed the UBI problems on my board.  Something else odd is
>> happening, but that's for another thread...
> Good to know.
> Is the other issue also related to UBI?
>
> Thanks,
> //richard

Yes, it's related, but it may be the gpmi driver.  I'm getting -74 ECC 
errors occasionally which I shouldn't ever, as bitflips are being 
reported and fixed correctly now and the bitflip_threshold is turned 
down enough that it'd take 3 simultaneously appearing bit errors to be 
uncorrectable.  When these ECC errors occur there appears to be some 
wacky behavior from UBI. Maybe it's normal/expected, but it sure looks 
odd to me.  Here's the kernel messages:

[49980.860000] UBI: fixable bit-flip detected at PEB 3310
[49980.870000] UBI: schedule PEB 3310 for scrubbing
[49980.970000] UBI: fixable bit-flip detected at PEB 3310
[49981.120000] UBI warning: ubi_io_read: error -74 (ECC error) while 
reading 120832 bytes from PEB 3261:4096, read only 120832 bytes, retry
[49981.200000] UBI warning: ubi_io_read: error -74 (ECC error) while 
reading 120832 bytes from PEB 3261:4096, read only 120832 bytes, retry
[49981.270000] UBI warning: ubi_io_read: error -74 (ECC error) while 
reading 120832 bytes from PEB 3261:4096, read only 120832 bytes, retry
[49981.340000] UBI error: ubi_io_read: error -74 (ECC error) while 
reading 120832 bytes from PEB 3261:4096, read 120832 bytes
[49981.360000] [<c000daec>] (unwind_backtrace+0x0/0x134) from 
[<c02838f0>] (ubi_io_read+0x180/0x338)
[49981.370000] [<c02838f0>] (ubi_io_read+0x180/0x338) from [<c0280e40>] 
(ubi_eba_copy_leb+0x540/0x710)
[49981.370000] [<c0280e40>] (ubi_eba_copy_leb+0x540/0x710) from 
[<c0286e00>] (wear_leveling_worker+0x4bc/0x9c8)
[49981.380000] [<c0286e00>] (wear_leveling_worker+0x4bc/0x9c8) from 
[<c028592c>] (do_work+0x8c/0x110)
[49981.390000] [<c028592c>] (do_work+0x8c/0x110) from [<c0287740>] 
(ubi_thread+0xd4/0x178)
[49981.400000] [<c0287740>] (ubi_thread+0xd4/0x178) from [<c0037580>] 
(kthread+0xa0/0xac)
[49981.410000] [<c0037580>] (kthread+0xa0/0xac) from [<c00092e8>] 
(ret_from_fork+0x14/0x2c)
[49981.420000] UBI warning: ubi_eba_copy_leb: error -74 while reading 
data back from PEB 3261
[49981.430000] UBI: run torture test for PEB 3261
[49982.100000] UBI: PEB 3261 passed torture test, do not mark it as bad
[49982.180000] UBI: fixable bit-flip detected at PEB 3310
[49982.330000] UBI: fixable bit-flip detected at PEB 3261
[49982.330000] UBI: run torture test for PEB 3261
[49983.000000] UBI: PEB 3261 passed torture test, do not mark it as bad
[49983.080000] UBI: fixable bit-flip detected at PEB 3310
[49983.240000] UBI: fixable bit-flip detected at PEB 3261
[49983.240000] UBI: run torture test for PEB 3261
[49983.910000] UBI: PEB 3261 passed torture test, do not mark it as bad
[49984.000000] UBI: fixable bit-flip detected at PEB 3310
[49984.170000] UBI warning: ubi_io_read: error -74 (ECC error) while 
reading 126976 bytes from PEB 3261:4096, read only 126976 bytes, retry
[49984.260000] UBI warning: ubi_io_read: error -74 (ECC error) while 
reading 126976 bytes from PEB 3261:4096, read only 126976 bytes, retry
[49984.340000] UBI warning: ubi_io_read: error -74 (ECC error) while 
reading 126976 bytes from PEB 3261:4096, read only 126976 bytes, retry
[49984.420000] UBI error: ubi_io_read: error -74 (ECC error) while 
reading 126976 bytes from PEB 3261:4096, read 126976 bytes
[49984.430000] [<c000daec>] (unwind_backtrace+0x0/0x134) from 
[<c02838f0>] (ubi_io_read+0x180/0x338)
[49984.440000] [<c02838f0>] (ubi_io_read+0x180/0x338) from [<c0280e40>] 
(ubi_eba_copy_leb+0x540/0x710)
[49984.450000] [<c0280e40>] (ubi_eba_copy_leb+0x540/0x710) from 
[<c0286e00>] (wear_leveling_worker+0x4bc/0x9c8)
[49984.460000] [<c0286e00>] (wear_leveling_worker+0x4bc/0x9c8) from 
[<c028592c>] (do_work+0x8c/0x110)
[49984.470000] [<c028592c>] (do_work+0x8c/0x110) from [<c0287740>] 
(ubi_thread+0xd4/0x178)
[49984.480000] [<c0287740>] (ubi_thread+0xd4/0x178) from [<c0037580>] 
(kthread+0xa0/0xac)
[49984.490000] [<c0037580>] (kthread+0xa0/0xac) from [<c00092e8>] 
(ret_from_fork+0x14/0x2c)
[49984.500000] UBI warning: ubi_eba_copy_leb: error -74 while reading 
data back from PEB 3261
[49984.500000] UBI: run torture test for PEB 3261
[49985.170000] UBI: PEB 3261 passed torture test, do not mark it as bad
[49985.260000] UBI: fixable bit-flip detected at PEB 3310
[49985.440000] UBI warning: ubi_io_read: error -74 (ECC error) while 
reading 126976 bytes from PEB 3261:4096, read only 126976 bytes, retry
[49985.530000] UBI warning: ubi_io_read: error -74 (ECC error) while 
reading 126976 bytes from PEB 3261:4096, read only 126976 bytes, retry
[49985.610000] UBI warning: ubi_io_read: error -74 (ECC error) while 
reading 126976 bytes from PEB 3261:4096, read only 126976 bytes, retry
[49985.690000] UBI error: ubi_io_read: error -74 (ECC error) while 
reading 126976 bytes from PEB 3261:4096, read 126976 bytes
[49985.710000] [<c000daec>] (unwind_backtrace+0x0/0x134) from 
[<c02838f0>] (ubi_io_read+0x180/0x338)
[49985.710000] [<c02838f0>] (ubi_io_read+0x180/0x338) from [<c0280e40>] 
(ubi_eba_copy_leb+0x540/0x710)
[49985.720000] [<c0280e40>] (ubi_eba_copy_leb+0x540/0x710) from 
[<c0286e00>] (wear_leveling_worker+0x4bc/0x9c8)
[49985.730000] [<c0286e00>] (wear_leveling_worker+0x4bc/0x9c8) from 
[<c028592c>] (do_work+0x8c/0x110)
[49985.740000] [<c028592c>] (do_work+0x8c/0x110) from [<c0287740>] 
(ubi_thread+0xd4/0x178)
[49985.750000] [<c0287740>] (ubi_thread+0xd4/0x178) from [<c0037580>] 
(kthread+0xa0/0xac)
[49985.760000] [<c0037580>] (kthread+0xa0/0xac) from [<c00092e8>] 
(ret_from_fork+0x14/0x2c)
[49985.770000] UBI warning: ubi_eba_copy_leb: error -74 while reading 
data back from PEB 3261
[49985.780000] UBI: run torture test for PEB 3261
[49986.450000] UBI: PEB 3261 passed torture test, do not mark it as bad
[49986.530000] UBI: fixable bit-flip detected at PEB 3310
[49986.710000] UBI: fixable bit-flip detected at PEB 3261
[49986.710000] UBI: run torture test for PEB 3261
[49987.380000] UBI: PEB 3261 passed torture test, do not mark it as bad
[49987.500000] UBI: fixable bit-flip detected at PEB 3310
[49987.700000] UBI: fixable bit-flip detected at PEB 3261
[49987.710000] UBI: run torture test for PEB 3261
[49988.370000] UBI: PEB 3261 passed torture test, do not mark it as bad
[49988.450000] UBI: fixable bit-flip detected at PEB 3310
[49988.620000] UBI: scrubbed PEB 3310 (LEB 3:807), data moved to PEB 3261
