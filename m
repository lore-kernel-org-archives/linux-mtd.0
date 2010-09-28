Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0V8X-0008Ur-Td
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 08:02:11 +0000
Message-ID: <4CA1A0F8.2090206@parrot.com>
Date: Tue, 28 Sep 2010 10:02:00 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: RE : UBI/UBIFS interrupted write page handling
References: <4C88DDD5.4060507@parrot.com>	 <1284054669.11335.21.camel@brekeke>
	<1285006478.1762.1.camel@brekeke>	 <4C9B7CD8.4070806@parrot.com>,
	<1285266914.1766.1.camel@brekeke>	
	<F5C24FC168F95048BB6B9E0B13EB33152BA6F5304E@DIAMANT.xi-lite.lan>	
	<1285523911.1776.9.camel@brekeke>
	<1285657088.2437.23.camel@localhost> <4CA19DAE.7030402@parrot.com>
In-Reply-To: <4CA19DAE.7030402@parrot.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthieu CASTET a écrit :
> Artem Bityutskiy a écrit :
>> On Sun, 2010-09-26 at 20:58 +0300, Artem Bityutskiy wrote:
>>>> The test is still running, but because for each boot we got this slow
>>>> dump (take near 1 min), I expect others errors to take longer to
>>>> appear.
>>> Your PEB 20 contains almost all 0xFFs, but not quite, and NAND pages are
>>> read with ECC errors. I think this is a result of power cut during
>>> erasure.
>>>
>>> My new patch-set is trying to detect situations when we have a PEB which
>>> contains important data, but its VID header is corrupted. We try to
>>> preserve such PEBs instead of erasing. UBI would not spam so much if
>>> debugging was disabled.
>>
>> Matthieu, thanks for testing the latest UBI changes. I wonder, do you
>> have issues with the follow-up fix I sent you. I just wonder if it is ok
>> for me to put these patches to linux-next or it is better to wait a
>> little?
>>
> That's better : interrupt erased page are not put anymore in corrupted 
> list.
> But I have problem with interrupt write :
> this night the test crashed [1].
> 

> [   15.903840] UBI error: ubi_io_read: error -74 (ECC error) while 
> reading 4144 bytes from PEB 113:4096, read 4144 bytes

And the interesting thing is that is PEB (113) had the max. sequence 
number (647359) in the previous reboot before the crash.

So the senario is PEB 113 was interrupted during write. In the first 
reboot there was no error, but in the following one it become instable 
and some bits flipped producing uncorrectable error.

Matthieu

[1]
[    1.910670] UBI: attaching mtd3 to ubi3
[    1.914632] UBI DBG (pid 276): io_init: min_io_size      2048
[    1.920393] UBI DBG (pid 276): io_init: hdrs_min_io_size 512
[    1.926092] UBI DBG (pid 276): io_init: ec_hdr_alsize    512
[    1.931776] UBI DBG (pid 276): io_init: vid_hdr_alsize   512
[    1.937445] UBI DBG (pid 276): io_init: vid_hdr_offset   2048
[    1.943227] UBI DBG (pid 276): io_init: vid_hdr_aloffset 2048
[    1.948982] UBI DBG (pid 276): io_init: vid_hdr_shift    0
[    1.954522] UBI DBG (pid 276): io_init: leb_start        4096
[    1.960280] UBI DBG (pid 276): io_init: max_erroneous    25
[    1.965886] UBI: physical eraseblock size:   131072 bytes (128 KiB)
[    1.972176] UBI: logical eraseblock size:    126976 bytes
[    1.977580] UBI: smallest flash I/O unit:    2048
[    1.982301] UBI: sub-page size:              512
[    1.986924] UBI: VID header offset:          2048 (aligned 2048)
[    1.992954] UBI: data offset:                4096
[    1.997892] UBI DBG (pid 276): process_eb: scan PEB 0
[    2.003437] UBI DBG (pid 276): ubi_scan_add_used: PEB 0, LEB 0:189, 
EC 2592, sqnum 647146, bitflips 0
[    2.012725] UBI DBG (pid 276): add_volume: added volume 0
[    2.018141] UBI DBG (pid 276): process_eb: scan PEB 1
[    2.023559] UBI DBG (pid 276): ubi_scan_add_used: PEB 1, LEB 0:0, EC 
2, sqnum 6, bitflips 0
[    2.031967] UBI DBG (pid 276): process_eb: scan PEB 2
[    2.037356] UBI DBG (pid 276): ubi_scan_add_used: PEB 2, LEB 0:33, EC 
2506, sqnum 647195, bitflips 0
[    2.046554] UBI DBG (pid 276): process_eb: scan PEB 3
[    2.051963] UBI DBG (pid 276): ubi_scan_add_used: PEB 3, LEB 0:80, EC 
2543, sqnum 646954, bitflips 0
[    2.061120] UBI DBG (pid 276): process_eb: scan PEB 4
[    2.066535] UBI DBG (pid 276): ubi_scan_add_used: PEB 4, LEB 0:186, 
EC 2546, sqnum 647333, bitflips 0
[    2.075815] UBI DBG (pid 276): process_eb: scan PEB 5
[    2.081193] UBI DBG (pid 276): ubi_scan_add_used: PEB 5, LEB 0:98, EC 
2589, sqnum 647135, bitflips 0
[    2.090384] UBI DBG (pid 276): process_eb: scan PEB 6
[    2.095788] UBI DBG (pid 276): ubi_scan_add_used: PEB 6, LEB 0:43, EC 
2564, sqnum 647356, bitflips 0
[    2.104978] UBI DBG (pid 276): process_eb: scan PEB 7
[    2.110358] UBI DBG (pid 276): ubi_scan_add_used: PEB 7, LEB 0:13, EC 
2572, sqnum 647102, bitflips 0
[    2.119548] UBI DBG (pid 276): process_eb: scan PEB 8
[    2.124951] UBI DBG (pid 276): ubi_scan_add_used: PEB 8, LEB 0:143, 
EC 2587, sqnum 646846, bitflips 0
[    2.134227] UBI DBG (pid 276): process_eb: scan PEB 9
[    2.139606] UBI DBG (pid 276): ubi_scan_add_used: PEB 9, LEB 0:149, 
EC 2590, sqnum 646957, bitflips 0
[    2.148885] UBI DBG (pid 276): process_eb: scan PEB 10
[    2.154375] UBI DBG (pid 276): ubi_scan_add_used: PEB 10, LEB 0:130, 
EC 2575, sqnum 647142, bitflips 0
[    2.163741] UBI DBG (pid 276): process_eb: scan PEB 11
[    2.169205] UBI DBG (pid 276): ubi_scan_add_used: PEB 11, LEB 0:19, 
EC 2580, sqnum 647313, bitflips 0
[    2.178482] UBI DBG (pid 276): process_eb: scan PEB 12
[    2.183972] UBI DBG (pid 276): ubi_scan_add_used: PEB 12, LEB 0:196, 
EC 2497, sqnum 646945, bitflips 0
[    2.193337] UBI DBG (pid 276): process_eb: scan PEB 13
[    2.198799] UBI DBG (pid 276): ubi_scan_add_used: PEB 13, LEB 0:157, 
EC 2582, sqnum 647221, bitflips 0
[    2.208166] UBI DBG (pid 276): process_eb: scan PEB 14
[    2.213651] UBI DBG (pid 276): ubi_scan_add_used: PEB 14, LEB 0:155, 
EC 2530, sqnum 647111, bitflips 0
[    2.223015] UBI DBG (pid 276): process_eb: scan PEB 15
[    2.228480] UBI DBG (pid 276): ubi_scan_add_used: PEB 15, LEB 0:101, 
EC 2545, sqnum 647294, bitflips 0
[    2.237849] UBI DBG (pid 276): process_eb: scan PEB 16
[    2.243335] UBI DBG (pid 276): ubi_scan_add_used: PEB 16, LEB 0:50, 
EC 2585, sqnum 647315, bitflips 0
[    2.252612] UBI DBG (pid 276): process_eb: scan PEB 17
[    2.258079] UBI DBG (pid 276): ubi_scan_add_used: PEB 17, LEB 0:242, 
EC 2566, sqnum 646850, bitflips 0
[    2.267450] UBI DBG (pid 276): process_eb: scan PEB 18
[    2.272938] UBI DBG (pid 276): ubi_scan_add_used: PEB 18, LEB 0:1, EC 
2539, sqnum 647164, bitflips 0
[    2.282133] UBI DBG (pid 276): process_eb: scan PEB 19
[    2.287600] UBI DBG (pid 276): ubi_scan_add_used: PEB 19, LEB 0:193, 
EC 2582, sqnum 647052, bitflips 0
[    2.296965] UBI DBG (pid 276): process_eb: scan PEB 20
[    2.302451] UBI DBG (pid 276): ubi_scan_add_used: PEB 20, LEB 0:132, 
EC 2555, sqnum 647210, bitflips 0
[    2.311818] UBI DBG (pid 276): process_eb: scan PEB 21
[    2.317280] UBI DBG (pid 276): ubi_scan_add_used: PEB 21, LEB 0:103, 
EC 2476, sqnum 647126, bitflips 0
[    2.326648] UBI DBG (pid 276): process_eb: scan PEB 22
[    2.332141] UBI DBG (pid 276): ubi_scan_add_used: PEB 22, LEB 0:239, 
EC 2559, sqnum 646947, bitflips 0
[    2.341506] UBI DBG (pid 276): process_eb: scan PEB 23
[    2.346973] UBI DBG (pid 276): ubi_scan_add_used: PEB 23, LEB 0:70, 
EC 2593, sqnum 647328, bitflips 0
[    2.356253] UBI DBG (pid 276): process_eb: scan PEB 24
[    2.361746] UBI DBG (pid 276): ubi_scan_add_used: PEB 24, LEB 0:221, 
EC 2562, sqnum 646904, bitflips 0
[    2.371077] UBI DBG (pid 276): process_eb: scan PEB 25
[    2.376576] UBI DBG (pid 276): ubi_scan_add_used: PEB 25, LEB 0:54, 
EC 2592, sqnum 647323, bitflips 0
[    2.385853] UBI DBG (pid 276): process_eb: scan PEB 26
[    2.391318] UBI DBG (pid 276): ubi_scan_add_used: PEB 26, LEB 0:75, 
EC 2536, sqnum 646900, bitflips 0
[    2.400598] UBI DBG (pid 276): process_eb: scan PEB 27
[    2.406084] UBI DBG (pid 276): ubi_scan_add_used: PEB 27, LEB 0:121, 
EC 2569, sqnum 644645, bitflips 0
[    2.415449] UBI DBG (pid 276): process_eb: scan PEB 28
[    2.420916] UBI DBG (pid 276): ubi_scan_add_used: PEB 28, LEB 0:91, 
EC 2461, sqnum 646844, bitflips 0
[    2.430194] UBI DBG (pid 276): process_eb: scan PEB 29
[    2.435682] UBI DBG (pid 276): ubi_scan_add_used: PEB 29, LEB 0:183, 
EC 2536, sqnum 647265, bitflips 0
[    2.445049] UBI DBG (pid 276): process_eb: scan PEB 30
[    2.450513] UBI DBG (pid 276): ubi_scan_add_used: PEB 30, LEB 0:240, 
EC 2554, sqnum 646842, bitflips 0
[    2.459880] UBI DBG (pid 276): process_eb: scan PEB 31
[    2.465367] UBI DBG (pid 276): ubi_scan_add_used: PEB 31, LEB 0:82, 
EC 2418, sqnum 647173, bitflips 0
[    2.474646] UBI DBG (pid 276): process_eb: scan PEB 32
[    2.480111] UBI DBG (pid 276): ubi_scan_add_used: PEB 32, LEB 0:28, 
EC 2514, sqnum 646791, bitflips 0
[    2.489390] UBI DBG (pid 276): process_eb: scan PEB 33
[    2.494878] UBI DBG (pid 276): ubi_scan_add_used: PEB 33, LEB 0:69, 
EC 2579, sqnum 646928, bitflips 0
[    2.504159] UBI DBG (pid 276): process_eb: scan PEB 34
[    2.509624] UBI DBG (pid 276): ubi_scan_add_used: PEB 34, LEB 0:10, 
EC 2592, sqnum 647184, bitflips 0
[    2.518903] UBI DBG (pid 276): process_eb: scan PEB 35
[    2.524389] UBI DBG (pid 276): ubi_scan_add_used: PEB 35, LEB 0:195, 
EC 2573, sqnum 647121, bitflips 0
[    2.533755] UBI DBG (pid 276): process_eb: scan PEB 36
[    2.539222] UBI DBG (pid 276): ubi_scan_add_used: PEB 36, LEB 0:180, 
EC 2574, sqnum 646943, bitflips 0
[    2.548587] UBI DBG (pid 276): process_eb: scan PEB 37
[    2.554078] UBI DBG (pid 276): ubi_scan_add_used: PEB 37, LEB 0:137, 
EC 2587, sqnum 647104, bitflips 0
[    2.563466] UBI DBG (pid 276): process_eb: scan PEB 38
[    2.568940] UBI DBG (pid 276): ubi_scan_add_used: PEB 38, LEB 0:202, 
EC 2583, sqnum 647289, bitflips 0
[    2.578311] UBI DBG (pid 276): process_eb: scan PEB 39
[    2.583805] UBI DBG (pid 276): ubi_scan_add_used: PEB 39, LEB 0:120, 
EC 2522, sqnum 647175, bitflips 0
[    2.593173] UBI DBG (pid 276): process_eb: scan PEB 40
[    2.598643] UBI DBG (pid 276): ubi_scan_add_used: PEB 40, LEB 0:35, 
EC 2552, sqnum 645902, bitflips 0
[    2.607922] UBI DBG (pid 276): process_eb: scan PEB 41
[    2.613413] UBI DBG (pid 276): ubi_scan_add_used: PEB 41, LEB 0:48, 
EC 2515, sqnum 647231, bitflips 0
[    2.622693] UBI DBG (pid 276): process_eb: scan PEB 42
[    2.628159] UBI DBG (pid 276): ubi_scan_add_used: PEB 42, LEB 0:181, 
EC 2581, sqnum 647260, bitflips 0
[    2.637528] UBI DBG (pid 276): process_eb: scan PEB 43
[    2.643018] UBI DBG (pid 276): ubi_scan_add_used: PEB 43, LEB 0:104, 
EC 2527, sqnum 647062, bitflips 0
[    2.652386] UBI DBG (pid 276): process_eb: scan PEB 44
[    2.657854] UBI DBG (pid 276): ubi_scan_add_used: PEB 44, LEB 0:222, 
EC 2452, sqnum 646930, bitflips 0
[    2.667222] UBI DBG (pid 276): process_eb: scan PEB 45
[    2.672714] UBI DBG (pid 276): ubi_scan_add_used: PEB 45, LEB 0:74, 
EC 2592, sqnum 647293, bitflips 0
[    2.681990] UBI DBG (pid 276): process_eb: scan PEB 46
[    2.687456] UBI DBG (pid 276): ubi_scan_add_used: PEB 46, LEB 0:139, 
EC 2508, sqnum 647203, bitflips 0
[    2.696825] UBI DBG (pid 276): process_eb: scan PEB 47
[    2.702314] UBI DBG (pid 276): ubi_scan_add_used: PEB 47, LEB 0:199, 
EC 2550, sqnum 647047, bitflips 0
[    2.711681] UBI DBG (pid 276): process_eb: scan PEB 48
[    2.717148] UBI DBG (pid 276): ubi_scan_add_used: PEB 48, LEB 0:90, 
EC 2513, sqnum 646764, bitflips 0
[    2.726427] UBI DBG (pid 276): process_eb: scan PEB 49
[    2.731900] UBI DBG (pid 276): ubi_scan_add_used: PEB 49, LEB 0:198, 
EC 2583, sqnum 647200, bitflips 0
[    2.741232] UBI DBG (pid 276): process_eb: scan PEB 50
[    2.746732] UBI DBG (pid 276): ubi_scan_add_used: PEB 50, LEB 0:67, 
EC 2568, sqnum 647176, bitflips 0
[    2.756013] UBI DBG (pid 276): process_eb: scan PEB 51
[    2.761479] UBI DBG (pid 276): ubi_scan_add_used: PEB 51, LEB 0:213, 
EC 2592, sqnum 647196, bitflips 0
[    2.770847] UBI DBG (pid 276): process_eb: scan PEB 52
[    2.776336] UBI DBG (pid 276): ubi_scan_add_used: PEB 52, LEB 0:22, 
EC 2561, sqnum 646020, bitflips 0
[    2.785618] UBI DBG (pid 276): process_eb: scan PEB 53
[    2.791086] UBI DBG (pid 276): ubi_scan_add_used: PEB 53, LEB 0:38, 
EC 2550, sqnum 646913, bitflips 0
[    2.800363] UBI DBG (pid 276): process_eb: scan PEB 54
[    2.805856] UBI DBG (pid 276): ubi_scan_add_used: PEB 54, LEB 0:205, 
EC 2493, sqnum 647141, bitflips 0
[    2.815224] UBI DBG (pid 276): process_eb: scan PEB 55
[    2.820690] UBI DBG (pid 276): ubi_scan_add_used: PEB 55, LEB 0:169, 
EC 2516, sqnum 647179, bitflips 0
[    2.830058] UBI DBG (pid 276): process_eb: scan PEB 56
[    2.835550] UBI DBG (pid 276): ubi_scan_add_used: PEB 56, LEB 0:109, 
EC 2590, sqnum 647331, bitflips 0
[    2.844919] UBI DBG (pid 276): process_eb: scan PEB 57
[    2.850384] UBI DBG (pid 276): ubi_scan_add_used: PEB 57, LEB 0:194, 
EC 2592, sqnum 647202, bitflips 0
[    2.859748] UBI DBG (pid 276): process_eb: scan PEB 58
[    2.865236] UBI DBG (pid 276): ubi_scan_add_used: PEB 58, LEB 0:106, 
EC 2588, sqnum 647143, bitflips 0
[    2.874599] UBI DBG (pid 276): process_eb: scan PEB 59
[    2.880066] UBI DBG (pid 276): ubi_scan_add_used: PEB 59, LEB 0:53, 
EC 2557, sqnum 647341, bitflips 0
[    2.889346] UBI DBG (pid 276): process_eb: scan PEB 60
[    2.894836] UBI DBG (pid 276): ubi_scan_add_used: PEB 60, LEB 0:23, 
EC 2415, sqnum 646118, bitflips 0
[    2.904116] UBI DBG (pid 276): process_eb: scan PEB 61
[    2.909580] UBI DBG (pid 276): ubi_scan_add_used: PEB 61, LEB 0:217, 
EC 2513, sqnum 645167, bitflips 0
[    2.918951] UBI DBG (pid 276): process_eb: scan PEB 62
[    2.924440] UBI DBG (pid 276): ubi_scan_add_used: PEB 62, LEB 0:89, 
EC 2574, sqnum 646055, bitflips 0
[    2.933902] UBI DBG (pid 276): process_eb: scan PEB 63
[    2.939480] UBI DBG (pid 276): ubi_scan_add_used: PEB 63, LEB 0:247, 
EC 2497, sqnum 647339, bitflips 0
[    2.948870] UBI DBG (pid 276): process_eb: scan PEB 64
[    2.954384] UBI DBG (pid 276): ubi_scan_add_used: PEB 64, LEB 0:227, 
EC 2578, sqnum 646944, bitflips 0
[    2.963757] UBI DBG (pid 276): process_eb: scan PEB 65
[    2.969229] UBI DBG (pid 276): ubi_scan_add_used: PEB 65, LEB 0:141, 
EC 2559, sqnum 645415, bitflips 0
[    2.978598] UBI DBG (pid 276): process_eb: scan PEB 66
[    2.984092] UBI DBG (pid 276): ubi_scan_add_used: PEB 66, LEB 0:225, 
EC 2506, sqnum 647140, bitflips 0
[    2.993460] UBI DBG (pid 276): process_eb: scan PEB 67
[    2.998928] UBI DBG (pid 276): ubi_scan_add_used: PEB 67, LEB 0:245, 
EC 2585, sqnum 647338, bitflips 0
[    3.008300] UBI DBG (pid 276): process_eb: scan PEB 68
[    3.013793] UBI DBG (pid 276): ubi_scan_add_used: PEB 68, LEB 0:49, 
EC 2587, sqnum 647076, bitflips 0
[    3.023074] UBI DBG (pid 276): process_eb: scan PEB 69
[    3.028538] UBI DBG (pid 276): ubi_scan_add_used: PEB 69, LEB 0:47, 
EC 2593, sqnum 647334, bitflips 0
[    3.037818] UBI DBG (pid 276): process_eb: scan PEB 70
[    3.043307] UBI DBG (pid 276): ubi_scan_add_used: PEB 70, LEB 0:12, 
EC 2571, sqnum 647267, bitflips 0
[    3.052587] UBI DBG (pid 276): process_eb: scan PEB 71
[    3.058051] UBI DBG (pid 276): ubi_scan_add_used: PEB 71, LEB 0:95, 
EC 2578, sqnum 647241, bitflips 0
[    3.067334] UBI DBG (pid 276): process_eb: scan PEB 72
[    3.072821] UBI DBG (pid 276): ubi_scan_add_used: PEB 72, LEB 0:237, 
EC 2593, sqnum 647354, bitflips 0
[    3.082185] UBI DBG (pid 276): process_eb: scan PEB 73
[    3.087651] UBI DBG (pid 276): ubi_scan_add_used: PEB 73, LEB 0:154, 
EC 2587, sqnum 647211, bitflips 0
[    3.097016] UBI DBG (pid 276): process_eb: scan PEB 74
[    3.102500] UBI DBG (pid 276): ubi_scan_add_used: PEB 74, LEB 0:163, 
EC 2573, sqnum 646922, bitflips 0
[    3.111832] UBI DBG (pid 276): process_eb: scan PEB 75
[    3.117331] UBI DBG (pid 276): ubi_scan_add_used: PEB 75, LEB 0:52, 
EC 2578, sqnum 647350, bitflips 0
[    3.126613] UBI DBG (pid 276): process_eb: scan PEB 76
[    3.132098] UBI DBG (pid 276): ubi_scan_add_used: PEB 76, LEB 0:170, 
EC 2572, sqnum 647240, bitflips 0
[    3.141431] UBI DBG (pid 276): process_eb: scan PEB 77
[    3.146932] UBI DBG (pid 276): ubi_scan_add_used: PEB 77, LEB 0:85, 
EC 2586, sqnum 647120, bitflips 0
[    3.156212] UBI DBG (pid 276): process_eb: scan PEB 78
[    3.161680] UBI DBG (pid 276): ubi_scan_add_used: PEB 78, LEB 0:179, 
EC 2562, sqnum 647059, bitflips 0
[    3.171045] UBI DBG (pid 276): process_eb: scan PEB 79
[    3.176537] UBI DBG (pid 276): ubi_scan_add_used: PEB 79, LEB 0:122, 
EC 2553, sqnum 647352, bitflips 0
[    3.185904] UBI DBG (pid 276): process_eb: scan PEB 80
[    3.191372] UBI DBG (pid 276): ubi_scan_add_used: PEB 80, LEB 0:236, 
EC 2567, sqnum 647139, bitflips 0
[    3.200743] UBI DBG (pid 276): process_eb: scan PEB 81
[    3.206232] UBI DBG (pid 276): ubi_scan_add_used: PEB 81, LEB 0:212, 
EC 2569, sqnum 645303, bitflips 0
[    3.215597] UBI DBG (pid 276): process_eb: scan PEB 82
[    3.221061] UBI DBG (pid 276): ubi_scan_add_used: PEB 82, LEB 0:142, 
EC 2551, sqnum 647303, bitflips 0
[    3.230430] UBI DBG (pid 276): process_eb: scan PEB 83
[    3.235923] UBI DBG (pid 276): ubi_scan_add_used: PEB 83, LEB 0:9, EC 
2530, sqnum 647232, bitflips 0
[    3.245114] UBI DBG (pid 276): process_eb: scan PEB 84
[    3.250578] UBI DBG (pid 276): ubi_scan_add_used: PEB 84, LEB 0:108, 
EC 2586, sqnum 647207, bitflips 0
[    3.259946] UBI DBG (pid 276): process_eb: scan PEB 85
[    3.265437] UBI DBG (pid 276): ubi_scan_add_used: PEB 85, LEB 0:140, 
EC 2478, sqnum 646914, bitflips 0
[    3.274802] UBI DBG (pid 276): process_eb: scan PEB 86
[    3.280273] UBI DBG (pid 276): ubi_scan_add_used: PEB 86, LEB 0:45, 
EC 2581, sqnum 644651, bitflips 0
[    3.289553] UBI DBG (pid 276): process_eb: scan PEB 87
[    3.295042] UBI DBG (pid 276): ubi_scan_add_used: PEB 87, LEB 0:58, 
EC 2559, sqnum 647355, bitflips 0
[    3.304323] UBI DBG (pid 276): process_eb: scan PEB 88
[    3.309790] UBI DBG (pid 276): ubi_scan_add_used: PEB 88, LEB 0:243, 
EC 2552, sqnum 647012, bitflips 0
[    3.319160] UBI DBG (pid 276): process_eb: scan PEB 89
[    3.324650] UBI DBG (pid 276): ubi_scan_add_used: PEB 89, LEB 0:197, 
EC 2591, sqnum 646997, bitflips 0
[    3.334016] UBI DBG (pid 276): process_eb: scan PEB 90
[    3.339486] UBI DBG (pid 276): ubi_scan_add_used: PEB 90, LEB 0:116, 
EC 2495, sqnum 647347, bitflips 0
[    3.348855] UBI DBG (pid 276): process_eb: scan PEB 91
[    3.354335] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 91, only 0xFF bytes
[    3.363348] UBI DBG (pid 276): add_to_list: add to free: PEB 91, EC 2593
[    3.370064] UBI DBG (pid 276): process_eb: scan PEB 92
[    3.375541] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 92, only 0xFF bytes
[    3.384558] UBI DBG (pid 276): add_to_list: add to free: PEB 92, EC 2593
[    3.391274] UBI DBG (pid 276): process_eb: scan PEB 93
[    3.396764] UBI DBG (pid 276): ubi_scan_add_used: PEB 93, LEB 0:27, 
EC 2535, sqnum 647194, bitflips 0
[    3.406046] UBI DBG (pid 276): process_eb: scan PEB 94
[    3.411512] UBI DBG (pid 276): ubi_scan_add_used: PEB 94, LEB 0:65, 
EC 2584, sqnum 646886, bitflips 0
[    3.420793] UBI DBG (pid 276): process_eb: scan PEB 95
[    3.426286] UBI DBG (pid 276): ubi_scan_add_used: PEB 95, LEB 0:71, 
EC 2562, sqnum 647117, bitflips 0
[    3.435589] UBI DBG (pid 276): process_eb: scan PEB 96
[    3.441065] UBI DBG (pid 276): ubi_scan_add_used: PEB 96, LEB 0:164, 
EC 2589, sqnum 647244, bitflips 0
[    3.450437] UBI DBG (pid 276): process_eb: scan PEB 97
[    3.455933] UBI DBG (pid 276): ubi_scan_add_used: PEB 97, LEB 0:16, 
EC 2575, sqnum 647013, bitflips 0
[    3.465215] UBI DBG (pid 276): process_eb: scan PEB 98
[    3.470681] UBI DBG (pid 276): ubi_scan_add_used: PEB 98, LEB 0:223, 
EC 2572, sqnum 647036, bitflips 0
[    3.480047] UBI DBG (pid 276): process_eb: scan PEB 99
[    3.485535] UBI DBG (pid 276): ubi_scan_add_used: PEB 99, LEB 0:185, 
EC 2501, sqnum 647212, bitflips 0
[    3.494899] UBI DBG (pid 276): process_eb: scan PEB 100
[    3.500456] UBI DBG (pid 276): ubi_scan_add_used: PEB 100, LEB 0:2, 
EC 2565, sqnum 647165, bitflips 0
[    3.509734] UBI DBG (pid 276): process_eb: scan PEB 101
[    3.515315] UBI DBG (pid 276): ubi_scan_add_used: PEB 101, LEB 0:100, 
EC 2584, sqnum 647322, bitflips 0
[    3.524769] UBI DBG (pid 276): process_eb: scan PEB 102
[    3.530320] UBI DBG (pid 276): ubi_scan_add_used: PEB 102, LEB 0:246, 
EC 2566, sqnum 647253, bitflips 0
[    3.539776] UBI DBG (pid 276): process_eb: scan PEB 103
[    3.545353] UBI DBG (pid 276): ubi_scan_add_used: PEB 103, LEB 0:96, 
EC 2586, sqnum 647145, bitflips 0
[    3.554719] UBI DBG (pid 276): process_eb: scan PEB 104
[    3.560268] UBI DBG (pid 276): ubi_scan_add_used: PEB 104, LEB 0:62, 
EC 2589, sqnum 647220, bitflips 0
[    3.569636] UBI DBG (pid 276): process_eb: scan PEB 105
[    3.575218] UBI DBG (pid 276): ubi_scan_add_used: PEB 105, LEB 0:145, 
EC 2587, sqnum 647243, bitflips 0
[    3.584671] UBI DBG (pid 276): process_eb: scan PEB 106
[    3.590222] UBI DBG (pid 276): ubi_scan_add_used: PEB 106, LEB 0:161, 
EC 2560, sqnum 647268, bitflips 0
[    3.599678] UBI DBG (pid 276): process_eb: scan PEB 107
[    3.605259] UBI DBG (pid 276): ubi_scan_add_used: PEB 107, LEB 0:44, 
EC 2525, sqnum 647262, bitflips 0
[    3.614626] UBI DBG (pid 276): process_eb: scan PEB 108
[    3.620179] UBI DBG (pid 276): ubi_scan_add_used: PEB 108, LEB 0:126, 
EC 2562, sqnum 647050, bitflips 0
[    3.629634] UBI DBG (pid 276): process_eb: scan PEB 109
[    3.635218] UBI DBG (pid 276): ubi_scan_add_used: PEB 109, LEB 0:229, 
EC 2556, sqnum 647235, bitflips 0
[    3.644673] UBI DBG (pid 276): process_eb: scan PEB 110
[    3.650212] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 110, only 0xFF bytes
[    3.659317] UBI DBG (pid 276): add_to_list: add to free: PEB 110, EC 2593
[    3.666142] UBI DBG (pid 276): process_eb: scan PEB 111
[    3.671698] UBI DBG (pid 276): ubi_scan_add_used: PEB 111, LEB 0:125, 
EC 2573, sqnum 647109, bitflips 0
[    3.681155] UBI DBG (pid 276): process_eb: scan PEB 112
[    3.686725] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 112, only 0xFF bytes
[    3.695829] UBI DBG (pid 276): add_to_list: add to free: PEB 112, EC 2581
[    3.702651] UBI DBG (pid 276): process_eb: scan PEB 113
[    3.708209] UBI DBG (pid 276): ubi_scan_add_used: PEB 113, LEB 0:248, 
EC 2530, sqnum 647359, bitflips 0
[    3.717662] UBI DBG (pid 276): process_eb: scan PEB 114
[    3.723237] UBI DBG (pid 276): ubi_scan_add_used: PEB 114, LEB 0:128, 
EC 2545, sqnum 647115, bitflips 0
[    3.732692] UBI DBG (pid 276): process_eb: scan PEB 115
[    3.738246] UBI DBG (pid 276): ubi_scan_add_used: PEB 115, LEB 0:218, 
EC 2525, sqnum 647300, bitflips 0
[    3.747706] UBI DBG (pid 276): process_eb: scan PEB 116
[    3.753285] UBI DBG (pid 276): ubi_scan_add_used: PEB 116, LEB 0:177, 
EC 2583, sqnum 647297, bitflips 0
[    3.762739] UBI DBG (pid 276): process_eb: scan PEB 117
[    3.768290] UBI DBG (pid 276): ubi_scan_add_used: PEB 117, LEB 0:86, 
EC 2591, sqnum 647245, bitflips 0
[    3.777656] UBI DBG (pid 276): process_eb: scan PEB 118
[    3.783231] UBI DBG (pid 276): ubi_scan_add_used: PEB 118, LEB 0:216, 
EC 2538, sqnum 647030, bitflips 0
[    3.792685] UBI DBG (pid 276): process_eb: scan PEB 119
[    3.798239] UBI DBG (pid 276): ubi_scan_add_used: PEB 119, LEB 0:55, 
EC 2586, sqnum 647177, bitflips 0
[    3.807606] UBI DBG (pid 276): process_eb: scan PEB 120
[    3.813182] UBI DBG (pid 276): ubi_scan_add_used: PEB 120, LEB 0:72, 
EC 2576, sqnum 646895, bitflips 0
[    3.822552] UBI DBG (pid 276): process_eb: scan PEB 121
[    3.828105] UBI DBG (pid 276): ubi_scan_add_used: PEB 121, LEB 0:134, 
EC 2555, sqnum 647258, bitflips 0
[    3.837559] UBI DBG (pid 276): process_eb: scan PEB 122
[    3.843141] UBI DBG (pid 276): ubi_scan_add_used: PEB 122, LEB 0:102, 
EC 2524, sqnum 647251, bitflips 0
[    3.852591] UBI DBG (pid 276): process_eb: scan PEB 123
[    3.858144] UBI DBG (pid 276): ubi_scan_add_used: PEB 123, LEB 0:241, 
EC 2484, sqnum 647259, bitflips 0
[    3.867599] UBI DBG (pid 276): process_eb: scan PEB 124
[    3.873177] UBI DBG (pid 276): ubi_scan_add_used: PEB 124, LEB 0:129, 
EC 2589, sqnum 647061, bitflips 0
[    3.882634] UBI DBG (pid 276): process_eb: scan PEB 125
[    3.888188] UBI DBG (pid 276): ubi_scan_add_used: PEB 125, LEB 0:41, 
EC 2505, sqnum 647276, bitflips 0
[    3.897557] UBI DBG (pid 276): process_eb: scan PEB 126
[    3.903123] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 126, only 0xFF bytes
[    3.912192] UBI DBG (pid 276): add_to_list: add to free: PEB 126, EC 2593
[    3.919028] UBI DBG (pid 276): process_eb: scan PEB 127
[    3.924603] UBI DBG (pid 276): ubi_scan_add_used: PEB 127, LEB 0:152, 
EC 2563, sqnum 647310, bitflips 0
[    3.934057] UBI DBG (pid 276): process_eb: scan PEB 128
[    3.939610] UBI DBG (pid 276): ubi_scan_add_used: PEB 128, LEB 0:105, 
EC 2531, sqnum 647342, bitflips 0
[    3.949066] UBI DBG (pid 276): process_eb: scan PEB 129
[    3.954647] UBI DBG (pid 276): ubi_scan_add_used: PEB 129, LEB 0:208, 
EC 2566, sqnum 647321, bitflips 0
[    3.964099] UBI DBG (pid 276): process_eb: scan PEB 130
[    3.969640] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 130, only 0xFF bytes
[    3.978746] UBI DBG (pid 276): add_to_list: add to free: PEB 130, EC 2536
[    3.985570] UBI DBG (pid 276): process_eb: scan PEB 131
[    3.991124] UBI DBG (pid 276): ubi_scan_add_used: PEB 131, LEB 0:131, 
EC 2524, sqnum 646948, bitflips 0
[    4.000581] UBI DBG (pid 276): process_eb: scan PEB 132
[    4.006160] UBI DBG (pid 276): ubi_scan_add_used: PEB 132, LEB 0:228, 
EC 2576, sqnum 647353, bitflips 0
[    4.015618] UBI DBG (pid 276): process_eb: scan PEB 133
[    4.021172] UBI DBG (pid 276): ubi_scan_add_used: PEB 133, LEB 0:118, 
EC 2543, sqnum 647144, bitflips 0
[    4.030630] UBI DBG (pid 276): process_eb: scan PEB 134
[    4.036209] UBI DBG (pid 276): ubi_scan_add_used: PEB 134, LEB 0:188, 
EC 2541, sqnum 647191, bitflips 0
[    4.045662] UBI DBG (pid 276): process_eb: scan PEB 135
[    4.051217] UBI DBG (pid 276): ubi_scan_add_used: PEB 135, LEB 0:92, 
EC 2531, sqnum 647280, bitflips 0
[    4.060584] UBI DBG (pid 276): process_eb: scan PEB 136
[    4.066163] UBI DBG (pid 276): ubi_scan_add_used: PEB 136, LEB 0:99, 
EC 2577, sqnum 645908, bitflips 0
[    4.075528] UBI DBG (pid 276): process_eb: scan PEB 137
[    4.081082] UBI DBG (pid 276): ubi_scan_add_used: PEB 137, LEB 0:115, 
EC 2579, sqnum 647201, bitflips 0
[    4.090536] UBI DBG (pid 276): process_eb: scan PEB 138
[    4.096113] UBI DBG (pid 276): ubi_scan_add_used: PEB 138, LEB 0:174, 
EC 2574, sqnum 647250, bitflips 0
[    4.105566] UBI DBG (pid 276): process_eb: scan PEB 139
[    4.111120] UBI DBG (pid 276): ubi_scan_add_used: PEB 139, LEB 0:59, 
EC 2568, sqnum 647031, bitflips 0
[    4.120490] UBI DBG (pid 276): process_eb: scan PEB 140
[    4.126070] UBI DBG (pid 276): ubi_scan_add_used: PEB 140, LEB 0:233, 
EC 2522, sqnum 647318, bitflips 0
[    4.135526] UBI DBG (pid 276): process_eb: scan PEB 141
[    4.141076] UBI DBG (pid 276): ubi_scan_add_used: PEB 141, LEB 0:158, 
EC 2551, sqnum 645357, bitflips 0
[    4.150536] UBI DBG (pid 276): process_eb: scan PEB 142
[    4.156114] UBI DBG (pid 276): ubi_scan_add_used: PEB 142, LEB 0:79, 
EC 2590, sqnum 646849, bitflips 0
[    4.165481] UBI DBG (pid 276): process_eb: scan PEB 143
[    4.171033] UBI DBG (pid 276): ubi_scan_add_used: PEB 143, LEB 0:166, 
EC 2583, sqnum 646921, bitflips 0
[    4.180488] UBI DBG (pid 276): process_eb: scan PEB 144
[    4.186070] UBI DBG (pid 276): ubi_scan_add_used: PEB 144, LEB 0:60, 
EC 2568, sqnum 647197, bitflips 0
[    4.195438] UBI DBG (pid 276): process_eb: scan PEB 145
[    4.200993] UBI DBG (pid 276): ubi_scan_add_used: PEB 145, LEB 0:6, 
EC 2584, sqnum 647349, bitflips 0
[    4.210275] UBI DBG (pid 276): process_eb: scan PEB 146
[    4.215856] UBI DBG (pid 276): ubi_scan_add_used: PEB 146, LEB 0:172, 
EC 2582, sqnum 647035, bitflips 0
[    4.225311] UBI DBG (pid 276): process_eb: scan PEB 147
[    4.230871] UBI DBG (pid 276): ubi_scan_add_used: PEB 147, LEB 0:111, 
EC 2582, sqnum 647344, bitflips 0
[    4.240325] UBI DBG (pid 276): process_eb: scan PEB 148
[    4.245905] UBI DBG (pid 276): ubi_scan_add_used: PEB 148, LEB 0:94, 
EC 2578, sqnum 647218, bitflips 0
[    4.255271] UBI DBG (pid 276): process_eb: scan PEB 149
[    4.260828] UBI DBG (pid 276): ubi_scan_add_used: PEB 149, LEB 0:156, 
EC 2586, sqnum 647266, bitflips 0
boot 3[    4.270451] UBI DBG (pid 276): process_eb: scan PEB 150
1
[    4.276484] UBI DBG (pid 276): ubi_scan_add_used: PEB 150, LEB 0:133, 
EC 2564, sqnum 646048, bitflips 0
[    4.285947] UBI DBG (pid 276): process_eb: scan PEB 151
[    4.291507] UBI DBG (pid 276): ubi_scan_add_used: PEB 151, LEB 0:20, 
EC 2553, sqnum 647119, bitflips 0
[    4.300876] UBI DBG (pid 276): process_eb: scan PEB 152
[    4.306459] UBI DBG (pid 276): ubi_scan_add_used: PEB 152, LEB 0:200, 
EC 2561, sqnum 647228, bitflips 0
[    4.315916] UBI DBG (pid 276): process_eb: scan PEB 153
[    4.321469] UBI DBG (pid 276): ubi_scan_add_used: PEB 153, LEB 0:84, 
EC 2581, sqnum 646986, bitflips 0
[    4.330861] UBI DBG (pid 276): process_eb: scan PEB 154
[    4.336458] UBI DBG (pid 276): ubi_scan_add_used: PEB 154, LEB 0:77, 
EC 2568, sqnum 647237, bitflips 0
[    4.345832] UBI DBG (pid 276): process_eb: scan PEB 155
[    4.351390] UBI DBG (pid 276): ubi_scan_add_used: PEB 155, LEB 0:93, 
EC 2547, sqnum 647234, bitflips 0
[    4.360760] UBI DBG (pid 276): process_eb: scan PEB 156
[    4.366344] UBI DBG (pid 276): ubi_scan_add_used: PEB 156, LEB 0:148, 
EC 2532, sqnum 646923, bitflips 0
[    4.375797] UBI DBG (pid 276): process_eb: scan PEB 157
[    4.381353] UBI DBG (pid 276): ubi_scan_add_used: PEB 157, LEB 0:207, 
EC 2540, sqnum 646908, bitflips 0
[    4.390810] UBI DBG (pid 276): process_eb: scan PEB 158
[    4.396374] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 158, only 0xFF bytes
[    4.405476] UBI DBG (pid 276): add_to_list: add to free: PEB 158, EC 2593
[    4.412280] UBI DBG (pid 276): process_eb: scan PEB 159
[    4.417857] UBI DBG (pid 276): ubi_scan_add_used: PEB 159, LEB 0:24, 
EC 2568, sqnum 647226, bitflips 0
[    4.427226] UBI DBG (pid 276): process_eb: scan PEB 160
[    4.432786] UBI DBG (pid 276): ubi_scan_add_used: PEB 160, LEB 0:182, 
EC 2590, sqnum 646956, bitflips 0
[    4.442206] UBI DBG (pid 276): process_eb: scan PEB 161
[    4.447790] UBI DBG (pid 276): ubi_scan_add_used: PEB 161, LEB 0:192, 
EC 2592, sqnum 647326, bitflips 0
[    4.457244] UBI DBG (pid 276): process_eb: scan PEB 162
[    4.462804] UBI DBG (pid 276): ubi_scan_add_used: PEB 162, LEB 0:220, 
EC 2556, sqnum 647199, bitflips 0
[    4.472224] UBI DBG (pid 276): process_eb: scan PEB 163
[    4.477811] UBI DBG (pid 276): ubi_scan_add_used: PEB 163, LEB 0:187, 
EC 2429, sqnum 647132, bitflips 0
[    4.487266] UBI DBG (pid 276): process_eb: scan PEB 164
[    4.492830] UBI DBG (pid 276): ubi_scan_add_used: PEB 164, LEB 0:36, 
EC 2582, sqnum 647314, bitflips 0
[    4.502162] UBI DBG (pid 276): process_eb: scan PEB 165
[    4.507744] UBI DBG (pid 276): ubi_scan_add_used: PEB 165, LEB 0:113, 
EC 2578, sqnum 647252, bitflips 0
[    4.517201] UBI DBG (pid 276): process_eb: scan PEB 166
[    4.522774] UBI DBG (pid 276): ubi_scan_add_used: PEB 166, LEB 0:31, 
EC 2588, sqnum 646887, bitflips 0
[    4.532104] UBI DBG (pid 276): process_eb: scan PEB 167
[    4.537684] UBI DBG (pid 276): ubi_scan_add_used: PEB 167, LEB 0:135, 
EC 2588, sqnum 647254, bitflips 0
[    4.547138] UBI DBG (pid 276): process_eb: scan PEB 168
[    4.552690] UBI DBG (pid 276): ubi_scan_add_used: PEB 168, LEB 0:184, 
EC 2577, sqnum 647337, bitflips 0
[    4.562143] UBI DBG (pid 276): process_eb: scan PEB 169
[    4.567720] UBI DBG (pid 276): ubi_scan_add_used: PEB 169, LEB 0:37, 
EC 2546, sqnum 647233, bitflips 0
[    4.577086] UBI DBG (pid 276): process_eb: scan PEB 170
[    4.582641] UBI DBG (pid 276): ubi_scan_add_used: PEB 170, LEB 0:68, 
EC 2439, sqnum 647329, bitflips 0
[    4.592010] UBI DBG (pid 276): process_eb: scan PEB 171
[    4.597589] UBI DBG (pid 276): ubi_scan_add_used: PEB 171, LEB 0:201, 
EC 2580, sqnum 646946, bitflips 0
[    4.607044] UBI DBG (pid 276): process_eb: scan PEB 172
[    4.612600] UBI DBG (pid 276): ubi_scan_add_used: PEB 172, LEB 0:160, 
EC 2591, sqnum 647325, bitflips 0
[    4.622055] UBI DBG (pid 276): process_eb: scan PEB 173
[    4.627634] UBI DBG (pid 276): ubi_scan_add_used: PEB 173, LEB 0:51, 
EC 2590, sqnum 647264, bitflips 0
[    4.637002] UBI DBG (pid 276): process_eb: scan PEB 174
[    4.642557] UBI DBG (pid 276): ubi_scan_add_used: PEB 174, LEB 0:214, 
EC 2585, sqnum 647209, bitflips 0
[    4.652011] UBI DBG (pid 276): process_eb: scan PEB 175
[    4.657587] UBI DBG (pid 276): ubi_scan_add_used: PEB 175, LEB 0:127, 
EC 2590, sqnum 646920, bitflips 0
[    4.667040] UBI DBG (pid 276): process_eb: scan PEB 176
[    4.672591] UBI DBG (pid 276): ubi_scan_add_used: PEB 176, LEB 0:29, 
EC 2561, sqnum 645315, bitflips 0
[    4.681959] UBI DBG (pid 276): process_eb: scan PEB 177
[    4.687537] UBI DBG (pid 276): ubi_scan_add_used: PEB 177, LEB 0:210, 
EC 2536, sqnum 647049, bitflips 0
[    4.696991] UBI DBG (pid 276): process_eb: scan PEB 178
[    4.702543] UBI DBG (pid 276): ubi_scan_add_used: PEB 178, LEB 0:224, 
EC 2577, sqnum 647149, bitflips 0
[    4.711998] UBI DBG (pid 276): process_eb: scan PEB 179
[    4.717578] UBI DBG (pid 276): ubi_scan_add_used: PEB 179, LEB 0:209, 
EC 2589, sqnum 647286, bitflips 0
[    4.727031] UBI DBG (pid 276): process_eb: scan PEB 180
[    4.732583] UBI DBG (pid 276): ubi_scan_add_used: PEB 180, LEB 0:40, 
EC 2572, sqnum 647336, bitflips 0
[    4.741950] UBI DBG (pid 276): process_eb: scan PEB 181
[    4.747528] UBI DBG (pid 276): ubi_scan_add_used: PEB 181, LEB 0:11, 
EC 2588, sqnum 647192, bitflips 0
[    4.756894] UBI DBG (pid 276): process_eb: scan PEB 182
[    4.762447] UBI DBG (pid 276): ubi_scan_add_used: PEB 182, LEB 0:119, 
EC 2555, sqnum 647204, bitflips 0
[    4.771900] UBI DBG (pid 276): process_eb: scan PEB 183
[    4.777476] UBI DBG (pid 276): ubi_scan_add_used: PEB 183, LEB 0:165, 
EC 2527, sqnum 647189, bitflips 0
[    4.786932] UBI DBG (pid 276): process_eb: scan PEB 184
[    4.792482] UBI DBG (pid 276): ubi_scan_add_used: PEB 184, LEB 0:17, 
EC 2531, sqnum 647345, bitflips 0
[    4.801850] UBI DBG (pid 276): process_eb: scan PEB 185
[    4.807426] UBI DBG (pid 276): ubi_scan_add_used: PEB 185, LEB 0:46, 
EC 2410, sqnum 647358, bitflips 0
[    4.816795] UBI DBG (pid 276): process_eb: scan PEB 186
[    4.822347] UBI DBG (pid 276): ubi_scan_add_used: PEB 186, LEB 0:150, 
EC 2586, sqnum 647077, bitflips 0
[    4.831802] UBI DBG (pid 276): process_eb: scan PEB 187
[    4.837380] UBI DBG (pid 276): ubi_scan_add_used: PEB 187, LEB 0:117, 
EC 2579, sqnum 647270, bitflips 0
[    4.846834] UBI DBG (pid 276): process_eb: scan PEB 188
[    4.852388] UBI DBG (pid 276): ubi_scan_add_used: PEB 188, LEB 0:34, 
EC 2564, sqnum 647096, bitflips 0
[    4.861755] UBI DBG (pid 276): process_eb: scan PEB 189
[    4.867332] UBI DBG (pid 276): ubi_scan_add_used: PEB 189, LEB 0:206, 
EC 2546, sqnum 647133, bitflips 0
[    4.876786] UBI DBG (pid 276): process_eb: scan PEB 190
[    4.882327] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 190, only 0xFF bytes
[    4.891432] UBI DBG (pid 276): add_to_list: add to free: PEB 190, EC 2593
[    4.898256] UBI DBG (pid 276): process_eb: scan PEB 191
[    4.903826] UBI DBG (pid 276): ubi_scan_add_used: PEB 191, LEB 0:175, 
EC 2586, sqnum 646093, bitflips 0
[    4.913283] UBI DBG (pid 276): process_eb: scan PEB 192
[    4.918834] UBI DBG (pid 276): ubi_scan_add_used: PEB 192, LEB 0:97, 
EC 2592, sqnum 647327, bitflips 0
[    4.928201] UBI DBG (pid 276): process_eb: scan PEB 193
[    4.934038] UBI DBG (pid 276): ubi_scan_add_used: PEB 193, LEB 0:167, 
EC 2585, sqnum 647075, bitflips 0
[    4.943508] UBI DBG (pid 276): process_eb: scan PEB 194
[    4.949069] UBI DBG (pid 276): ubi_scan_add_used: PEB 194, LEB 0:21, 
EC 2587, sqnum 647060, bitflips 0
[    4.958442] UBI DBG (pid 276): process_eb: scan PEB 195
[    4.964025] UBI DBG (pid 276): ubi_scan_add_used: PEB 195, LEB 0:162, 
EC 2510, sqnum 647150, bitflips 0
[    4.973480] UBI DBG (pid 276): process_eb: scan PEB 196
[    4.979035] UBI DBG (pid 276): ubi_scan_add_used: PEB 196, LEB 0:63, 
EC 2576, sqnum 647274, bitflips 0
[    4.988401] UBI DBG (pid 276): process_eb: scan PEB 197
[    4.993978] UBI DBG (pid 276): ubi_scan_add_used: PEB 197, LEB 0:176, 
EC 2499, sqnum 647215, bitflips 0
[    5.003436] UBI DBG (pid 276): process_eb: scan PEB 198
[    5.008993] UBI DBG (pid 276): ubi_scan_add_used: PEB 198, LEB 0:56, 
EC 2591, sqnum 647131, bitflips 0
[    5.018362] UBI DBG (pid 276): process_eb: scan PEB 199
[    5.023939] UBI DBG (pid 276): ubi_scan_add_used: PEB 199, LEB 0:114, 
EC 2591, sqnum 647205, bitflips 0
[    5.033394] UBI DBG (pid 276): process_eb: scan PEB 200
[    5.038949] UBI DBG (pid 276): ubi_scan_add_used: PEB 200, LEB 0:215, 
EC 2525, sqnum 647319, bitflips 0
[    5.048407] UBI DBG (pid 276): process_eb: scan PEB 201
[    5.053986] UBI DBG (pid 276): ubi_scan_add_used: PEB 201, LEB 0:159, 
EC 2540, sqnum 647216, bitflips 0
[    5.063443] UBI DBG (pid 276): process_eb: scan PEB 202
[    5.068996] UBI DBG (pid 276): ubi_scan_add_used: PEB 202, LEB 0:39, 
EC 2564, sqnum 647051, bitflips 0
[    5.078367] UBI DBG (pid 276): process_eb: scan PEB 203
[    5.083947] UBI DBG (pid 276): ubi_scan_add_used: PEB 203, LEB 0:204, 
EC 2524, sqnum 646905, bitflips 0
[    5.093402] UBI DBG (pid 276): process_eb: scan PEB 204
[    5.098955] UBI DBG (pid 276): ubi_scan_add_used: PEB 204, LEB 0:87, 
EC 2545, sqnum 647346, bitflips 0
[    5.108321] UBI DBG (pid 276): process_eb: scan PEB 205
[    5.113897] UBI DBG (pid 276): ubi_scan_add_used: PEB 205, LEB 0:64, 
EC 2572, sqnum 647343, bitflips 0
[    5.123266] UBI DBG (pid 276): process_eb: scan PEB 206
[    5.128825] UBI DBG (pid 276): ubi_scan_add_used: PEB 206, LEB 0:5, 
EC 2565, sqnum 647357, bitflips 0
[    5.138108] UBI DBG (pid 276): process_eb: scan PEB 207
[    5.143689] UBI DBG (pid 276): ubi_scan_add_used: PEB 207, LEB 0:7, 
EC 2566, sqnum 646848, bitflips 0
[    5.152933] UBI DBG (pid 276): process_eb: scan PEB 208
[    5.158522] UBI DBG (pid 276): ubi_scan_add_used: PEB 208, LEB 0:191, 
EC 2565, sqnum 647134, bitflips 0
[    5.167976] UBI DBG (pid 276): process_eb: scan PEB 209
[    5.173556] UBI DBG (pid 276): ubi_scan_add_used: PEB 209, LEB 0:235, 
EC 2565, sqnum 647033, bitflips 0
[    5.182976] UBI DBG (pid 276): process_eb: scan PEB 210
[    5.188561] UBI DBG (pid 276): ubi_scan_add_used: PEB 210, LEB 0:136, 
EC 2567, sqnum 647208, bitflips 0
[    5.198017] UBI DBG (pid 276): process_eb: scan PEB 211
[    5.203601] UBI DBG (pid 276): ubi_scan_add_used: PEB 211, LEB 0:138, 
EC 2560, sqnum 647320, bitflips 0
[    5.213019] UBI DBG (pid 276): process_eb: scan PEB 212
[    5.218605] UBI DBG (pid 276): ubi_scan_add_used: PEB 212, LEB 0:238, 
EC 2561, sqnum 646896, bitflips 0
[    5.228077] UBI DBG (pid 276): process_eb: scan PEB 213
[    5.233667] UBI DBG (pid 276): ubi_scan_add_used: PEB 213, LEB 0:173, 
EC 2571, sqnum 647311, bitflips 0
[    5.243085] UBI DBG (pid 276): process_eb: scan PEB 214
[    5.248679] UBI DBG (pid 276): ubi_scan_add_used: PEB 214, LEB 0:32, 
EC 2427, sqnum 647073, bitflips 0
[    5.258048] UBI DBG (pid 276): process_eb: scan PEB 215
[    5.263626] UBI DBG (pid 276): ubi_scan_add_used: PEB 215, LEB 0:81, 
EC 2588, sqnum 646953, bitflips 0
[    5.272956] UBI DBG (pid 276): process_eb: scan PEB 216
[    5.278544] UBI DBG (pid 276): ubi_scan_add_used: PEB 216, LEB 0:26, 
EC 2587, sqnum 646931, bitflips 0
[    5.287913] UBI DBG (pid 276): process_eb: scan PEB 217
[    5.293493] UBI DBG (pid 276): ubi_scan_add_used: PEB 217, LEB 0:153, 
EC 2585, sqnum 647330, bitflips 0
[    5.302913] UBI DBG (pid 276): process_eb: scan PEB 218
[    5.308503] UBI DBG (pid 276): ubi_scan_add_used: PEB 218, LEB 0:219, 
EC 2591, sqnum 647193, bitflips 0
[    5.317959] UBI DBG (pid 276): process_eb: scan PEB 219
[    5.323538] UBI DBG (pid 276): ubi_scan_add_used: PEB 219, LEB 0:61, 
EC 2589, sqnum 647284, bitflips 0
[    5.332870] UBI DBG (pid 276): process_eb: scan PEB 220
[    5.338459] UBI DBG (pid 276): ubi_scan_add_used: PEB 220, LEB 0:151, 
EC 2489, sqnum 647148, bitflips 0
[    5.347911] UBI DBG (pid 276): process_eb: scan PEB 221
[    5.353472] UBI DBG (pid 276): ubi_scan_add_used: PEB 221, LEB 0:107, 
EC 2548, sqnum 647309, bitflips 0
[    5.362890] UBI DBG (pid 276): process_eb: scan PEB 222
[    5.368476] UBI DBG (pid 276): ubi_scan_add_used: PEB 222, LEB 0:230, 
EC 2590, sqnum 647217, bitflips 0
[    5.377930] UBI DBG (pid 276): process_eb: scan PEB 223
[    5.383490] UBI DBG (pid 276): ubi_scan_add_used: PEB 223, LEB 0:124, 
EC 2547, sqnum 647136, bitflips 0
[    5.392909] UBI DBG (pid 276): process_eb: scan PEB 224
[    5.398498] UBI DBG (pid 276): ubi_scan_add_used: PEB 224, LEB 0:25, 
EC 2559, sqnum 647223, bitflips 0
[    5.407864] UBI DBG (pid 276): process_eb: scan PEB 225
[    5.413440] UBI DBG (pid 276): ubi_scan_add_used: PEB 225, LEB 0:171, 
EC 2588, sqnum 646853, bitflips 0
[    5.422858] UBI DBG (pid 276): process_eb: scan PEB 226
[    5.428445] UBI DBG (pid 276): ubi_scan_add_used: PEB 226, LEB 0:78, 
EC 2553, sqnum 646162, bitflips 0
[    5.437813] UBI DBG (pid 276): process_eb: scan PEB 227
[    5.443373] UBI DBG (pid 276): ubi_scan_add_used: PEB 227, LEB 0:66, 
EC 2567, sqnum 646983, bitflips 0
[    5.452706] UBI DBG (pid 276): process_eb: scan PEB 228
[    5.458290] UBI DBG (pid 276): ubi_scan_add_used: PEB 228, LEB 0:168, 
EC 2506, sqnum 647174, bitflips 0
[    5.467746] UBI DBG (pid 276): process_eb: scan PEB 229
[    5.473329] UBI DBG (pid 276): ubi_scan_add_used: PEB 229, LEB 0:88, 
EC 2534, sqnum 647308, bitflips 0
[    5.482661] UBI DBG (pid 276): process_eb: scan PEB 230
[    5.488250] UBI DBG (pid 276): ubi_scan_add_used: PEB 230, LEB 0:234, 
EC 2553, sqnum 647183, bitflips 0
[    5.497705] UBI DBG (pid 276): process_eb: scan PEB 231
[    5.503259] UBI DBG (pid 276): ubi_scan_add_used: PEB 231, LEB 0:231, 
EC 2590, sqnum 646852, bitflips 0
[    5.512715] UBI DBG (pid 276): process_eb: scan PEB 232
[    5.518301] UBI DBG (pid 276): ubi_scan_add_used: PEB 232, LEB 0:76, 
EC 2527, sqnum 647046, bitflips 0
[    5.527666] UBI DBG (pid 276): process_eb: scan PEB 233
[    5.533219] UBI DBG (pid 276): ubi_scan_add_used: PEB 233, LEB 0:211, 
EC 2553, sqnum 647213, bitflips 0
[    5.542675] UBI DBG (pid 276): process_eb: scan PEB 234
[    5.548251] UBI DBG (pid 276): ubi_scan_add_used: PEB 234, LEB 0:249, 
EC 2507, sqnum 646784, bitflips 0
[    5.557706] UBI DBG (pid 276): process_eb: scan PEB 235
[    5.563262] UBI DBG (pid 276): ubi_scan_add_used: PEB 235, LEB 0:144, 
EC 2575, sqnum 645390, bitflips 0
[    5.572715] UBI DBG (pid 276): process_eb: scan PEB 236
[    5.578294] UBI DBG (pid 276): ubi_scan_add_used: PEB 236, LEB 0:203, 
EC 2590, sqnum 646855, bitflips 0
[    5.587750] UBI DBG (pid 276): process_eb: scan PEB 237
[    5.593300] UBI DBG (pid 276): ubi_scan_add_used: PEB 237, LEB 0:18, 
EC 2585, sqnum 647351, bitflips 0
[    5.602669] UBI DBG (pid 276): process_eb: scan PEB 238
[    5.608250] UBI DBG (pid 276): ubi_scan_add_used: PEB 238, LEB 0:57, 
EC 2566, sqnum 647127, bitflips 0
[    5.617619] UBI DBG (pid 276): process_eb: scan PEB 239
[    5.623174] UBI DBG (pid 276): ubi_scan_add_used: PEB 239, LEB 0:232, 
EC 2545, sqnum 646056, bitflips 0
[    5.632629] UBI DBG (pid 276): process_eb: scan PEB 240
[    5.638208] UBI DBG (pid 276): ubi_scan_add_used: PEB 240, LEB 0:147, 
EC 2589, sqnum 647269, bitflips 0
[    5.647663] UBI DBG (pid 276): process_eb: scan PEB 241
[    5.653216] UBI DBG (pid 276): ubi_scan_add_used: PEB 241, LEB 0:30, 
EC 2539, sqnum 645316, bitflips 0
[    5.662583] UBI DBG (pid 276): process_eb: scan PEB 242
[    5.668161] UBI DBG (pid 276): ubi_scan_add_used: PEB 242, LEB 0:146, 
EC 2512, sqnum 647011, bitflips 0
[    5.677618] UBI DBG (pid 276): process_eb: scan PEB 243
[    5.683173] UBI DBG (pid 276): ubi_scan_add_used: PEB 243, LEB 0:15, 
EC 2582, sqnum 645494, bitflips 0
[    5.692541] UBI DBG (pid 276): process_eb: scan PEB 244
[    5.698124] UBI DBG (pid 276): ubi_scan_add_used: PEB 244, LEB 0:110, 
EC 2496, sqnum 644071, bitflips 0
[    5.707578] UBI DBG (pid 276): process_eb: scan PEB 245
[    5.713130] UBI DBG (pid 276): ubi_scan_add_used: PEB 245, LEB 0:190, 
EC 2501, sqnum 646888, bitflips 0
[    5.722588] UBI DBG (pid 276): process_eb: scan PEB 246
[    5.728166] UBI DBG (pid 276): ubi_scan_add_used: PEB 246, LEB 0:123, 
EC 2502, sqnum 647317, bitflips 0
[    5.737620] UBI DBG (pid 276): process_eb: scan PEB 247
[    5.743176] UBI DBG (pid 276): ubi_scan_add_used: PEB 247, LEB 0:83, 
EC 2528, sqnum 647225, bitflips 0
[    5.752546] UBI DBG (pid 276): process_eb: scan PEB 248
[    5.758127] UBI DBG (pid 276): ubi_scan_add_used: PEB 248, LEB 0:244, 
EC 2577, sqnum 646929, bitflips 0
[    5.767582] UBI DBG (pid 276): process_eb: scan PEB 249
[    5.773138] UBI DBG (pid 276): ubi_scan_add_used: PEB 249, LEB 0:112, 
EC 2550, sqnum 647335, bitflips 0
[    5.782592] UBI DBG (pid 276): process_eb: scan PEB 250
[    5.788173] UBI DBG (pid 276): ubi_scan_add_used: PEB 250, LEB 0:178, 
EC 2588, sqnum 647100, bitflips 0
[    5.797626] UBI DBG (pid 276): process_eb: scan PEB 251
[    5.803177] UBI DBG (pid 276): ubi_scan_add_used: PEB 251, LEB 0:226, 
EC 2572, sqnum 647044, bitflips 0
[    5.812632] UBI DBG (pid 276): process_eb: scan PEB 252
[    5.818213] UBI DBG (pid 276): ubi_scan_add_used: PEB 252, LEB 0:73, 
EC 2544, sqnum 647261, bitflips 0
[    5.827584] UBI DBG (pid 276): process_eb: scan PEB 253
[    5.833136] UBI DBG (pid 276): ubi_scan_add_used: PEB 253, LEB 0:14, 
EC 2574, sqnum 647312, bitflips 0
[    5.842504] UBI DBG (pid 276): process_eb: scan PEB 254
[    5.848082] UBI DBG (pid 276): ubi_scan_add_used: PEB 254, LEB 
2147479551:1, EC 1, sqnum 4, bitflips 0
[    5.857444] UBI DBG (pid 276): add_volume: added volume 2147479551
[    5.863661] UBI DBG (pid 276): process_eb: scan PEB 255
[    5.869216] UBI DBG (pid 276): ubi_scan_add_used: PEB 255, LEB 
2147479551:0, EC 1, sqnum 3, bitflips 0
[    5.878580] UBI DBG (pid 276): ubi_scan: scanning is finished
[    5.884457] UBI: max. sequence number:       647359
[    5.897130] UBI: attached mtd3 to ubi3
[    5.900896] UBI: MTD device name:            "Psystem"
[    5.906122] UBI: MTD device size:            32 MiB
[    5.911009] UBI: number of good PEBs:        256
[    5.915687] UBI: number of bad PEBs:         0
[    5.920137] UBI: number of corrupted PEBs:   0
[    5.924604] UBI: max. allowed volumes:       128
[    5.929226] UBI: wear-leveling threshold:    4096
[    5.933949] UBI: number of internal volumes: 1
[    5.938396] UBI: number of user volumes:     1
[    5.942842] UBI: available PEBs:             0
[    5.947308] UBI: total number of reserved PEBs: 256
[    5.952190] UBI: number of PEBs reserved for bad PEB handling: 2
[    5.958224] UBI: max/mean erase counter: 2593/2527
[    5.963020] UBI: image sequence number:  -884939195
[    5.967941] UBI: background thread "ubi_bgt3d" started, PID 280


[   13.501809] UBIFS: recovery completed
[   13.505504] UBIFS: mounted UBI device 3, volume 0, name "system"
[   13.511583] UBIFS: file system size:   30601216 bytes (29884 KiB, 29 
MiB, 241 LEBs)
[   13.519280] UBIFS: journal size:       1523712 bytes (1488 KiB, 1 
MiB, 12 LEBs)
[   13.526603] UBIFS: media format:       w4/r0 (latest is w4/r0)
[   13.532462] UBIFS: default compressor: none
[   13.536652] UBIFS: reserved for root:  1445370 bytes (1411 KiB)
