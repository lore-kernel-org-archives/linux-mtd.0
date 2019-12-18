Return-Path: <SRS0=i5Q8=2I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50B2C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2019 12:01:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE732072B
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2019 12:01:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uv4IDeVl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="d95OjbwV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE732072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gNAvBnKUJ7w2cQvLSX3U29B/lAsZC+ZU05bRfK3ygzM=; b=uv4IDeVlTrPP53
	4lJ5a2fQNLv+tK8TkXcel8f7chDKADJ6L9U0a7XiNOHx6/DniTEWSOhmBi/JNud44QunAEIYOKT0K
	9l8yfoEm/hVHETLkHI2Tuthp/Rnx4NA3aBmT+XztgsfrP4Ef7PEL0X9ew3amjLYpBqtg1liqO3vAD
	W4RlTZGrU0x2GLDr+nkI3hDrSsz90pUL2K2J+RwsRpwsXOYM1p1DmFm0/N4y0iS3wV1cB573BZPmV
	uAH9S+C4BKbqa2vATPuJnuPCaaB1drjYCoLXbfu/aTAp0Fjzw5N4b2jlPyIQnQxWWdXIuvvqTkKCf
	EPn+Z3qmoYUhfIdy1scA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihY0Y-0007wK-Cm; Wed, 18 Dec 2019 12:00:50 +0000
Received: from mail-eopbgr10082.outbound.protection.outlook.com ([40.107.1.82]
 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihY0U-0007rV-NG
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2019 12:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjnBTXD+pF+7GYjGm86cc/U3Xqj0qzkfSwbSCllbA+RLRuvSOA95Vr7mTADzWODrPhQpgZ2lnbbL/if8QPL/czbEfYP/E7EIpazc/rcQON9RL9Z7ZI54bcvdGo38hTQrpWMvN77LMfRxKafZGOavCbqh10DS4mEDSY7N2kbHZ5DTVDHZ0ORBa4/n2LP/XCwePzYj5r3Zfl0RF4J50uCFU4IqdCqjk/BJPYDPKoBcDM0zusmGWEZMBegvxB4pc/YyynXH0D95bY7MkUEMz8FoRkiqJBbQ0zMIFrNJpi8ykAsnw1gIqHtjSQX5eeLdmJHP4EX3JDSOW6XgmgFtVJPXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rln8FPlCqIqnmzoKzV2HfAWTWjpcoJ4JCksJL3Qw5Ds=;
 b=EhlUF4NOR2yPPBgge/0Ig6CuDqQK5/WYaX+zlNzuCd0FPxE60iEQh+Ec646Bl+k1RDABCTYy7Km1/yU/G5qi4f9ptWDPGqY+tfsAy8z8jRlEA/MsdqHzrzNdUI+wHA2eu170vmHkRM4wyCMoZGJFcVAYetmVepNhUR6J3WeC/hjUisZZfOMRxfPKa6VnpBsq0+8nK00pM9yKkFJGs/B+EExV/tnFMvqHN+Xl+SXFoCIFHWDkCoFk9DzLRGMLeL76j1bEBFQ3D0EEunSsbSC8tF6M5DuWeIQVxZireQTsqIfiur80W8m5eT1yrVErxVpLa85IWWylut/LzOEPyZ4XSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rln8FPlCqIqnmzoKzV2HfAWTWjpcoJ4JCksJL3Qw5Ds=;
 b=d95OjbwVgNg9D2cuSmr3GaLtrUs6mVDiAHO8kqCQiRtps3wU/axg91tmysxdHcFQiSMbzq8BYuq6AnbTvey/OXcoVEZwjgeIicYKu8GidVBN50RR95nOa9+tFYpFxBBNRwB0+L2XMuldIZqxZlw9c+PAj7EKe8u6bTxkgt0qC9o=
Received: from AM0PR0402MB3556.eurprd04.prod.outlook.com (52.133.43.147) by
 AM0PR0402MB3521.eurprd04.prod.outlook.com (52.133.47.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Wed, 18 Dec 2019 12:00:40 +0000
Received: from AM0PR0402MB3556.eurprd04.prod.outlook.com
 ([fe80::918a:1621:497d:eac3]) by AM0PR0402MB3556.eurprd04.prod.outlook.com
 ([fe80::918a:1621:497d:eac3%7]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 12:00:40 +0000
From: Kuldeep Singh <kuldeep.singh@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>, "dedekind1@gmail.com"
 <dedekind1@gmail.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>
Subject: Help needed | Deploy UBIFS on qspi nor flash(s25fs512s)
Thread-Topic: Help needed | Deploy UBIFS on qspi nor flash(s25fs512s)
Thread-Index: AdW1mdq+R6jt05p+RI2INtJ+jvBvkQ==
Date: Wed, 18 Dec 2019 12:00:40 +0000
Message-ID: <AM0PR0402MB3556AE4529CD01BF89D95BA9E0530@AM0PR0402MB3556.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kuldeep.singh@nxp.com; 
x-originating-ip: [92.120.1.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f0bb3fd4-37ba-45dc-19ce-08d783b1e70f
x-ms-traffictypediagnostic: AM0PR0402MB3521:
x-microsoft-antispam-prvs: <AM0PR0402MB352121F84C9F5529939DB684E0530@AM0PR0402MB3521.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(199004)(189003)(186003)(26005)(8936002)(33656002)(8676002)(5660300002)(478600001)(86362001)(7696005)(316002)(66946007)(110136005)(76116006)(44832011)(6506007)(81156014)(66476007)(66446008)(81166006)(64756008)(66556008)(966005)(55016002)(9686003)(2906002)(52536014)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR0402MB3521;
 H:AM0PR0402MB3556.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Shi6Jg/LUCW9i7LfdO1+Pxl4eIC1qinV+PSLI2apJqpELjW/lixuN6e9XDDM8Q4xSKnEMNmiBpnphzxPio+mLlaUOvxuapYouNiL0ulm7TTAgWYUu/x8wJKiA3LK2MdwNt9/Xa1XPJHJZLRDvg4/3MASYKagSGQu6ga9rmQmMzuftzXVYlfNAQ/9qDcQuGWGtseP+5GSsooJO8s+VqML8qL+36KghmH630GODMANqdlwYrZeaImUTSvFJbT35NTMoEJXZATPg5VJ3XANswxo0hFqjUltt5F7n0w1Wye5jmDh+VbAjGdAQnMo+htJA2fAZTvlhtbXzMjPoDNACP+A/pfp5TTGyO7gwkhMRXspaxDfp04oPOrUSCuhgj3cpuhFrsTG1zckDzQy16svS2OsUyImh2vKKdS06409LuWAUrj1C24rX0PbAgeQBeXU962+5FWI1ojwEVQh3Qmh+5br/gFAl49t3tUt8S1NywkRZc4=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bb3fd4-37ba-45dc-19ce-08d783b1e70f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 12:00:40.3971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f9SriNTAzu8P1BtBXn3OR5CcU5GhAbCOAorzWXZO4P7vcCBZrd3fS26mu/HURvY9xYr9CF19croQgrK/FxCnhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3521
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_040046_768418_E462913C 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi maintainers/developers,

I have been trying to deploy UBIFS on qspi nor flash and need some help regarding the same.
LS1088ARDB platform has 2 Spansion flashes "s25fs512s" of size 64M each with page size and erase size as 256bytes.

I have erased the flash partition with 256bytes sector size successfully and got stuck on mounting step.
Logs are provided below [1].
After mounting, I read the content of flash and found that only 64bytes were written successfully. Moreover, TxFIFO size is 128 bytes.
I am using dts[2] for platform and the patch is under review.
Can someone please provide a pointer on how to debug/resolve the issue.

Thanks
Kuldeep

[1]
cat /proc/mtd
dev:    size   erasesize  name
mtd0: 20000000 00020000 "530000000.flash"
mtd1: 04000000 00040000 "20c0000.spi-0"
mtd2: 01000000 00040000 "read_only"
mtd3: 03000000 00040000 "file_system"
root@ls1012ardb:~# flash_erase /dev/mtd3 0 0
Erasing 256 Kibyte @ 2fc0000 -- 100 % complete
root@ls1012ardb:~# mtdinfo /dev/mtd3
mtd3
Name:                           file_system
Type:                           nor
Eraseblock size:                262144 bytes, 256.0 KiB
Amount of eraseblocks:          192 (50331648 bytes, 48.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:6
Bad blocks are allowed:         false
Device is writable:             true

root@ls1012ardb:~#
root@ls1012ardb:~#
root@ls1012ardb:~#
root@ls1012ardb:~#
root@ls1012ardb:~#
root@ls1012ardb:~# ubiattach /dev/ubi_ctrl -m 3
[  415.072280] ubi0: attaching mtd3
[  415.081749] ubi0: scanning is finished
[  415.085508] ubi0: empty MTD device detected
[  417.065014] ubi0: attached mtd3 (name "file_system", size 48 MiB)
[  417.071126] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 262016 bytes
[  417.078006] ubi0: min./max. I/O unit sizes: 1/256, sub-page size 1
[  417.084187] ubi0: VID header offset: 64 (aligned 64), data offset: 128
[  417.090719] ubi0: good PEBs: 192, bad PEBs: 0, corrupted PEBs: 0
[  417.096728] ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
[  417.103955] ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 2360392164
[  417.113088] ubi0: available PEBs: 188, total reserved PEBs: 4, PEBs reserved for bad PEB handling: 0
[  417.122273] ubi0: background thread "ubi_bgt0d" started, PID 1196
UBI device number 0, total 192 LEBs (50307072 bytes, 48.0 MiB), available 188 LEBs (49259008 bytes, 47.0 MiB), LEB size 262016 bytes (255.9 KiB)
root@ls1012ardb:~# cat /sys/class/ubi/ubi0/max_vol_count
128
root@ls1012ardb:~# ubimkvol /dev/ubi0 -N ubi_rootfs -S 128
Volume ID 0, size 128 LEBs (33538048 bytes, 32.0 MiB), LEB size 262016 bytes (255.9 KiB), dynamic, name "ubi_rootfs", alignment 1
root@ls1012ardb:~# mount -t ubifs ubi0_0 /tmp
[  443.249649] UBIFS (ubi0:0): default file-system created
[  444.122800] UBIFS error (ubi0:0 pid 1199): ubifs_check_node: bad CRC: calculated 0x51676941, read 0xd999b981
[  444.132656] UBIFS error (ubi0:0 pid 1199): ubifs_check_node: bad node at LEB 0:0
[  444.140070]  magic          0x6101831
[  444.143728]  crc            0xd999b981
[  444.147497]  node_type      6 (superblock node)
[  444.152027]  group_type     0 (no node group)
[  444.156382]  sqnum          2
[  444.159341]  len            4096
[  444.162569]  key_hash       0 (R5)
[  444.165971]  key_fmt        0 (simple)
[  444.169719]  flags          0x8
[  444.172857]  big_lpt        0
[  444.175815]  space_fixup    0
[  444.178781]  min_io_size    8
[  444.181746]  leb_size       262016
[  444.185146]  leb_cnt        128
[  444.188284]  max_leb_cnt    128
[  444.191416]  max_bud_bytes  786048
[  444.194816]  log_lebs       3
[  444.197784]  lpt_lebs       2
[  444.200750]  orph_lebs      2
[  444.203711]  jhead_cnt      1
[  444.206677]  fanout         8
[  444.209641]  lsave_cnt      256
[  444.212781]  default_compr  1
[  444.215740]  rp_size        1545894
[  444.219227]  rp_uid         0
[  444.222191]  rp_gid         0
[  444.225157]  fmt_version    5
[  444.228121]  time_gran      1000000000
[  444.231862]  UUID           975E6BE0-3472-4BAC-8176-8C491D3AD3CC
[  444.237874] CPU: 1 PID: 1199 Comm: mount Not tainted 5.4.0-03609-g51ebe9040582-dirty #14
[  444.245959] Hardware name: LS1088A RDB Board (DT)
[  444.250655] Call trace:
[  444.253095]  dump_backtrace+0x0/0x150
[  444.256750]  show_stack+0x14/0x20
[  444.260059]  dump_stack+0xbc/0x100
[  444.263453]  ubifs_check_node+0xc0/0x210
[  444.267367]  ubifs_read_node+0x1f0/0x248
[  444.271283]  ubifs_read_superblock+0x538/0xd00
[  444.275719]  ubifs_mount+0xa4c/0x13b8
[  444.279376]  legacy_get_tree+0x2c/0x58
[  444.283118]  vfs_get_tree+0x28/0x108
[  444.286687]  do_mount+0x64c/0x970
[  444.289994]  ksys_mount+0x90/0x100
[  444.293389]  __arm64_sys_mount+0x1c/0x28
[  444.297305]  el0_svc_common.constprop.2+0x64/0x160
[  444.302090]  el0_svc_handler+0x20/0x80
[  444.305832]  el0_svc+0x8/0xc
[  444.308721] UBIFS error (ubi0:0 pid 1199): ubifs_read_node: expected node type 6
mount: mount ubi0_0 on /var/volatile/tmp failed: Structure needs cleaning
root@ls1012ardb:~# mtd_debug read /dev/mtd3 0x0 0x1000 rw
Copied 4096 bytes from address 0x00000000 in flash to rw
root@ls1012ardb:~# hexdump -n 100 rw
0000000 4255 2349 0001 0000 0000 0000 0000 0200
0000010 0000 4000 0000 8000 b08c e4b9 0000 0000
0000020 0000 0000 0000 0000 0000 0000 0000 0000
0000030 0000 0000 0000 0000 0000 0000 8b5f 0b9e
0000040 ffff ffff ffff ffff ffff ffff ffff ffff
*
0000060 ffff ffff
0000064

Steps to deploy UBIFS:
flash_erase /dev/mtd3 0 0
ubiattach /dev/ubi_ctrl -m 3
cat /sys/class/ubi/ubi0/max_vol_count
ubimkvol /dev/ubi0 -N ubi_rootfs -S 128
mount -t ubifs ubi0_0 /tmp
mkdir /root_mnt
mount -o loop /ramdisk_rootfs_arm64.ext4 /root_mnt
cp -r /root_mnt/* /tmp/                                                                                                     
umount /tmp/;umount /root_mnt;rm -rf /root_mnt

[2] https://patchwork.kernel.org/patch/11272751/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
