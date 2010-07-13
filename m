Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYb5h-0004Ik-S8
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 08:43:52 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.243])
	by co202.xi-lite.net (Postfix) with ESMTPS id C7FE32602B1
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jul 2010 10:43:47 +0200 (CEST)
Message-ID: <4C3C2740.2040105@parrot.com>
Date: Tue, 13 Jul 2010 10:43:44 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ubifs : corruption after power cut test
References: <4C346D5B.2000609@parrot.com> <4C3C1572.8080501@parrot.com>
In-Reply-To: <4C3C1572.8080501@parrot.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthieu CASTET a écrit :
> Hi,
> 
> we found some bug in our driver. Now there no more ubifs error when
> there is uncorrectable ecc error (they should happen in the last
> (interrupted) written page).
> 
> But now we got "validate_master: bad master node at offset 69632 error
> 7" [1].
notice that gc_lnum==-1 in this case.
Also this didn't happen on power cut.
The senario was :
- power cut
- mount fs [1]
- do some fs operation
- umount fs quickly (9 second after mount in this case) [2]
- mount fs [3]

The the problem seems that gc_lnum==-1 is not handled in mount or 
shouldn't happen in umount.

[1]
UBIFS: recovery needed
UBIFS: recovery completed
UBIFS: mounted UBI device 3, volume 0, name "test"
UBIFS: file system size:   14348288 bytes (14012 KiB, 13 MiB, 113 LEBs)
UBIFS: journal size:       1015809 bytes (992 KiB, 0 MiB, 6 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: none
UBIFS: reserved for root:  677704 bytes (661 KiB)
[2]
### round 0 : 9 seconds
UBIFS: un-mount UBI device 3, volume 0
[3]
UBIFS error (pid 287): validate_master: bad master node at offset 69632 
error 7

> 
> The error is not very clear to me.
> 
> What does it means ?
> 
> What could cause it.
> 
> 
> Thanks
> 
> Matthieu
> 
> 
> 
> [1]
> [...]
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 69632
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 1:69632 (57344 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 1:70144 (56832 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 71680
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 1:71680 (55296 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: hit empty space
> 
> UBIFS DBG (pid 288): ubifs_end_scan: stop scanning LEB 1 at offset 71680
> 
> UBIFS DBG (pid 288): ubifs_start_scan: scan LEB 2:0
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:0 (126976 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:512 (126464 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 2048
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:2048 (124928 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:2560 (124416 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 4096
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:4096 (122880 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:4608 (122368 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 6144
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:6144 (120832 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:6656 (120320 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 8192
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:8192 (118784 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:8704 (118272 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 10240
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:10240 (116736 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:10752 (116224 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 12288
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:12288 (114688 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:12800 (114176 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 14336
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:14336 (112640 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:14848 (112128 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 16384
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:16384 (110592 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:16896 (110080 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 18432
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:18432 (108544 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:18944 (108032 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 20480
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:20480 (106496 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:20992 (105984 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 22528
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:22528 (104448 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:23040 (103936 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 24576
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:24576 (102400 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:25088 (101888 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 26624
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:26624 (100352 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:27136 (99840 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 28672
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:28672 (98304 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:29184 (97792 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 30720
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:30720 (96256 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:31232 (95744 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 32768
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:32768 (94208 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:33280 (93696 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 34816
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:34816 (92160 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:35328 (91648 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 36864
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:36864 (90112 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:37376 (89600 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 38912
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:38912 (88064 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:39424 (87552 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 40960
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:40960 (86016 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:41472 (85504 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 43008
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:43008 (83968 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:43520 (83456 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 45056
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:45056 (81920 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:45568 (81408 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 47104
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:47104 (79872 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:47616 (79360 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 49152
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:49152 (77824 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:49664 (77312 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 51200
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:51200 (75776 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:51712 (75264 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 53248
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:53248 (73728 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:53760 (73216 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 55296
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:55296 (71680 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:55808 (71168 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 57344
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:57344 (69632 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:57856 (69120 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 59392
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:59392 (67584 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:59904 (67072 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 61440
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:61440 (65536 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:61952 (65024 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 63488
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:63488 (63488 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:64000 (62976 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 65536
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:65536 (61440 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:66048 (60928 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 67584
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:67584 (59392 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:68096 (58880 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 69632
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:69632 (57344 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning master node
> 
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:70144 (56832 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: scanning padding node
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: 1508 bytes padded, offset now
> 71680
> UBIFS DBG (pid 288): ubifs_scan: look at LEB 2:71680 (55296 bytes left)
> 
> UBIFS DBG (pid 288): ubifs_scan_a_node: hit empty space
> 
> UBIFS DBG (pid 288): ubifs_end_scan: stop scanning LEB 2 at offset 71680
> 
> UBIFS error (pid 288): validate_master: bad master node at offset 69632
> error 7
>          magic          0x6101831
> 
>          crc            0xf1cb595d
> 
>          node_type      7 (master node)
> 
>          group_type     0 (no node group)
> 
>          sqnum          53559169
> 
>          len            512
> 
>          highest_inum   50055
> 
>          commit number  208832
> 
>          flags          0x2
> 
>          log_lnum       3
> 
>          root_lnum      42
> 
>          root_offs      78864
> 
>          root_len       68
> 
>          gc_lnum        4294967295
> 
>          ihead_lnum     42
> 
>          ihead_offs     79872
> 
>          index_size     81072
> 
>          lpt_lnum       6
> 
>          lpt_offs       27032
> 
>          nhead_lnum     6
> 
>          nhead_offs     28672
> 
>          ltab_lnum      6
> 
>          ltab_offs      26624
> 
>          lsave_lnum     0
> 
>          lsave_offs     0
> 
>          lscan_lnum     58
> 
>          leb_cnt        122
> 
>          empty_lebs     1
> 
>          idx_lebs       3
> 
>          total_free     327680
> 
>          total_dirty    4500616
> 
>          total_used     9438920
> 
>          total_dead     0
> 
>          total_dark     620816
> 
> UBIFS DBG (pid 292): ubifs_bg_thread: background thread "ubifs_bgt3_0"
> stops
> 
