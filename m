Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTV2S-0001yn-KS
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 14:47:10 +0000
Received: by mail-ot0-x231.google.com with SMTP id 65so64554557otq.2
 for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2017 06:46:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <0f04ed5e-e7fb-7bbf-678d-840fe0be4b16@nod.at>
References: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
 <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
 <CAMBC=j7Yjk5RkT5xg1N=q3aVf45BbJgtYaZ8vsy3oBjZ+OOOaA@mail.gmail.com>
 <01b355e9-6095-a2af-5c77-3e15751ff8da@nod.at>
 <CAMBC=j7fn7tqouMD3ZQptZF_xRO5Xsx7HOXaGQahCQm2ug3RUw@mail.gmail.com>
 <0f04ed5e-e7fb-7bbf-678d-840fe0be4b16@nod.at>
From: chaitanya vinnakota <chaitanya.sai.v@gmail.com>
Date: Tue, 17 Jan 2017 20:16:46 +0530
Message-ID: <CAMBC=j5X5rJdTDkPK=K0ZEzvo5w7mBnOygqdPqWqopRm=wgG3w@mail.gmail.com>
Subject: Re: UBIFS errors are randomly seen after reboots
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
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
I formatted the mtd partition using ubiformat and issued ubiattach on
the mtd partition.

root@router6654A1:~/arm-openwrt-linux# ubiformat /dev/mtd7

ubiformat: mtd7 (nand), size 96468992 bytes (92.0 MiB), 736
eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 735 -- 100 % complete
ubiformat: 736 eraseblocks have valid erase counter, mean value is 0
ubiformat: formatting eraseblock 735 -- 100 % complete

root@router6654A1:~/arm-openwrt-linux# ubiattach -p /dev/mtd7

[77286.016761] UBI: default fastmap pool size: 35
[77286.021226] UBI: default fastmap WL pool size: 25
[77286.026003] UBI: attaching mtd7 to ubi1

[77289.297700] UBI: scanning is finished
[77289.352234] UBI: attached mtd7 (name "rootfs2", size 92 MiB) to ubi1
[77289.358649] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[77289.365476] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[77289.372201] UBI: VID header offset: 2048 (aligned 2048), data offset: 4096
[77289.379112] UBI: good PEBs: 736, bad PEBs: 0, corrupted PEBs: 0
[77289.385060] UBI: user volume: 0, internal volumes: 1, max. volumes count: 128
[77289.392220] UBI: max/mean erase counter: 2/1, WL threshold: 4096,
image sequence number: 1177844582
[77289.401303] UBI: available PEBs: 680, total reserved PEBs: 56, PEBs
reserved for bad PEB handling: 50
[77289.410574] UBI: background thread "ubi_bgt1d" started, PID 20224
UBI device number 1, total 736 LEBs (93454336 bytes, 89.1 MiB),
available 680 LEBs (86343680 bytes, 82.3 MiB), LEB size 126976 bytes
(124.0 )

Now , I'm seeing altogether different form of errors.

./runtests.sh /dev/ubi1
Running mkvol_basic /dev/ubi1
Running mkvol_bad /dev/ubi1

[77361.468670] UBI error: verify_mkvol_req: bad volume creation request
[77361.475116] Volume creation request dump:
[77361.479139]  vol_id    -2
[77361.481768]  alignment 1
[77361.484322]  bytes     86343680
[77361.487473]  vol_type  3
[77361.490013]  name_len  22
[77361.492641]  1st 16 characters of name: mkvol_bad:test_m
[77361.498235] UBI error: verify_mkvol_req: bad volume creation request
[77361.504652] Volume creation request dump:
[77361.508676]  vol_id    128
[77361.511390]  alignment 1
[77361.513930]  bytes     86343680
[77361.517095]  vol_type  3
[77361.519636]  name_len  22
[77361.522265]  1st 16 characters of name: mkvol_bad:test_m
[77361.527634] UBI error: verify_mkvol_req: bad volume creation request
[77361.534009] Volume creation request dump:
[77361.538064]  vol_id    0
[77361.540606]  alignment 0
[77361.543145]  bytes     86343680
[77361.546316]  vol_type  3
[77361.548857]  name_len  22
[77361.551485]  1st 16 characters of name: mkvol_bad:test_m
[77361.558437] UBI error: verify_mkvol_req: bad volume creation request
[77361.564862] Volume creation request dump:
[77361.568902]  vol_id    0
[77361.571457]  alignment -1
[77361.574101]  bytes     86343680
[77361.577313]  vol_type  3
[77361.579866]  name_len  22
[77361.582504]  1st 16 characters of name: mkvol_bad:test_m
[77361.587943] UBI error: verify_mkvol_req: bad volume creation request
[77361.594355] Volume creation request dump:
[77361.598394]  vol_id    0
[77361.600945]  alignment 126977
[77361.603936]  bytes     86343680
[77361.607132]  vol_type  3
[77361.609688]  name_len  22
[77361.612329]  1st 16 characters of name: mkvol_bad:test_m
[77361.617765] UBI error: verify_mkvol_req: bad volume creation request
[77361.624199] Volume creation request dump:
[77361.628241]  vol_id    0
[77361.630800]  alignment 2049
[77361.633617]  bytes     86343680
[77361.636814]  vol_type  3
[77361.639368]  name_len  22
[77361.642010]  1st 16 characters of name: mkvol_bad:test_m
[77361.647478] UBI error: verify_mkvol_req: bad volume creation request
[77361.653868] Volume creation request dump:
[77361.657940]  vol_id    0
[77361.660510]  alignment 1
[77361.663065]  bytes     -1
[77361.665739]  vol_type  3
[77361.668290]  name_len  22
[77361.670930]  1st 16 characters of name: mkvol_bad:test_m
[77361.676360] UBI error: verify_mkvol_req: bad volume creation request
[77361.682748] Volume creation request dump:
[77361.686826]  vol_id    0
[77361.689383]  alignment 1
[77361.691936]  bytes     0
[77361.694513]  vol_type  3
[77361.697068]  name_len  22
[77361.699708]  1st 16 characters of name: mkvol_bad:test_m
[77361.705119] UBI error: ubi_create_volume: not enough PEBs, only 680 available
[77361.712293] UBI error: ubi_create_volume: cannot create volume 0, error -28
[77361.719415] UBI error: ubi_create_volume: not enough PEBs, only 680 available
[77361.726655] UBI error: ubi_create_volume: cannot create volume 0, error -28
[77361.733804] UBI error: verify_mkvol_req: bad volume creation request
[77361.740243] Volume creation request dump:
[77361.744301]  vol_id    0
[77361.746854]  alignment 1
[77361.749407]  bytes     126976
[77361.752397]  vol_type  7
[77361.754981]  name_len  22
[77361.757622]  1st 16 characters of name: mkvol_bad:test_m
[77361.926468] UBI error: ubi_create_volume: volume 0 already exists
[77361.932606] UBI error: ubi_create_volume: cannot create volume 0, error -17
[77361.939839] UBI error: ubi_create_volume: volume
"mkvol_bad:test_mkvol()" exists (ID 0)
[77361.947946] UBI error: ubi_create_volume: cannot create volume 1, error -17
[77362.290898] UBI error: ubi_create_volume: volume
"mkvol_bad:test_mkvol()" exists (ID 0)
[77362.299021] UBI error: ubi_create_volume: cannot create volume 1, error -17
[77405.406937] UBI error: ubi_open_volume: cannot open device 1,
volume 128, error -22
[77405.420226] UBI error: ubi_open_volume: cannot open device 1,
volume -1, error -22
[77405.427910] UBI error: ubi_open_volume: cannot open device 1,
volume 128, error -22
[77405.435657] UBI error: ubi_open_volume: cannot open device 1,
volume 0, error -19
[77405.774800] UBI error: ubi_open_volume: cannot open device 1,
volume 0, error -19
Running mkvol_paral /dev/ubi1
Running rsvol /dev/ubi1
[rsvol] test_rsvol1():178: function open() failed with error 2 (No
such file or directory)
[rsvol] test_rsvol1():179: cannot open "/dev/ubi1_0"


Thanks
Chaitanya

On Tue, Jan 17, 2017 at 6:03 PM, Richard Weinberger <richard@nod.at> wrote:
> Chaitanya,
>
>
> Am 17.01.2017 um 12:47 schrieb chaitanya vinnakota:
>> Hi Richard,
>>
>> Seems that the ubi-tests are failing work on my board. I'm getting the
>> below output when I initiated the test.
>>
>> # ./runtests.sh /dev/ubi1
>>
>> Running mkvol_basic /dev/ubi1
>> [mkvol_basic] __initial_check():74: insufficient available eraseblocks
>> 0 on UBI device, required 5
>>
>> # ./runtests.sh /dev/ubi1_0
>> Running mkvol_basic /dev/ubi1_0
>> [mkvol_basic] __initial_check():69: function ubi_get_dev_info() failed
>> with error 19 (No such device)
>>
>> Which device should I pass as the argument , is that ubi1 or ubi1_0
>> [the partition to mount rootfs ] ?
>>
>> Added ubinfo of /dev/ubi1_0 and /dev/ubi1 for further reference
>
> ubi1 needs to be empty for testing.
>
> Thanks,
> //richard
