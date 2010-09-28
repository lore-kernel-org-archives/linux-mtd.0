Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0Uuy-000611-CT
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 07:48:13 +0000
Message-ID: <4CA19DAE.7030402@parrot.com>
Date: Tue, 28 Sep 2010 09:47:58 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: RE : UBI/UBIFS interrupted write page handling
References: <4C88DDD5.4060507@parrot.com>	 <1284054669.11335.21.camel@brekeke>
	<1285006478.1762.1.camel@brekeke>	 <4C9B7CD8.4070806@parrot.com>,
	<1285266914.1766.1.camel@brekeke>	
	<F5C24FC168F95048BB6B9E0B13EB33152BA6F5304E@DIAMANT.xi-lite.lan>	
	<1285523911.1776.9.camel@brekeke>
	<1285657088.2437.23.camel@localhost>
In-Reply-To: <1285657088.2437.23.camel@localhost>
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

Artem Bityutskiy a écrit :
> On Sun, 2010-09-26 at 20:58 +0300, Artem Bityutskiy wrote:
>>> The test is still running, but because for each boot we got this slow
>>> dump (take near 1 min), I expect others errors to take longer to
>>> appear.
>> Your PEB 20 contains almost all 0xFFs, but not quite, and NAND pages are
>> read with ECC errors. I think this is a result of power cut during
>> erasure.
>>
>> My new patch-set is trying to detect situations when we have a PEB which
>> contains important data, but its VID header is corrupted. We try to
>> preserve such PEBs instead of erasing. UBI would not spam so much if
>> debugging was disabled.
> 
> Matthieu, thanks for testing the latest UBI changes. I wonder, do you
> have issues with the follow-up fix I sent you. I just wonder if it is ok
> for me to put these patches to linux-next or it is better to wait a
> little?
> 
That's better : interrupt erased page are not put anymore in corrupted list.
But I have problem with interrupt write :
this night the test crashed [1].



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
[    2.090385] UBI DBG (pid 276): process_eb: scan PEB 6
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
[    2.169206] UBI DBG (pid 276): ubi_scan_add_used: PEB 11, LEB 0:233, 
EC 2581, sqnum 647381, bitflips 0
[    2.178570] UBI DBG (pid 276): process_eb: scan PEB 12
[    2.184059] UBI DBG (pid 276): ubi_scan_add_used: PEB 12, LEB 0:196, 
EC 2497, sqnum 646945, bitflips 0
[    2.193423] UBI DBG (pid 276): process_eb: scan PEB 13
[    2.198886] UBI DBG (pid 276): ubi_scan_add_used: PEB 13, LEB 0:157, 
EC 2582, sqnum 647221, bitflips 0
[    2.208249] UBI DBG (pid 276): process_eb: scan PEB 14
[    2.213737] UBI DBG (pid 276): ubi_scan_add_used: PEB 14, LEB 0:155, 
EC 2530, sqnum 647111, bitflips 0
[    2.223100] UBI DBG (pid 276): process_eb: scan PEB 15
[    2.228566] UBI DBG (pid 276): ubi_scan_add_used: PEB 15, LEB 0:101, 
EC 2545, sqnum 647294, bitflips 0
[    2.237934] UBI DBG (pid 276): process_eb: scan PEB 16
[    2.243421] UBI DBG (pid 276): ubi_scan_add_used: PEB 16, LEB 0:208, 
EC 2586, sqnum 647384, bitflips 0
[    2.252789] UBI DBG (pid 276): process_eb: scan PEB 17
[    2.258251] UBI DBG (pid 276): ubi_scan_add_used: PEB 17, LEB 0:242, 
EC 2566, sqnum 646850, bitflips 0
[    2.267619] UBI DBG (pid 276): process_eb: scan PEB 18
[    2.273109] UBI DBG (pid 276): ubi_scan_add_used: PEB 18, LEB 0:1, EC 
2539, sqnum 647164, bitflips 0
[    2.282303] UBI DBG (pid 276): process_eb: scan PEB 19
[    2.287768] UBI DBG (pid 276): ubi_scan_add_used: PEB 19, LEB 0:193, 
EC 2582, sqnum 647052, bitflips 0
[    2.297134] UBI DBG (pid 276): process_eb: scan PEB 20
[    2.302617] UBI DBG (pid 276): ubi_scan_add_used: PEB 20, LEB 0:132, 
EC 2555, sqnum 647210, bitflips 0
[    2.311983] UBI DBG (pid 276): process_eb: scan PEB 21
[    2.317452] UBI DBG (pid 276): ubi_scan_add_used: PEB 21, LEB 0:103, 
EC 2476, sqnum 647126, bitflips 0
[    2.326819] UBI DBG (pid 276): process_eb: scan PEB 22
[    2.332308] UBI DBG (pid 276): ubi_scan_add_used: PEB 22, LEB 0:239, 
EC 2559, sqnum 646947, bitflips 0
[    2.341676] UBI DBG (pid 276): process_eb: scan PEB 23
[    2.347134] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 23, only 0xFF bytes
[    2.356152] UBI DBG (pid 276): add_to_list: add to free: PEB 23, EC 2594
[    2.362886] UBI DBG (pid 276): process_eb: scan PEB 24
[    2.368352] UBI DBG (pid 276): ubi_scan_add_used: PEB 24, LEB 0:221, 
EC 2562, sqnum 646904, bitflips 0
[    2.377720] UBI DBG (pid 276): process_eb: scan PEB 25
[    2.383208] UBI DBG (pid 276): ubi_scan_add_used: PEB 25, LEB 0:160, 
EC 2593, sqnum 647392, bitflips 0
[    2.392575] UBI DBG (pid 276): process_eb: scan PEB 26
[    2.398040] UBI DBG (pid 276): ubi_scan_add_used: PEB 26, LEB 0:75, 
EC 2536, sqnum 646900, bitflips 0
[    2.407320] UBI DBG (pid 276): process_eb: scan PEB 27
[    2.412806] UBI DBG (pid 276): ubi_scan_add_used: PEB 27, LEB 0:121, 
EC 2569, sqnum 644645, bitflips 0
[    2.422172] UBI DBG (pid 276): process_eb: scan PEB 28
[    2.427637] UBI DBG (pid 276): ubi_scan_add_used: PEB 28, LEB 0:91, 
EC 2461, sqnum 646844, bitflips 0
[    2.436917] UBI DBG (pid 276): process_eb: scan PEB 29
[    2.442405] UBI DBG (pid 276): ubi_scan_add_used: PEB 29, LEB 0:183, 
EC 2536, sqnum 647265, bitflips 0
[    2.451773] UBI DBG (pid 276): process_eb: scan PEB 30
[    2.457238] UBI DBG (pid 276): ubi_scan_add_used: PEB 30, LEB 0:240, 
EC 2554, sqnum 646842, bitflips 0
[    2.466605] UBI DBG (pid 276): process_eb: scan PEB 31
[    2.472093] UBI DBG (pid 276): ubi_scan_add_used: PEB 31, LEB 0:82, 
EC 2418, sqnum 647173, bitflips 0
[    2.481336] UBI DBG (pid 276): process_eb: scan PEB 32
[    2.486832] UBI DBG (pid 276): ubi_scan_add_used: PEB 32, LEB 0:28, 
EC 2514, sqnum 646791, bitflips 0
[    2.496110] UBI DBG (pid 276): process_eb: scan PEB 33
[    2.501586] UBI DBG (pid 276): ubi_scan_add_used: PEB 33, LEB 0:69, 
EC 2579, sqnum 646928, bitflips 0
[    2.510831] UBI DBG (pid 276): process_eb: scan PEB 34
[    2.516328] UBI DBG (pid 276): ubi_scan_add_used: PEB 34, LEB 0:10, 
EC 2592, sqnum 647184, bitflips 0
[    2.525604] UBI DBG (pid 276): process_eb: scan PEB 35
[    2.531067] UBI DBG (pid 276): ubi_scan_add_used: PEB 35, LEB 0:195, 
EC 2573, sqnum 647121, bitflips 0
[    2.540434] UBI DBG (pid 276): process_eb: scan PEB 36
[    2.545924] UBI DBG (pid 276): ubi_scan_add_used: PEB 36, LEB 0:180, 
EC 2574, sqnum 646943, bitflips 0
[    2.555289] UBI DBG (pid 276): process_eb: scan PEB 37
[    2.560754] UBI DBG (pid 276): ubi_scan_add_used: PEB 37, LEB 0:137, 
EC 2587, sqnum 647104, bitflips 0
[    2.570141] UBI DBG (pid 276): process_eb: scan PEB 38
[    2.575644] UBI DBG (pid 276): ubi_scan_add_used: PEB 38, LEB 0:202, 
EC 2583, sqnum 647289, bitflips 0
[    2.585011] UBI DBG (pid 276): process_eb: scan PEB 39
[    2.590481] UBI DBG (pid 276): ubi_scan_add_used: PEB 39, LEB 0:120, 
EC 2522, sqnum 647175, bitflips 0
[    2.599848] UBI DBG (pid 276): process_eb: scan PEB 40
[    2.605339] UBI DBG (pid 276): ubi_scan_add_used: PEB 40, LEB 0:35, 
EC 2552, sqnum 645902, bitflips 0
[    2.614621] UBI DBG (pid 276): process_eb: scan PEB 41
[    2.620089] UBI DBG (pid 276): ubi_scan_add_used: PEB 41, LEB 0:48, 
EC 2515, sqnum 647231, bitflips 0
[    2.629368] UBI DBG (pid 276): process_eb: scan PEB 42
[    2.634858] UBI DBG (pid 276): ubi_scan_add_used: PEB 42, LEB 0:181, 
EC 2581, sqnum 647260, bitflips 0
[    2.644229] UBI DBG (pid 276): process_eb: scan PEB 43
[    2.649695] UBI DBG (pid 276): ubi_scan_add_used: PEB 43, LEB 0:104, 
EC 2527, sqnum 647062, bitflips 0
[    2.659065] UBI DBG (pid 276): process_eb: scan PEB 44
[    2.664554] UBI DBG (pid 276): ubi_scan_add_used: PEB 44, LEB 0:222, 
EC 2452, sqnum 646930, bitflips 0
[    2.673923] UBI DBG (pid 276): process_eb: scan PEB 45
[    2.679392] UBI DBG (pid 276): ubi_scan_add_used: PEB 45, LEB 0:74, 
EC 2592, sqnum 647293, bitflips 0
[    2.688672] UBI DBG (pid 276): process_eb: scan PEB 46
[    2.694162] UBI DBG (pid 276): ubi_scan_add_used: PEB 46, LEB 0:139, 
EC 2508, sqnum 647203, bitflips 0
[    2.703528] UBI DBG (pid 276): process_eb: scan PEB 47
[    2.708994] UBI DBG (pid 276): ubi_scan_add_used: PEB 47, LEB 0:199, 
EC 2550, sqnum 647047, bitflips 0
[    2.718360] UBI DBG (pid 276): process_eb: scan PEB 48
[    2.723848] UBI DBG (pid 276): ubi_scan_add_used: PEB 48, LEB 0:90, 
EC 2513, sqnum 646764, bitflips 0
[    2.733128] UBI DBG (pid 276): process_eb: scan PEB 49
[    2.738591] UBI DBG (pid 276): ubi_scan_add_used: PEB 49, LEB 0:198, 
EC 2583, sqnum 647200, bitflips 0
[    2.747961] UBI DBG (pid 276): process_eb: scan PEB 50
[    2.753450] UBI DBG (pid 276): ubi_scan_add_used: PEB 50, LEB 0:67, 
EC 2568, sqnum 647176, bitflips 0
[    2.762731] UBI DBG (pid 276): process_eb: scan PEB 51
[    2.768199] UBI DBG (pid 276): ubi_scan_add_used: PEB 51, LEB 0:213, 
EC 2592, sqnum 647196, bitflips 0
[    2.777566] UBI DBG (pid 276): process_eb: scan PEB 52
[    2.783056] UBI DBG (pid 276): ubi_scan_add_used: PEB 52, LEB 0:22, 
EC 2561, sqnum 646020, bitflips 0
[    2.792335] UBI DBG (pid 276): process_eb: scan PEB 53
[    2.797801] UBI DBG (pid 276): ubi_scan_add_used: PEB 53, LEB 0:38, 
EC 2550, sqnum 646913, bitflips 0
[    2.807081] UBI DBG (pid 276): process_eb: scan PEB 54
[    2.812567] UBI DBG (pid 276): ubi_scan_add_used: PEB 54, LEB 0:205, 
EC 2493, sqnum 647141, bitflips 0
[    2.821933] UBI DBG (pid 276): process_eb: scan PEB 55
[    2.827400] UBI DBG (pid 276): ubi_scan_add_used: PEB 55, LEB 0:169, 
EC 2516, sqnum 647179, bitflips 0
[    2.836770] UBI DBG (pid 276): process_eb: scan PEB 56
[    2.842259] UBI DBG (pid 276): ubi_scan_add_used: PEB 56, LEB 0:68, 
EC 2591, sqnum 647367, bitflips 0
[    2.851503] UBI DBG (pid 276): process_eb: scan PEB 57
[    2.857003] UBI DBG (pid 276): ubi_scan_add_used: PEB 57, LEB 0:194, 
EC 2592, sqnum 647202, bitflips 0
[    2.866367] UBI DBG (pid 276): process_eb: scan PEB 58
[    2.871836] UBI DBG (pid 276): ubi_scan_add_used: PEB 58, LEB 0:106, 
EC 2588, sqnum 647143, bitflips 0
[    2.881168] UBI DBG (pid 276): process_eb: scan PEB 59
[    2.886662] UBI DBG (pid 276): ubi_scan_add_used: PEB 59, LEB 0:105, 
EC 2558, sqnum 647388, bitflips 0
[    2.896030] UBI DBG (pid 276): process_eb: scan PEB 60
[    2.901497] UBI DBG (pid 276): ubi_scan_add_used: PEB 60, LEB 0:23, 
EC 2415, sqnum 646118, bitflips 0
[    2.910779] UBI DBG (pid 276): process_eb: scan PEB 61
[    2.916269] UBI DBG (pid 276): ubi_scan_add_used: PEB 61, LEB 0:217, 
EC 2513, sqnum 645167, bitflips 0
[    2.925636] UBI DBG (pid 276): process_eb: scan PEB 62
[    2.931100] UBI DBG (pid 276): ubi_scan_add_used: PEB 62, LEB 0:89, 
EC 2574, sqnum 646055, bitflips 0
[    2.940563] UBI DBG (pid 276): process_eb: scan PEB 63
[    2.946284] UBI DBG (pid 276): ubi_scan_add_used: PEB 63, LEB 0:247, 
EC 2497, sqnum 647339, bitflips 0
[    2.955670] UBI DBG (pid 276): process_eb: scan PEB 64
[    2.961152] UBI DBG (pid 276): ubi_scan_add_used: PEB 64, LEB 0:227, 
EC 2578, sqnum 646944, bitflips 0
[    2.970525] UBI DBG (pid 276): process_eb: scan PEB 65
[    2.976024] UBI DBG (pid 276): ubi_scan_add_used: PEB 65, LEB 0:141, 
EC 2559, sqnum 645415, bitflips 0
[    2.985393] UBI DBG (pid 276): process_eb: scan PEB 66
[    2.990864] UBI DBG (pid 276): ubi_scan_add_used: PEB 66, LEB 0:225, 
EC 2506, sqnum 647140, bitflips 0
[    3.000235] UBI DBG (pid 276): process_eb: scan PEB 67
[    3.005729] UBI DBG (pid 276): ubi_scan_add_used: PEB 67, LEB 0:100, 
EC 2586, sqnum 647385, bitflips 0
[    3.015095] UBI DBG (pid 276): process_eb: scan PEB 68
[    3.020558] UBI DBG (pid 276): ubi_scan_add_used: PEB 68, LEB 0:49, 
EC 2587, sqnum 647076, bitflips 0
[    3.029838] UBI DBG (pid 276): process_eb: scan PEB 69
[    3.035317] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 69, only 0xFF bytes
[    3.044335] UBI DBG (pid 276): add_to_list: add to free: PEB 69, EC 2594
[    3.051049] UBI DBG (pid 276): process_eb: scan PEB 70
[    3.056537] UBI DBG (pid 276): ubi_scan_add_used: PEB 70, LEB 0:12, 
EC 2571, sqnum 647267, bitflips 0
[    3.065818] UBI DBG (pid 276): process_eb: scan PEB 71
[    3.071286] UBI DBG (pid 276): ubi_scan_add_used: PEB 71, LEB 0:95, 
EC 2578, sqnum 647241, bitflips 0
[    3.080566] UBI DBG (pid 276): process_eb: scan PEB 72
[    3.086041] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 72, only 0xFF bytes
[    3.095056] UBI DBG (pid 276): add_to_list: add to free: PEB 72, EC 2594
[    3.101770] UBI DBG (pid 276): process_eb: scan PEB 73
[    3.107261] UBI DBG (pid 276): ubi_scan_add_used: PEB 73, LEB 0:154, 
EC 2587, sqnum 647211, bitflips 0
[    3.116627] UBI DBG (pid 276): process_eb: scan PEB 74
[    3.122098] UBI DBG (pid 276): ubi_scan_add_used: PEB 74, LEB 0:163, 
EC 2573, sqnum 646922, bitflips 0
[    3.131431] UBI DBG (pid 276): process_eb: scan PEB 75
[    3.136930] UBI DBG (pid 276): ubi_scan_add_used: PEB 75, LEB 0:52, 
EC 2579, sqnum 647399, bitflips 0
[    3.146212] UBI DBG (pid 276): process_eb: scan PEB 76
[    3.151680] UBI DBG (pid 276): ubi_scan_add_used: PEB 76, LEB 0:170, 
EC 2572, sqnum 647240, bitflips 0
[    3.161047] UBI DBG (pid 276): process_eb: scan PEB 77
[    3.166536] UBI DBG (pid 276): ubi_scan_add_used: PEB 77, LEB 0:85, 
EC 2586, sqnum 647120, bitflips 0
[    3.175817] UBI DBG (pid 276): process_eb: scan PEB 78
[    3.181287] UBI DBG (pid 276): ubi_scan_add_used: PEB 78, LEB 0:179, 
EC 2562, sqnum 647059, bitflips 0
[    3.190655] UBI DBG (pid 276): process_eb: scan PEB 79
[    3.196146] UBI DBG (pid 276): ubi_scan_add_used: PEB 79, LEB 0:42, 
EC 2554, sqnum 647401, bitflips 0
[    3.205427] UBI DBG (pid 276): process_eb: scan PEB 80
[    3.210893] UBI DBG (pid 276): ubi_scan_add_used: PEB 80, LEB 0:236, 
EC 2567, sqnum 647139, bitflips 0
[    3.220262] UBI DBG (pid 276): process_eb: scan PEB 81
[    3.225752] UBI DBG (pid 276): ubi_scan_add_used: PEB 81, LEB 0:212, 
EC 2569, sqnum 645303, bitflips 0
[    3.235115] UBI DBG (pid 276): process_eb: scan PEB 82
[    3.240580] UBI DBG (pid 276): ubi_scan_add_used: PEB 82, LEB 0:142, 
EC 2551, sqnum 647303, bitflips 0
[    3.249949] UBI DBG (pid 276): process_eb: scan PEB 83
[    3.255440] UBI DBG (pid 276): ubi_scan_add_used: PEB 83, LEB 0:9, EC 
2530, sqnum 647232, bitflips 0
[    3.264632] UBI DBG (pid 276): process_eb: scan PEB 84
[    3.270097] UBI DBG (pid 276): ubi_scan_add_used: PEB 84, LEB 0:108, 
EC 2586, sqnum 647207, bitflips 0
[    3.279464] UBI DBG (pid 276): process_eb: scan PEB 85
[    3.284953] UBI DBG (pid 276): ubi_scan_add_used: PEB 85, LEB 0:140, 
EC 2478, sqnum 646914, bitflips 0
[    3.294321] UBI DBG (pid 276): process_eb: scan PEB 86
[    3.299789] UBI DBG (pid 276): ubi_scan_add_used: PEB 86, LEB 0:45, 
EC 2581, sqnum 644651, bitflips 0
[    3.309071] UBI DBG (pid 276): process_eb: scan PEB 87
[    3.314564] UBI DBG (pid 276): ubi_scan_add_used: PEB 87, LEB 0:237, 
EC 2560, sqnum 647363, bitflips 0
[    3.323931] UBI DBG (pid 276): process_eb: scan PEB 88
[    3.329394] UBI DBG (pid 276): ubi_scan_add_used: PEB 88, LEB 0:243, 
EC 2552, sqnum 647012, bitflips 0
[    3.338763] UBI DBG (pid 276): process_eb: scan PEB 89
[    3.344257] UBI DBG (pid 276): ubi_scan_add_used: PEB 89, LEB 0:197, 
EC 2591, sqnum 646997, bitflips 0
[    3.353624] UBI DBG (pid 276): process_eb: scan PEB 90
[    3.359090] UBI DBG (pid 276): ubi_scan_add_used: PEB 90, LEB 0:17, 
EC 2496, sqnum 647396, bitflips 0
[    3.368372] UBI DBG (pid 276): process_eb: scan PEB 91
[    3.373866] UBI DBG (pid 276): ubi_scan_add_used: PEB 91, LEB 0:109, 
EC 2593, sqnum 647366, bitflips 0
[    3.383232] UBI DBG (pid 276): process_eb: scan PEB 92
[    3.388686] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 92, only 0xFF bytes
[    3.397703] UBI DBG (pid 276): add_to_list: add to free: PEB 92, EC 2594
[    3.404440] UBI DBG (pid 276): process_eb: scan PEB 93
[    3.409911] UBI DBG (pid 276): ubi_scan_add_used: PEB 93, LEB 0:27, 
EC 2535, sqnum 647194, bitflips 0
[    3.419191] UBI DBG (pid 276): process_eb: scan PEB 94
[    3.424683] UBI DBG (pid 276): ubi_scan_add_used: PEB 94, LEB 0:65, 
EC 2584, sqnum 646886, bitflips 0
[    3.433958] UBI DBG (pid 276): process_eb: scan PEB 95
[    3.439424] UBI DBG (pid 276): ubi_scan_add_used: PEB 95, LEB 0:71, 
EC 2562, sqnum 647117, bitflips 0
[    3.448727] UBI DBG (pid 276): process_eb: scan PEB 96
[    3.454229] UBI DBG (pid 276): ubi_scan_add_used: PEB 96, LEB 0:164, 
EC 2589, sqnum 647244, bitflips 0
[    3.463600] UBI DBG (pid 276): process_eb: scan PEB 97
[    3.469067] UBI DBG (pid 276): ubi_scan_add_used: PEB 97, LEB 0:16, 
EC 2575, sqnum 647013, bitflips 0
[    3.478350] UBI DBG (pid 276): process_eb: scan PEB 98
[    3.483842] UBI DBG (pid 276): ubi_scan_add_used: PEB 98, LEB 0:223, 
EC 2572, sqnum 647036, bitflips 0
[    3.493213] UBI DBG (pid 276): process_eb: scan PEB 99
[    3.498680] UBI DBG (pid 276): ubi_scan_add_used: PEB 99, LEB 0:185, 
EC 2501, sqnum 647212, bitflips 0
[    3.508047] UBI DBG (pid 276): process_eb: scan PEB 100
[    3.513624] UBI DBG (pid 276): ubi_scan_add_used: PEB 100, LEB 0:2, 
EC 2565, sqnum 647165, bitflips 0
[    3.522904] UBI DBG (pid 276): process_eb: scan PEB 101
[    3.528456] UBI DBG (pid 276): ubi_scan_add_used: PEB 101, LEB 0:138, 
EC 2585, sqnum 647383, bitflips 0
[    3.537909] UBI DBG (pid 276): process_eb: scan PEB 102
[    3.543486] UBI DBG (pid 276): ubi_scan_add_used: PEB 102, LEB 0:246, 
EC 2566, sqnum 647253, bitflips 0
[    3.552939] UBI DBG (pid 276): process_eb: scan PEB 103
[    3.558493] UBI DBG (pid 276): ubi_scan_add_used: PEB 103, LEB 0:96, 
EC 2586, sqnum 647145, bitflips 0
[    3.567860] UBI DBG (pid 276): process_eb: scan PEB 104
[    3.573434] UBI DBG (pid 276): ubi_scan_add_used: PEB 104, LEB 0:62, 
EC 2589, sqnum 647220, bitflips 0
[    3.582801] UBI DBG (pid 276): process_eb: scan PEB 105
[    3.588351] UBI DBG (pid 276): ubi_scan_add_used: PEB 105, LEB 0:145, 
EC 2587, sqnum 647243, bitflips 0
[    3.597805] UBI DBG (pid 276): process_eb: scan PEB 106
[    3.603381] UBI DBG (pid 276): ubi_scan_add_used: PEB 106, LEB 0:161, 
EC 2560, sqnum 647268, bitflips 0
[    3.612835] UBI DBG (pid 276): process_eb: scan PEB 107
[    3.618388] UBI DBG (pid 276): ubi_scan_add_used: PEB 107, LEB 0:44, 
EC 2525, sqnum 647262, bitflips 0
[    3.627757] UBI DBG (pid 276): process_eb: scan PEB 108
[    3.633334] UBI DBG (pid 276): ubi_scan_add_used: PEB 108, LEB 0:126, 
EC 2562, sqnum 647050, bitflips 0
[    3.642789] UBI DBG (pid 276): process_eb: scan PEB 109
[    3.648340] UBI DBG (pid 276): ubi_scan_add_used: PEB 109, LEB 0:229, 
EC 2556, sqnum 647235, bitflips 0
[    3.657793] UBI DBG (pid 276): process_eb: scan PEB 110
[    3.663369] UBI DBG (pid 276): ubi_scan_add_used: PEB 110, LEB 0:192, 
EC 2593, sqnum 647393, bitflips 0
[    3.672822] UBI DBG (pid 276): process_eb: scan PEB 111
[    3.678372] UBI DBG (pid 276): ubi_scan_add_used: PEB 111, LEB 0:125, 
EC 2573, sqnum 647109, bitflips 0
[    3.687826] UBI DBG (pid 276): process_eb: scan PEB 112
[    3.693405] UBI DBG (pid 276): ubi_scan_add_used: PEB 112, LEB 0:40, 
EC 2581, sqnum 647364, bitflips 0
[    3.702771] UBI DBG (pid 276): process_eb: scan PEB 113
[    3.708324] UBI DBG (pid 276): ubi_scan_add_used: PEB 113, LEB 0:248, 
EC 2530, sqnum 647359, bitflips 0
[    3.717780] UBI DBG (pid 276): process_eb: scan PEB 114
[    3.723356] UBI DBG (pid 276): ubi_scan_add_used: PEB 114, LEB 0:128, 
EC 2545, sqnum 647115, bitflips 0
[    3.732811] UBI DBG (pid 276): process_eb: scan PEB 115
[    3.738366] UBI DBG (pid 276): ubi_scan_add_used: PEB 115, LEB 0:218, 
EC 2525, sqnum 647300, bitflips 0
[    3.747820] UBI DBG (pid 276): process_eb: scan PEB 116
[    3.753394] UBI DBG (pid 276): ubi_scan_add_used: PEB 116, LEB 0:177, 
EC 2583, sqnum 647297, bitflips 0
[    3.762849] UBI DBG (pid 276): process_eb: scan PEB 117
[    3.768404] UBI DBG (pid 276): ubi_scan_add_used: PEB 117, LEB 0:86, 
EC 2591, sqnum 647245, bitflips 0
[    3.777773] UBI DBG (pid 276): process_eb: scan PEB 118
[    3.783353] UBI DBG (pid 276): ubi_scan_add_used: PEB 118, LEB 0:216, 
EC 2538, sqnum 647030, bitflips 0
[    3.792805] UBI DBG (pid 276): process_eb: scan PEB 119
[    3.798345] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 119, only 0xFF bytes
[    3.807447] UBI DBG (pid 276): add_to_list: add to free: PEB 119, EC 2587
[    3.814275] UBI DBG (pid 276): process_eb: scan PEB 120
[    3.819828] UBI DBG (pid 276): ubi_scan_add_used: PEB 120, LEB 0:72, 
EC 2576, sqnum 646895, bitflips 0
[    3.829196] UBI DBG (pid 276): process_eb: scan PEB 121
[    3.834780] UBI DBG (pid 276): ubi_scan_add_used: PEB 121, LEB 0:134, 
EC 2555, sqnum 647258, bitflips 0
[    3.844230] UBI DBG (pid 276): process_eb: scan PEB 122
[    3.849784] UBI DBG (pid 276): ubi_scan_add_used: PEB 122, LEB 0:102, 
EC 2524, sqnum 647251, bitflips 0
[    3.859237] UBI DBG (pid 276): process_eb: scan PEB 123
[    3.864815] UBI DBG (pid 276): ubi_scan_add_used: PEB 123, LEB 0:241, 
EC 2484, sqnum 647259, bitflips 0
[    3.874268] UBI DBG (pid 276): process_eb: scan PEB 124
[    3.879823] UBI DBG (pid 276): ubi_scan_add_used: PEB 124, LEB 0:129, 
EC 2589, sqnum 647061, bitflips 0
[    3.889277] UBI DBG (pid 276): process_eb: scan PEB 125
[    3.894853] UBI DBG (pid 276): ubi_scan_add_used: PEB 125, LEB 0:41, 
EC 2505, sqnum 647276, bitflips 0
[    3.904219] UBI DBG (pid 276): process_eb: scan PEB 126
[    3.909770] UBI DBG (pid 276): ubi_scan_add_used: PEB 126, LEB 0:18, 
EC 2593, sqnum 647394, bitflips 0
[    3.919138] UBI DBG (pid 276): process_eb: scan PEB 127
[    3.924715] UBI DBG (pid 276): ubi_scan_add_used: PEB 127, LEB 0:36, 
EC 2564, sqnum 647376, bitflips 0
[    3.934081] UBI DBG (pid 276): process_eb: scan PEB 128
[    3.939632] UBI DBG (pid 276): ubi_scan_add_used: PEB 128, LEB 0:53, 
EC 2532, sqnum 647387, bitflips 0
[    3.949001] UBI DBG (pid 276): process_eb: scan PEB 129
[    3.954580] UBI DBG (pid 276): ubi_scan_add_used: PEB 129, LEB 0:64, 
EC 2568, sqnum 647389, bitflips 0
[    3.963948] UBI DBG (pid 276): process_eb: scan PEB 130
[    3.969499] UBI DBG (pid 276): ubi_scan_add_used: PEB 130, LEB 0:58, 
EC 2537, sqnum 647362, bitflips 0
[    3.978867] UBI DBG (pid 276): process_eb: scan PEB 131
[    3.984442] UBI DBG (pid 276): ubi_scan_add_used: PEB 131, LEB 0:131, 
EC 2524, sqnum 646948, bitflips 0
[    3.993897] UBI DBG (pid 276): process_eb: scan PEB 132
[    3.999452] UBI DBG (pid 276): ubi_scan_add_used: PEB 132, LEB 0:228, 
EC 2576, sqnum 647353, bitflips 0
[    4.008908] UBI DBG (pid 276): process_eb: scan PEB 133
[    4.014488] UBI DBG (pid 276): ubi_scan_add_used: PEB 133, LEB 0:118, 
EC 2543, sqnum 647144, bitflips 0
[    4.023948] UBI DBG (pid 276): process_eb: scan PEB 134
[    4.029504] UBI DBG (pid 276): ubi_scan_add_used: PEB 134, LEB 0:188, 
EC 2541, sqnum 647191, bitflips 0
[    4.038960] UBI DBG (pid 276): process_eb: scan PEB 135
[    4.044538] UBI DBG (pid 276): ubi_scan_add_used: PEB 135, LEB 0:92, 
EC 2531, sqnum 647280, bitflips 0
[    4.053906] UBI DBG (pid 276): process_eb: scan PEB 136
[    4.059462] UBI DBG (pid 276): ubi_scan_add_used: PEB 136, LEB 0:3, 
EC 2578, sqnum 647404, bitflips 0
[    4.068746] UBI DBG (pid 276): process_eb: scan PEB 137
[    4.074323] UBI DBG (pid 276): ubi_scan_add_used: PEB 137, LEB 0:115, 
EC 2579, sqnum 647201, bitflips 0
[    4.083777] UBI DBG (pid 276): process_eb: scan PEB 138
[    4.089332] UBI DBG (pid 276): ubi_scan_add_used: PEB 138, LEB 0:174, 
EC 2574, sqnum 647250, bitflips 0
[    4.098787] UBI DBG (pid 276): process_eb: scan PEB 139
[    4.104365] UBI DBG (pid 276): ubi_scan_add_used: PEB 139, LEB 0:59, 
EC 2568, sqnum 647031, bitflips 0
[    4.113737] UBI DBG (pid 276): process_eb: scan PEB 140
[    4.119292] UBI DBG (pid 276): ubi_scan_add_used: PEB 140, LEB 0:107, 
EC 2523, sqnum 647371, bitflips 0
[    4.128746] UBI DBG (pid 276): process_eb: scan PEB 141
[    4.134320] UBI DBG (pid 276): ubi_scan_add_used: PEB 141, LEB 0:158, 
EC 2551, sqnum 645357, bitflips 0
[    4.143773] UBI DBG (pid 276): process_eb: scan PEB 142
[    4.149326] UBI DBG (pid 276): ubi_scan_add_used: PEB 142, LEB 0:79, 
EC 2590, sqnum 646849, bitflips 0
[    4.158696] UBI DBG (pid 276): process_eb: scan PEB 143
[    4.164270] UBI DBG (pid 276): ubi_scan_add_used: PEB 143, LEB 0:166, 
EC 2583, sqnum 646921, bitflips 0
[    4.173725] UBI DBG (pid 276): process_eb: scan PEB 144
[    4.179277] UBI DBG (pid 276): ubi_scan_add_used: PEB 144, LEB 0:60, 
EC 2568, sqnum 647197, bitflips 0
[    4.188646] UBI DBG (pid 276): process_eb: scan PEB 145
[    4.194227] UBI DBG (pid 276): ubi_scan_add_used: PEB 145, LEB 0:6, 
EC 2584, sqnum 647349, bitflips 0
[    4.203510] UBI DBG (pid 276): process_eb: scan PEB 146
[    4.209065] UBI DBG (pid 276): ubi_scan_add_used: PEB 146, LEB 0:172, 
EC 2582, sqnum 647035, bitflips 0
[    4.218521] UBI DBG (pid 276): process_eb: scan PEB 147
[    4.224098] UBI DBG (pid 276): ubi_scan_add_used: PEB 147, LEB 0:54, 
EC 2583, sqnum 647391, bitflips 0
[    4.233467] UBI DBG (pid 276): process_eb: scan PEB 148
[    4.239024] UBI DBG (pid 276): ubi_scan_add_used: PEB 148, LEB 0:94, 
EC 2578, sqnum 647218, bitflips 0
[    4.248392] UBI DBG (pid 276): process_eb: scan PEB 149
[    4.253971] UBI DBG (pid 276): ubi_scan_add_used: PEB 149, LEB 0:156, 
EC 2586, sqnum 647266, bitflips 0
[    4.263423] UBI DBG (pid 276): process_eb: scan PEB 150
[    4.269027] UBI DBG (pid 276): ubi_scan_add_used: PEB 150, LEB 0:133, 
EC 2564, sqnum 646048, bitflips 0
boot 3[    4.278620] UBI DBG (pid 276): process_eb: scan PEB 151
1
[    4.284649] UBI DBG (pid 276): ubi_scan_add_used: PEB 151, LEB 0:20, 
EC 2553, sqnum 647119, bitflips 0
[    4.294029] UBI DBG (pid 276): process_eb: scan PEB 152
[    4.299594] UBI DBG (pid 276): ubi_scan_add_used: PEB 152, LEB 0:200, 
EC 2561, sqnum 647228, bitflips 0
[    4.309052] UBI DBG (pid 276): process_eb: scan PEB 153
[    4.314630] UBI DBG (pid 276): ubi_scan_add_used: PEB 153, LEB 0:84, 
EC 2581, sqnum 646986, bitflips 0
[    4.324021] UBI DBG (pid 276): process_eb: scan PEB 154
[    4.329589] UBI DBG (pid 276): ubi_scan_add_used: PEB 154, LEB 0:77, 
EC 2568, sqnum 647237, bitflips 0
[    4.338965] UBI DBG (pid 276): process_eb: scan PEB 155
[    4.344547] UBI DBG (pid 276): ubi_scan_add_used: PEB 155, LEB 0:93, 
EC 2547, sqnum 647234, bitflips 0
[    4.353921] UBI DBG (pid 276): process_eb: scan PEB 156
[    4.359478] UBI DBG (pid 276): ubi_scan_add_used: PEB 156, LEB 0:148, 
EC 2532, sqnum 646923, bitflips 0
[    4.368935] UBI DBG (pid 276): process_eb: scan PEB 157
[    4.374515] UBI DBG (pid 276): ubi_scan_add_used: PEB 157, LEB 0:207, 
EC 2540, sqnum 646908, bitflips 0
[    4.383972] UBI DBG (pid 276): process_eb: scan PEB 158
[    4.389525] UBI DBG (pid 276): ubi_scan_add_used: PEB 158, LEB 0:122, 
EC 2593, sqnum 647400, bitflips 0
[    4.398982] UBI DBG (pid 276): process_eb: scan PEB 159
[    4.404559] UBI DBG (pid 276): ubi_scan_add_used: PEB 159, LEB 0:24, 
EC 2568, sqnum 647226, bitflips 0
[    4.413928] UBI DBG (pid 276): process_eb: scan PEB 160
[    4.419482] UBI DBG (pid 276): ubi_scan_add_used: PEB 160, LEB 0:182, 
EC 2590, sqnum 646956, bitflips 0
[    4.428937] UBI DBG (pid 276): process_eb: scan PEB 161
[    4.434515] UBI DBG (pid 276): ubi_scan_add_used: PEB 161, LEB 0:32, 
EC 2593, sqnum 647402, bitflips 0
[    4.443882] UBI DBG (pid 276): process_eb: scan PEB 162
[    4.449433] UBI DBG (pid 276): ubi_scan_add_used: PEB 162, LEB 0:220, 
EC 2556, sqnum 647199, bitflips 0
[    4.458892] UBI DBG (pid 276): process_eb: scan PEB 163
[    4.464474] UBI DBG (pid 276): ubi_scan_add_used: PEB 163, LEB 0:187, 
EC 2429, sqnum 647132, bitflips 0
[    4.473930] UBI DBG (pid 276): process_eb: scan PEB 164
[    4.479484] UBI DBG (pid 276): ubi_scan_add_used: PEB 164, LEB 0:215, 
EC 2583, sqnum 647382, bitflips 0
[    4.488940] UBI DBG (pid 276): process_eb: scan PEB 165
[    4.494518] UBI DBG (pid 276): ubi_scan_add_used: PEB 165, LEB 0:113, 
EC 2578, sqnum 647252, bitflips 0
[    4.503975] UBI DBG (pid 276): process_eb: scan PEB 166
[    4.509530] UBI DBG (pid 276): ubi_scan_add_used: PEB 166, LEB 0:31, 
EC 2588, sqnum 646887, bitflips 0
[    4.518897] UBI DBG (pid 276): process_eb: scan PEB 167
[    4.524476] UBI DBG (pid 276): ubi_scan_add_used: PEB 167, LEB 0:135, 
EC 2588, sqnum 647254, bitflips 0
[    4.533932] UBI DBG (pid 276): process_eb: scan PEB 168
[    4.539485] UBI DBG (pid 276): ubi_scan_add_used: PEB 168, LEB 0:184, 
EC 2577, sqnum 647337, bitflips 0
[    4.548941] UBI DBG (pid 276): process_eb: scan PEB 169
[    4.554518] UBI DBG (pid 276): ubi_scan_add_used: PEB 169, LEB 0:37, 
EC 2546, sqnum 647233, bitflips 0
[    4.563888] UBI DBG (pid 276): process_eb: scan PEB 170
[    4.569441] UBI DBG (pid 276): ubi_scan_add_used: PEB 170, LEB 0:70, 
EC 2440, sqnum 647368, bitflips 0
[    4.578811] UBI DBG (pid 276): process_eb: scan PEB 171
[    4.584390] UBI DBG (pid 276): ubi_scan_add_used: PEB 171, LEB 0:201, 
EC 2580, sqnum 646946, bitflips 0
[    4.593846] UBI DBG (pid 276): process_eb: scan PEB 172
[    4.599389] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 172, only 0xFF bytes
[    4.608492] UBI DBG (pid 276): add_to_list: add to free: PEB 172, EC 2593
[    4.615319] UBI DBG (pid 276): process_eb: scan PEB 173
[    4.620874] UBI DBG (pid 276): ubi_scan_add_used: PEB 173, LEB 0:51, 
EC 2590, sqnum 647264, bitflips 0
[    4.630242] UBI DBG (pid 276): process_eb: scan PEB 174
[    4.635820] UBI DBG (pid 276): ubi_scan_add_used: PEB 174, LEB 0:214, 
EC 2585, sqnum 647209, bitflips 0
[    4.645274] UBI DBG (pid 276): process_eb: scan PEB 175
[    4.650832] UBI DBG (pid 276): ubi_scan_add_used: PEB 175, LEB 0:127, 
EC 2590, sqnum 646920, bitflips 0
[    4.660286] UBI DBG (pid 276): process_eb: scan PEB 176
[    4.665868] UBI DBG (pid 276): ubi_scan_add_used: PEB 176, LEB 0:29, 
EC 2561, sqnum 645315, bitflips 0
[    4.675233] UBI DBG (pid 276): process_eb: scan PEB 177
[    4.680786] UBI DBG (pid 276): ubi_scan_add_used: PEB 177, LEB 0:210, 
EC 2536, sqnum 647049, bitflips 0
[    4.690241] UBI DBG (pid 276): process_eb: scan PEB 178
[    4.695820] UBI DBG (pid 276): ubi_scan_add_used: PEB 178, LEB 0:224, 
EC 2577, sqnum 647149, bitflips 0
[    4.705276] UBI DBG (pid 276): process_eb: scan PEB 179
[    4.710828] UBI DBG (pid 276): ubi_scan_add_used: PEB 179, LEB 0:209, 
EC 2589, sqnum 647286, bitflips 0
[    4.720282] UBI DBG (pid 276): process_eb: scan PEB 180
[    4.725861] UBI DBG (pid 276): ubi_scan_add_used: PEB 180, LEB 0:47, 
EC 2573, sqnum 647365, bitflips 0
[    4.735229] UBI DBG (pid 276): process_eb: scan PEB 181
[    4.740782] UBI DBG (pid 276): ubi_scan_add_used: PEB 181, LEB 0:11, 
EC 2588, sqnum 647192, bitflips 0
[    4.750147] UBI DBG (pid 276): process_eb: scan PEB 182
[    4.755726] UBI DBG (pid 276): ubi_scan_add_used: PEB 182, LEB 0:119, 
EC 2555, sqnum 647204, bitflips 0
[    4.765181] UBI DBG (pid 276): process_eb: scan PEB 183
[    4.770737] UBI DBG (pid 276): ubi_scan_add_used: PEB 183, LEB 0:165, 
EC 2527, sqnum 647189, bitflips 0
[    4.780194] UBI DBG (pid 276): process_eb: scan PEB 184
[    4.785773] UBI DBG (pid 276): ubi_scan_add_used: PEB 184, LEB 0:87, 
EC 2532, sqnum 647397, bitflips 0
[    4.795138] UBI DBG (pid 276): process_eb: scan PEB 185
[    4.800692] UBI DBG (pid 276): ubi_scan_add_used: PEB 185, LEB 0:46, 
EC 2410, sqnum 647358, bitflips 0
[    4.810060] UBI DBG (pid 276): process_eb: scan PEB 186
[    4.815640] UBI DBG (pid 276): ubi_scan_add_used: PEB 186, LEB 0:150, 
EC 2586, sqnum 647077, bitflips 0
[    4.825093] UBI DBG (pid 276): process_eb: scan PEB 187
[    4.830650] UBI DBG (pid 276): ubi_scan_add_used: PEB 187, LEB 0:117, 
EC 2579, sqnum 647270, bitflips 0
[    4.840105] UBI DBG (pid 276): process_eb: scan PEB 188
[    4.845685] UBI DBG (pid 276): ubi_scan_add_used: PEB 188, LEB 0:34, 
EC 2564, sqnum 647096, bitflips 0
[    4.855052] UBI DBG (pid 276): process_eb: scan PEB 189
[    4.860604] UBI DBG (pid 276): ubi_scan_add_used: PEB 189, LEB 0:206, 
EC 2546, sqnum 647133, bitflips 0
[    4.870061] UBI DBG (pid 276): process_eb: scan PEB 190
[    4.875632] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 190, only 0xFF bytes
[    4.884735] UBI DBG (pid 276): add_to_list: add to free: PEB 190, EC 2593
[    4.891537] UBI DBG (pid 276): process_eb: scan PEB 191
[    4.897112] UBI DBG (pid 276): ubi_scan_add_used: PEB 191, LEB 0:175, 
EC 2586, sqnum 646093, bitflips 0
[    4.906569] UBI DBG (pid 276): process_eb: scan PEB 192
[    4.912127] UBI DBG (pid 276): ubi_scan_add_used: PEB 192, LEB 0:97, 
EC 2592, sqnum 647327, bitflips 0
[    4.921496] UBI DBG (pid 276): process_eb: scan PEB 193
[    4.927076] UBI DBG (pid 276): ubi_scan_add_used: PEB 193, LEB 0:167, 
EC 2585, sqnum 647075, bitflips 0
[    4.936761] UBI DBG (pid 276): process_eb: scan PEB 194
[    4.942351] UBI DBG (pid 276): ubi_scan_add_used: PEB 194, LEB 0:21, 
EC 2587, sqnum 647060, bitflips 0
[    4.951733] UBI DBG (pid 276): process_eb: scan PEB 195
[    4.957324] UBI DBG (pid 276): ubi_scan_add_used: PEB 195, LEB 0:162, 
EC 2510, sqnum 647150, bitflips 0
[    4.966780] UBI DBG (pid 276): process_eb: scan PEB 196
[    4.972342] UBI DBG (pid 276): ubi_scan_add_used: PEB 196, LEB 0:63, 
EC 2576, sqnum 647274, bitflips 0
[    4.981713] UBI DBG (pid 276): process_eb: scan PEB 197
[    4.987293] UBI DBG (pid 276): ubi_scan_add_used: PEB 197, LEB 0:176, 
EC 2499, sqnum 647215, bitflips 0
[    4.996750] UBI DBG (pid 276): process_eb: scan PEB 198
[    5.002310] UBI DBG (pid 276): ubi_scan_add_used: PEB 198, LEB 0:56, 
EC 2591, sqnum 647131, bitflips 0
[    5.011681] UBI DBG (pid 276): process_eb: scan PEB 199
[    5.017262] UBI DBG (pid 276): ubi_scan_add_used: PEB 199, LEB 0:114, 
EC 2591, sqnum 647205, bitflips 0
[    5.026715] UBI DBG (pid 276): process_eb: scan PEB 200
[    5.032268] UBI DBG (pid 276): ubi_scan_add_used: PEB 200, LEB 0:152, 
EC 2526, sqnum 647372, bitflips 0
[    5.041723] UBI DBG (pid 276): process_eb: scan PEB 201
[    5.047304] UBI DBG (pid 276): ubi_scan_add_used: PEB 201, LEB 0:159, 
EC 2540, sqnum 647216, bitflips 0
[    5.056759] UBI DBG (pid 276): process_eb: scan PEB 202
[    5.062312] UBI DBG (pid 276): ubi_scan_add_used: PEB 202, LEB 0:39, 
EC 2564, sqnum 647051, bitflips 0
[    5.071680] UBI DBG (pid 276): process_eb: scan PEB 203
[    5.077258] UBI DBG (pid 276): ubi_scan_add_used: PEB 203, LEB 0:204, 
EC 2524, sqnum 646905, bitflips 0
[    5.086714] UBI DBG (pid 276): process_eb: scan PEB 204
[    5.092268] UBI DBG (pid 276): ubi_scan_add_used: PEB 204, LEB 0:116, 
EC 2546, sqnum 647398, bitflips 0
[    5.101725] UBI DBG (pid 276): process_eb: scan PEB 205
[    5.107307] UBI DBG (pid 276): ubi_scan_add_used: PEB 205, LEB 0:111, 
EC 2573, sqnum 647390, bitflips 0
[    5.116761] UBI DBG (pid 276): process_eb: scan PEB 206
[    5.122313] UBI DBG (pid 276): ubi_scan_add_used: PEB 206, LEB 0:245, 
EC 2567, sqnum 647378, bitflips 0
[    5.131769] UBI DBG (pid 276): process_eb: scan PEB 207
[    5.137348] UBI DBG (pid 276): ubi_scan_add_used: PEB 207, LEB 0:7, 
EC 2566, sqnum 646848, bitflips 0
[    5.146629] UBI DBG (pid 276): process_eb: scan PEB 208
[    5.152187] UBI DBG (pid 276): ubi_scan_add_used: PEB 208, LEB 0:191, 
EC 2565, sqnum 647134, bitflips 0
[    5.161640] UBI DBG (pid 276): process_eb: scan PEB 209
[    5.167219] UBI DBG (pid 276): ubi_scan_add_used: PEB 209, LEB 0:235, 
EC 2565, sqnum 647033, bitflips 0
[    5.176674] UBI DBG (pid 276): process_eb: scan PEB 210
[    5.182231] UBI DBG (pid 276): ubi_scan_add_used: PEB 210, LEB 0:136, 
EC 2567, sqnum 647208, bitflips 0
[    5.191684] UBI DBG (pid 276): process_eb: scan PEB 211
[    5.197264] UBI DBG (pid 276): ubi_scan_add_used: PEB 211, LEB 0:19, 
EC 2561, sqnum 647375, bitflips 0
[    5.206630] UBI DBG (pid 276): process_eb: scan PEB 212
[    5.212180] UBI DBG (pid 276): ubi_scan_add_used: PEB 212, LEB 0:238, 
EC 2561, sqnum 646896, bitflips 0
[    5.221655] UBI DBG (pid 276): process_eb: scan PEB 213
[    5.227247] UBI DBG (pid 276): ubi_scan_add_used: PEB 213, LEB 0:50, 
EC 2572, sqnum 647379, bitflips 0
[    5.236619] UBI DBG (pid 276): process_eb: scan PEB 214
[    5.242174] UBI DBG (pid 276): ubi_scan_add_used: PEB 214, LEB 0:99, 
EC 2428, sqnum 647403, bitflips 0
[    5.251538] UBI DBG (pid 276): process_eb: scan PEB 215
[    5.257119] UBI DBG (pid 276): ubi_scan_add_used: PEB 215, LEB 0:81, 
EC 2588, sqnum 646953, bitflips 0
[    5.266486] UBI DBG (pid 276): process_eb: scan PEB 216
[    5.272040] UBI DBG (pid 276): ubi_scan_add_used: PEB 216, LEB 0:26, 
EC 2587, sqnum 646931, bitflips 0
[    5.281406] UBI DBG (pid 276): process_eb: scan PEB 217
[    5.286983] UBI DBG (pid 276): ubi_scan_add_used: PEB 217, LEB 0:153, 
EC 2585, sqnum 647330, bitflips 0
[    5.296437] UBI DBG (pid 276): process_eb: scan PEB 218
[    5.301990] UBI DBG (pid 276): ubi_scan_add_used: PEB 218, LEB 0:219, 
EC 2591, sqnum 647193, bitflips 0
[    5.311449] UBI DBG (pid 276): process_eb: scan PEB 219
[    5.317028] UBI DBG (pid 276): ubi_scan_add_used: PEB 219, LEB 0:61, 
EC 2589, sqnum 647284, bitflips 0
[    5.326395] UBI DBG (pid 276): process_eb: scan PEB 220
[    5.331947] UBI DBG (pid 276): ubi_scan_add_used: PEB 220, LEB 0:151, 
EC 2489, sqnum 647148, bitflips 0
[    5.341398] UBI DBG (pid 276): process_eb: scan PEB 221
[    5.346976] UBI DBG (pid 276): ubi_scan_add_used: PEB 221, LEB 0:14, 
EC 2549, sqnum 647374, bitflips 0
[    5.356342] UBI DBG (pid 276): process_eb: scan PEB 222
[    5.361896] UBI DBG (pid 276): ubi_scan_add_used: PEB 222, LEB 0:230, 
EC 2590, sqnum 647217, bitflips 0
[    5.371351] UBI DBG (pid 276): process_eb: scan PEB 223
[    5.376929] UBI DBG (pid 276): ubi_scan_add_used: PEB 223, LEB 0:124, 
EC 2547, sqnum 647136, bitflips 0
[    5.386385] UBI DBG (pid 276): process_eb: scan PEB 224
[    5.391939] UBI DBG (pid 276): ubi_scan_add_used: PEB 224, LEB 0:25, 
EC 2559, sqnum 647223, bitflips 0
[    5.401306] UBI DBG (pid 276): process_eb: scan PEB 225
[    5.406886] UBI DBG (pid 276): ubi_scan_add_used: PEB 225, LEB 0:171, 
EC 2588, sqnum 646853, bitflips 0
[    5.416341] UBI DBG (pid 276): process_eb: scan PEB 226
[    5.421892] UBI DBG (pid 276): ubi_scan_add_used: PEB 226, LEB 0:78, 
EC 2553, sqnum 646162, bitflips 0
[    5.431259] UBI DBG (pid 276): process_eb: scan PEB 227
[    5.436841] UBI DBG (pid 276): ubi_scan_add_used: PEB 227, LEB 0:66, 
EC 2568, sqnum 647405, bitflips 0
[    5.446208] UBI DBG (pid 276): process_eb: scan PEB 228
[    5.451765] UBI DBG (pid 276): ubi_scan_add_used: PEB 228, LEB 0:168, 
EC 2506, sqnum 647174, bitflips 0
[    5.461219] UBI DBG (pid 276): process_eb: scan PEB 229
[    5.466797] UBI DBG (pid 276): ubi_scan_add_used: PEB 229, LEB 0:173, 
EC 2535, sqnum 647373, bitflips 0
[    5.476249] UBI DBG (pid 276): process_eb: scan PEB 230
[    5.481805] UBI DBG (pid 276): ubi_scan_add_used: PEB 230, LEB 0:234, 
EC 2553, sqnum 647183, bitflips 0
[    5.491260] UBI DBG (pid 276): process_eb: scan PEB 231
[    5.496837] UBI DBG (pid 276): ubi_scan_add_used: PEB 231, LEB 0:231, 
EC 2590, sqnum 646852, bitflips 0
[    5.506292] UBI DBG (pid 276): process_eb: scan PEB 232
[    5.511851] UBI DBG (pid 276): ubi_scan_add_used: PEB 232, LEB 0:76, 
EC 2527, sqnum 647046, bitflips 0
[    5.521217] UBI DBG (pid 276): process_eb: scan PEB 233
[    5.526798] UBI DBG (pid 276): ubi_scan_add_used: PEB 233, LEB 0:211, 
EC 2553, sqnum 647213, bitflips 0
[    5.536251] UBI DBG (pid 276): process_eb: scan PEB 234
[    5.541802] UBI DBG (pid 276): ubi_scan_add_used: PEB 234, LEB 0:249, 
EC 2507, sqnum 646784, bitflips 0
[    5.551255] UBI DBG (pid 276): process_eb: scan PEB 235
[    5.556840] UBI DBG (pid 276): ubi_scan_add_used: PEB 235, LEB 0:144, 
EC 2575, sqnum 645390, bitflips 0
[    5.566296] UBI DBG (pid 276): process_eb: scan PEB 236
[    5.571848] UBI DBG (pid 276): ubi_scan_add_used: PEB 236, LEB 0:203, 
EC 2590, sqnum 646855, bitflips 0
[    5.581301] UBI DBG (pid 276): process_eb: scan PEB 237
[    5.586865] UBI DBG (pid 276): ubi_io_read_vid_hdr: no VID header 
found at PEB 237, only 0xFF bytes
[    5.595966] UBI DBG (pid 276): add_to_list: add to free: PEB 237, EC 2587
[    5.602769] UBI DBG (pid 276): process_eb: scan PEB 238
[    5.608341] UBI DBG (pid 276): ubi_scan_add_used: PEB 238, LEB 0:57, 
EC 2566, sqnum 647127, bitflips 0
[    5.617713] UBI DBG (pid 276): process_eb: scan PEB 239
[    5.623266] UBI DBG (pid 276): ubi_scan_add_used: PEB 239, LEB 0:232, 
EC 2545, sqnum 646056, bitflips 0
[    5.632722] UBI DBG (pid 276): process_eb: scan PEB 240
[    5.638303] UBI DBG (pid 276): ubi_scan_add_used: PEB 240, LEB 0:147, 
EC 2589, sqnum 647269, bitflips 0
[    5.647758] UBI DBG (pid 276): process_eb: scan PEB 241
[    5.653312] UBI DBG (pid 276): ubi_scan_add_used: PEB 241, LEB 0:30, 
EC 2539, sqnum 645316, bitflips 0
[    5.662676] UBI DBG (pid 276): process_eb: scan PEB 242
[    5.668254] UBI DBG (pid 276): ubi_scan_add_used: PEB 242, LEB 0:146, 
EC 2512, sqnum 647011, bitflips 0
[    5.677708] UBI DBG (pid 276): process_eb: scan PEB 243
[    5.683263] UBI DBG (pid 276): ubi_scan_add_used: PEB 243, LEB 0:15, 
EC 2582, sqnum 645494, bitflips 0
[    5.692631] UBI DBG (pid 276): process_eb: scan PEB 244
[    5.698211] UBI DBG (pid 276): ubi_scan_add_used: PEB 244, LEB 0:110, 
EC 2496, sqnum 644071, bitflips 0
[    5.707665] UBI DBG (pid 276): process_eb: scan PEB 245
[    5.713220] UBI DBG (pid 276): ubi_scan_add_used: PEB 245, LEB 0:190, 
EC 2501, sqnum 646888, bitflips 0
[    5.722673] UBI DBG (pid 276): process_eb: scan PEB 246
[    5.728253] UBI DBG (pid 276): ubi_scan_add_used: PEB 246, LEB 0:88, 
EC 2503, sqnum 647370, bitflips 0
[    5.737621] UBI DBG (pid 276): process_eb: scan PEB 247
[    5.743173] UBI DBG (pid 276): ubi_scan_add_used: PEB 247, LEB 0:83, 
EC 2528, sqnum 647225, bitflips 0
[    5.752540] UBI DBG (pid 276): process_eb: scan PEB 248
[    5.758119] UBI DBG (pid 276): ubi_scan_add_used: PEB 248, LEB 0:244, 
EC 2577, sqnum 646929, bitflips 0
[    5.767574] UBI DBG (pid 276): process_eb: scan PEB 249
[    5.773128] UBI DBG (pid 276): ubi_scan_add_used: PEB 249, LEB 0:112, 
EC 2550, sqnum 647335, bitflips 0
[    5.782580] UBI DBG (pid 276): process_eb: scan PEB 250
[    5.788159] UBI DBG (pid 276): ubi_scan_add_used: PEB 250, LEB 0:178, 
EC 2588, sqnum 647100, bitflips 0
[    5.797616] UBI DBG (pid 276): process_eb: scan PEB 251
[    5.803168] UBI DBG (pid 276): ubi_scan_add_used: PEB 251, LEB 0:226, 
EC 2572, sqnum 647044, bitflips 0
[    5.812622] UBI DBG (pid 276): process_eb: scan PEB 252
[    5.818201] UBI DBG (pid 276): ubi_scan_add_used: PEB 252, LEB 0:73, 
EC 2544, sqnum 647261, bitflips 0
[    5.827569] UBI DBG (pid 276): process_eb: scan PEB 253
[    5.833123] UBI DBG (pid 276): ubi_scan_add_used: PEB 253, LEB 0:123, 
EC 2575, sqnum 647380, bitflips 0
[    5.842577] UBI DBG (pid 276): process_eb: scan PEB 254
[    5.848159] UBI DBG (pid 276): ubi_scan_add_used: PEB 254, LEB 
2147479551:1, EC 1, sqnum 4, bitflips 0
[    5.857523] UBI DBG (pid 276): add_volume: added volume 2147479551
[    5.863740] UBI DBG (pid 276): process_eb: scan PEB 255
[    5.869296] UBI DBG (pid 276): ubi_scan_add_used: PEB 255, LEB 
2147479551:0, EC 1, sqnum 3, bitflips 0
[    5.878664] UBI DBG (pid 276): ubi_scan: scanning is finished
[    5.884543] UBI: max. sequence number:       647405
[    5.897201] UBI: attached mtd3 to ubi3
[    5.900967] UBI: MTD device name:            "Psystem"
[    5.906196] UBI: MTD device size:            32 MiB
[    5.911082] UBI: number of good PEBs:        256
[    5.915759] UBI: number of bad PEBs:         0
[    5.920209] UBI: number of corrupted PEBs:   0
[    5.924677] UBI: max. allowed volumes:       128
[    5.929298] UBI: wear-leveling threshold:    4096
[    5.934020] UBI: number of internal volumes: 1
[    5.938467] UBI: number of user volumes:     1
[    5.942913] UBI: available PEBs:             0
[    5.947379] UBI: total number of reserved PEBs: 256
[    5.952261] UBI: number of PEBs reserved for bad PEB handling: 2
[    5.958293] UBI: max/mean erase counter: 2594/2527
[    5.963089] UBI: image sequence number:  -884939195
[    5.968009] UBI: background thread "ubi_bgt3d" started, PID 280
UBI device number 3, total 256 LEBs (32505856 bytes, 31.0 MiB), 
available 0 LEBs (0 bytes), LEB size 126976 bytes (124.0 KiB)
boot 31
[   13.318035] BA315_STATUS_DEC_ERR : 512 4 on 19650
[   13.322758] ff ff 0f 30 cc 56 6a 56 c3 3c f3 a6 5a 9a ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   13.341336] UBI error: ubi_io_read: error -74 (ECC error) while 
reading 4096 bytes from PEB 113:4096, read 4096 bytes
[   13.352049] [<c0027690>] (unwind_backtrace+0x0/0xec) from 
[<c018f890>] (ubi_io_read+0xf0/0x260)
[   13.360826] [<c018f890>] (ubi_io_read+0xf0/0x260) from [<c018ec50>] 
(ubi_eba_read_leb+0x198/0x428)
[   13.369849] [<c018ec50>] (ubi_eba_read_leb+0x198/0x428) from 
[<c018b468>] (vol_cdev_read+0x158/0x264)
[   13.379140] [<c018b468>] (vol_cdev_read+0x158/0x264) from 
[<c009b5e8>] (vfs_read+0xa4/0xd4)
[   13.387533] [<c009b5e8>] (vfs_read+0xa4/0xd4) from [<c009b9c0>] 
(sys_read+0x3c/0x6c)
[   13.395348] [<c009b9c0>] (sys_read+0x3c/0x6c) from [<c0022ea0>] 
(ret_fast_syscall+0x0/0x2c)
cat: read error: Bad message
Command exited with non-zero status 1
real	0m 7.21s
user	0m 0.07s
sys	0m 5.56s
info.type      = 0x04
info.flags     = 0x00000400
info.size      = 0x02000000
info.erasesize = 0x00020000
info.writesize = 2048
info.oobsize   = 64
ecc.eccbytes   = 12
ecc.eccpos     = 2,3,4,5,6,7,8,9,10,11,12,13,

Please press Enter to activate this console. starting pid 287, tty '': 
'/bin/sh'


BusyBox v1.16.0 (2010-09-24 09:41:28 CEST) built-in [   13.443493] 
UBIFS: recovery needed
shell (ash)
Enter 'help' for a list of built-in commands.

# boot 31
/bin/sh: boot: not found
# [   13.498398] UBIFS: recovery completed
[   13.502092] UBIFS: mounted UBI device 3, volume 0, name "system"
[   13.508157] UBIFS: file system size:   30601216 bytes (29884 KiB, 29 
MiB, 241 LEBs)
[   13.515832] UBIFS: journal size:       1523712 bytes (1488 KiB, 1 
MiB, 12 LEBs)
[   13.523177] UBIFS: media format:       w4/r0 (latest is w4/r0)
[   13.529033] UBIFS: default compressor: none
[   13.533222] UBIFS: reserved for root:  1445370 bytes (1411 KiB)
checking all files...
boot 31
/bin/sh: boot: not found
# [   15.729979] BA315_STATUS_DEC_ERR : 512 4 on 19650
[   15.734701] ff ff 0f 30 cc 56 6a 56 c3 3c f3 a6 5a 9a ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   15.753424] UBI error: ubi_io_read: error -74 (ECC error) while 
reading 4144 bytes from PEB 113:4096, read 4144 bytes
[   15.764136] [<c0027690>] (unwind_backtrace+0x0/0xec) from 
[<c018f890>] (ubi_io_read+0xf0/0x260)
[   15.772904] [<c018f890>] (ubi_io_read+0xf0/0x260) from [<c018ec50>] 
(ubi_eba_read_leb+0x198/0x428)
[   15.781933] [<c018ec50>] (ubi_eba_read_leb+0x198/0x428) from 
[<c018cb80>] (ubi_leb_read+0xe0/0x130)
[   15.791046] [<c018cb80>] (ubi_leb_read+0xe0/0x130) from [<c00f9564>] 
(fallible_read_node+0x48/0x194)
[   15.800247] [<c00f9564>] (fallible_read_node+0x48/0x194) from 
[<c00f9c4c>] (ubifs_tnc_locate+0xec/0x168)
[   15.809785] [<c00f9c4c>] (ubifs_tnc_locate+0xec/0x168) from 
[<c00edfa0>] (do_readpage+0x14c/0x34c)
[   15.818778] [<c00edfa0>] (do_readpage+0x14c/0x34c) from [<c00ee1dc>] 
(ubifs_readpage+0x3c/0x40c)
[   15.827619] [<c00ee1dc>] (ubifs_readpage+0x3c/0x40c) from 
[<c00705cc>] (generic_file_aio_read+0x220/0x830)
[   15.837340] [<c00705cc>] (generic_file_aio_read+0x220/0x830) from 
[<c009ae64>] (do_sync_read+0xa4/0xd8)
[   15.846802] [<c009ae64>] (do_sync_read+0xa4/0xd8) from [<c009b5e8>] 
(vfs_read+0xa4/0xd4)
[   15.854954] [<c009b5e8>] (vfs_read+0xa4/0xd4) from [<c009b9c0>] 
(sys_read+0x3c/0x6c)
[   15.862762] [<c009b9c0>] (sys_read+0x3c/0x6c) from [<c0022ea0>] 
(ret_fast_syscall+0x0/0x2c)
[   15.871165] UBIFS error (pid 284): try_read_node: cannot read node 
type 1 from LEB 248:0, error -74
[   15.880435] BA315_STATUS_DEC_ERR : 512 4 on 19650
[   15.885147] ff ff 0f 30 cc 56 6a 56 c3 3c f3 a6 5a 9a ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff 
ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   15.903840] UBI error: ubi_io_read: error -74 (ECC error) while 
reading 4144 bytes from PEB 113:4096, read 4144 bytes
[   15.914544] [<c0027690>] (unwind_backtrace+0x0/0xec) from 
[<c018f890>] (ubi_io_read+0xf0/0x260)
[   15.923312] [<c018f890>] (ubi_io_read+0xf0/0x260) from [<c018ec50>] 
(ubi_eba_read_leb+0x198/0x428)
[   15.932333] [<c018ec50>] (ubi_eba_read_leb+0x198/0x428) from 
[<c018cb80>] (ubi_leb_read+0xe0/0x130)
[   15.941441] [<c018cb80>] (ubi_leb_read+0xe0/0x130) from [<c00f6380>] 
(ubifs_read_node+0x38/0x19c)
[   15.950374] [<c00f6380>] (ubifs_read_node+0x38/0x19c) from 
[<c010bfac>] (ubifs_tnc_read_node+0xe0/0xf0)
[   15.959833] [<c010bfac>] (ubifs_tnc_read_node+0xe0/0xf0) from 
[<c00f9c80>] (ubifs_tnc_locate+0x120/0x168)
[   15.969439] [<c00f9c80>] (ubifs_tnc_locate+0x120/0x168) from 
[<c00edfa0>] (do_readpage+0x14c/0x34c)
[   15.978539] [<c00edfa0>] (do_readpage+0x14c/0x34c) from [<c00ee1dc>] 
(ubifs_readpage+0x3c/0x40c)
[   15.987379] [<c00ee1dc>] (ubifs_readpage+0x3c/0x40c) from 
[<c00705cc>] (generic_file_aio_read+0x220/0x830)
[   15.997099] [<c00705cc>] (generic_file_aio_read+0x220/0x830) from 
[<c009ae64>] (do_sync_read+0xa4/0xd8)
[   16.006562] [<c009ae64>] (do_sync_read+0xa4/0xd8) from [<c009b5e8>] 
(vfs_read+0xa4/0xd4)
[   16.014713] [<c009b5e8>] (vfs_read+0xa4/0xd4) from [<c009b9c0>] 
(sys_read+0x3c/0x6c)
[   16.022521] [<c009b9c0>] (sys_read+0x3c/0x6c) from [<c0022ea0>] 
(ret_fast_syscall+0x0/0x2c)
[   16.031029] UBIFS error (pid 284): ubifs_check_node: bad CRC: 
calculated 0xc6400557, read 0xfc22b4d0
[   16.040213] UBIFS error (pid 284): ubifs_check_node: bad node at LEB 
248:0
[   16.047101] UBIFS error (pid 284): ubifs_read_node: expected node type 1
[   16.053842] UBIFS error (pid 284): do_readpage: cannot read page 0 of 
inode 18308, error -117
