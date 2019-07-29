Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC4FC433FF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 13:29:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB3F3206E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 13:29:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjycGEg0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB3F3206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=etictelecom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xvE1WbGzWQ6hO5PCB9DUG7r7k4t0UnNlqaRYirsSzIY=; b=jjycGEg0nsKUJz
	LxCr/U9OjZ6I333hio71gFm9FUDh9NjtG/CZXBomsEyj/jUr1iDEjuaq9ZhQCeyP+jSrUyTa8Cu4z
	DSUD3FHbL082ksFIkIVYpTzLjhZim0xa499dsZO7zwfWBXb95Jb9y3JdCk6DPmRA/wymXNyIBD/MY
	dZ9MKdQLnTLgjPb2dAgDs0x6J0UyTwGue5Sw6/G3fSGkGT1GvpQtzttokMjLr6/IW7qDGLemgC0J6
	9r4IXWoFdV/JHiqbz+wQw65Ktqw5ySjP3R+Lk+Axf7M3Q+Gu/JtLVbnUNm7Ck2kecmzR5iv0g+PtA
	k9FcLoz08yFWGr9m1bAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs5hw-0004xy-7R; Mon, 29 Jul 2019 13:28:56 +0000
Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs5hq-0004we-Sq
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 13:28:54 +0000
Received: from player761.ha.ovh.net (unknown [10.108.54.67])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6E0B712C13A
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jul 2019 15:28:47 +0200 (CEST)
Received: from etictelecom.com (130.9.1.81.rev.sfr.net [81.1.9.130])
 (Authenticated sender: mickael.chazaux@etictelecom.com)
 by player761.ha.ovh.net (Postfix) with ESMTPSA id F147086C0D33
 for <linux-mtd@lists.infradead.org>; Mon, 29 Jul 2019 13:28:46 +0000 (UTC)
Message-ID: <5D3EF488.6010307@etictelecom.com>
Date: Mon, 29 Jul 2019 15:28:40 +0200
From: Mickael Chazaux <mickael.chazaux@etictelecom.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
 rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ubifs_check_node: bad CRC
X-Enigmail-Version: 1.6
X-Ovh-Tracer-Id: 17622303870357640115
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrledugdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_062851_073315_A07B1ED8 
X-CRM114-Status: GOOD (  12.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I have been using UBIFS on embedded devices for several years now.
We never had a corrupted filesystem. Recently, I used it on a =

board design based on the previous ones. On this new board I =

had several filesystem corruptions like the one below. =


I checked the CRC of the corrupted UBIFS node, and it is incorrect.
However, the CRC of the UBI LEB and the ECC of the NAND page _are_
correct.

This node is on a PEB that was copied (copy_flag =3D 1 in the header)

I have been working on this a lot now, and I would like to hear the
advice of the experts on how to find the cause of this corruption.

A bit of background : =

	The volume "userdata" is used for logging. =

	Approx. 1 message per second is logged. =

	It is mounted with option sync.
	Its size is 10MiB, the ubi0 device itself is 491MiB.
	There are other volumes on ubi0, that are not
	corrupted (rootfs, etc.) . They are less busy.

I imaged the NAND and can reproduce the error like this : =


flash_eraseall /dev/mtd8
nandwrite -no /dev/mtd8 nand-image.img
ubiattach /dev/ubi_ctrl -m 8
mount -t ubifs ubi0:userdata /mnt/
echo "azer" > /mnt/azer

Trace : =


[  202.408718] UBI: attaching mtd8 to ubi0
[  203.672957] UBI: scanning is finished
[  203.695000] UBI: attached mtd8 (name "NAND.ubi", size 491 MiB) to ubi0
[  203.702056] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
[  203.709244] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
[  203.716264] UBI: VID header offset: 512 (aligned 512), data offset: 2048
[  203.723373] UBI: good PEBs: 3927, bad PEBs: 1, corrupted PEBs: 0
[  203.729729] UBI: user volume: 6, internal volumes: 1, max. volumes count=
: 128
[  203.737305] UBI: max/mean erase counter: 51/23, WL threshold: 4096, imag=
e sequence number: 751089049
[  203.746987] UBI: available PEBs: 589, total reserved PEBs: 3338, PEBs re=
served for bad PEB handling: 79
[  203.757015] UBI: background thread "ubi_bgt0d" started, PID 248
[  213.080579] UBIFS: background thread "ubifs_bgt0_1" started, PID 250
[  213.106953] UBIFS: recovery needed
[  213.206555] UBIFS: recovery completed
[  213.210881] UBIFS: mounted UBI device 0, volume 1, name "userdata"
[  213.217435] UBIFS: LEB size: 129024 bytes (126 KiB), min./max. I/O unit =
sizes: 2048 bytes/2048 bytes
[  213.227143] UBIFS: FS size: 9289728 bytes (8 MiB, 72 LEBs), journal size=
 1032193 bytes (0 MiB, 6 LEBs)
[  213.237007] UBIFS: reserved for root: 438776 bytes (428 KiB)
[  213.243019] UBIFS: media format: w4/r0 (latest is w4/r0), UUID 84A393F9-=
FCAF-4611-BE72-0C6E1D61115D, small LPT model
[  219.625362] UBIFS error (pid 241): ubifs_check_node: bad CRC: calculated=
 0xbfd1e3d2, read 0xc5aa5090
[  219.635114] UBIFS error (pid 241): ubifs_check_node: bad node at LEB 33:=
122880
[  219.642777]  magic          0x6101831
[  219.646651]  crc            0xc5aa5090
[  219.650634]  node_type      1 (data node)
[  219.654875]  group_type     0 (no node group)
[  219.659483]  sqnum          2408403
[  219.663187]  len            485
[  219.666513]  key            (1248, data, 4)
[  219.670953]  size           2950
[  219.674365]  compr_typ      1
[  219.677500]  data size      437
[  219.680884]  data:
[  219.683020]  00000000: 00 08 3a 35 34 20 6e 6f 68 6f 73 74 6c 61 6d 65 2=
0 6c 6f 67 3a 20 53 48 44 53 4c 00 2e 00 00 03
[  219.694357]  00000020: 2d 20 4c 69 6e 6b b0 03 00 0e 34 20 54 72 79 69 6=
e 67 20 53 54 55 2d 43 20 6d 6f 60 65 0a 4a 61
[  219.705693]  00000040: 6e 20 20 36 20 31 33 32 35 35 20 15 54 01 04 32 2=
0 73 74 61 72 74 7c 0a 0b 72 6f 6c 65 20 64 65
[  219.717028]  00000060: 74 65 63 74 69 6f 6e 2d 6e 01 36 20 6e 20 10 05 0=
2 31 20 06 6d 01 38 20 14 6c 01 3e 34 04 20 13
[  219.728364]  00000080: 55 01 33 20 03 c4 02 00 36 3a 30 30 00 12 c5 02 3=
3 2a fd 06 52 2f fc 06 20 16 55 00 34 00 06 c5
[  219.739703]  000000a0: 02 31 20 12 c4 02 2b c4 09 33 c4 02 20 13 54 01 2=
0 04 c4 09 01 36 3a 30 33 20 12 c4 02 20 04 c4
[  219.751057]  000000c0: 09 20 16 6c 01 20 07 6d 08 35 20 12 dc 02 3b 6c 0=
8 30 6f 0f 36 3a 30 20 13 54 01 20 07 6d 08 37
[  219.762391]  000000e0: 20 12 c0 02 2b 64 08 33 c4 02 20 13 54 01 20 07 6=
d 08 39 20 12 c5 02 32 3f bc 0d 20 13 54 81 20
[  219.773724]  00000100: 07 c4 09 20 13 6c 01 20 06 c5 09 31 20 13 14 0e 2=
b c4 09 32 6c 0f 20 14 54 01 20 06 c4 09 20 16
[  219.785059]  00000120: 6d 01 28 84 df 0d 29 20 44 4f 57 4e 5f 4e 4f 54 5=
f 52 45 41 44 59 2a a3 1a 36 3a 31 20 15 d8 10
[  219.796393]  00000140: 20 3a 68 01 20 02 7f 1d 36 3a 31 20 13 7d 0f 31 3=
e 44 0b 20 14 54 01 20 07 d4 09 20 13 c4 02 20
[  219.807727]  00000160: 07 7c 08 20 13 ec 10 2b 44 12 33 44 0b 20 13 54 0=
1 20 06 45 12 31 20 13 7c 0f 2b 44 12 32 0d 15
[  219.819060]  00000180: 32 20 13 64 0f 20 06 44 12 20 14 6c 01 20 06 6d 0=
8 32 20 13 10 0e 2b 44 12 33 34 04 20 13 54 01
[  219.830395]  000001a0: 2a c4 09 0b 6f 6c 65 20 64 65 74 65 63 74 69 6f 6=
e 0a 11 00 00
[  219.838690] CPU: 0 PID: 241 Comm: sh Not tainted 3.12.10 #1
[  219.844603] Backtrace: =

[  219.847248] [<c00120fc>] (dump_backtrace+0x0/0x108) from [<c001221c>] (s=
how_stack+0x18/0x1c)
[  219.856195]  r6:cd596000 r5:d0b1f000 r4:ffffff8b
[  219.861136] [<c0012204>] (show_stack+0x0/0x1c) from [<c0815a34>] (dump_s=
tack+0x20/0x2c)
[  219.869620] [<c0815a14>] (dump_stack+0x0/0x2c) from [<c0247354>] (ubifs_=
check_node+0x1b8/0x2d8)
[  219.878858] [<c024719c>] (ubifs_check_node+0x0/0x2d8) from [<c024f020>] =
(ubifs_scan_a_node+0xd8/0x1e8)
[  219.888738] [<c024ef48>] (ubifs_scan_a_node+0x0/0x1e8) from [<c024f194>]=
 (ubifs_scan+0x64/0x300)
[  219.898067] [<c024f130>] (ubifs_scan+0x0/0x300) from [<c0253cb8>] (ubifs=
_garbage_collect_leb+0x84/0x7f4)
[  219.908127] [<c0253c34>] (ubifs_garbage_collect_leb+0x0/0x7f4) from [<c0=
254550>] (ubifs_garbage_collect+0x128/0x3b4)
[  219.919306] [<c0254428>] (ubifs_garbage_collect+0x0/0x3b4) from [<c023a2=
40>] (make_reservation+0x120/0x440)
[  219.929643] [<c023a120>] (make_reservation+0x0/0x440) from [<c023c380>] =
(ubifs_jnl_update+0x12c/0x640)
[  219.939517] [<c023c254>] (ubifs_jnl_update+0x0/0x640) from [<c02413a0>] =
(ubifs_create+0x10c/0x1b0)
[  219.949027] [<c0241294>] (ubifs_create+0x0/0x1b0) from [<c00e5d8c>] (vfs=
_create+0xb0/0xdc)
[  219.957796] [<c00e5cdc>] (vfs_create+0x0/0xdc) from [<c00e6f50>] (do_las=
t+0x94c/0xc9c)
[  219.966186]  r8:00020241 r7:cd5c7f5c r6:cd5c7ed0 r5:c9161f70 r4:000081a4
[  219.973334] [<c00e6604>] (do_last+0x0/0xc9c) from [<c00e7368>] (path_ope=
nat+0xc8/0x5ac)
[  219.981829] [<c00e72a0>] (path_openat+0x0/0x5ac) from [<c00e7960>] (do_f=
ilp_open+0x38/0x8c)
[  219.990707] [<c00e7928>] (do_filp_open+0x0/0x8c) from [<c00d7a94>] (do_s=
ys_open+0x118/0x1d4)
[  219.999635]  r8:cd620000 r7:00000003 r6:000ad29c r5:ffffff9c r4:00020241
[  220.006786] [<c00d797c>] (do_sys_open+0x0/0x1d4) from [<c00d7b8c>] (SyS_=
open+0x24/0x28)
[  220.015288] [<c00d7b68>] (SyS_open+0x0/0x28) from [<c000ebc0>] (ret_fast=
_syscall+0x0/0x30)
[  220.024053] UBIFS error (pid 241): ubifs_scan: bad node
[  220.029585] UBIFS error (pid 241): ubifs_scanned_corruption: corruption =
at LEB 33:122880
[  220.038164] UBIFS error (pid 241): ubifs_scanned_corruption: first 6144 =
bytes from LEB 33:122880
[  220.047498] 00000000: 06101831 c5aa5090 0024bfd3 00000000 000001e5 00000=
001 000004e0 20000004  1....P....$.................... =

(clipped) =

[  220.051722] UBIFS error (pid 241): ubifs_scan: LEB 33 scanning failed
[  220.058571] UBIFS warning (pid 241): ubifs_ro_mode: switched to read-onl=
y mode, error -117
[  220.067357] CPU: 0 PID: 241 Comm: sh Not tainted 3.12.10 #1
[  220.073271] Backtrace: =

[  220.075883] [<c00120fc>] (dump_backtrace+0x0/0x108) from [<c001221c>] (s=
how_stack+0x18/0x1c)
[  220.084830]  r6:cd596000 r5:ffffff8b r4:00000000
[  220.089747] [<c0012204>] (show_stack+0x0/0x1c) from [<c0815a34>] (dump_s=
tack+0x20/0x2c)
[  220.098264] [<c0815a14>] (dump_stack+0x0/0x2c) from [<c0246c1c>] (ubifs_=
ro_mode+0x64/0x70)
[  220.107039] [<c0246bb8>] (ubifs_ro_mode+0x0/0x70) from [<c025464c>] (ubi=
fs_garbage_collect+0x224/0x3b4)
[  220.117012] [<c0254428>] (ubifs_garbage_collect+0x0/0x3b4) from [<c023a2=
40>] (make_reservation+0x120/0x440)
[  220.127348] [<c023a120>] (make_reservation+0x0/0x440) from [<c023c380>] =
(ubifs_jnl_update+0x12c/0x640)
[  220.137230] [<c023c254>] (ubifs_jnl_update+0x0/0x640) from [<c02413a0>] =
(ubifs_create+0x10c/0x1b0)
[  220.146736] [<c0241294>] (ubifs_create+0x0/0x1b0) from [<c00e5d8c>] (vfs=
_create+0xb0/0xdc)
[  220.155506] [<c00e5cdc>] (vfs_create+0x0/0xdc) from [<c00e6f50>] (do_las=
t+0x94c/0xc9c)
[  220.163897]  r8:00020241 r7:cd5c7f5c r6:cd5c7ed0 r5:c9161f70 r4:000081a4
[  220.171045] [<c00e6604>] (do_last+0x0/0xc9c) from [<c00e7368>] (path_ope=
nat+0xc8/0x5ac)
[  220.179522] [<c00e72a0>] (path_openat+0x0/0x5ac) from [<c00e7960>] (do_f=
ilp_open+0x38/0x8c)
[  220.188388] [<c00e7928>] (do_filp_open+0x0/0x8c) from [<c00d7a94>] (do_s=
ys_open+0x118/0x1d4)
[  220.197331]  r8:cd620000 r7:00000003 r6:000ad29c r5:ffffff9c r4:00020241
[  220.204483] [<c00d797c>] (do_sys_open+0x0/0x1d4) from [<c00d7b8c>] (SyS_=
open+0x24/0x28)
[  220.212982] [<c00d7b68>] (SyS_open+0x0/0x28) from [<c000ebc0>] (ret_fast=
_syscall+0x0/0x30)
[  220.222268] UBIFS error (pid 241): make_reservation: cannot reserve 384 =
bytes in jhead 1, error -117
[  220.232023] UBIFS error (pid 241): ubifs_create: cannot create regular f=
ile, error -117

Best regards,

-- =

Mickael Chazaux
Software Engineer
Tel : (33) 476 042 006
Fax : (33) 476 042 001

ETIC TELECOM
13, Chemin du Vieux Ch=EAne
38240 MEYLAN
Tel: 33 4 76 04 20 00
fax : 33 4 76 04 20 01

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
