Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLDTR-0002md-RC
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2015 16:47:59 +0000
Received: by wibud3 with SMTP id ud3so39343606wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2015 09:47:35 -0700 (PDT)
From: Bhuvanchandra DV <bhuvanchandradv@gmail.com>
Subject: Re: UBIFS errors when file-system is full
To: Richard Weinberger <richard@nod.at>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com> <55A4ED47.4060802@nod.at>
 <55A74812.2020906@gmail.com> <55A74AA1.2000000@nod.at>
 <55A7540C.3050900@nod.at> <55A7592D.6010906@gmail.com>
 <55A75A05.7040603@nod.at> <55ADE0F1.9090809@gmail.com>
 <55ADE35F.6050808@nod.at> <55AF41DD.2060902@gmail.com>
 <55AF4447.50500@nod.at> <55B24F2F.9020705@gmail.com>
 <55B26D24.3060006@nod.at>
Cc: linux-mtd@lists.infradead.org
Message-ID: <55BBA6A5.9020701@gmail.com>
Date: Fri, 31 Jul 2015 18:47:33 +0200
MIME-Version: 1.0
In-Reply-To: <55B26D24.3060006@nod.at>
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

On 07/24/2015 06:51 PM, Richard Weinberger wrote:

> Hi!
>
> Am 24.07.2015 um 16:43 schrieb Bhuvanchandra DV:
>> Disabled fastmap in U-Boot, still the corruption is persistent when using
>> U-Boot to mount rootfs and load kernel.
> Can you please describe your boot setup in detail?
> Why does U-Boot _mount_ an UBIFS? Install the kernel on an UBI static volume.

U-Boot mounts UBIFS for loading the kernel and device tree blobs availabel in rootfs.
Since approximately around ~3-5 % of spare blocks are reserverd for wear leveling
(according to the NAND manufacturer). Initially we had a separate UBI partition of 8MB
for Kenrel, but after few times of re-writing the kernel to that volume kernel fails
with no available free space. Due to that reason we made a single big ubi volume and
moved the kernel and device tree blobs to rootfs.

> If U-Boot mounts UBIFS it has to use UBI in RW mode and therefore it has to process
> fastmap or _delete_ it.
>
>>>> The same power cut tests are done by skipping the U-Boot to mount the UBIFS. Loaded
>>>> the kernel via tftp and mount the rootfs with kernel. The power cut test passed.
>>>> I think U-Boot might have some issues, but not very sure.
>>> To my knowledge U-Boot's fastmap support is incomplete.
>>> If you *really* need fastmap in U-Boot make sure that they have backported
>>> all recent fastmap changes. Fastmap is still experimental and faced a lot of fixes
>>> recently.
>> Tested with mainline U-Boot along with few downstream patches for boot config block
>> support applied, the ubifs corruption is persistant.
>>
>>>>> Anyway, we need to sort out what is going on.
>>>>> As fm_debug does not trigger it could also be a non-fastmap issue.
>>>>> Did you try your test without fastmap being enabled?
>>>>>
>>>>> Does your target pass UBI tests too?
>>>> I'm not aware of UBI tests so far the driver passed all MTD tests.
>>>> Can you please provide some pointers for UBI tests. Will run the UBI tests with
>>>> driver.
>>> They are in the mtd-utils source.
>> Not yet ran the ubi-tests. Will run the tests and share the results.
> Please do so. :-)

Seems the mtd-utils are not really cross-compile friendly, some how managed to build the ubi-tests
tweeking the Makefiles.

The tests ran on ubi partition after isolating it from U-Boot completly.
Formatted the ubi partition and then boot with SD card (4.1.2 kernel fastmap enabled/disabled, fm_debug enabled).
Please find the below log of ubi-tests:

root@colibri-vf:~# ubiattach -m 3
[   44.663944] ubi0: default fastmap pool size: 50
[   44.668930] ubi0: default fastmap WL pool size: 25
[   44.674045] ubi0: attaching mtd3
[   44.995279] ubi0: scanning is finished
[   44.999364] ubi0: empty MTD device detected
[   45.033211] ubi0: attached mtd3 (name "ubi", size 126 MiB)
[   45.039205] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[   45.046572] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[   45.053715] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[   45.061141] ubi0: good PEBs: 1003, bad PEBs: 5, corrupted PEBs: 0
[   45.067951] ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
[   45.075701] ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 595808446
[   45.085278] ubi0: available PEBs: 982, total reserved PEBs: 21, PEBs reserved for bad PEB handling: 15
[   45.101889] ubi0: background thread "ubi_bgt0d" started, PID 337
UBI device number 0, total 1003 LEBs (127356928 bytes, 121.5 MiB), available 982 LEBs (124690432 bytes, 118.9 MiB), LEB size 126976 bytes (124.0 KiB)
root@colibri-vf:~# cd ubi-tests-bin/
root@colibri-vf:~/ubi-tests-bin# ./runtests.sh /dev/ubi0 - test /dev/ubi0
Running mkvol_basic /dev/ubi0
Running mkvol_bad /dev/ubi0
[   99.630756] ubi0 error: verify_mkvol_req: bad volume creation request
[   99.637579] Volume creation request dump:
[   99.641987]  vol_id    -2
[   99.644784]  alignment 1
[   99.647466]  bytes     124690432
[   99.650994]  vol_type  3
[   99.653696]  name_len  22
[   99.656464]  1st 16 characters of name: mkvol_bad:test_m
[   99.669464] ubi0 error: verify_mkvol_req: bad volume creation request
[   99.676292] Volume creation request dump:
[   99.680674]  vol_id    128
[   99.683558]  alignment 1
[   99.686240]  bytes     124690432
[   99.694911]  vol_type  3
[   99.702852]  name_len  22
[   99.710786]  1st 16 characters of name: mkvol_bad:test_m
[   99.728668] ubi0 error: verify_mkvol_req: bad volume creation request
[   99.740962] Volume creation request dump:
[   99.750630]  vol_id    0
[   99.758537]  alignment 0
[   99.766352]  bytes     124690432
[   99.774804]  vol_type  3
[   99.782409]  name_len  22
[   99.789923]  1st 16 characters of name: mkvol_bad:test_m
[   99.808480] ubi0 error: verify_mkvol_req: bad volume creation request
[   99.820028] Volume creation request dump:
[   99.828796]  vol_id    0
[   99.835879]  alignment -1
[   99.842859]  bytes     124690432
[   99.850335]  vol_type  3
[   99.856849]  name_len  22
[   99.863395]  1st 16 characters of name: mkvol_bad:test_m
[   99.880157] ubi0 error: verify_mkvol_req: bad volume creation request
[   99.891064] Volume creation request dump:
[   99.899440]  vol_id    0
[   99.906182]  alignment 126977
[   99.913456]  bytes     124690432
[   99.920926]  vol_type  3
[   99.927467]  name_len  22
[   99.934058]  1st 16 characters of name: mkvol_bad:test_m
[   99.950732] ubi0 error: verify_mkvol_req: bad volume creation request
[   99.961655] Volume creation request dump:
[   99.970057]  vol_id    0
[   99.976826]  alignment 2049
[   99.983931]  bytes     124690432
[   99.991412]  vol_type  3
[   99.997959]  name_len  22
[  100.004551]  1st 16 characters of name: mkvol_bad:test_m
[  100.021254] ubi0 error: verify_mkvol_req: bad volume creation request
[  100.032201] Volume creation request dump:
[  100.040649]  vol_id    0
[  100.047441]  alignment 1
[  100.054334]  bytes     -1
[  100.061191]  vol_type  3
[  100.067708]  name_len  22
[  100.074250]  1st 16 characters of name: mkvol_bad:test_m
[  100.090929] ubi0 error: verify_mkvol_req: bad volume creation request
[  100.101834] Volume creation request dump:
[  100.110223]  vol_id    0
[  100.116969]  alignment 1
[  100.123783]  bytes     0
[  100.130505]  vol_type  3
[  100.136980]  name_len  22
[  100.143502]  1st 16 characters of name: mkvol_bad:test_m
[  100.160274] ubi0 error: ubi_create_volume: not enough PEBs, only 982 available
[  100.175970] ubi0 error: ubi_create_volume: cannot create volume 0, error -28
[  100.189501] ubi0 error: ubi_create_volume: not enough PEBs, only 982 available
[  100.205998] ubi0 error: ubi_create_volume: cannot create volume 0, error -28
[  100.222091] ubi0 error: verify_mkvol_req: bad volume creation request
[  100.233529] Volume creation request dump:
[  100.242409]  vol_id    0
[  100.249771]  alignment 1
[  100.256993]  bytes     126976
[  100.264716]  vol_type  7
[  100.272035]  name_len  22
[  100.279316]  1st 16 characters of name: mkvol_bad:test_m
[  100.416661] ubi0 error: ubi_create_volume: volume 0 already exists
[  100.427776] ubi0 error: ubi_create_volume: cannot create volume 0, error -17
[  100.441410] ubi0 error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
[  100.459295] ubi0 error: ubi_create_volume: cannot create volume 1, error -17
[  100.711027] ubi0 error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
[  100.729733] ubi0 error: ubi_create_volume: cannot create volume 1, error -17
[  131.225291] ubi0 error: ubi_open_volume: cannot open device 0, volume 128, error -22
[  131.244295] ubi0 error: ubi_open_volume: cannot open device 0, volume -1, error -22
[  131.269510] ubi0 error: ubi_open_volume: cannot open device 0, volume 128, error -22
[  131.290092] ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -19
[  131.551660] ubi0 error: ubi_open_volume: cannot open device 0, volume 0, error -19
Running mkvol_paral /dev/ubi0
Running rsvol /dev/ubi0
Running io_basic /dev/ubi0
Running io_read /dev/ubi0
Running io_update /dev/ubi0
Running io_paral /dev/ubi0
[io_paral] write_thread():222: written and read data are different
Running volrefcnt /dev/ubi0
SUCCESS
root@colibri-vf:~/ubi-tests-bin#

>
> Thanks,
> //richard

Best regards,
Bhuvan
