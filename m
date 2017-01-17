Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cTUv3-0005uu-LD
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2017 14:39:32 +0000
Subject: Re: UBIFS errors are randomly seen after reboots
To: chaitanya vinnakota <chaitanya.sai.v@gmail.com>
References: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
 <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
 <CAMBC=j7Yjk5RkT5xg1N=q3aVf45BbJgtYaZ8vsy3oBjZ+OOOaA@mail.gmail.com>
 <01b355e9-6095-a2af-5c77-3e15751ff8da@nod.at>
 <CAMBC=j7fn7tqouMD3ZQptZF_xRO5Xsx7HOXaGQahCQm2ug3RUw@mail.gmail.com>
 <0f04ed5e-e7fb-7bbf-678d-840fe0be4b16@nod.at>
 <CAMBC=j6t2h_yB3wQbNUexrJto+O3ruTXo992JWFLH293OyH0Bg@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <10f4c447-f1e5-89dc-17b6-b5d450a473fe@nod.at>
Date: Tue, 17 Jan 2017 15:39:00 +0100
MIME-Version: 1.0
In-Reply-To: <CAMBC=j6t2h_yB3wQbNUexrJto+O3ruTXo992JWFLH293OyH0Bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chaitanya,

Am 17.01.2017 um 15:32 schrieb chaitanya vinnakota:
> Now , I'm seeing altogether different form of errors.
> 
> ./runtests.sh /dev/ubi1
> Running mkvol_basic /dev/ubi1
> Running mkvol_bad /dev/ubi1

_bad is supposed to return errors.

> [77361.468670] UBI error: verify_mkvol_req: bad volume creation request
> [77361.475116] Volume creation request dump:
> [77361.479139]  vol_id    -2
> [77361.481768]  alignment 1
> [77361.484322]  bytes     86343680
> [77361.487473]  vol_type  3
> [77361.490013]  name_len  22
> [77361.492641]  1st 16 characters of name: mkvol_bad:test_m
> [77361.498235] UBI error: verify_mkvol_req: bad volume creation request
> [77361.504652] Volume creation request dump:
> [77361.508676]  vol_id    128
> [77361.511390]  alignment 1
> [77361.513930]  bytes     86343680
> [77361.517095]  vol_type  3
> [77361.519636]  name_len  22
> [77361.522265]  1st 16 characters of name: mkvol_bad:test_m
> [77361.527634] UBI error: verify_mkvol_req: bad volume creation request
> [77361.534009] Volume creation request dump:
> [77361.538064]  vol_id    0
> [77361.540606]  alignment 0
> [77361.543145]  bytes     86343680
> [77361.546316]  vol_type  3
> [77361.548857]  name_len  22
> [77361.551485]  1st 16 characters of name: mkvol_bad:test_m
> [77361.558437] UBI error: verify_mkvol_req: bad volume creation request
> [77361.564862] Volume creation request dump:
> [77361.568902]  vol_id    0
> [77361.571457]  alignment -1
> [77361.574101]  bytes     86343680
> [77361.577313]  vol_type  3
> [77361.579866]  name_len  22
> [77361.582504]  1st 16 characters of name: mkvol_bad:test_m
> [77361.587943] UBI error: verify_mkvol_req: bad volume creation request
> [77361.594355] Volume creation request dump:
> [77361.598394]  vol_id    0
> [77361.600945]  alignment 126977
> [77361.603936]  bytes     86343680
> [77361.607132]  vol_type  3
> [77361.609688]  name_len  22
> [77361.612329]  1st 16 characters of name: mkvol_bad:test_m
> [77361.617765] UBI error: verify_mkvol_req: bad volume creation request
> [77361.624199] Volume creation request dump:
> [77361.628241]  vol_id    0
> [77361.630800]  alignment 2049
> [77361.633617]  bytes     86343680
> [77361.636814]  vol_type  3
> [77361.639368]  name_len  22
> [77361.642010]  1st 16 characters of name: mkvol_bad:test_m
> [77361.647478] UBI error: verify_mkvol_req: bad volume creation request
> [77361.653868] Volume creation request dump:
> [77361.657940]  vol_id    0
> [77361.660510]  alignment 1
> [77361.663065]  bytes     -1
> [77361.665739]  vol_type  3
> [77361.668290]  name_len  22
> [77361.670930]  1st 16 characters of name: mkvol_bad:test_m
> [77361.676360] UBI error: verify_mkvol_req: bad volume creation request
> [77361.682748] Volume creation request dump:
> [77361.686826]  vol_id    0
> [77361.689383]  alignment 1
> [77361.691936]  bytes     0
> [77361.694513]  vol_type  3
> [77361.697068]  name_len  22
> [77361.699708]  1st 16 characters of name: mkvol_bad:test_m
> [77361.705119] UBI error: ubi_create_volume: not enough PEBs, only 680 available
> [77361.712293] UBI error: ubi_create_volume: cannot create volume 0, error -28
> [77361.719415] UBI error: ubi_create_volume: not enough PEBs, only 680 available
> [77361.726655] UBI error: ubi_create_volume: cannot create volume 0, error -28
> [77361.733804] UBI error: verify_mkvol_req: bad volume creation request

These are fine.

> [77361.740243] Volume creation request dump:
> [77361.744301]  vol_id    0
> [77361.746854]  alignment 1
> [77361.749407]  bytes     126976
> [77361.752397]  vol_type  7
> [77361.754981]  name_len  22
> [77361.757622]  1st 16 characters of name: mkvol_bad:test_m
> [77361.926468] UBI error: ubi_create_volume: volume 0 already exists
> [77361.932606] UBI error: ubi_create_volume: cannot create volume 0, error -17
> [77361.939839] UBI error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
> [77361.947946] UBI error: ubi_create_volume: cannot create volume 1, error -17
> [77362.290898] UBI error: ubi_create_volume: volume "mkvol_bad:test_mkvol()" exists (ID 0)
> [77362.299021] UBI error: ubi_create_volume: cannot create volume 1, error -17
> [77405.406937] UBI error: ubi_open_volume: cannot open device 1, volume 128, error -22
> [77405.420226] UBI error: ubi_open_volume: cannot open device 1, volume -1, error -22
> [77405.427910] UBI error: ubi_open_volume: cannot open device 1, volume 128, error -22
> [77405.435657] UBI error: ubi_open_volume: cannot open device 1, volume 0, error -19
> [77405.774800] UBI error: ubi_open_volume: cannot open device 1, volume 0, error -19

These are fine too.

> Running mkvol_paral /dev/ubi1
> Running rsvol /dev/ubi1
> [rsvol] test_rsvol1():178: function open() failed with error 2 (No such file or directory)
> [rsvol] test_rsvol1():179: cannot open "/dev/ubi1_0"

That's one is odd.
Do all other tests fail too?
io_basic and io_parallel are interesting. You can also start them by hand.

Thanks,
//richard
