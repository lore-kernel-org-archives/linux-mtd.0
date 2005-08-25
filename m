Received: from xproxy.gmail.com ([66.249.82.196])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8Bwl-00060A-Qq
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2005 03:15:02 -0400
Received: by xproxy.gmail.com with SMTP id i30so147422wxd
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Aug 2005 00:14:46 -0700 (PDT)
Message-ID: <802ad8b605082500141e278cee@mail.gmail.com>
Date: Thu, 25 Aug 2005 12:44:46 +0530
From: Suresh K <sureshkanniappan@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <430C8DB9.3030803@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <802ad8b60508222243345b5e18@mail.gmail.com>
	<802ad8b60508230349683751c6@mail.gmail.com>
	<430B1B29.2010004@inf.u-szeged.hu>
	<802ad8b60508240052462d2d5c@mail.gmail.com>
	<430C8DB9.3030803@inf.u-szeged.hu>
Cc: 
Subject: Re: JFFS2 Mount issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hai,

The following are the dmesg and kernel messages obtained by applying
the EBS patch, mtd-snapshots dated 24/08/2005 to the kernel 2.6.12-5 .
Compiled the kernel without Preemption and SMP support, with JFFS2
debug level 1.

FYI:  When i compiled the 2.6.12-5 without Summary support, no
segmentation fault occured. The Segmentation fault occurs only when
the kernel is compiled with JFFS2 summary support.

----------------------dmesg output start-----------------------------------=
--
########## After blkmtd loaded - dmesg output ###########
blkmtd: version $Revision: 1.26 $
blkmtd: mtd0: [/dev/hda13] erase_size =3D 256KiB

########## After jffs2 loaded - dmesg output ###########
JFFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2003 Red Hat, Inc.
Allocated 267964 bytes for deflate workspace
Allocated 46912 bytes for inflate workspace
Registering JFFS2 compressor "zlib"
Registering JFFS2 compressor "rtime"
Registering JFFS2 compressor "rubinmips"
Registering JFFS2 compressor "dynrubin"
JFFS2: default compression mode: priority

########## After jffs2 Partition mounted - dmesg output ###########
BG] (2745) check_node_data: no need to check node at 0x5a559b0, data
length 2345, data starts at 0x5a559f4 - it has already been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 44,
phys offset 0x5a5509c(0), range 172032-176128.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x2a000-0x2b000, ver 44
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a5509c, data length 2254, data starts at 0x5a550e0 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 43,
phys offset 0x5a54728(0), range 167936-172032.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x29000-0x2a000, ver 43
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a54728, data length 2352, data starts at 0x5a5476c - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 42,
phys offset 0x5a53e84(0), range 163840-167936.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x28000-0x29000, ver 42
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a53e84, data length 2144, data starts at 0x5a53ec8 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 41,
phys offset 0x5a536a8(0), range 159744-163840.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x27000-0x28000, ver 41
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a536a8, data length 1941, data starts at 0x5a536ec - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 40,
phys offset 0x5a52cdc(0), range 155648-159744.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x26000-0x27000, ver 40
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a52cdc, data length 2439, data starts at 0x5a52d20 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 39,
phys offset 0x5a52380(0), range 151552-155648.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x25000-0x26000, ver 39
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a52380, data length 2327, data starts at 0x5a523c4 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 38,
phys offset 0x5a51a04(0), range 147456-151552.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x24000-0x25000, ver 38
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a51a04, data length 2359, data starts at 0x5a51a48 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 37,
phys offset 0x5a5114c(0), range 143360-147456.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x23000-0x24000, ver 37
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a5114c, data length 2164, data starts at 0x5a51190 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 36,
phys offset 0x5a50874(0), range 139264-143360.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x22000-0x23000, ver 36
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a50874, data length 2196, data starts at 0x5a508b8 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 35,
phys offset 0x5a4ff2c(0), range 135168-139264.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x21000-0x22000, ver 35
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4ff2c, data length 2306, data starts at 0x5a4ff70 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 34,
phys offset 0x5a4f70c(0), range 131072-135168.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x20000-0x21000, ver 34
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4f70c, data length 2011, data starts at 0x5a4f750 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 33,
phys offset 0x5a4f064(0), range 126976-131072.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x1f000-0x20000, ver 33
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4f064, data length 1633, data starts at 0x5a4f0a8 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 32,
phys offset 0x5a4eed4(0), range 122880-126976.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x1e000-0x1f000, ver 32
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4eed4, data length 331, data starts at 0x5a4ef18 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 31,
phys offset 0x5a4e898(0), range 118784-122880.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x1d000-0x1e000, ver 31
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4e898, data length 1525, data starts at 0x5a4e8dc - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 30,
phys offset 0x5a4e104(0), range 114688-118784.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x1c000-0x1d000, ver 30
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4e104, data length 1870, data starts at 0x5a4e148 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 29,
phys offset 0x5a4d968(0), range 110592-114688.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x1b000-0x1c000, ver 29
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4d968, data length 1878, data starts at 0x5a4d9ac - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 28,
phys offset 0x5a4d1fc(0), range 106496-110592.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x1a000-0x1b000, ver 28
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4d1fc, data length 1831, data starts at 0x5a4d240 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 27,
phys offset 0x5a4ca50(0), range 102400-106496.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x19000-0x1a000, ver 27
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4ca50, data length 1893, data starts at 0x5a4ca94 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 26,
phys offset 0x5a4c2c0(0), range 98304-102400.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x18000-0x19000, ver 26
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4c2c0, data length 1866, data starts at 0x5a4c304 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 25,
phys offset 0x5a4bb20(0), range 94208-98304.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x17000-0x18000, ver 25
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4bb20, data length 1884, data starts at 0x5a4bb64 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 24,
phys offset 0x5a4b364(0), range 90112-94208.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x16000-0x17000, ver 24
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4b364, data length 1909, data starts at 0x5a4b3a8 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 23,
phys offset 0x5a4abcc(0), range 86016-90112.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x15000-0x16000, ver 23
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4abcc, data length 1875, data starts at 0x5a4ac10 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 22,
phys offset 0x5a4a410(0), range 81920-86016.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x14000-0x15000, ver 22
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4a410, data length 1911, data starts at 0x5a4a454 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 21,
phys offset 0x5a49c60(0), range 77824-81920.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x13000-0x14000, ver 21
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a49c60, data length 1900, data starts at 0x5a49ca4 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 20,
phys offset 0x5a494a8(0), range 73728-77824.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x12000-0x13000, ver 20
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a494a8, data length 1907, data starts at 0x5a494ec - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 19,
phys offset 0x5a48c14(0), range 69632-73728.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x11000-0x12000, ver 19
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a48c14, data length 2127, data starts at 0x5a48c58 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 18,
phys offset 0x5a48368(0), range 65536-69632.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x10000-0x11000, ver 18
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a48368, data length 2150, data starts at 0x5a483ac - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 17,
phys offset 0x5a47aac(0), range 61440-65536.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0xf000-0x10000, ver 17
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a47aac, data length 2167, data starts at 0x5a47af0 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 16,
phys offset 0x5a471fc(0), range 57344-61440.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0xe000-0xf000, ver 16
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a471fc, data length 2155, data starts at 0x5a47240 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 15,
phys offset 0x5a46958(0), range 53248-57344.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0xd000-0xe000, ver 15
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a46958, data length 2144, data starts at 0x5a4699c - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 14,
phys offset 0x5a460d4(0), range 49152-53248.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0xc000-0xd000, ver 14
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a460d4, data length 2112, data starts at 0x5a46118 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 13,
phys offset 0x5a45838(0), range 45056-49152.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0xb000-0xc000, ver 13
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a45838, data length 2133, data starts at 0x5a4587c - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 12,
phys offset 0x5a44fa8(0), range 40960-45056.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0xa000-0xb000, ver 12
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a44fa8, data length 2122, data starts at 0x5a44fec - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 11,
phys offset 0x5a44720(0), range 36864-40960.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x9000-0xa000, ver 11
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a44720, data length 2115, data starts at 0x5a44764 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 10,
phys offset 0x5a43e74(0), range 32768-36864.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x8000-0x9000, ver 10
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a43e74, data length 2150, data starts at 0x5a43eb8 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 9,
phys offset 0x5a435e0(0), range 28672-32768.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x7000-0x8000, ver 9
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a435e0, data length 2125, data starts at 0x5a43624 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 8,
phys offset 0x5a42d58(0), range 24576-28672.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x6000-0x7000, ver 8
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a42d58, data length 2114, data starts at 0x5a42d9c - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 7,
phys offset 0x5a424b4(0), range 20480-24576.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x5000-0x6000, ver 7
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a424b4, data length 2141, data starts at 0x5a424f8 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 6,
phys offset 0x5a41ce4(0), range 16384-20480.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x4000-0x5000, ver 6
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a41ce4, data length 1932, data starts at 0x5a41d28 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 5,
phys offset 0x5a416fc(0), range 12288-16384.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x3000-0x4000, ver 5
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a416fc, data length 1444, data starts at 0x5a41740 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 4,
phys offset 0x5a413a4(0), range 8192-12288.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x2000-0x3000, ver 4
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a413a4, data length 788, data starts at 0x5a413e8 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 3,
phys offset 0x5a40b6c(0), range 4096-8192.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x1000-0x2000, ver 3
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a40b6c, data length 2035, data starts at 0x5a40bb0 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 2,
phys offset 0x5a4031c(0), range 0-4096.
[JFFS2 DBG] (2745) jffs2_add_older_frag_to_fragtree: insert fragment
0x00-0x1000, ver 2
[JFFS2 DBG] (2745) check_node_data: no need to check node at
0x5a4031c, data length 2059, data starts at 0x5a40360 - it has already
been checked.
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: consider node ver 1,
phys offset 0x5a402ac(3), range 0-0.
Obsoleting node at 0x05a402ac of len 0x44: <7>Dirtying
Eraseblock at 0x05a40000 not moved anywhere. (free 0x00000000, dirty
0x000002c4, used 0x0003fd3c)
[JFFS2 DBG] (2745) jffs2_do_read_inode_internal: delete dnode 0-0.
[JFFS2 DBG] (2745) jffs2_truncate_fragtree: truncating fragtree to
0x00076867 bytes
[JFFS2 DBG] (2745) jffs2_kill_fragtree: killing
jffs2_thread_should_wake(): nr_free_blocks 200, nr_erasing_blocks 0,
dirty_size 0x5e828: no
jffs2_garbage_collect_thread sleeping...

########## After Copied 1.5MB file - dmesg output ###########
serve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(25248) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0x6264 bytes at 0x6639d60
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1751, total_in 4084, total_out =
2333
calling deflate with avail_in 12, avail_out 1751
deflate returned with avail_in 0, avail_out 1740, total_in 4096, total_out =
2344
zlib compressed 4096 bytes into 2350
jffs2_add_physical_node_ref(): Node at 0x6639d60(2), size 0x974
jffs2_write_dnode wrote node at 0x06639d60(2) with dsize 0x1000, csize
0x92e, node_crc 0xb9a0ef07, data_crc 0x489495f7, totlen 0x00000972
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x6c000-0x6d000 @0x06639d60 on flash, newfrag *d6f8172c
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 20000001
jffs2_commit_write(): ino #3513, page at 0x6d000, range 0-4096, flags 20000=
001
jffs2_write_inode_range(): Ino #3513, ofs 0x6d000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(22828) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0x58f0 bytes at 0x663a6d4
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1668, total_in 4084, total_out =
2416
calling deflate with avail_in 12, avail_out 1668
deflate returned with avail_in 0, avail_out 1655, total_in 4096, total_out =
2429
zlib compressed 4096 bytes into 2435
jffs2_add_physical_node_ref(): Node at 0x663a6d4(2), size 0x9c8
jffs2_write_dnode wrote node at 0x0663a6d4(2) with dsize 0x1000, csize
0x983, node_crc 0xd8416cad, data_crc 0xbd71fc05, totlen 0x000009c7
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x6d000-0x6e000 @0x0663a6d4 on flash, newfrag *d6f816bc
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 20000001
jffs2_commit_write(): ino #3513, page at 0x6e000, range 0-4096, flags 20000=
001
jffs2_write_inode_range(): Ino #3513, ofs 0x6e000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(20324) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0x4f28 bytes at 0x663b09c
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1448, total_in 4084, total_out =
2636
calling deflate with avail_in 12, avail_out 1448
deflate returned with avail_in 0, avail_out 1433, total_in 4096, total_out =
2651
zlib compressed 4096 bytes into 2657
jffs2_add_physical_node_ref(): Node at 0x663b09c(2), size 0xaa8
jffs2_write_dnode wrote node at 0x0663b09c(2) with dsize 0x1000, csize
0xa61, node_crc 0x542c5b86, data_crc 0xac7c440b, totlen 0x00000aa5
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x6e000-0x6f000 @0x0663b09c on flash, newfrag *d6f815dc
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 20000001
jffs2_commit_write(): ino #3513, page at 0x6f000, range 0-4096, flags 20000=
001
jffs2_write_inode_range(): Ino #3513, ofs 0x6f000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(17596) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0x4480 bytes at 0x663bb44
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1618, total_in 4084, total_out =
2466
calling deflate with avail_in 12, avail_out 1618
deflate returned with avail_in 0, avail_out 1604, total_in 4096, total_out =
2480
zlib compressed 4096 bytes into 2486
jffs2_add_physical_node_ref(): Node at 0x663bb44(2), size 0x9fc
jffs2_write_dnode wrote node at 0x0663bb44(2) with dsize 0x1000, csize
0x9b6, node_crc 0x4f1a7df6, data_crc 0x88fb9835, totlen 0x000009fa
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x6f000-0x70000 @0x0663bb44 on flash, newfrag *d6f8141c
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 20000001
jffs2_commit_write(): ino #3513, page at 0x70000, range 0-4096, flags 20000=
001
jffs2_write_inode_range(): Ino #3513, ofs 0x70000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(15040) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0x3a84 bytes at 0x663c540
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1951, total_in 4084, total_out =
2133
calling deflate with avail_in 12, avail_out 1951
deflate returned with avail_in 0, avail_out 1940, total_in 4096, total_out =
2144
zlib compressed 4096 bytes into 2151
jffs2_add_physical_node_ref(): Node at 0x663c540(2), size 0x8ac
jffs2_write_dnode wrote node at 0x0663c540(2) with dsize 0x1000, csize
0x867, node_crc 0x0c5fd562, data_crc 0x1874f09d, totlen 0x000008ab
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x70000-0x71000 @0x0663c540 on flash, newfrag *d6f817b8
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 20000001
jffs2_commit_write(): ino #3513, page at 0x71000, range 0-4096, flags 20000=
001
jffs2_write_inode_range(): Ino #3513, ofs 0x71000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(12820) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0x31d8 bytes at 0x663cdec
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1866, total_in 4084, total_out =
2218
calling deflate with avail_in 12, avail_out 1866
deflate returned with avail_in 0, avail_out 1861, total_in 4096, total_out =
2223
zlib compressed 4096 bytes into 2229
jffs2_add_physical_node_ref(): Node at 0x663cdec(2), size 0x8fc
jffs2_write_dnode wrote node at 0x0663cdec(2) with dsize 0x1000, csize
0x8b5, node_crc 0x3b60484d, data_crc 0xd356eb4e, totlen 0x000008f9
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x71000-0x72000 @0x0663cdec on flash, newfrag *d6f817f0
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 20000001
jffs2_commit_write(): ino #3513, page at 0x72000, range 0-4096, flags 20000=
001
jffs2_write_inode_range(): Ino #3513, ofs 0x72000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(10520) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0x28dc bytes at 0x663d6e8
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1958, total_in 4084, total_out =
2126
calling deflate with avail_in 12, avail_out 1958
deflate returned with avail_in 0, avail_out 1945, total_in 4096, total_out =
2139
zlib compressed 4096 bytes into 2145
jffs2_add_physical_node_ref(): Node at 0x663d6e8(2), size 0x8a8
jffs2_write_dnode wrote node at 0x0663d6e8(2) with dsize 0x1000, csize
0x861, node_crc 0x90dbc331, data_crc 0xfb83f9f3, totlen 0x000008a5
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x72000-0x73000 @0x0663d6e8 on flash, newfrag *d6f817d4
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 20000001
jffs2_commit_write(): ino #3513, page at 0x73000, range 0-4096, flags 20000=
001
jffs2_write_inode_range(): Ino #3513, ofs 0x73000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(8304) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0x2034 bytes at 0x663df90
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 1932, total_in 4084, total_out =
2152
calling deflate with avail_in 12, avail_out 1932
deflate returned with avail_in 0, avail_out 1922, total_in 4096, total_out =
2162
zlib compressed 4096 bytes into 2168
jffs2_add_physical_node_ref(): Node at 0x663df90(2), size 0x8bc
jffs2_write_dnode wrote node at 0x0663df90(2) with dsize 0x1000, csize
0x878, node_crc 0x89ca1ac2, data_crc 0xb624c327, totlen 0x000008bc
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x73000-0x74000 @0x0663df90 on flash, newfrag *d6f81828
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 20000001
jffs2_commit_write(): ino #3513, page at 0x74000, range 0-4096, flags 20000=
001
jffs2_write_inode_range(): Ino #3513, ofs 0x74000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(6068) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0x1778 bytes at 0x663e84c
calling deflate with avail_in 4084, avail_out 4084
deflate returned with avail_in 0, avail_out 2116, total_in 4084, total_out =
1968
calling deflate with avail_in 12, avail_out 2116
deflate returned with avail_in 0, avail_out 2109, total_in 4096, total_out =
1975
zlib compressed 4096 bytes into 1981
jffs2_add_physical_node_ref(): Node at 0x663e84c(2), size 0x804
jffs2_write_dnode wrote node at 0x0663e84c(2) with dsize 0x1000, csize
0x7bd, node_crc 0x446f5e1e, data_crc 0xd1ed2bc2, totlen 0x00000801
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x74000-0x75000 @0x0663e84c on flash, newfrag *d6f81860
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 20000001
jffs2_commit_write(): ino #3513, page at 0x75000, range 0-4096, flags 20000=
001
jffs2_write_inode_range(): Ino #3513, ofs 0x75000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(4016) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0xf74 bytes at 0x663f050
calling deflate with avail_in 3876, avail_out 3876
deflate returned with avail_in 0, avail_out 2170, total_in 3876, total_out =
1706
calling deflate with avail_in 220, avail_out 2170
deflate returned with avail_in 0, avail_out 2094, total_in 4096, total_out =
1782
zlib compressed 4096 bytes into 1788
jffs2_add_physical_node_ref(): Node at 0x663f050(2), size 0x740
jffs2_write_dnode wrote node at 0x0663f050(2) with dsize 0x1000, csize
0x6fc, node_crc 0xa99f4c1d, data_crc 0xc6c2fd56, totlen 0x00000740
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x75000-0x76000 @0x0663f050 on flash, newfrag *d6f81844
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 4096
jffs2_commit_write() returning 4096
jffs2_prepare_write()
end prepare_write(). pg->flags 20000001
jffs2_commit_write(): ino #3513, page at 0x76000, range 0-4096, flags 20000=
001
jffs2_write_inode_range(): Ino #3513, ofs 0x76000, len 0x1000
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(2160) ,summary->size(0) , sumsize(18)
jffs2_do_reserve_space(): Giving 0x834 bytes at 0x663f790
calling deflate with avail_in 2020, avail_out 2020
deflate returned with avail_in 0, avail_out 755, total_in 2020, total_out 1=
265
calling deflate with avail_in 755, avail_out 755
deflate returned with avail_in 0, avail_out 303, total_in 2775, total_out 1=
717
calling deflate with avail_in 303, avail_out 303
deflate returned with avail_in 0, avail_out 96, total_in 3078, total_out 19=
24
calling deflate with avail_in 96, avail_out 96
deflate returned with avail_in 0, avail_out 16, total_in 3174, total_out 20=
04
calling deflate with avail_in 16, avail_out 16
deflate returned with avail_in 0, avail_out 2, total_in 3190, total_out 201=
8
calling deflate with avail_in 2, avail_out 2
deflate returned with avail_in 0, avail_out 0, total_in 3192, total_out 202=
0
zlib compressed 3192 bytes into 2028
jffs2_add_physical_node_ref(): Node at 0x663f790(2), size 0x830
jffs2_write_dnode wrote node at 0x0663f790(2) with dsize 0xc78, csize
0x7ec, node_crc 0xd6b71617, data_crc 0x109b02bd, totlen 0x00000830
[JFFS2 DBG] (2752) jffs2_add_full_dnode_to_inode: adding node
0x76000-0x76c78 @0x0663f790 on flash, newfrag *d6f8180c
jffs2_complete_reservation()
jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 0,
dirty_size 0xde4cc: no
increasing writtenlen by 3192
jffs2_reserve_space(): Requested 0xc4 bytes
jffs2_reserve_space(): alloc sem got
JFFS2: minsize 196 , jeb->free(64) ,summary->size(0) , sumsize(18)
JFFS2: generating summary for 0x06600000.
JFFS2: jffs2_sum_write_sumnode(): empty summary info!!!
------------[ cut here ]------------
kernel BUG at fs/jffs2/summary.c:668!
invalid operand: 0000 [#1]
Modules linked in: jffs2 zlib_inflate zlib_deflate blkmtd
CPU:    0
EIP:    0060:[<de89b90c>]    Not tainted VLI
EFLAGS: 00010292   (2.6.12.5)=20
EIP is at jffs2_sum_write_sumnode+0x2c/0x180 [jffs2]
eax: 0000003e   ebx: db3e4c80   ecx: db3ebc64   edx: de8a68a0
esi: dd551e00   edi: db3e4c80   ebp: dd551e00   esp: db3ebc60
ds: 007b   es: 007b   ss: 0068
Process cp (pid: 2752, threadinfo=3Ddb3ea000 task=3Dddc3c0c0)
Stack: de8a68a0 db3e4c80 dd551e00 00000012 0000003c de88c492 dd551e00 de89d=
740=20
       06600000 c17de940 db3ebd08 db3ebd0c 00000012 dd551e00 de88bf77 dd551=
e00=20
       000000c4 db3ebd08 db3ebd0c 00000012 000000c7 de89de80 000000c7 00000=
000=20
Call Trace:
 [<de88c492>] jffs2_do_reserve_space+0x192/0x1d0 [jffs2]
 [<de88bf77>] jffs2_reserve_space+0x167/0x230 [jffs2]
 [<de88f34c>] jffs2_write_inode_range+0x6c/0x300 [jffs2]
 [<de889e5d>] jffs2_commit_write+0xed/0x213 [jffs2]
 [<c012931c>] add_to_page_cache+0x3c/0x70
 [<c012b174>] generic_file_buffered_write+0x224/0x630
 [<c0113864>] current_fs_time+0x44/0x60
 [<c01592eb>] inode_update_time+0x3b/0xe0
 [<c012b834>] __generic_file_aio_write_nolock+0x2b4/0x500
 [<c012a078>] __generic_file_aio_read+0x1a8/0x1f0
 [<c012bbaa>] __generic_file_write_nolock+0x9a/0xc0
 [<c0120a40>] autoremove_wake_function+0x0/0x40
 [<c012bd8f>] generic_file_write+0x3f/0xb0
 [<c0142609>] vfs_write+0x89/0xf0
 [<c014271d>] sys_write+0x3d/0x70
 [<c01026cb>] sysenter_past_esp+0x54/0x79
Code: 57 56 53 8b 6c 24 14 8b 95 34 01 00 00 8b bd 80 00 00 00 8b 42
04 85 c0 74 07 8b 42 0c 85 c0 75 19 68 a0 68 8a de e8 44 42 87 e1 <0f>
0b 9c 02 bc 74 8a de 58 8b 95 34 01 00 00 8b 02 8b 5f 20 8d

############# Copied smbd file(1.5MB). After Segmantation fault, when
i access the file using ls -al s(followed by tab key) shows the
following error ########

[root@Qute mnt]# ls -al smbjffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
jffs2_readdir() for dir_i #1

jffs2_lookup()
ls: -: No such file or directory
[root@Qute mnt]# ls -al smbd
-rwxr-xr-x    1 root     root       483328 Aug 25 12:07 smbd (After
Segmentation fault)
[root@Qute mnt]#
[root@Qute mnt]# ls -al /usr/sbin/smbd
-rwxr-xr-x    1 root     root      1529308 Sep 25  2003 /usr/sbin/smbd
(Original Size - 1.5MB)
[root@Qute mnt]#

########## Unmount the JFFS2 Partition after segmentation fault #######
[root@Qute /]# umount /mnt/
jffs2: Killing GC task 3086
jffs2_garbage_collect_thread(): SIGKILL received.

----------------------------dmesg output ends------------------------------=
---

----------------------------Kernel Messages starts-------------------------=
---
Aug 25 11:28:09 Qute syslogd 1.4.1: restart.
Aug 25 11:28:09 Qute syslog: syslogd startup succeeded
Aug 25 11:28:09 Qute kernel: klogd 1.4.1, log source =3D /proc/kmsg started=
.
Aug 25 11:28:09 Qute kernel: Linux version 2.6.12.5 (root@Qute) (gcc
version 3.2.3 20030502 (Red Hat Linux 3.2.3-20)) #1 Thu Aug 25
10:47:09 IST 2005
Aug 25 11:28:09 Qute kernel: BIOS-provided physical RAM map:
Aug 25 11:28:09 Qute kernel:  BIOS-e820: 0000000000000000 -
000000000009fc00 (usable)
Aug 25 11:28:09 Qute kernel:  BIOS-e820: 000000000009fc00 -
00000000000a0000 (reserved)
Aug 25 11:28:09 Qute kernel:  BIOS-e820: 00000000000f0000 -
0000000000100000 (reserved)
Aug 25 11:28:09 Qute kernel:  BIOS-e820: 0000000000100000 -
000000001dff0000 (usable)
Aug 25 11:28:09 Qute kernel:  BIOS-e820: 000000001dff0000 -
000000001dff3000 (ACPI NVS)
Aug 25 11:28:09 Qute kernel:  BIOS-e820: 000000001dff3000 -
000000001e000000 (ACPI data)
Aug 25 11:28:09 Qute kernel:  BIOS-e820: 00000000fec00000 -
00000000fec01000 (reserved)
Aug 25 11:28:09 Qute kernel:  BIOS-e820: 00000000fee00000 -
00000000fee01000 (reserved)
Aug 25 11:28:09 Qute kernel:  BIOS-e820: 00000000ffff0000 -
0000000100000000 (reserved)
Aug 25 11:28:09 Qute syslog: klogd startup succeeded
Aug 25 11:28:09 Qute kernel: 479MB LOWMEM available.
Aug 25 11:28:09 Qute irqbalance: irqbalance startup succeeded
Aug 25 11:28:09 Qute portmap: portmap startup succeeded
Aug 25 11:28:10 Qute kernel: DMI 2.3 present.
Aug 25 11:28:10 Qute rpc.statd[2118]: Version 1.0.5 Starting
Aug 25 11:28:10 Qute kernel: Allocating PCI resources starting at
1e000000 (gap: 1e000000:e0c00000)
Aug 25 11:28:10 Qute kernel: Built 1 zonelists
Aug 25 11:28:10 Qute kernel: Kernel command line: ro root=3D/dev/hda6
Aug 25 11:28:10 Qute nfslock: rpc.statd startup succeeded
Aug 25 11:28:10 Qute kernel: Initializing CPU#0
Aug 25 11:28:10 Qute kernel: PID hash table entries: 2048 (order: 11,
32768 bytes)
Aug 25 11:28:10 Qute keytable: Loading keymap:=20
Aug 25 11:28:10 Qute kernel: Detected 2010.963 MHz processor.
Aug 25 11:28:10 Qute kernel: Using tsc for high-res timesource
Aug 25 11:28:10 Qute keytable: ^[[60G
Aug 25 11:28:10 Qute kernel: Console: colour VGA+ 80x25
Aug 25 11:28:10 Qute keytable:=20
Aug 25 11:28:10 Qute kernel: Dentry cache hash table entries: 65536
(order: 6, 262144 bytes)
Aug 25 11:28:10 Qute keytable:=20
Aug 25 11:28:10 Qute kernel: Inode-cache hash table entries: 32768
(order: 5, 131072 bytes)
Aug 25 11:28:10 Qute rc: Starting keytable:  succeeded
Aug 25 11:28:10 Qute kernel: Memory: 483952k/491456k available (1563k
kernel code, 6948k reserved, 765k data, 200k init, 0k highmem)
Aug 25 11:28:10 Qute kernel: Checking if this processor honours the WP
bit even in supervisor mode... Ok.
Aug 25 11:28:10 Qute random: Initializing random number generator:  succeed=
ed
Aug 25 11:28:11 Qute kernel: Mount-cache hash table entries: 512
Aug 25 11:28:11 Qute rc: Starting pcmcia:  succeeded
Aug 25 11:28:11 Qute mount: mount: wrong fs type, bad option, bad
superblock on none,
Aug 25 11:28:11 Qute mount:        or too many mounted file systems
Aug 25 11:28:11 Qute kernel: CPU: L1 I Cache: 64K (64 bytes/line), D
cache 64K (64 bytes/line)
Aug 25 11:28:11 Qute kernel: CPU: L2 Cache: 256K (64 bytes/line)
Aug 25 11:28:11 Qute netfs: Mounting other filesystems:  failed
Aug 25 11:28:11 Qute kernel: Intel machine check architecture supported.
Aug 25 11:28:11 Qute kernel: Intel machine check reporting enabled on CPU#0=
.
Aug 25 11:28:11 Qute kernel: CPU: AMD Athlon(tm) XP 2400+ stepping 00
Aug 25 11:28:11 Qute pcscd: pcscdaemon.c:446:main() pcsc-lite
1.2.9-beta7 daemon ready.
Aug 25 11:28:11 Qute pcscd: pcscd startup succeeded
Aug 25 11:28:11 Qute kernel: Enabling fast FPU save and restore... done.
Aug 25 11:28:12 Qute kernel: Enabling unmasked SIMD FPU exception
support... done.
Aug 25 11:28:12 Qute kernel: Checking 'hlt' instruction... OK.
Aug 25 11:28:12 Qute autofs: automount startup succeeded
Aug 25 11:28:12 Qute kernel: NET: Registered protocol family 16
Aug 25 11:28:12 Qute kernel: EISA bus registered
Aug 25 11:28:13 Qute kernel: PCI: PCI BIOS revision 2.10 entry at
0xfa5b0, last bus=3D1
Aug 25 11:28:13 Qute kernel: PCI: Using configuration type 1
Aug 25 11:28:13 Qute kernel: Linux Plug and Play Support v0.97 (c) Adam Bel=
ay
Aug 25 11:28:14 Qute kernel: SCSI subsystem initialized
Aug 25 11:28:14 Qute kernel: PCI: Probing PCI hardware
Aug 25 11:28:14 Qute kernel: PCI: Probing PCI hardware (bus 00)
Aug 25 11:28:15 Qute kernel: PCI: Using IRQ router VIA [1106/3177] at
0000:00:11.0
Aug 25 11:28:15 Qute kernel: PCI: IRQ 0 for device 0000:00:11.1
doesn't match PIRQ mask - try pci=3Dusepirqmask
Aug 25 11:28:16 Qute kernel: PCI: Found IRQ 11 for device 0000:00:11.1
Aug 25 11:28:16 Qute kernel: PCI: Sharing IRQ 11 with 0000:00:10.0
Aug 25 11:28:16 Qute kernel: PCI: Sharing IRQ 11 with 0000:00:12.0
Aug 25 11:28:16 Qute kernel: isapnp: Scanning for PnP cards...
Aug 25 11:28:17 Qute kernel: isapnp: No Plug & Play device found
Aug 25 11:28:17 Qute kernel: lp: driver loaded but no devices found
Aug 25 11:28:17 Qute kernel: PNP: No PS/2 controller found. Probing
ports directly.
Aug 25 11:28:17 Qute kernel: serio: i8042 AUX port at 0x60,0x64 irq 12
Aug 25 11:28:18 Qute cups: cupsd startup succeeded
Aug 25 11:28:18 Qute kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
Aug 25 11:28:18 Qute kernel: parport0: PC-style at 0x378 [PCSPP(,...)]
Aug 25 11:28:18 Qute kernel: lp0: using parport0 (polling).
Aug 25 11:28:18 Qute sshd:  succeeded
Aug 25 11:28:18 Qute kernel: lp0: console ready
Aug 25 11:28:18 Qute kernel: io scheduler noop registered
Aug 25 11:28:19 Qute xinetd: xinetd startup succeeded
Aug 25 11:28:19 Qute kernel: io scheduler anticipatory registered
Aug 25 11:28:19 Qute kernel: io scheduler deadline registered
Aug 25 11:28:20 Qute vsftpd: true startup succeeded
Aug 25 11:28:20 Qute kernel: io scheduler cfq registered
Aug 25 11:28:20 Qute kernel: PPP generic driver version 2.4.2
Aug 25 11:28:21 Qute kernel: Uniform Multi-Platform E-IDE driver
Revision: 7.00alpha2
Aug 25 11:28:21 Qute kernel: ide: Assuming 33MHz system bus speed for
PIO modes; override with idebus=3Dxx
Aug 25 11:28:22 Qute kernel: hda: ST340015A, ATA DISK drive
Aug 25 11:28:22 Qute kernel: hdb: Maxtor 6Y080L0, ATA DISK drive
Aug 25 11:28:22 Qute sendmail: sendmail startup succeeded
Aug 25 11:28:22 Qute kernel: hdc: SAMSUNG CDRW/DVD SM-352N, ATAPI
CD/DVD-ROM drive
Aug 25 11:28:22 Qute sendmail: sm-client startup succeeded
Aug 25 11:28:22 Qute gpm: gpm startup succeeded
Aug 25 11:28:23 Qute kernel: ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
Aug 25 11:28:23 Qute kernel: ide1 at 0x170-0x177,0x376 on irq 15
Aug 25 11:28:23 Qute kernel: hda: max request size: 128KiB
Aug 25 11:28:23 Qute kernel: hda: Host Protected Area detected.
Aug 25 11:28:23 Qute kernel: ^Icurrent capacity is 78163247 sectors (40019 =
MB)
Aug 25 11:28:23 Qute kernel: ^Inative  capacity is 78165360 sectors (40020 =
MB)
Aug 25 11:28:23 Qute kernel: hda: Host Protected Area disabled.
Aug 25 11:28:23 Qute kernel: hda: 78165360 sectors (40020 MB)
w/2048KiB Cache, CHS=3D65535/16/63
Aug 25 11:28:23 Qute kernel: hda: cache flushes supported
Aug 25 11:28:23 Qute kernel:  hda: hda1 hda2 < hda5 hda6 hda7 hda8
hda9 hda10 hda11 hda12 hda13 hda14 hda15 >
Aug 25 11:28:23 Qute kernel: hdb: max request size: 128KiB
Aug 25 11:28:23 Qute xinetd[2267]: Server /usr/sbin/in.telnetd is not
executable [file=3D/etc/xinetd.d/telnet] [line=3D11]
Aug 25 11:28:23 Qute kernel: hdb: 160086528 sectors (81964 MB)
w/2048KiB Cache, CHS=3D65535/16/63
Aug 25 11:28:24 Qute xinetd[2267]: Error parsing attribute server -
DISABLING SERVICE [file=3D/etc/xinetd.d/telnet] [line=3D11]
Aug 25 11:28:24 Qute kernel: hdb: cache flushes supported
Aug 25 11:28:24 Qute kernel:  hdb: hdb1
Aug 25 11:28:24 Qute kernel: hdc: ATAPI 52X DVD-ROM CD-R/RW drive, 2048kB C=
ache
Aug 25 11:28:24 Qute kernel: Uniform CD-ROM driver Revision: 3.20
Aug 25 11:28:24 Qute kernel: mice: PS/2 mouse device common for all mice
Aug 25 11:28:24 Qute kernel: EISA: Probing bus 0 at eisa.0
Aug 25 11:28:24 Qute kernel: NET: Registered protocol family 2
Aug 25 11:28:24 Qute kernel: IP: routing cache hash table of 4096
buckets, 32Kbytes
Aug 25 11:28:24 Qute kernel: TCP established hash table entries: 16384
(order: 5, 131072 bytes)
Aug 25 11:28:24 Qute kernel: TCP bind hash table entries: 16384
(order: 4, 65536 bytes)
Aug 25 11:28:24 Qute kernel: TCP: Hash tables configured (established
16384 bind 16384)
Aug 25 11:28:24 Qute kernel: NET: Registered protocol family 1
Aug 25 11:28:24 Qute kernel: NET: Registered protocol family 17
Aug 25 11:28:24 Qute kernel: input: AT Translated Set 2 keyboard on
isa0060/serio0
Aug 25 11:28:24 Qute kernel: kjournald starting.  Commit interval 5 seconds
Aug 25 11:28:24 Qute kernel: EXT3-fs: mounted filesystem with ordered data =
mode.
Aug 25 11:28:24 Qute kernel: VFS: Mounted root (ext3 filesystem) readonly.
Aug 25 11:28:24 Qute kernel: Freeing unused kernel memory: 200k freed
Aug 25 11:28:24 Qute kernel: input: ImExPS/2 Generic Explorer Mouse on
isa0060/serio1
Aug 25 11:28:24 Qute kernel: EXT3 FS on hda6, internal journal
Aug 25 11:28:24 Qute kernel: Adding 514040k swap on /dev/hda9.=20
Priority:-1 extents:1
Aug 25 11:28:25 Qute canna:  succeeded
Aug 25 11:28:25 Qute xinetd[2267]: xinetd Version 2.3.12 started with
libwrap loadavg options compiled in.
Aug 25 11:28:25 Qute xinetd[2267]: Started working: 1 available service
Aug 25 11:28:25 Qute crond: crond startup succeeded
Aug 25 11:28:26 Qute xfs: xfs startup succeeded
Aug 25 11:28:26 Qute atd: atd startup succeeded
Aug 25 11:28:26 Qute xfs: ignoring font path element
/usr/X11R6/lib/X11/fonts/cyrillic (unreadable)
Aug 25 11:28:27 Qute /sbin/hotplug: no runnable /etc/hotplug/vc.agent
is installed
Aug 25 11:28:27 Qute last message repeated 29 times
Aug 25 11:28:31 Qute login(pam_unix)[2395]: session opened for user
root by LOGIN(uid=3D0)
Aug 25 11:28:31 Qute  -- root[2395]: ROOT LOGIN ON tty1
Aug 25 11:28:35 Qute login(pam_unix)[2396]: check pass; user unknown
Aug 25 11:28:35 Qute login(pam_unix)[2396]: authentication failure;
logname=3DLOGIN uid=3D0 euid=3D0 tty=3Dtty2 ruser=3D rhost=3D
Aug 25 11:28:37 Qute login[2396]: FAILED LOGIN 1 FROM (null) FOR
rootr, Authentication failure
Aug 25 11:28:40 Qute login(pam_unix)[2396]: session opened for user
root by LOGIN(uid=3D0)
Aug 25 11:28:40 Qute  -- root[2396]: ROOT LOGIN ON tty2
Aug 25 11:28:44 Qute init: Switching to runlevel: 5
Aug 25 11:28:44 Qute vsftpd: vsftpd shutdown succeeded
Aug 25 11:28:44 Qute irqbalance: irqbalance startup succeeded
Aug 25 11:28:44 Qute rc: Starting pcmcia:  succeeded
Aug 25 11:28:44 Qute autofs: automount startup succeeded
Aug 25 11:28:46 Qute /sbin/hotplug: no runnable /etc/hotplug/vc.agent
is installed
Aug 25 11:28:47 Qute last message repeated 5 times
Aug 25 11:28:50 Qute kernel: atkbd.c: Spurious ACK on isa0060/serio0.
Some program, like XFree86, might be trying access hardware directly.
Aug 25 11:28:50 Qute kernel: atkbd.c: Spurious ACK on isa0060/serio0.
Some program, like XFree86, might be trying access hardware directly.
Aug 25 11:29:00 Qute gdm(pam_unix)[2818]: session opened for user root
by (uid=3D0)
Aug 25 11:29:02 Qute gconfd (root-2934): starting (version 2.2.1), pid
2934 user 'root'
Aug 25 11:29:03 Qute gconfd (root-2934): Resolved address
"xml:readonly:/etc/gconf/gconf.xml.mandatory" to a read-only config
source at position 0
Aug 25 11:29:03 Qute gconfd (root-2934): Resolved address
"xml:readwrite:/root/.gconf" to a writable config source at position 1
Aug 25 11:29:03 Qute gconfd (root-2934): Resolved address
"xml:readonly:/etc/gconf/gconf.xml.defaults" to a read-only config
source at position 2
Aug 25 11:29:05 Qute xinetd[2944]: warning: can't get client address:
Transport endpoint is not connected
Aug 25 11:29:12 Qute kernel: cdrom: This disc doesn't have any tracks
I recognize!
Aug 25 11:29:40 Qute /sbin/hotplug: no runnable
/etc/hotplug/module.agent is installed
Aug 25 11:29:40 Qute /sbin/hotplug: no runnable
/etc/hotplug/block.agent is installed
Aug 25 11:29:40 Qute kernel: blkmtd: version $Revision: 1.26 $
Aug 25 11:29:40 Qute /sbin/hotplug: no runnable /etc/hotplug/mtd.agent
is installed
Aug 25 11:29:40 Qute /sbin/hotplug: no runnable /etc/hotplug/mtd.agent
is installed
Aug 25 11:29:40 Qute kernel: blkmtd: mtd0: [/dev/hda13] erase_size =3D 256K=
iB=20
Aug 25 11:30:02 Qute /sbin/hotplug: no runnable
/etc/hotplug/module.agent is installed
Aug 25 11:30:02 Qute last message repeated 2 times
Aug 25 11:30:02 Qute kernel: JFFS2 version 2.2. (NAND) (SUMMARY)  (C)
2001-2003 Red Hat, Inc.
Aug 25 11:30:02 Qute kernel: JFFS2: default compression mode: priority
Aug 25 11:30:44 Qute kernel: jffs2: Flash size not aligned to
erasesize, reducing to 128256KiB
Aug 25 11:30:45 Qute kernel: summmary
Aug 25 11:30:47 Qute kernel: JFFS2 SUMMARY: There is not enough space
for summary information, freeing up summary info!
Aug 25 11:31:12 Qute last message repeated 237 times
Aug 25 11:31:13 Qute kernel: 0000, unchecked 0x000000, free 0x03fff4)
Aug 25 11:31:53 Qute kernel: JFFS2: not enough space for summary, padsize =
=3D -68
Aug 25 11:31:59 Qute kernel: .
Aug 25 11:32:01 Qute kernel: JFFS2: jffs2_sum_write_sumnode(): empty
summary info!!!
Aug 25 11:32:01 Qute kernel: ------------[ cut here ]------------
Aug 25 11:32:01 Qute kernel: kernel BUG at fs/jffs2/summary.c:668!
Aug 25 11:32:01 Qute kernel: invalid operand: 0000 [#1]
Aug 25 11:32:01 Qute kernel: Modules linked in: jffs2 zlib_inflate
zlib_deflate blkmtd
Aug 25 11:32:01 Qute kernel: CPU:    0
Aug 25 11:32:01 Qute kernel: EIP:    0060:[<de8a190c>]    Not tainted VLI
Aug 25 11:32:01 Qute kernel: EFLAGS: 00010292   (2.6.12.5)=20
Aug 25 11:32:01 Qute kernel: EIP is at
jffs2_sum_write_sumnode+0x2c/0x180 [jffs2]
Aug 25 11:32:01 Qute kernel: eax: 0000003e   ebx: d4bec3b0   ecx:
d0689c64   edx: de8ac8a0
Aug 25 11:32:01 Qute kernel: esi: d704b200   edi: d4bec3b0   ebp:
d704b200   esp: d0689c60
Aug 25 11:32:01 Qute kernel: ds: 007b   es: 007b   ss: 0068
Aug 25 11:32:01 Qute kernel: Process cp (pid: 3094,
threadinfo=3Dd0688000 task=3Dd4e51ac0)
Aug 25 11:32:01 Qute kernel: Stack: de8ac8a0 d4bec3b0 d704b200
00000012 0000003c de892492 d704b200 de8a3740
Aug 25 11:32:01 Qute kernel:        05a40000 c1564c00 d0689d08
d0689d0c 00000012 d704b200 de891f77 d704b200
Aug 25 11:32:01 Qute kernel:        000000c4 d0689d08 d0689d0c
00000012 000000c7 de8a3e80 000000c8 00000001
Aug 25 11:32:01 Qute kernel: Call Trace:
Aug 25 11:32:01 Qute kernel:  [<de892492>]
jffs2_do_reserve_space+0x192/0x1d0 [jffs2]
Aug 25 11:32:01 Qute kernel:  [<de891f77>]
jffs2_reserve_space+0x167/0x230 [jffs2]
Aug 25 11:32:01 Qute kernel:  [<de89534c>]
jffs2_write_inode_range+0x6c/0x300 [jffs2]
Aug 25 11:32:01 Qute kernel:  [<de88fe5d>] jffs2_commit_write+0xed/0x213 [j=
ffs2]
Aug 25 11:32:01 Qute kernel:  [<c012931c>] add_to_page_cache+0x3c/0x70
Aug 25 11:32:01 Qute kernel:  [<c012b174>]
generic_file_buffered_write+0x224/0x630
Aug 25 11:32:01 Qute kernel:  [<c0113864>] current_fs_time+0x44/0x60
Aug 25 11:32:01 Qute kernel:  [<c01592eb>] inode_update_time+0x3b/0xe0
Aug 25 11:32:01 Qute kernel:  [<c012b834>]
__generic_file_aio_write_nolock+0x2b4/0x500
Aug 25 11:32:01 Qute kernel:  [<c012a078>] __generic_file_aio_read+0x1a8/0x=
1f0
Aug 25 11:32:01 Qute kernel:  [<c012bbaa>] __generic_file_write_nolock+0x9a=
/0xc0
Aug 25 11:32:01 Qute kernel:  [<c0120a40>] autoremove_wake_function+0x0/0x4=
0
Aug 25 11:32:01 Qute kernel:  [<c012bd8f>] generic_file_write+0x3f/0xb0
Aug 25 11:32:01 Qute kernel:  [<c0142609>] vfs_write+0x89/0xf0
Aug 25 11:32:01 Qute kernel:  [<c014271d>] sys_write+0x3d/0x70
Aug 25 11:32:01 Qute kernel:  [<c01026cb>] sysenter_past_esp+0x54/0x79
Aug 25 11:32:01 Qute kernel: Code: 57 56 53 8b 6c 24 14 8b 95 34 01 00
00 8b bd 80 00 00 00 8b 42 04 85 c0 74 07 8b 42 0c 85 c0 75 19 68 a0
c8 8a de e8 44 e2 86 e1 <0f> 0b 9c 02 bc d4 8a de 58 8b 95 34 01 00 00
8b 02 8b 5f 20 8d
Aug 25 11:32:02 Qute kernel:  <7>jffs2_write_super()

jffs2_thread_should_wake(): nr_free_blocks 199, nr_erasing_blocks 1, dirty_=
size
0xde538: no
Starting erase of pending block 0x06700000
Freeing all node refs for eraseblock offset 0x06700000
Removed nodes in range 0x06700000-0x06740000 from ino #1
jffs2_erase_block(): erase block 0x6700000 (range 0x6700000-0x6740000)
Erase completed successfully at 0x06700000
Verifying erase at 0x06700000
Writing erased marker to block at 0x06700000
jffs2_erase_pending_blocks completed
jffs2_flush_wbuf_gc() called for ino #0...
jffs2_write_super()
jffs2_thread_should_wake(): nr_free_blocks 200, nr_erasing_blocks 0, dirty_=
size
0x9e538: no
jffs2_erase_pending_blocks completed
jffs2_flush_wbuf_gc() called for ino #0...

----------------------------Kernel Messages ends---------------------------=
-

Hope the info provided will help u a lot. Expecting ur reply soon.

Regards,
K. Suresh


On 8/24/05, Ferenc Havasi <havasi@inf.u-szeged.hu> wrote:
> Hi,
>=20
> Suresh K wrote:
>=20
> >>Can you send me more information about it? For example kernel log with
> >>debug level 1. And please make sure that you use the latest mtd        =
    > snapshot
> >>with newest summary patch - use only erase block summary, centralized
> >>summary is now under construction.
> >>
> >>
> >
> >   Initially I have used the EBS patch and mtd-snapshots released on
> >11/08/2005. I faced the segmentation fault issue with this patches
> >used in 2.6.10 kernel.
> >
> >   Today I have downloaded the latest EBS patch and mtd-snapshot
> >released on 23/08/2005 from the below sites
> >
> >   http://www.inf.u-szeged.hu/jffs2/mount.php - EBS patch
> >   ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/ - MTD 23/08/05
> >
> >Applied the EBS patches to JFFS2 utilities in MTD snapshots, patched
> >the 2.6.10 kernel with the command /mtd/kernelpatch.sh -2
> >/usr/src/linux-2.6.10.
> >Created the jffs2 image with new mkfs.jffs2 utility. Created the jffs2
> >image with sumtool utility. Mounted the same. Copied the 1.5MB file to
> >JFFS2 partition, still i faced the Segmentation fault issue. The
> >following are the debug messages posted by the kernel.
> >
> >/dev/hdc13 (120MB) - jffs2 image created by mkfs.jffs2 utility
> >/dev/hdc14 (120MB) - jffs2 image created with sumtool utility after
> >mkfs.jffs2 utility.
> >
> >Only 472K of 1.5MB file is copied into the JFFS2 partition in both the
> >cases. This is FYI.
> >
> >-----------------------------Kernel Message Starts----------------------=
------
> >blkmtd: version $Revision: 1.26 $
> >blkmtd: mtd0: [/dev/hda14] erase_size =3D 256KiB
> >JFFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2003 Red Hat, Inc.
> >jffs2: Flash size not aligned to erasesize, reducing to 128256KiB
> >JFFS2: jffs2_sum_write_sumnode(): empty summary info!!!
> >------------[ cut here ]------------
> >kernel BUG at fs/jffs2/summary.c:661!
> >
> >
> It is too few information for me. Please use JFFS2 debug level 1, and
> send me the full kernel log. If possible use the summary patch of today
> (24th), I've added some additional debug message, which can be very
> usefull to debug your problem.
>=20
> Some other question/idea: did you try it without summary? Did it work
> correctly? (Peter Grayson reported a problem using the current snapshot,
> it also maybe related by that). You also may try compile 2.6.x without
> preemtion and SMP. I would be good to know that it works or not, I may
> be the difference between 2.4.x and 2.6.x.
>=20
> Bye,
> Ferenc
>=20
>
